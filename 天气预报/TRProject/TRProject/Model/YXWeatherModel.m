//
//  YXWeatherModel.m
//  TRProject
//
//  Created by chuchangqing on 16/7/3.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "YXWeatherModel.h"

@implementation YXWeatherModel

@end
@implementation WTResultModel
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"days":[WTDaysModel class],
             @"hours":[WTHoursModel class]};
}


@end


@implementation WTNowweatherModel

@end


@implementation WTDaysModel

@end


@implementation WTHoursModel

@end


