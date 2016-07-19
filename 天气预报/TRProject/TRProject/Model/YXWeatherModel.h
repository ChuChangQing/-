//
//  YXWeatherModel.h
//  TRProject
//
//  Created by chuchangqing on 16/7/3.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WTResultModel,WTNowweatherModel,WTDaysModel,WTHoursModel;
@interface YXWeatherModel : NSObject

@property (nonatomic, assign) BOOL success;

@property (nonatomic, copy) NSString *errorInfo;

@property (nonatomic, strong) WTResultModel *result;

@property (nonatomic, copy) NSString *errorCode;

@end
@interface WTResultModel : NSObject

@property (nonatomic, strong) NSArray<WTDaysModel *> *days;

@property (nonatomic, strong) WTNowweatherModel *nowWeather;

@property (nonatomic, strong) NSArray<WTHoursModel *> *hours;

@end

@interface WTNowweatherModel : NSObject

@property (nonatomic, copy) NSString *sky;

@property (nonatomic, assign) NSInteger skyId;

@end

@interface WTDaysModel : NSObject

@property (nonatomic, copy) NSString *sky;

@property (nonatomic, copy) NSString *wind;

@property (nonatomic, copy) NSString *minTmp;

@property (nonatomic, assign) NSInteger run;

@property (nonatomic, copy) NSString *maxTmp;

@property (nonatomic, copy) NSString *date;

@end

@interface WTHoursModel : NSObject

@property (nonatomic, copy) NSString *sky;

@property (nonatomic, copy) NSString *wind;

@property (nonatomic, assign) NSInteger run;

@property (nonatomic, copy) NSString *tmp;

@property (nonatomic, assign) NSInteger hour;

@end

