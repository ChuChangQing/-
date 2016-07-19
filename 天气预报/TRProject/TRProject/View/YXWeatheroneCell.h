//
//  YXWeatheroneCell.h
//  TRProject
//
//  Created by chuchangqing on 16/7/3.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YXWeatheroneCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *dateLb;
@property (weak, nonatomic) IBOutlet UILabel *weatherLb;
@property (weak, nonatomic) IBOutlet UILabel *lowTemtLb;
@property (weak, nonatomic) IBOutlet UIView *lowHeiView;
@property (weak, nonatomic) IBOutlet UILabel *highTemtLb;
@property (weak, nonatomic) IBOutlet UIView *highHeiView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *lowHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *highHeight;

@end
