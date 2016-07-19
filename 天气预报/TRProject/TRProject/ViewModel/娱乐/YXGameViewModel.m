//
//  YXGameViewModel.m
//  TRProject
//
//  Created by chuchangqing on 16/7/9.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "YXGameViewModel.h"

@implementation YXGameViewModel
- (void)getGameDataWithRequestMode:(VMRequestMode)requestMode WithStar1:(NSInteger)star1 andStar2:(NSInteger)star2 completionHandler:(void (^)(NSError *))completionHandler{
    [YXNetManager getGameDataWithStar1:star1 andStar2:star2 completionHandler:^(YXGameModel *model, NSError *error) {
        if (error) {
            DDLogError(@"error %@", error);
        }else{
            self.cai1Name = model.data[0].title;
            self.cai2Name = model.data[1].title;
            self.intro1Cai = model.data[0].content;
            self.intro2Cai = model.data[1].content;
        }
        !completionHandler ?: completionHandler(error);
    }];
}
@end
