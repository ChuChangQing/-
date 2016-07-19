//
//  YXStarListModel.h
//  TRProject
//
//  Created by chuchangqing on 16/7/7.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YXStarListModel : NSObject
/** <#属性描述#> */
@property (nonatomic ) NSString *starName;
/** <#属性描述#> */
@property (nonatomic) NSString *intro;
/** */
@property (nonatomic) NSString *emotion1;
/** */
@property (nonatomic) NSString *emotion2;
/** */
@property (nonatomic) NSString *emotion3;

@property (nonatomic) NSString *age;

+ (YXStarListModel *)parseStarListModel:(NSDictionary *)starlist;
@end
