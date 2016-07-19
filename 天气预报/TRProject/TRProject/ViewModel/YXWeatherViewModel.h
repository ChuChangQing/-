//
//  YXWeatherViewModel.h
//  TRProject
//
//  Created by chuchangqing on 16/7/3.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TRBaseViewModel.h"
#import "YXWeatherModel.h"


@interface YXWeatherViewModel : TRBaseViewModel
/** <#属性描述#> */
@property (nonatomic ,assign) NSInteger rowNumber;
/**  */
/** <#属性描述#> */
@property (nonatomic) NSMutableArray<WTDaysModel *> *daysArray;
/** <#属性描述#> */
@property (nonatomic) NSMutableArray<WTHoursModel *> *hoursArray;
- (WTDaysModel *)daysModelForRow:(NSInteger)row;
- (WTHoursModel *)hoursModelForRow:(NSInteger)row;
//head
- (NSString *)HdataForRow;
//- (NSString *)HcityForRow:(NSInteger)row;
- (NSString *)HweatherForRow;
- (NSString *)HtmptForRow;
- (NSString *)HairForRow;
- (NSString *)HwindForRow;
- (NSString *)HshiduForRow;
/** <#属性描述#> */
@property (nonatomic, readonly) NSInteger icRowNumber;
- (NSString *)icLbForRow:(NSInteger)row;

//cell
//- (NSInteger)cellImageForRow:(NSInteger)row;
- (NSString *)dateForRow:(NSInteger)row;
- (NSString *)weatherForRow:(NSInteger)row;
- (NSString *)lowTempForRow:(NSInteger)row;
- (CGFloat)lowHeightForRow:(NSInteger)row;
- (NSString *)highTempForRow:(NSInteger)row;
- (CGFloat)highHeightForRow:(NSInteger)row;

- (void)getDataWithRequestMode:(VMRequestMode)requestMode withCity:(NSString *)city completionHandler:(void(^)(NSError *error))completionHandler;

/** <#属性描述#> */
@property (nonatomic ,strong) WTNowweatherModel *nowWeather;


@end
