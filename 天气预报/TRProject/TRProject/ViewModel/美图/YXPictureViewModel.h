//
//  YXPictureViewModel.h
//  TRProject
//
//  Created by chuchangqing on 16/7/10.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TRBaseViewModel.h"

@interface YXPictureViewModel : TRBaseViewModel
/** <#属性描述#> */
@property (nonatomic) NSInteger offset;
/** <#属性描述#> */
@property (nonatomic,readonly) NSInteger rowNumber;
/** <#属性描述#> */
@property (nonatomic) NSMutableArray<PICItemModel *> *itemList;

- (PICItemModel *)modelForRow:(NSInteger)row;
- (NSURL *)iconForRow:(NSInteger)row;
- (double)hwScaleForRow:(NSInteger)row;
- (NSURL *)iconLargeForRow:(NSInteger)row;


@end
