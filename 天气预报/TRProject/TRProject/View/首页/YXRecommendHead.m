//
//  YXRecommendHead.m
//  TRProject
//
//  Created by chuchangqing on 16/7/11.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "YXRecommendHead.h"

@implementation YXRecommendHead

- (iCarousel *)ic {
    if(_ic == nil) {
        _ic = [[iCarousel alloc] initWithFrame:CGRectMake(0, 0, kScreenW, 250)];
        [self addSubview:_ic];
    }
    return _ic;
}
//- (UILabel *)Hlabel {
//    if(_Hlabel == nil) {
//        _Hlabel = [[UILabel alloc] init];
//        [self.blackView addSubview:_Hlabel];
//        [_Hlabel mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.top.equalTo(5);
//        }];
//        _Hlabel.font = [UIFont systemFontOfSize:15];
//        _Hlabel.textColor = [UIColor whiteColor];
//    }
//    return _Hlabel;
//}
//
//- (UIPageControl *)Hpc {
//    if(_Hpc == nil) {
//        _Hpc = [[UIPageControl alloc] init];
//        [self.ic addSubview:_Hpc];
//        [_Hpc mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.bottom.right.equalTo(-5);
//        }];
//    }
//    return _Hpc;
//}
//
//- (UIView *)blackView {
//    if(_blackView == nil) {
//        _blackView = [[UIView alloc] init];
//        [self addSubview:_blackView];
//        [_blackView mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.right.bottom.equalTo(0);
//            make.height.equalTo(26);
//        }];
//        _blackView.backgroundColor = kRGBColor(0, 0, 0, 0.5);
//    }
//    return _blackView;
//}

@end
