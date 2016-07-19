//
//  UIImageView+YXStarImage.h
//  TRProject
//
//  Created by chuchangqing on 16/7/7.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
//十二星座
typedef NS_ENUM(NSInteger, StarName) {
    baiyangzuoStarName,//1
    jinniuzuoStarName,//2
    shuangziStarName,//3
    juxiezuoStarName,//4
    shizizuoStarName,//5
    chunvzuoStarName,//6
    tianchengzuoStarName, //7
    tianxiezuoStarName, //8
    sheshouzuoStarName,//9
    mojiezuoStarName,//10
    shuipingzuoStarName, //11
    shuangyuzuoStarName,//12
};
@interface UIImageView (YXStarImage)
- (void)setStarImageWithStarName:(StarName)starName;
@end
