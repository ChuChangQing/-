//
//  YXPictureViewModel.m
//  TRProject
//
//  Created by chuchangqing on 16/7/10.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "YXPictureViewModel.h"

@implementation YXPictureViewModel
- (NSMutableArray<PICItemModel *> *)itemList {
    if(_itemList == nil) {
        _itemList = [[NSMutableArray<PICItemModel *> alloc] init];
    }
    return _itemList;
}
- (NSInteger)rowNumber{
    return self.itemList.count;
}
- (PICItemModel *)modelForRow:(NSInteger)row{
    return self.itemList[row];
}
- (NSURL *)iconForRow:(NSInteger)row{
    return [self modelForRow:row].icon.url.yx_URL;
}
- (NSURL *)iconLargeForRow:(NSInteger)row{
    return [self modelForRow:row].icon.url_l.yx_URL;
}

- (void)getDataWithRequestMode:(VMRequestMode)requestMode completionHandler:(void (^)(NSError *))completionHandler{
    NSInteger tmpPage = 1;
    switch (requestMode) {
        case VMRequestModeRefresh: {
            tmpPage = 1;
            break;
        }
        case VMRequestModeMore: {
            tmpPage = _offset + 1;
            break;
        }
    }
    [YXNetManager getPictureDataWithOffset:tmpPage Completionhandler:^(YXPictureModel *model, NSError *error) {
        if (error) {
            DDLogError(@"error %@", error);
        }else{
            if (requestMode == VMRequestModeRefresh) {
                [self.itemList removeAllObjects];
            }
            [self.itemList addObjectsFromArray:model.item];
            _offset = tmpPage;
        }
        !completionHandler ?: completionHandler(error);
    }];
}
- (double)hwScaleForRow:(NSInteger)row{
    return ([self modelForRow:row].icon.height/1.0) / ([self modelForRow:row].icon.width/1.0);
}
@end
