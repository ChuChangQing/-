//
//  YXStarViewModel.h
//  TRProject
//
//  Created by chuchangqing on 16/7/6.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TRBaseViewModel.h"
#import "YXStarListModel.h"

@interface YXStarViewModel : TRBaseViewModel

///** <#属性描述#> */
//@property (nonatomic) NSString *starName;
///** <#属性描述#> */
//@property (nonatomic) NSString *starIntro;
/** <#属性描述#> */
@property (nonatomic) NSArray<NSNumber *> *starPaihang;
/** <#属性描述#> */
@property (nonatomic, readonly) NSInteger rowNumber;
/** <#属性描述#> */
@property (nonatomic) NSMutableArray<YXStarListModel *> *starList;




@end
