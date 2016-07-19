//
//  YXGameViewModel.h
//  TRProject
//
//  Created by chuchangqing on 16/7/9.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TRBaseViewModel.h"

@interface YXGameViewModel : TRBaseViewModel
/** <#属性描述#> */
@property (nonatomic) NSString *cai1Name;
/** <#属性描述#> */
@property (nonatomic) NSString *intro1Cai;
/** <#属性描述#> */
@property (nonatomic) NSString *cai2Name;
/** <#属性描述#> */
@property (nonatomic) NSString *intro2Cai;
- (void)getGameDataWithRequestMode:(VMRequestMode)requestMode WithStar1:(NSInteger)star1 andStar2:(NSInteger)star2 completionHandler:(void (^)(NSError *))completionHandler;
@end
