//
//  YXWeatherHeaderCell.h
//  TRProject
//
//  Created by chuchangqing on 16/7/3.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YXWeatherHeaderCell : UIView
/** 属性描述 */
@property (nonatomic) UILabel *dateLb;
/** <#属性描述#> */
@property (nonatomic) UILabel *cityLb;
/** <#属性描述#> */
@property (nonatomic) UILabel *weatherLb;
/** <#属性描述#> */
@property (nonatomic) UIImageView *weatherImageView;
/** <#属性描述#> */
@property (nonatomic) UIImageView *tmptImageView;
/** <#属性描述#> */
@property (nonatomic) UILabel *tmptLb;

/** 空气状况 */
@property (nonatomic) UIImageView *airImageView;
/** <#属性描述#> */
@property (nonatomic) UILabel *airLb;

/** 风向 */
@property (nonatomic) UIImageView *windImageView;
/** <#属性描述#> */
@property (nonatomic) UILabel *windLb;

/** 湿度 */
@property (nonatomic) UIImageView *shiduImageView;
/** <#属性描述#> */
@property (nonatomic) UILabel *shiduLb;

/** <#属性描述#> */
@property (nonatomic, assign) CGFloat cellWid;
/** <#属性描述#> */
@property (nonatomic, assign) CGFloat cellHei;

/** <#属性描述#> */
@property (nonatomic) UILabel *scrolLb;


@end
