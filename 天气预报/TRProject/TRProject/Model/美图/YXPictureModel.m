//
//  YXPictureModel.m
//  TRProject
//
//  Created by chuchangqing on 16/7/10.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "YXPictureModel.h"

@implementation YXPictureModel
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"item": [PICItemModel class]};
}
@end

@implementation PICItemModel

@end


@implementation PICIconModel

@end


