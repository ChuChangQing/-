//
//  YXStarSecondModel.h
//  TRProject
//
//  Created by chuchangqing on 16/7/7.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TRBaseViewModel.h"

@interface YXStarSecondModel : TRBaseViewModel

- (void)getDataWithStarName:(NSString *)starName RequestMode:(VMRequestMode)requestMode completionHandler:(void (^)(NSError *))completionHandler;
/** <#属性描述#> */
@property (nonatomic) NSString  *stardata;

@end
