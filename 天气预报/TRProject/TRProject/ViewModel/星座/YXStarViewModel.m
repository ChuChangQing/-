//
//  YXStarViewModel.m
//  TRProject
//
//  Created by chuchangqing on 16/7/6.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "YXStarViewModel.h"

@implementation YXStarViewModel
- (NSInteger)rowNumber{
    return self.starPaihang.count;
}


- (NSArray<NSNumber *> *)starPaihang {
    if(_starPaihang == nil) {
        _starPaihang = [[NSArray<NSNumber *> alloc] init];
    }
    return _starPaihang;
}
//- (NSString *)starName{
//    return self.stardata[0].title;
//}
//- (NSString *)starIntro{
//    return self.stardata[0].content;
//}

- (void)getDataWithRequestMode:(VMRequestMode)requestMode completionHandler:(void (^)(NSError *))completionHandler{
    [YXNetManager getStarPaihangDataCompletionhandler:^(YXStarPaihangModel *model, NSError *error) {
        if (error) {
            DDLogError(@"error %@", error);
        }else{
//            if (requestMode == VMRequestModeRefresh) {
//                self.starPaihang = nil;
//            }
            self.starPaihang = model.data.stars;
            [self starList];
        }
        !completionHandler ?: completionHandler(error);
    }];
}

- (NSMutableArray<YXStarListModel *> *)starList {
    if(_starList == nil) {
        _starList = [[NSMutableArray<YXStarListModel *> alloc] init];
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            NSString *path = [[NSBundle mainBundle] pathForResource:@"StarList" ofType:@"plist"];
            NSArray *array = [NSArray arrayWithContentsOfFile:path];
            for (NSDictionary *dic in array) {
                [_starList addObject:[YXStarListModel parseStarListModel:dic]];
            }
        });
    }
    return _starList;
}



@end
