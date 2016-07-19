//
//  YXNetManager.h
//  TRProject
//
//  Created by chuchangqing on 16/7/3.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YXWeatherModel.h"
#import "YXStarModel.h"
#import "YXStarRecommendModel.h"
#import "YXStarPaihangModel.h"
#import "YXGameModel.h"
#import "YXPipeiModel.h"
#import "YXRecommendModel.h"
#import "YXPictureModel.h"

@interface YXNetManager : NSObject
+ (id)getWeatherDataCity:(NSString *)city completionHandler:(void(^)(YXWeatherModel *model, NSError *error))completionHandler;

+ (id)getStarDataWithName:(NSString *)starName Completionhandler:(void(^)(YXStarModel *model, NSError *error))completionHandler;

+ (id)getStarRecommendDataWithOffset:(NSInteger)offset Completionhandler:(void(^)(YXStarRecommendModel *model, NSError *error))completionHandler;

+ (id)getStarPaihangDataCompletionhandler:(void(^)(YXStarPaihangModel *model, NSError *error))completionHandler;

+ (id)getGameDataWithStar1:(NSInteger)star1 andStar2:(NSInteger)star2 completionHandler:(void(^)(YXGameModel *model, NSError *error))completionHandler;

+ (id)getPipeiDataWithStar1:(NSInteger)star1 andStar2:(NSInteger)star2 completionHandler:(void(^)(YXPipeiModel *model, NSError *error))completionHandler;

+ (id)getRecommendUserDatacompletionHandler:(void(^)(YXRecommendModel *model, NSError *error))completionHandler;

+ (id)getPictureDataWithOffset:(NSInteger)offset Completionhandler:(void(^)(YXPictureModel *model, NSError *error))completionHandler;
@end
