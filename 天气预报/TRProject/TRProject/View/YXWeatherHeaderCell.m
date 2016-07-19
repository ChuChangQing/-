//
//  YXWeatherHeaderCell.m
//  TRProject
//
//  Created by chuchangqing on 16/7/3.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "YXWeatherHeaderCell.h"

@implementation YXWeatherHeaderCell
- (UILabel *)dateLb {
    if(_dateLb == nil) {
        _dateLb = [[UILabel alloc] init];
        [self addSubview:_dateLb];
        [_dateLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(30);
            make.centerX.equalTo(self.weatherImageView.mas_centerX);
            make.height.equalTo(20);
        }];
        _dateLb.textAlignment = NSTextAlignmentCenter;
        _dateLb.font = [UIFont systemFontOfSize:15];
        _dateLb.textColor = [UIColor whiteColor];
    }
    return _dateLb;
}

- (UILabel *)cityLb {
    if(_cityLb == nil) {
        _cityLb = [[UILabel alloc] init];
        [self addSubview:_cityLb];
        [_cityLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(20);
            make.centerX.equalTo(self.weatherLb.mas_centerX);
            make.height.equalTo(20);
        }];
        _cityLb.textAlignment = NSTextAlignmentCenter;
        _cityLb.font = [UIFont systemFontOfSize:20];
        _cityLb.textColor = [UIColor whiteColor];
    }
    return _cityLb;
}

- (UILabel *)weatherLb {
    if(_weatherLb == nil) {
        _weatherLb = [[UILabel alloc] init];
        [self addSubview:_weatherLb];
        [_weatherLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(20);
            make.top.equalTo(100);
            make.height.equalTo(50);
            make.width.equalTo(200);
        }];
        _weatherLb.textAlignment = NSTextAlignmentCenter;
        _weatherLb.font = [UIFont systemFontOfSize:40];
        _weatherLb.textColor = [UIColor whiteColor];
    }
    return _weatherLb;
}

- (UIImageView *)weatherImageView {
    if(_weatherImageView == nil) {
        _weatherImageView = [[UIImageView alloc] init];
        [self addSubview:_weatherImageView];
        [_weatherImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(-20);
            make.top.equalTo(self.cityLb.mas_bottom).equalTo(30);
            make.width.equalTo(128);
            make.height.equalTo(110);
        }];
        _weatherImageView.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _weatherImageView;
}

- (UIImageView *)tmptImageView {
    if(_tmptImageView == nil) {
        _tmptImageView = [[UIImageView alloc] init];
        [self addSubview:_tmptImageView];
        [_tmptImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.weatherLb.mas_left).equalTo(40);
            make.top.equalTo(self.weatherLb.mas_bottom).equalTo(10);
            make.width.equalTo(40);
            make.height.equalTo(40);
        }];
        //        _tmptImageView.contentMode = UIViewContentModeScaleAspectFill;
        _tmptImageView.image = [UIImage imageNamed:@"wendu"];
    }
    return _tmptImageView;
}

- (UILabel *)tmptLb {
    if(_tmptLb == nil) {
        _tmptLb = [[UILabel alloc] init];
        [self addSubview:_tmptLb];
        [_tmptLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.tmptImageView.mas_right).equalTo(20);
            make.top.equalTo(self.weatherLb.mas_bottom).equalTo(15);
            make.height.equalTo(30);
        }];
        _tmptLb.textAlignment = NSTextAlignmentCenter;
        _tmptLb.font = [UIFont systemFontOfSize:18];
        _tmptLb.textColor = [UIColor whiteColor];
    }
    return _tmptLb;
}


- (UIImageView *)airImageView {
    if(_airImageView == nil) {
        _airImageView = [[UIImageView alloc] init];
        [self addSubview:_airImageView];
        [_airImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(-40);
            make.left.equalTo(40);
            make.height.equalTo(self.cellHei);
            make.width.equalTo(self.cellWid);
        }];
//        _airImageView.contentMode = UIViewContentModeScaleAspectFill;
        _airImageView.image = [UIImage imageNamed:@"air"];
    }
    return _airImageView;
}
- (UIImageView *)windImageView {
    if(_windImageView == nil) {
        _windImageView = [[UIImageView alloc] init];
        [self addSubview:_windImageView];
        [_windImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.airImageView.mas_top);
            make.left.equalTo(self.airImageView.mas_right).equalTo(70);
            make.height.equalTo(self.cellHei);
            make.width.equalTo(self.cellWid);
        }];
