//
//  YXStarGameController.m
//  TRProject
//
//  Created by chuchangqing on 16/7/8.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "YXStarGameController.h"
#import "YXStarViewModel.h"
#import "YXGameSecondController.h"

@interface YXStarGameController ()<iCarouselDelegate, iCarouselDataSource>

/** <#属性描述#> */
@property (nonatomic) iCarousel *leftIC;
@property (weak, nonatomic) IBOutlet UILabel *leftLb;
/** <#属性描述#> */
@property (nonatomic) iCarousel *rightIC;
@property (weak, nonatomic) IBOutlet UILabel *rightLb;
/** <#属性描述#> */
@property (nonatomic) NSMutableArray<YXStarListModel *> *starList;
@property (nonatomic, assign) NSInteger indexMale;
@property (nonatomic, assign) NSInteger indexFMale;



@end

@implementation YXStarGameController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self leftIC];
    [self starList];
    [self rightIC];
    self.navigationItem.title = @"一起吃";
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
//按键点击事件
- (IBAction)clickedPipei:(UIButton *)sender {
    
}
- (IBAction)clickedChifan:(UIButton *)sender {
    YXGameSecondController *vc = [YXGameSecondController new];
    vc.maleIndex = self.indexMale;
    vc.FmaleIndex = self.indexFMale;
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}



#pragma mark -  IC  Delegate
- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel{
    return 12;
}

- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view{
    if (!view) {
        view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 120, 300)];
//        view.backgroundColor = [UIColor redColor];
        UIImageView *iv = [UIImageView new];
        [view addSubview:iv];
        [iv mas_makeConstraints:^(MASConstraintMaker *make) {            
            make.top.equalTo(70);
            if (carousel.tag == 200) {
                make.left.equalTo(25);
                make.right.equalTo(5);
            }else{
                make.right.equalTo(-15);
                make.left.equalTo(5);
            }
            make.bottom.equalTo(-70);
        }];
//        iv.contentMode = UIViewContentModeScaleAspectFit;
        iv.tag = 1000;
    }
    UIImageView *iv = (UIImageView *)[view viewWithTag:1000];
    iv.layer.cornerRadius = 10;
    iv.layer.masksToBounds = YES;
    [iv setStarImageWithStarName:index];
    return view;
}

- (void)carouselCurrentItemIndexDidChange:(iCarousel *)carousel{
    if (carousel.tag == 100) {
        _indexMale = carousel.currentItemIndex;
        self.leftLb.text = _starList[carousel.currentItemIndex].starName;
    }else{
        _indexFMale = carousel.currentItemIndex;
        self.rightLb.text = _starList[carousel.currentItemIndex].starName;
    }

}

#pragma mark - Lazyload 懒加载
- (iCarousel *)leftIC {
	if(_leftIC == nil) {
		_leftIC = [iCarousel new];
        _leftIC.backgroundColor = [UIColor clearColor];
        [self.view addSubview:_leftIC];
        [_leftIC mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(8);
            make.width.equalTo(130);
            make.height.equalTo(500);
            make.top.equalTo(0);
        }];
        _leftIC.tag = 100;
//        _leftIC.backgroundColor = [UIColor blueColor];
        _leftIC.delegate = self;
        _leftIC.dataSource = self;
        _leftIC.type = 7;
        _leftIC.vertical = YES;
        _leftIC.scrollSpeed = .1;
	}
	return _leftIC;
}

- (iCarousel *)rightIC {
	if(_rightIC == nil) {
		_rightIC = [[iCarousel alloc] init];
        _rightIC.backgroundColor = [UIColor clearColor];
        [self.view addSubview:_rightIC];
        [_rightIC mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(-8);
            make.width.equalTo(130);
            make.height.equalTo(500);
            make.top.equalTo(0);
        }];
        _rightIC.tag = 200;
        _rightIC.delegate = self;
        _rightIC.dataSource = self;
        _rightIC.type = 7;
        _rightIC.vertical = YES;
        _rightIC.scrollSpeed = .1;
//        _rightIC.backgroundColor = [UIColor redColor];
	}
	return _rightIC;
}

- (NSMutableArray<YXStarListModel *> *)starList {
    if(_starList == nil) {
        _starList = [[NSMutableArray<YXStarListModel *> alloc] init];
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            NSString *path = [[NSBundle mainBundle] pathForResource:@"StarList" ofType:@"plist"];
            NSArray *array = [NSArray arrayWithContentsOfFile:path];
            for (NSDictionary *dic in array) {
                [_starList addObject:[YXStarListModel parseStarListModel:dic]];
            }
           
        });
    }
    return _starList;
}

@end
