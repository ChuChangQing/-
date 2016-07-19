//
//  YXStarModel.h
//  TRProject
//
//  Created by chuchangqing on 16/7/6.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@class STResultModel,STDataModel;
@interface YXStarModel : NSObject

@property (nonatomic, strong) STResultModel *result;

@property (nonatomic, strong) NSArray<STDataModel *> *data;

@end
@interface STResultModel : NSObject

@property (nonatomic, copy) NSString *msg;

@property (nonatomic, assign) NSInteger resultCode;

@end

@interface STDataModel : NSObject

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *content;

@property (nonatomic, copy) NSString *share_text;

@end

