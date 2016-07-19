//
//  YXPictureCell.m
//  TRProject
//
//  Created by chuchangqing on 16/7/10.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "YXPictureCell.h"

@implementation YXPictureCell

- (UIImageView *)iconView {
    if(_iconView == nil) {
        _iconView = [UIImageView new];
        [self addSubview:_iconView];
        [_iconView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
        _iconView.layer.cornerRadius = 5;
        _iconView.layer.masksToBounds = YES;
    }
    return _iconView;
}

@end
