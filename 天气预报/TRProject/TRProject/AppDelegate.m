//
//  AppDelegate.m
//  TRProject
//
//  Created by jiyingxin on 16/2/4.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "AppDelegate.h"
#include "YXNetManager.h"
#include "YXWeatherViewModel.h"
#import "YXWelcomeController.h"
#import "TRGetUserLocation.h"
#import "YXWeatherController.h"


@interface AppDelegate ()<CLLocationManagerDelegate>

/** 声明属性(弹出框瞬间消失) */
@property (nonatomic,strong) CLLocationManager *locationMgr;

/** <#属性描述#> */
@property (nonatomic) TRGetUserLocation *getLocation;

/** <#属性描述#> */
@property (nonatomic) CLGeocoder *geocoder;

@property (nonatomic) NSString *cityName;

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //全局默认配置
    [self setupGlobalConfig];
//    self.window.rootViewController = [UIViewController new];
//    [YXNetManager getWeatherDataCity:@"%e4%b8%8a%e6%b5%b7" completionHandler:^(YXWeatherModel *model, NSError *error) {
//        NSLog(@"");
//    }];
//    [YXNetManager getStarRecommendDataWithOffset:0 Completionhandler:^(YXStarRecommendModel *model, NSError *error) {
//        NSLog(@"");
//    }];
//    [YXNetManager getStarDataWithName:@"处女座" Completionhandler:^(YXStarModel *model, NSError *error) {
//        NSLog(@"");
//    }];
//    [YXNetManager getStarPaihangDataCompletionhandler:^(YXStarPaihangModel *model, NSError *error) {
//        NSLog(@"");
//    }];
//    [YXNetManager getRecommendUserDatacompletionHandler:^(YXRecommendModel *model, NSError *error) {
//        NSLog(@"");
//    }];
    
    NSDictionary *infoDic = [NSBundle mainBundle].infoDictionary;
    NSString *version = infoDic[@"CFBundleShortVersionString"];
    NSString *runVersion = [[NSUserDefaults standardUserDefaults] stringForKey:@"RunVersion"];
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    _window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];

    if (runVersion == nil || ![runVersion isEqualToString:version]) {
        self.window.rootViewController = [YXWelcomeController new];
    }else{
        UIStoryboard *stboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        UITabBarController *tab = [stboard instantiateViewControllerWithIdentifier:@"main"];
        self.window.rootViewController = tab;
    }
    
    
    //初始化location对象
    self.locationMgr = [CLLocationManager new];
    //征求用户的同意(>=iOS8.0),如果<iOS8.0.不需要用户的同意
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 8.0) {
        //发送请求定位的许可(仅仅是征求app在前台的时候的授权)
        //在info.plist添加key(定位授权配置)
        [self.locationMgr requestWhenInUseAuthorization];
    }else{
        //直接定位
        [self.locationMgr startUpdatingLocation];
    }
    //设置代理
    self.locationMgr.delegate = self;
    
    self.getLocation = [TRGetUserLocation new];
    CLLocation *location = [self.getLocation getLocationData];
    NSLog(@"位置是%@", location);
    _geocoder = [CLGeocoder new];
    [_geocoder reverseGeocodeLocation:location completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        _cityName = placemarks.firstObject.locality;
        _cityName = [placemarks.firstObject.locality componentsSeparatedByString:@"市"][0];
        [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:@"CityName"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        if (_cityName.length > 0) {
            [[NSUserDefaults standardUserDefaults] setObject:_cityName forKey:@"CityName"];
            [[NSUserDefaults standardUserDefaults] synchronize];
            NSLog(@"");
        }
    }];
    
    return YES;
}

@end
