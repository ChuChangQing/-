//
//  YXGameSecondController.m
//  TRProject
//
//  Created by chuchangqing on 16/7/9.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "YXGameSecondController.h"
#import "YXGameViewModel.h"


@interface YXGameSecondController ()
/**  */
@property (nonatomic) UIView *Hview;
@property (nonatomic) UILabel *cai1NameLb;
@property (nonatomic) UITextView *intro1TV;
@property (nonatomic) UILabel *cai2NameLb;
@property (nonatomic) UITextView *intro2TV;
@property (nonatomic) UILabel *starName1Lb;
@property (nonatomic) UILabel *starName2Lb;
@property (nonatomic) UIImageView *star1Img;
@property (nonatomic) UIImageView *star2Img;

@property (nonatomic) YXGameViewModel *gameVM;

/** <#属性描述#> */
@property (nonatomic) NSMutableArray<YXStarListModel *> *starList;

@end

@implementation YXGameSecondController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self gameVM];
    [self starList];
    UIImageView *bk = [[UIImageView alloc] initWithFrame:CGRectZero];
    bk.image = [UIImage imageNamed:@"starBK"];
    self.tableView.backgroundView = bk;
    self.tableView.tableHeaderView = self.Hview;
    
    self.starName1Lb.text = self.starList[_maleIndex].starName;
    self.starName2Lb.text = self.starList[_FmaleIndex].starName;
    [self.star1Img setStarImageWithStarName:_maleIndex];
    self.star1Img.layer.cornerRadius = 10;
    self.star1Img.layer.masksToBounds = YES;
    [self.star2Img setStarImageWithStarName:_FmaleIndex];
    self.star2Img.layer.cornerRadius = 10;
    self.star2Img.layer.masksToBounds = YES;
    
    
    [self.gameVM getGameDataWithRequestMode:VMRequestModeRefresh WithStar1:self.maleIndex andStar2:self.FmaleIndex completionHandler:^(NSError *error) {
        if (error) {
            DDLogError(@"error %@", error);
        }else{
            self.cai1NameLb.text = _gameVM.cai1Name;
            self.cai2NameLb.text = _gameVM.cai2Name;
            self.intro1TV.text = _gameVM.intro1Cai;
            self.intro2TV.text = _gameVM.intro2Cai;            
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
#pragma mark - Lazyload 懒加载
- (YXGameViewModel *)gameVM {
	if(_gameVM == nil) {
		_gameVM = [[YXGameViewModel alloc] init];
	}
	return _gameVM;
}
- (NSMutableArray<YXStarListModel *> *)starList {
    if(_starList == nil) {
        _starList = [[NSMutableArray<YXStarListModel *> alloc] init];
            NSString *path = [[NSBundle mainBundle] pathForResource:@"StarList" ofType:@"plist"];
            NSArray *array = [NSArray arrayWithContentsOfFile:path];
            for (NSDictionary *dic in array) {
                [_starList addObject:[YXStarListModel parseStarListModel:dic]];
            }
        };
    return _starList;
}
- (UIView *)Hview {
	if(_Hview == nil) {
		_Hview = [[UIView alloc] initWithFrame:self.view.frame];
        UILabel *nan = [UILabel new];
        [_Hview addSubview:nan];
        [nan mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(86);
            make.top.equalTo(64);
            make.width.height.equalTo(25);
        }];
        nan.font = [UIFont systemFontOfSize:25];
        nan.textColor = kRGBColor(131, 209, 219, 1.0);
        nan.text = @"男";
        
        UILabel *nv = [UILabel new];
        [_Hview addSubview:nv];
        [nv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(-30);
            make.top.equalTo(64);
            make.width.height.equalTo(25);
        }];
        nv.font = [UIFont systemFontOfSize:25];
        nv.textColor = kRGBColor(244, 105, 123, 1.0);
        nv.text = @"女";
	}
	return _Hview;
}

- (UILabel *)cai1NameLb {
	if(_cai1NameLb == nil) {
		_cai1NameLb = [[UILabel alloc] init];
        [self.Hview addSubview:_cai1NameLb];
        [_cai1NameLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.Hview.mas_centerX).equalTo(0);
            make.top.equalTo(245);
            make.height.equalTo(21);
        }];
        _cai1NameLb.font = [UIFont systemFontOfSize:20];
        _cai1NameLb.textColor = [UIColor whiteColor];
	}
	return _cai1NameLb;
}

- (UITextView *)intro1TV {
	if(_intro1TV == nil) {
		_intro1TV = [[UITextView alloc] init];
        [self.Hview addSubview:_intro1TV];
        [_intro1TV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(30);
            make.right.equalTo(-30);
            make.top.equalTo(280);
            make.height.equalTo(120);
        }];
        _intro1TV.textColor = [UIColor whiteColor];
        _intro1TV.backgroundColor = [UIColor clearColor];
        _intro1TV.font = [UIFont systemFontOfSize:15];
	}
	return _intro1TV;
}

- (UILabel *)cai2NameLb {
	if(_cai2NameLb == nil) {
		_cai2NameLb = [[UILabel alloc] init];
        [self.Hview addSubview:_cai2NameLb];
        [_cai2NameLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.Hview.mas_centerX).equalTo(0);
            make.top.equalTo(395);
            make.height.equalTo(21);
        }];
        _cai2NameLb.font = [UIFont systemFontOfSize:20];
        _cai2NameLb.textColor = [UIColor whiteColor];
	}
	return _cai2NameLb;
}

- (UITextView *)intro2TV {
	if(_intro2TV == nil) {
		_intro2TV = [[UITextView alloc] init];
        [self.Hview addSubview:_intro2TV];
        [_intro2TV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(30);
            make.right.equalTo(-30);
            make.top.equalTo(430);
            make.height.equalTo(120);
        }];
        _intro2TV.textColor = [UIColor whiteColor];
        _intro2TV.backgroundColor = [UIColor clearColor];
        _intro2TV.font = [UIFont systemFontOfSize:15];
	}
	return _intro2TV;
}

- (UILabel *)starName1Lb {
	if(_starName1Lb == nil) {
		_starName1Lb = [[UILabel alloc] init];
        [self.Hview addSubview:_starName1Lb];
        [_starName1Lb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(30);
            make.top.equalTo(70);
            make.width.equalTo(51);
            make.height.equalTo(21);
        }];
        _starName1Lb.textColor = kRGBColor(131, 209, 219, 1.0);
        
	}
	return _starName1Lb;
}

- (UILabel *)starName2Lb {
	if(_starName2Lb == nil) {
		_starName2Lb = [[UILabel alloc] init];
        [self.Hview addSubview:_starName2Lb];
        [_starName2Lb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(-60);
            make.top.equalTo(70);
            make.width.equalTo(51);
            make.height.equalTo(21);
        }];
        _starName2Lb.textColor = kRGBColor(244, 105, 123, 1.0);
	}
	return _starName2Lb;
}

- (UIImageView *)star1Img {
	if(_star1Img == nil) {
		_star1Img = [[UIImageView alloc] init];
        [self.Hview addSubview:_star1Img];
        [_star1Img mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(20);
            make.width.equalTo(95);
            make.height.equalTo(130);
            make.top.equalTo(95);
        }];
	}
	return _star1Img;
}

- (UIImageView *)star2Img {
	if(_star2Img == nil) {
		_star2Img = [[UIImageView alloc] init];
        [self.Hview addSubview:_star2Img];
        [_star2Img mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(-20);
            make.width.equalTo(95);
            make.height.equalTo(130);
            make.top.equalTo(95);
        }];
	}
	return _star2Img;
}

@end
