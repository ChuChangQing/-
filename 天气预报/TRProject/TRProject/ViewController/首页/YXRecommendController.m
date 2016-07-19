//
//  YXRecommendController.m
//  TRProject
//
//  Created by chuchangqing on 16/7/10.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "YXRecommendController.h"
#import "YXRecommendFangCell.h"
#import "YXRecommendRoundCell.h"
#import "YXRecommendViewModel.h"
#import "YXRecommendHead.h"
#import "YXRecommendSecondView.h"
#import "YXStarController.h"
#import "YXStarGameController.h"
#import "YXPictureController.h"

@interface YXRecommendController ()<iCarouselDelegate, iCarouselDataSource>
@property (nonatomic) YXRecommendViewModel *recommendVM;
@property (nonatomic) NSArray<NSNumber *> *indexList;
@property (nonatomic) YXRecommendSecondView *secondView;
/** <#属性描述#> */
@property (nonatomic) YXRecommendHead *Hview;
/** <#属性描述#> */
@property (nonatomic) UIPageControl *pc;
/** <#属性描述#> */
@property (nonatomic) UILabel *lb;
@end

@implementation YXRecommendController{
    NSTimer *_timer;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self recommendVM];
    self.navigationItem.title = @"推荐";
    self.tableView.tableHeaderView = self.Hview;
    self.tabBarController.tabBar.tintColor = kRGBColor(131, 187, 193, 1.0);
    
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.recommendVM getDataWithRequestMode:VMRequestModeRefresh completionHandler:^(NSError *error) {
            [self.tableView.mj_header endRefreshing];
            if (error) {
                DDLogError(@"error %@", error);
            }else{
                [[NSOperationQueue new] addOperationWithBlock:^{
                    while (1) {
                        if ((self.recommendVM.itemList.count == 0)||(self.recommendVM.contentsList.count == 0)) {
                            
                        }else{
                            dispatch_async(dispatch_get_main_queue(), ^{
                                [self.tableView reloadData];
                            });
                            break;
                        }
                    }
                }];
            }
        }];
    }];
    [self.tableView.mj_header beginRefreshing];
    
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [self.recommendVM getDataWithRequestMode:VMRequestModeMore completionHandler:^(NSError *error) {
            [self.tableView.mj_footer endRefreshing];
            if (error) {
                DDLogError(@"error %@", error);
            }else{
                while (1) {
                    if ((self.recommendVM.itemList == nil)||(self.recommendVM.contentsList.count == 0)) {
                        
                    }else{
                        [self.tableView reloadData];
                        break;
                    }
                }
            }
        }];
    }];
    [self.tableView.mj_header beginRefreshing];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark -  IC  Delegate
