//
//  YXRecommendSecondView.m
//  TRProject
//
//  Created by chuchangqing on 16/7/13.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "YXRecommendSecondView.h"

@implementation YXRecommendSecondView
- (UILabel *)labelTitle {
    if(_labelTitle == nil) {
        _labelTitle = [[UILabel alloc] init];
        [self addSubview:_labelTitle];
        [_labelTitle mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.equalTo(50);
            make.right.equalTo(-50);
        }];
        _labelTitle.numberOfLines = 0;
        _labelTitle.textColor = [UIColor whiteColor];
        _labelTitle.font = [UIFont systemFontOfSize:20];
    }
    return _labelTitle;
}

- (UILabel *)introLabel {
    if(_introLabel == nil) {
        _introLabel = [[UILabel alloc] init];
        [self addSubview:_introLabel];
        [_introLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.labelTitle.mas_bottom).equalTo(20);
            make.left.equalTo(20);
            make.right.equalTo(-20);
        }];
        _introLabel.numberOfLines = 0;
        _introLabel.textColor = [UIColor whiteColor];
        [self btu];
    }
    return _introLabel;
}
- (UIButton *)btu {
    if(_btu == nil) {
        _btu = [[UIButton alloc] init];
        [self addSubview:_btu];
        [_btu mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.top.equalTo(0);
            make.width.height.equalTo(50);
        }];
        [_btu setTitle:@"关闭" forState:UIControlStateNormal];
        _btu.tintColor = [UIColor whiteColor];
        //    btu.font = [UIFont systemFontOfSize:30];
        
        [_btu bk_whenTapped:^{
            [self removeFromSuperview];
        }];
    }
    return _btu;
}

@end
