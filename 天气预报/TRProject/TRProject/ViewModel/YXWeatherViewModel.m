//
//  YXWeatherViewModel.m
//  TRProject
//
//  Created by chuchangqing on 16/7/3.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "YXWeatherViewModel.h"

@implementation YXWeatherViewModel
- (NSInteger)rowNumber{
    return self.daysArray.count;
}
- (NSMutableArray<WTHoursModel *> *)hoursArray {
    if(_hoursArray == nil) {
        _hoursArray = [[NSMutableArray<WTHoursModel *> alloc] init];
    }
    return _hoursArray;
}
- (NSMutableArray<WTDaysModel *> *)daysArray {
    if(_daysArray == nil) {
        _daysArray = [[NSMutableArray<WTDaysModel *> alloc] init];
    }
    return _daysArray;
}
- (WTDaysModel *)daysModelForRow:(NSInteger)row{
    return self.daysArray[row];
}
//head
- (NSString *)HdataForRow{
    NSString *month = [[self daysModelForRow:0].date componentsSeparatedByString:@"/"].firstObject;
    NSString *day = [[self daysModelForRow:0].date componentsSeparatedByString:@"/"].lastObject;
    NSString *str = [NSString stringWithFormat:@"2016年%@月%@日",month, day];
    return str;
}
//- (NSString *)HcityForRow:(NSInteger)row{
//    return [self daysModelForRow:row]
//}
- (NSString *)HweatherForRow{
    return [self daysModelForRow:0].sky;
}
- (NSString *)HtmptForRow{
//    NSString *Hstr = [self daysModelForRow:0].maxTmp;
//    NSString *Lstr = [self daysModelForRow:0].minTmp;
//    NSString *str = [NSString stringWithFormat:@"%@~%@",Lstr,Hstr];
    return [NSString stringWithFormat:@"%@°C", [self hoursModelForRow:0].tmp];
}
- (NSString *)HairForRow{
    NSString *str = [NSString stringWithFormat:@"空气指数 %@", @([self daysModelForRow:0].run / 2 + 40).stringValue];
    return str;
}
- (NSString *)HwindForRow{
    return [self daysModelForRow:0].wind;
}
- (NSString *)HshiduForRow{
    NSInteger run = [self daysModelForRow:0].run;
    NSInteger shidu = (100 - run) / 2 + 45;
    NSString *str = [NSString stringWithFormat:@"湿度 %@",@(shidu).stringValue];
    return str;
}
- (NSInteger)icRowNumber{
    return self.hoursArray.count;
}
- (WTHoursModel *)hoursModelForRow:(NSInteger)row{
    return self.hoursArray[row];
}
- (NSString *)icLbForRow:(NSInteger)row{
    NSInteger time = [self hoursModelForRow:row].hour;
    NSString *weather = [self hoursModelForRow:row].sky;
    NSString *tmpt = [self hoursModelForRow:row].tmp;
    NSString *str = [NSString stringWithFormat:@"%ld时 %@ %@°C",time, weather, tmpt];
    return str;
}
//cell
//- (NSInteger)cellImageForRow:(NSInteger)row{
//    return [self daysModelForRow:row]
//}
- (NSString *)dateForRow:(NSInteger)row{
    return [self daysModelForRow:row].date;
}
- (NSString *)weatherForRow:(NSInteger)row{
    return [self daysModelForRow:row].sky;
}
- (NSString *)lowTempForRow:(NSInteger)row{
    return [self daysModelForRow:row].minTmp;
}
- (CGFloat)lowHeightForRow:(NSInteger)row{
    return [self daysModelForRow:row].minTmp.integerValue * 2.0;
}
- (NSString *)highTempForRow:(NSInteger)row{
    return [self daysModelForRow:row].maxTmp;
}
- (CGFloat)highHeightForRow:(NSInteger)row{
    return [self daysModelForRow:row].maxTmp.integerValue * 2.0;
}
- (WTNowweatherModel *)nowWeather {
    if(_nowWeather == nil) {
        _nowWeather = [[WTNowweatherModel alloc] init];
    }
    return _nowWeather;
}
- (void)getDataWithRequestMode:(VMRequestMode)requestMode withCity:(NSString *)city completionHandler:(void (^)(NSError *))completionHandler{
    [YXNetManager getWeatherDataCity:city completionHandler:^(YXWeatherModel *model, NSError *error) {
        if (error) {
            DDLogError(@"error %@", error);
        }else{
            if (requestMode == VMRequestModeRefresh) {
                [self.daysArray removeAllObjects];
                [self.hoursArray removeAllObjects];
            }
            [self.daysArray addObjectsFromArray:model.result.days];
            [self.hoursArray addObjectsFromArray:model.result.hours];
            self.nowWeather = model.result.nowWeather;
        }
        !completionHandler ?: completionHandler(error);
    }];
}

@end
