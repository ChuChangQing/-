//
//  YXRecommendViewModel.m
//  TRProject
//
//  Created by chuchangqing on 16/7/9.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "YXRecommendViewModel.h"

@implementation YXRecommendViewModel
- (NSMutableArray<RCItemModel *> *)itemList {
    if(_itemList == nil) {
        _itemList = [[NSMutableArray<RCItemModel *> alloc] init];
    }
    return _itemList;
}
- (RCItemModel *)modelForRow:(NSInteger)row{
    return self.itemList[row % 30];
}
- (NSString *)nameForRow:(NSInteger)row{
    return [self modelForRow:row].user.name;
}
- (NSURL *)iconForRow:(NSInteger)row{
    return [self modelForRow:row].user.icon.url.yx_URL;
}

- (NSMutableArray<STRContentsModel *> *)contentsList {
    if(_contentsList == nil) {
        _contentsList = [[NSMutableArray<STRContentsModel *> alloc] init];
    }
    return _contentsList;
}
- (NSInteger)rowNumber{
    return self.contentsList.count;
}
- (STRContentsModel *)introModelForRow:(NSInteger)row{
    return self.contentsList[row];
}
- (NSString *)titleForRow:(NSInteger)row{
    return [self introModelForRow:row].news.title;
}
- (NSString *)summaryForRow:(NSInteger)row{
    return [self introModelForRow:row].news.summary;
}
- (void)getDataWithRequestMode:(VMRequestMode)requestMode completionHandler:(void (^)(NSError *))completionHandler{
    
        [YXNetManager getRecommendUserDatacompletionHandler:^(YXRecommendModel *model, NSError *error) {
            if (error) {
                DDLogError(@"error %@", error);
            }else{
                [self.itemList addObjectsFromArray:model.item];
            }
            !completionHandler ?: completionHandler(error);
        }];
    
        NSInteger tmpOffset = 0;
        switch (requestMode) {
            case VMRequestModeRefresh: {
                tmpOffset = 0;
                break;
            }
            case VMRequestModeMore: {
                tmpOffset = _offSet + 1;
                break;
            }
        }
        [YXNetManager getStarRecommendDataWithOffset:tmpOffset Completionhandler:^(YXStarRecommendModel *model, NSError *error) {
            if (error) {
                DDLogError(@"error %@", error);
            }else{
                if (requestMode == VMRequestModeRefresh) {
                    [self.contentsList removeAllObjects];
                }
                [self.contentsList addObjectsFromArray:model.data.contents];
                _offSet = tmpOffset;
            }
            !completionHandler ?: completionHandler(error);
        }];
}


@end