//        _windImageView.contentMode = UIViewContentModeScaleAspectFill;
        _windImageView.image = [UIImage imageNamed:@"fengxiang"];
    }
    return _windImageView;
}

- (UIImageView *)shiduImageView {
    if(_shiduImageView == nil) {
        _shiduImageView = [[UIImageView alloc] init];
        [self addSubview:_shiduImageView];
        [_shiduImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.airImageView.mas_top);
            make.left.equalTo(self.windImageView.mas_right).equalTo(70);
            make.height.equalTo(self.cellHei);
            make.width.equalTo(self.cellWid);
        }];
//        _shiduImageView.contentMode = UIViewContentModeScaleAspectFill;
        _shiduImageView.image = [UIImage imageNamed:@"shidu"];
    }
    return _shiduImageView;
}
- (UILabel *)airLb {
    if(_airLb == nil) {
        _airLb = [[UILabel alloc] init];
        [self addSubview:_airLb];
        [_airLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.airImageView.mas_centerX);
            make.bottom.equalTo(-10);
            make.height.equalTo(20);
            
        }];
        _airLb.textAlignment = NSTextAlignmentCenter;
        _airLb.font = [UIFont systemFontOfSize:15];
        _airLb.textColor = [UIColor whiteColor];
        
    }
    return _airLb;
}

- (UILabel *)windLb {
    if(_windLb == nil) {
        _windLb = [[UILabel alloc] init];
        [self addSubview:_windLb];
        [_windLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.windImageView.mas_left);
            make.bottom.equalTo(-10);
            make.height.equalTo(20);
            make.width.equalTo(self.windImageView.mas_width);
        }];
        _windLb.textAlignment = NSTextAlignmentCenter;
        _windLb.font = [UIFont systemFontOfSize:15];
        _windLb.textColor = [UIColor whiteColor];
    }
    return _windLb;
}


- (UILabel *)shiduLb {
    if(_shiduLb == nil) {
        _shiduLb = [[UILabel alloc] init];
        [self addSubview:_shiduLb];
        [_shiduLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.windLb.mas_right).equalTo(50);
            make.bottom.equalTo(-10);
            make.height.equalTo(20);
            make.width.equalTo(self.shiduImageView.mas_width).equalTo(40);
        }];
        _shiduLb.textAlignment = NSTextAlignmentCenter;
        _shiduLb.font = [UIFont systemFontOfSize:15];
        _shiduLb.textColor = [UIColor whiteColor];
    }
    return _shiduLb;
}

- (UILabel *)scrolLb {
    if(_scrolLb == nil) {
        _scrolLb = [[UILabel alloc] init];
        [self addSubview:_scrolLb];
        [_scrolLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.cityLb.mas_centerX);
            make.top.equalTo(self.cityLb.mas_bottom).equalTo(20);
            make.height.equalTo(30);
//            make.width.equalTo(150);
        }];
        _scrolLb.textColor = [UIColor whiteColor];
    }
    return _scrolLb;
}

//- (iCarousel *)ic {
//    if(_ic == nil) {
//        _ic = [[iCarousel alloc] init];
//        UIView *view = [UIView new];
//        [self addSubview:view];
//        [view mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.centerX.equalTo(self.cityLb.mas_centerX);
//            make.top.equalTo(self.cityLb.mas_bottom).equalTo(20);
//            make.height.equalTo(30);
//            make.width.equalTo(150);
//        }];
//        [view addSubview:_ic];
//        [_ic mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.edges.equalTo(0);
//        }];
//        _ic.backgroundColor = [UIColor darkGrayColor];
//        
//    }
//    return _ic;
//}


- (CGFloat)cellHei{
    return (kScreenW - 200) / 3;
}
- (CGFloat)cellWid{
    return self.cellHei;
}
@end
