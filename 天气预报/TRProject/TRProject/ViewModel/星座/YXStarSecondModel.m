//
//  YXStarSecondModel.m
//  TRProject
//
//  Created by chuchangqing on 16/7/7.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "YXStarSecondModel.h"

@implementation YXStarSecondModel
- (void)getDataWithStarName:(NSString *)starName RequestMode:(VMRequestMode)requestMode completionHandler:(void (^)(NSError *))completionHandler{
    [YXNetManager getStarDataWithName:starName Completionhandler:^(YXStarModel *model, NSError *error) {
        if (error) {
            DDLogError(@"error %@", error);
        }else{
            if (requestMode == VMRequestModeRefresh) {
                self.stardata = nil;
            }
            self.stardata = model.data[0].content;
        }
        !completionHandler ?: completionHandler(error);
    }];
}

@end
