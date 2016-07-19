//
//  YXPipeiModel.h
//  TRProject
//
//  Created by chuchangqing on 16/7/9.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PPResultModel,PPDataModel;
@interface YXPipeiModel : NSObject

@property (nonatomic, strong) PPResultModel *result;

@property (nonatomic, strong) PPDataModel *data;

@end
@interface PPResultModel : NSObject

@property (nonatomic, copy) NSString *msg;

@property (nonatomic, assign) NSInteger resultCode;

@end

@interface PPDataModel : NSObject

@property (nonatomic, copy) NSString *pair_value;

@property (nonatomic, copy) NSString *share_text;

@property (nonatomic, copy) NSString *info;

@property (nonatomic, copy) NSString *rate;

@end

