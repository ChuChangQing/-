//
//  YXStarPaihangModel.h
//  TRProject
//
//  Created by chuchangqing on 16/7/6.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@class STPResultModel,STPDataModel;
@interface YXStarPaihangModel : NSObject

@property (nonatomic, strong) STPResultModel *result;

@property (nonatomic, strong) STPDataModel *data;

@end
@interface STPResultModel : NSObject

@property (nonatomic, copy) NSString *msg;

@property (nonatomic, assign) NSInteger resultCode;

@end

@interface STPDataModel : NSObject

@property (nonatomic, strong) NSArray<NSNumber *> *stars;

@end

