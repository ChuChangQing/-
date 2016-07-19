//
//  YXPictureModel.h
//  TRProject
//
//  Created by chuchangqing on 16/7/10.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PICItemModel,PICIconModel;
@interface YXPictureModel : NSObject

@property (nonatomic, strong) NSArray<PICItemModel *> *item;

@end

@interface PICItemModel : NSObject

@property (nonatomic, strong) PICIconModel *icon;

@property (nonatomic, copy) NSString *next;

@end

@interface PICIconModel : NSObject

@property (nonatomic, copy) NSString *url_l;

@property (nonatomic, assign) NSInteger l_height;

@property (nonatomic, assign) NSInteger l_width;

@property (nonatomic, copy) NSString *url;

@property (nonatomic, assign) NSInteger width;

@property (nonatomic, assign) NSInteger height;

@end

