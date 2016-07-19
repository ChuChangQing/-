//
//  UITableView+YXsetBKImage.m
//  TRProject
//
//  Created by chuchangqing on 16/7/6.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "UITableView+YXsetBKImage.h"
typedef NS_ENUM(NSInteger, backgroundImage) {
    qingtian,
    shandian,
    xiaoyu,
    xue,
    yintian,
};


@implementation UITableView (YXsetBKImage)
- (UIImageView *)imageViewWithBK:(backgroundImage)BK{
    UIImageView *IV = [[UIImageView alloc] initWithFrame:CGRectZero];
    switch (BK) {
        case qingtian: {
            IV.image = [UIImage imageNamed:@"BKqingtian"];
            break;
        }
        case shandian: {
            IV.image = [UIImage imageNamed:@"BKshandian"];
            break;
        }
        case xiaoyu: {
            IV.image = [UIImage imageNamed:@"BKxiaoyu"];
            break;
        }
        case xue: {
            IV.image = [UIImage imageNamed:@"BKxue"];
            break;
        }
        case yintian: {
            IV.image = [UIImage imageNamed:@"BKyintian"];
            break;
        }
    }
    return IV;
}
- (void)setBackgroundImageWithString:(NSString *)str{
    NSString *rain = @"雨";
    NSString *snow = @"雪";
    NSString *thund = @"雷";
    NSString *sun = @"晴";
    NSString *cloud = @"云";
    NSString *yin = @"阴";
    
    if (([str rangeOfString:yin].location != NSNotFound)||([str rangeOfString:cloud].location != NSNotFound)) {
        self.backgroundView = [self imageViewWithBK:yintian];
        return;
    }
    if ([str rangeOfString:sun].location != NSNotFound) {
        self.backgroundView = [self imageViewWithBK:qingtian];
        return;
    }
    if ([str rangeOfString:snow].location != NSNotFound) {
        self.backgroundView = [self imageViewWithBK:xue];
        return;
    }
    if ([str rangeOfString:rain].location != NSNotFound) {
        self.backgroundView = [self imageViewWithBK:xiaoyu];
    }
    if ([str rangeOfString:thund].location != NSNotFound) {
        self.backgroundView = [self imageViewWithBK:shandian];
        
    }
}
@end
