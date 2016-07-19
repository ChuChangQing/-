//
//  TRGetUserLocation.m
//  GetUserLocation
//
//  Created by chuchangqing on 16/6/30.
//  Copyright © 2016年 chuchangqing. All rights reserved.
//

#import "TRGetUserLocation.h"

@implementation TRGetUserLocation
- (CLLocation *)getLocationData{
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
    return self.locationMgr.location;
}
//4.通知用户的状态(同意/不同意)
- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status{
    if (status == kCLAuthorizationStatusDenied  ) {
        //不同意
        NSLog(@"用户不允许定位");
    }else if(status == kCLAuthorizationStatusAuthorizedWhenInUse){
        //设定更新最小距离(减少更新频率,真机,单位:米)
        self.locationMgr.distanceFilter = 100.0;
        //定位的准确性
        self.locationMgr.desiredAccuracy = kCLLocationAccuracyBest;
        //开启定位功能
        [self.locationMgr startUpdatingLocation];        
    }
}   
//5.通知用户的位置
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations{
    //location数组至少包含一个用户的位置,去数组中的最后一项(最近更新的位置)
    CLLocation *latestLocation = [locations lastObject];
    NSLog(@"%f, %f", latestLocation.coordinate.latitude, latestLocation.coordinate.longitude);
    //添加下面两行代码, 可以绝对只返回一次用户的位置
    [self.locationMgr stopUpdatingLocation];
    self.locationMgr = nil;
}
@end
