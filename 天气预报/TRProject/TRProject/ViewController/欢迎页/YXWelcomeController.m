//
//  YXWelcomeController.m
//  TRProject
//
//  Created by chuchangqing on 16/7/12.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "YXWelcomeController.h"
#import "YXRecommendController.h"



@interface YXWelcomeController ()<iCarouselDelegate, iCarouselDataSource>
/** <#属性描述#> */
@property (nonatomic) iCarousel *ic;
/** <#属性描述#> */
@property (nonatomic) UIButton *btu;
/** <#属性描述#> */
@property (nonatomic) UIPageControl *pc;

@end

@implementation YXWelcomeController
#pragma mark -  IC  Delegate
- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel{
    return 3;
}
- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view{
    if (!view) {
        view = [[UIView alloc] initWithFrame:self.view.frame];
        UIImageView *iv = [[UIImageView alloc] initWithFrame:self.view.frame];
        [view addSubview:iv];
        iv.tag = 100;
    }
    UIImageView *iv = (UIImageView *)[view viewWithTag:100];
    [self.ic addSubview:self.pc];
    [_pc mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        make.bottom.equalTo(-10);
    }];
    switch (index) {
        case 0:
            iv.image = [UIImage imageNamed:@"bk1"];
            break;
        case 1:
            iv.image = [UIImage imageNamed:@"bk2"];
            break;
        case 2:
            {
                iv.image = [UIImage imageNamed:@"bk3"];
                iv.userInteractionEnabled = YES;
                [iv addSubview:self.btu];
                [_btu mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.right.equalTo(-30);
                    make.bottom.equalTo(-80);
                    make.height.equalTo(40);
                    make.width.equalTo(100);
                }];
                break;
            }
    }
    return view;
}
- (void)carouselCurrentItemIndexDidChange:(iCarousel *)carousel{
    self.pc.currentPage = carousel.currentItemIndex;
}

#pragma mark -  LifeCycle 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    [self ic];
    [self.btu bk_whenTouches:1 tapped:1 handler:^{
        UIStoryboard *stboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        UITabBarController *tab = [stboard instantiateViewControllerWithIdentifier:@"main"];
        self.view.window.rootViewController = tab;
        //把当前版本号,存入到userDefault中固化
        NSDictionary *infoDic = [NSBundle mainBundle].infoDictionary;
        NSLog(@"info %@", infoDic);
        NSString *version = infoDic[@"CFBundleShortVersionString"];
        [[NSUserDefaults standardUserDefaults] setObject:version forKey:@"RunVersion"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma mark - Lazyload 懒加载
- (iCarousel *)ic {
	if(_ic == nil) {
		_ic = [[iCarousel alloc] init];
        [self.view addSubview:_ic];
        [_ic mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
        _ic.delegate = self;
        _ic.dataSource = self;
        _ic.scrollSpeed = .2;
	}
	return _ic;
}

- (UIButton *)btu {
	if(_btu == nil) {
		_btu = [UIButton buttonWithType:UIButtonTypeSystem];
        [_btu setTitle:@"走你 ->" forState:UIControlStateNormal];
        _btu.tintColor = [UIColor darkGrayColor];
        _btu.titleLabel.font = [UIFont systemFontOfSize:30];
//        [self.ic addSubview:self.btu];
//        [_btu mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.right.equalTo(-30);
//            make.bottom.equalTo(-50);
//            make.height.equalTo(40);
//            make.width.equalTo(80);
//        }];
	}
	return _btu;
}

- (UIPageControl *)pc {
	if(_pc == nil) {
		_pc = [UIPageControl new];
        _pc.numberOfPages = 3;
	}
	return _pc;
}

@end
