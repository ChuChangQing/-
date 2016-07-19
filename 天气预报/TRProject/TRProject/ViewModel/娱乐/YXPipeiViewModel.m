//
//  YXPipeiViewModel.m
//  TRProject
//
//  Created by chuchangqing on 16/7/9.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "YXPipeiViewModel.h"

@implementation YXPipeiViewModel
- (void)getDataWithRequestMode:(VMRequestMode)requestMode WithStar1:(NSInteger)star1 andStar2:(NSInteger)star2 completionHandler:(void (^)(NSError *))completionHandler{
    [YXNetManager getPipeiDataWithStar1:star1 andStar2:star2 completionHandler:^(YXPipeiModel *model, NSError *error) {
        if (error) {
            DDLogError(@"error %@", error);
        }else{
            self.pairValue = model.data.pair_value;
            self.rate = model.data.rate;
            self.intro = model.data.info;
        }
        !completionHandler ?: completionHandler(error);
    }];
}
@end
