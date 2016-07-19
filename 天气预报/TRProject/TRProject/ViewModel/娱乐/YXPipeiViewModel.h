//
//  YXPipeiViewModel.h
//  TRProject
//
//  Created by chuchangqing on 16/7/9.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TRBaseViewModel.h"

@interface YXPipeiViewModel : TRBaseViewModel
/** <#属性描述#> */
@property (nonatomic) NSString *pairValue;
/** <#属性描述#> */
@property (nonatomic) NSString *rate;
/** <#属性描述#> */
@property (nonatomic) NSString *intro;
- (void)getDataWithRequestMode:(VMRequestMode)requestMode WithStar1:(NSInteger)star1 andStar2:(NSInteger)star2 completionHandler:(void (^)(NSError *))completionHandler;
@end
