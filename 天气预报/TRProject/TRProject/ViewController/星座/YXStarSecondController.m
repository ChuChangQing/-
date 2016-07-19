//
//  YXStarSecondController.m
//  TRProject
//
//  Created by chuchangqing on 16/7/6.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "YXStarSecondController.h"
#import "YXStarSecondModel.h"


@interface YXStarSecondController ()

@property (nonatomic) UIImageView *IconView;
@property (nonatomic) UILabel *titleLb;
@property (nonatomic) UITextView *introTextView;

@property (nonatomic) YXStarSecondModel *starVM;
@end

@implementation YXStarSecondController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView *bkImg = [UIImageView new];
    bkImg.image = [UIImage imageNamed:@"starBK"];
    [self.view addSubview:bkImg];
    [bkImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(0);
    }];
    [self.IconView setStarImageWithStarName:self.starIndex];
    self.titleLb.text = self.starName;
    self.introTextView.text = _TVStr;
    [self introTextView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (YXStarSecondModel *)starVM {
	if(_starVM == nil) {
		_starVM = [[YXStarSecondModel alloc] init];
	}
	return _starVM;
}

- (UIImageView *)IconView {
	if(_IconView == nil) {
		_IconView = [[UIImageView alloc] init];
        [self.view addSubview:_IconView];
        [_IconView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(-30);
            make.top.equalTo(74);
            make.width.equalTo(85);
            make.height.equalTo(120);
        }];
        _IconView.layer.cornerRadius = 10;
        _IconView.layer.masksToBounds = YES;
	}
	return _IconView;
}

- (UILabel *)titleLb {
	if(_titleLb == nil) {
		_titleLb = [[UILabel alloc] init];
        [self.view addSubview:_titleLb];
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(140);
            make.left.equalTo(80);
            make.width.equalTo(90);
            make.height.equalTo(36);
        }];
        _titleLb.font = [UIFont systemFontOfSize:30];
        _titleLb.textColor = [UIColor whiteColor];
	}
	return _titleLb;
}

- (UITextView *)introTextView {
	if(_introTextView == nil) {
		_introTextView = [[UITextView alloc] init];
        [self.view addSubview:_introTextView];
        [_introTextView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(210);
            make.left.equalTo(30);
            make.right.equalTo(-30);
            make.bottom.equalTo(-40);
        }];
        _introTextView.backgroundColor = [UIColor clearColor];
        _introTextView.font = [UIFont systemFontOfSize:16];
        _introTextView.textColor = [UIColor whiteColor];
	}
	return _introTextView;
}

@end
