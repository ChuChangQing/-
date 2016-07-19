//
//  TRGetUserLocation.h
//  GetUserLocation
//
//  Created by chuchangqing on 16/6/30.
//  Copyright © 2016年 chuchangqing. All rights reserved.
//

#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface TRGetUserLocation : CLLocationManager<CLLocationManagerDelegate>
/** 声明属性(弹出框瞬间消失) */
@property (nonatomic,strong) CLLocationManager *locationMgr;
- (CLLocation *)getLocationData;
@end