//循环滚动
- (CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value{
    if (option == iCarouselOptionWrap) {
        value = YES;
    }
    return value;
}
- (void)carouselCurrentItemIndexDidChange:(iCarousel *)carousel{
    self.pc.currentPage = carousel.currentItemIndex;
    switch (carousel.currentItemIndex) {
        case 0:
            self.lb.text = @"看看你的星座排第几?";
            break;
        case 1:
            self.lb.text = @"和你的他(她)吃点啥";
            break;
        case 2:
            self.lb.text = @"炫酷美图";
            break;
    }
}
- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel{
    return 3;
}

- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view{
    if (!view) {
        view = [[UIView alloc] initWithFrame:carousel.frame];
        UIImageView *iv = [UIImageView new];
        [view addSubview:iv];
        [iv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
        iv.tag = 300;
    }
    
    UIImageView *iv = (UIImageView *)[view viewWithTag:300];
    iv.image = [UIImage imageNamed:@"aixin"];
    switch (index) {
        case 0:
            iv.image = [UIImage imageNamed:@"recommend1"];
            break;
        case 1:
            iv.image = [UIImage imageNamed:@"recommend2"];
            break;
        case 2:
            iv.image = [UIImage imageNamed:@"recommend3"];
            break;
    }

    UIView *blackView = [UIView new];
    [self.Hview addSubview:blackView];
    [blackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(0);
        make.height.equalTo(25);
    }];
    blackView.backgroundColor = kRGBColor(0, 0, 0, 0.5);
    
    [blackView addSubview:self.pc];
    [_pc mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(-5);
        make.top.equalTo(-5);
    }];
    
    [blackView addSubview:self.lb];
    [_lb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(10);
        make.top.equalTo(4);
    }];
    
    
    return view;
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.recommendVM.rowNumber;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger row = indexPath.row;
    NSInteger i = self.indexList[row % 10].integerValue;
    if (i == 0) {
        YXRecommendFangCell *cell = [tableView dequeueReusableCellWithIdentifier:kFangCell forIndexPath:indexPath];
        cell.nameLb.text = [self.recommendVM nameForRow:row];
        cell.nameLb.layer.cornerRadius = 5;
        cell.nameLb.layer.masksToBounds = YES;
        cell.titleLb.text = [self.recommendVM titleForRow:row];
        [cell.iconView sd_setImageWithURL:[self.recommendVM iconForRow:row] placeholderImage:[UIImage imageNamed:@"xingyu"]];
        cell.summeryLb.text = [self.recommendVM summaryForRow:row];
        return cell;

    }else{
        YXRecommendRoundCell *cell = [tableView dequeueReusableCellWithIdentifier:kRoundCell forIndexPath:indexPath];
        cell.nameLb.text = [self.recommendVM nameForRow:row];
        cell.titleLb.text = [self.recommendVM titleForRow:row];
        [cell.iconView sd_setImageWithURL:[self.recommendVM iconForRow:row] placeholderImage:[UIImage imageNamed:@"xingyu"]];
        cell.iconView.layer.cornerRadius = 23;
        cell.iconView.layer.masksToBounds = YES;
        cell.summeryLb.text = [self.recommendVM summaryForRow:row];
        return cell;
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (_secondView) {
        [_secondView removeFromSuperview];
    }
    [self createSecondView];
    _secondView.labelTitle.text = [self.recommendVM titleForRow:indexPath.row];
    _secondView.introLabel.text = [self.recommendVM summaryForRow:indexPath.row];
    
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    if (!self.secondView) {
        [_secondView removeFromSuperview];
    }
}

#pragma mark - Lazyload 懒加载
- (YXRecommendViewModel *)recommendVM {
	if(_recommendVM == nil) {
		_recommendVM = [[YXRecommendViewModel alloc] init];
	}
	return _recommendVM;
}

- (NSArray<NSNumber *> *)indexList {
	if(_indexList == nil) {
		_indexList = [[NSArray<NSNumber *> alloc] init];
        _indexList = @[@1, @1, @0, @1, @0, @0, @1, @0, @1, @1];
	}
	return _indexList;
}

- (void)createSecondView {

		_secondView = [[YXRecommendSecondView alloc] init];
        [self.tableView.window addSubview:_secondView];
        [_secondView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.equalTo(50);
            make.right.bottom.equalTo(-50);
        }];
        _secondView.layer.cornerRadius = 10;
        _secondView.layer.masksToBounds = YES;
        _secondView.backgroundColor = kRGBColor(0, 0, 0, 0.75);
}






- (YXRecommendHead *)Hview {
	if(_Hview == nil) {
		_Hview = [[YXRecommendHead alloc] initWithFrame:CGRectMake(0, 0, 0, 250)];
        _Hview.ic.delegate = self;
        _Hview.ic.dataSource = self;
        [_timer invalidate];
        _timer = nil;
        
        _timer = [NSTimer bk_scheduledTimerWithTimeInterval:4 block:^(NSTimer *timer) {
            [_Hview.ic scrollToItemAtIndex:_Hview.ic.currentItemIndex + 1 animated:YES];
        } repeats:YES];
        _Hview.ic.scrollSpeed = .1;
	}
	return _Hview;
}

- (UIPageControl *)pc {
	if(_pc == nil) {
		_pc = [[UIPageControl alloc] init];
        _pc.numberOfPages = 3;
        _pc.currentPageIndicatorTintColor = kRGBColor(128, 184, 190, 1.0);
	}
	return _pc;
}

- (UILabel *)lb {
	if(_lb == nil) {
		_lb = [[UILabel alloc] init];
        _lb.textColor = [UIColor whiteColor];
        _lb.font = [UIFont systemFontOfSize:16];
        _lb.text = @"看看你的星座排第几?";
	}
	return _lb;
}

@end
