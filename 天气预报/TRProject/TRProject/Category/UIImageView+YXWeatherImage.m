//
//  UIImageView+YXWeatherImage.m
//  TRProject
//
//  Created by chuchangqing on 16/7/4.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "UIImageView+YXWeatherImage.h"

@implementation UIImageView (YXWeatherImage)

- (void)imgViewSetImage:(WeatherMode)weathermode{
    switch (weathermode) {
        case duoyunWeatherMode: {
            self.image = [UIImage imageNamed:@"1duoyun"];
            break;
        }
        case yinWeatherMode: {
            self.image = [UIImage imageNamed:@"2yin"];
            break;
        }
        case qingWeatherMode: {
            self.image = [UIImage imageNamed:@"3qingtian"];
            break;
        }
        case leizhenyuWeatherMode: {
            self.image = [UIImage imageNamed:@"4leizhenyu"];
            break;
        }
        case yuWeatherMode: {
            self.image = [UIImage imageNamed:@"5yu"];
            break;
        }
        case xueWeatherMode: {
            self.image = [UIImage imageNamed:@"6xue"];
            break;
        }
        case yujiaxueWeatherMode: {
            self.image = [UIImage imageNamed:@"7yujiaxue"];
            break;
        }
        case bingbaoWeatherMode: {
            self.image = [UIImage imageNamed:@"8bingbao"];
            break;
        }
    }
}

- (void)imgViewSetImageWithString:(NSString *)str{
    NSString *rain = @"雨";
    NSString *snow = @"雪";
    NSString *thund = @"雷";
    NSString *sun = @"晴";
    NSString *cloud = @"云";
    NSString *yin = @"阴";
    NSString *bingbao = @"雹";
    if ([str rangeOfString:bingbao].location != NSNotFound) {
        [self imgViewSetImage:bingbaoWeatherMode];
        return;
    }
    if ([str rangeOfString:thund].location != NSNotFound) {
        [self imgViewSetImage:leizhenyuWeatherMode];
        return;
    }
    if ([str rangeOfString:snow].location != NSNotFound) {
        if ([str rangeOfString:rain].location != NSNotFound) {
            [self imgViewSetImage:yujiaxueWeatherMode];
        }else{
            [self imgViewSetImage:xueWeatherMode];
        }
        return;
    }
    if ([str rangeOfString:yin].location != NSNotFound) {
        [self imgViewSetImage:yinWeatherMode];
        return;
    }
    if ([str rangeOfString:cloud].location != NSNotFound) {
        [self imgViewSetImage:duoyunWeatherMode];
        return;
    }
    if ([str rangeOfString:rain].location != NSNotFound) {
        [self imgViewSetImage:yuWeatherMode];
        return;
    }
    if ([str rangeOfString:sun].location != NSNotFound) {
        [self imgViewSetImage:qingWeatherMode];
    }else{
        [self imgViewSetImage:yinWeatherMode];
    }
}
@end
