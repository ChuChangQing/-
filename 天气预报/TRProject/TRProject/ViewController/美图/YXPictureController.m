//
//  YXPictureController.m
//  TRProject
//
//  Created by chuchangqing on 16/7/10.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "YXPictureController.h"
#import "YXPictureCell.h"
#import "YXPictureViewModel.h"
#import "YXpicLookController.h"


@interface YXPictureController ()<PSCollectionViewDelegate, PSCollectionViewDataSource>
/** <#属性描述#> */
@property (nonatomic) PSCollectionView *cView;
/** <#属性描述#> */
@property (nonatomic) YXPictureViewModel *pubuliuVM;
/** <#属性描述#> */
@property (nonatomic) NSArray<NSNumber *> *numberArray;
@end

@implementation YXPictureController
- (NSInteger)numberOfRowsInCollectionView:(PSCollectionView *)collectionView{
    return self.pubuliuVM.rowNumber;
}
- (PSCollectionViewCell *)collectionView:(PSCollectionView *)collectionView cellForRowAtIndex:(NSInteger)index{
    YXPictureCell *cell = (YXPictureCell *)[collectionView dequeueReusableViewForClass:[YXPictureCell class]];
    if (!cell) {
        cell = [YXPictureCell new];
    }
    [cell.iconView sd_setImageWithURL:[self.pubuliuVM iconForRow:index] placeholderImage:[UIImage imageNamed:@"xingyu"]];
    return cell;
}
- (CGFloat)collectionView:(PSCollectionView *)collectionView heightForRowAtIndex:(NSInteger)index{
    CGFloat width = ([UIScreen mainScreen].bounds.size.width - 4 * 8) / 3;
    return [self.pubuliuVM hwScaleForRow:index] * width + self.numberArray[index%50].floatValue;
}
- (void)collectionView:(PSCollectionView *)collectionView didSelectCell:(PSCollectionViewCell *)cell atIndex:(NSInteger)index{
    YXpicLookController *vc = [[YXpicLookController alloc] initWithUrl:[self.pubuliuVM iconLargeForRow:index]];    
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self cView];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"酷图";
    
    
    self.cView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.pubuliuVM getDataWithRequestMode:VMRequestModeRefresh completionHandler:^(NSError *error) {
            if (error) {
                DDLogError(@"error %@", error);
            }else{
                [self.cView reloadData];
            }
            [self.cView.mj_header endRefreshing];
        }];
    }];
    
    self.cView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [self.pubuliuVM getDataWithRequestMode:VMRequestModeMore completionHandler:^(NSError *error) {
            [self.cView.mj_footer endRefreshing];
            if (error) {
                DDLogError(@"error %@", error);
            }else{
                [self.cView reloadData];
            }
        }];
    }];
    [self.cView.mj_header beginRefreshing];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


- (YXPictureViewModel *)pubuliuVM {
    if(_pubuliuVM == nil) {
        _pubuliuVM = [YXPictureViewModel new];
    }
    return _pubuliuVM;
}

- (PSCollectionView *)cView {
    if(_cView == nil) {
        _cView = [PSCollectionView new];
        [self.view addSubview:_cView];
        [_cView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
        _cView.collectionViewDelegate = self;
        _cView.collectionViewDataSource = self;
        //设置手机竖屏时的列的数量
        _cView.numColsPortrait = 3;
        
    }
    return _cView;
}
- (NSArray<NSNumber *> *)numberArray {
	if(_numberArray == nil) {
		_numberArray = [[NSArray<NSNumber *> alloc] init];
        _numberArray = @[@3, @13 , @21, @11, @31, @1, @4, @17, @8, @21,
                         @33, @16 , @5, @18, @32, @41, @6, @18, @29, @17,
                         @44, @15 , @8, @19, @10, @14, @25, @17, @11, @31,
                         @34, @46 , @24, @34, @40, @28, @24, @41, @33, @45,
                         @10, @15 , @22, @24, @35, @17, @19, @21, @14, @17];
	}
	return _numberArray;
}

@end
