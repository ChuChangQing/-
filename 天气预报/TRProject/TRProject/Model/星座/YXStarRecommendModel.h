//
//  YXStarRecommendModel.h
//  TRProject
//
//  Created by chuchangqing on 16/7/6.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@class STRDataModel,STRContentsModel,STRNewsModel;
@interface YXStarRecommendModel : NSObject



@property (nonatomic, strong) STRDataModel *data;

@end


@interface STRDataModel : NSObject

@property (nonatomic, copy) NSString *offset;

@property (nonatomic, strong) NSArray<STRContentsModel *> *contents;

@property (nonatomic, copy) NSString *total;

@property (nonatomic, copy) NSString *category;

@end

@interface STRContentsModel : NSObject

@property (nonatomic, strong) STRNewsModel *news;

@end

@interface STRNewsModel : NSObject



@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *timestamp;

@property (nonatomic, copy) NSString *category;

@property (nonatomic, copy) NSString *summary;

@end

