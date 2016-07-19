//
//  YXGameModel.h
//  TRProject
//
//  Created by chuchangqing on 16/7/9.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@class GMResultModel,GMDataModel;
@interface YXGameModel : NSObject

@property (nonatomic, strong) GMResultModel *result;

@property (nonatomic, strong) NSArray<GMDataModel *> *data;

@end
@interface GMResultModel : NSObject

@property (nonatomic, copy) NSString *msg;

@property (nonatomic, assign) NSInteger resultCode;

@end

@interface GMDataModel : NSObject

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *image;

@property (nonatomic, copy) NSString *content;

@end

