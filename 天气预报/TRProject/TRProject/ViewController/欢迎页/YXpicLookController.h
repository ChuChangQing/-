//
//  YXpicLookController.h
//  TRProject
//
//  Created by chuchangqing on 16/7/12.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <MWPhotoBrowser/MWPhotoBrowser.h>

@interface YXpicLookController : MWPhotoBrowser
/** <#属性描述#> */
@property (nonatomic) NSURL *url;
- (instancetype)initWithUrl:(NSURL *)url;
@end
