//
//  YXStarListModel.m
//  TRProject
//
//  Created by chuchangqing on 16/7/7.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "YXStarListModel.h"

@implementation YXStarListModel
+ (YXStarListModel *)parseStarListModel:(NSDictionary *)starlist{
    YXStarListModel *model = [self new];
    model.starName  = starlist[@"starName"];
    model.intro = starlist[@"intro"];
    model.emotion1 = starlist[@"emotion1"];
    model.emotion2 = starlist[@"emotion2"];
    model.emotion3 = starlist[@"emotion3"];
    model.age = starlist[@"age"];
    return model;
}
@end
