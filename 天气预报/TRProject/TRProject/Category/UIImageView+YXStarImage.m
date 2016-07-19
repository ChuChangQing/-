//
//  UIImageView+YXStarImage.m
//  TRProject
//
//  Created by chuchangqing on 16/7/7.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "UIImageView+YXStarImage.h"

@implementation UIImageView (YXStarImage)
- (void)setStarImageWithStarName:(StarName)starName{
    switch (starName) {
        case baiyangzuoStarName: {
            self.image = [UIImage imageNamed:@"baiyang"];
            break;
        }
        case jinniuzuoStarName: {
            self.image = [UIImage imageNamed:@"jinniu1"];
            break;
        }
        case shuangziStarName: {
            self.image = [UIImage imageNamed:@"shuangzi"];
            break;
        }
        case juxiezuoStarName: {
            self.image = [UIImage imageNamed:@"juxie"];
            break;
        }
        case shizizuoStarName: {
            self.image = [UIImage imageNamed:@"shizi"];
            break;
        }
        case chunvzuoStarName: {
            self.image = [UIImage imageNamed:@"chunv"];
            break;
        }
        case tianchengzuoStarName: {
            self.image = [UIImage imageNamed:@"tianping"];
            break;
        }
        case tianxiezuoStarName: {
            self.image = [UIImage imageNamed:@"tianxie"];
            break;
        }
        case sheshouzuoStarName: {
            self.image = [UIImage imageNamed:@"sheshou"];
            break;
        }
        case mojiezuoStarName: {
            self.image = [UIImage imageNamed:@"mojie"];
            break;
        }
        case shuipingzuoStarName: {
            self.image = [UIImage imageNamed:@"shuiping"];
            break;
        }
        case shuangyuzuoStarName: {
            self.image = [UIImage imageNamed:@"shuangyu"];
            break;
        }
    }
}
@end
