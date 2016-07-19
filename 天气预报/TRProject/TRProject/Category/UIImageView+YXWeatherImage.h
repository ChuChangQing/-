//
//  UIImageView+YXWeatherImage.h
//  TRProject
//
//  Created by chuchangqing on 16/7/4.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger ,WeatherMode){
    duoyunWeatherMode,      //多云  id  1
    yinWeatherMode,         //阴  id  2
    qingWeatherMode,        //晴天  id 3
    leizhenyuWeatherMode,   //雷阵雨 id 4
    yuWeatherMode,           //雨  id 5
    xueWeatherMode,           //雪    id 6
    yujiaxueWeatherMode,      //雨夹雪  id 7
    bingbaoWeatherMode         //冰雹   id 8
};
@interface UIImageView (YXWeatherImage)

- (void)imgViewSetImageWithString:(NSString *)str;

@end
