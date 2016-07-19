//
//  YXRecommendViewModel.h
//  TRProject
//
//  Created by chuchangqing on 16/7/9.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TRBaseViewModel.h"

@interface YXRecommendViewModel : TRBaseViewModel
/** <#属性描述#> */
@property (nonatomic ,assign) NSInteger offSet;
/** <#属性描述#> */
@property (nonatomic ,assign) NSInteger rowNumber;
/** <#属性描述#> */
@property (nonatomic) NSMutableArray<RCItemModel *> *itemList;
- (RCItemModel *)modelForRow:(NSInteger)row;
- (NSString *)nameForRow:(NSInteger)row;
- (NSURL *)iconForRow:(NSInteger)row;

@property (nonatomic) NSMutableArray<STRContentsModel *> *contentsList;
- (STRContentsModel *)introModelForRow:(NSInteger)row;
- (NSString *)titleForRow:(NSInteger)row;
- (NSString *)summaryForRow:(NSInteger)row;


@end
