//
//  YXRecommendModel.h
//  TRProject
//
//  Created by chuchangqing on 16/7/9.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RCInfoModel,RCItemModel,RCUserModel,RCIconModel;
@interface YXRecommendModel : NSObject

@property (nonatomic, strong) RCInfoModel *info;

@property (nonatomic, strong) NSArray<RCItemModel *> *item;

@end
@interface RCInfoModel : NSObject

@property (nonatomic, copy) NSString *num;

@end

@interface RCItemModel : NSObject

@property (nonatomic, strong) RCUserModel *user;

@property (nonatomic, copy) NSString *ts;

@property (nonatomic, copy) NSString *display_del;

@property (nonatomic, copy) NSString *cont;

@end

@interface RCUserModel : NSObject


@property (nonatomic, strong) RCIconModel *icon;

@property (nonatomic, copy) NSString *next;

@property (nonatomic, copy) NSString *name;

@end

@interface RCIconModel : NSObject

@property (nonatomic, copy) NSString *url;

@property (nonatomic, assign) NSInteger width;

@property (nonatomic, assign) NSInteger height;

@end

