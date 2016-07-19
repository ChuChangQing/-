//
//  YXWeatherController.m
//  TRProject
//
//  Created by chuchangqing on 16/7/3.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "YXWeatherController.h"
#import "YXWeatherViewModel.h"
#import "YXWeatheroneCell.h"
#import "YXWeatherHeaderCell.h"
#import "TRGetUserLocation.h"


@interface YXWeatherController ()<CLLocationManagerDelegate>
/** <#属性描述#> */
@property (nonatomic ) YXWeatherViewModel *weatherVM;

/** <#属性描述#> */
@property (nonatomic) YXWeatherHeaderCell *head;
/** <#属性描述#> */
@property (nonatomic,assign) NSInteger intIndex;
/** <#属性描述#> */
@property (nonatomic,assign) NSInteger skyID;

///** 声明属性(弹出框瞬间消失) */
//@property (nonatomic,strong) CLLocationManager *locationMgr;
//
///** <#属性描述#> */
//@property (nonatomic) TRGetUserLocation *getLocation;
//
///** <#属性描述#> */
//@property (nonatomic) CLGeocoder *geocoder;

@end

@implementation YXWeatherController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    _cityName = [[NSUserDefaults standardUserDefaults] stringForKey:@"CityName"];
    
    UIImageView *iv = [[UIImageView alloc] initWithFrame:CGRectZero];
    iv.image = [UIImage imageNamed:@"BKqingtian"];
    self.tableView.backgroundView = iv;
    self.navigationItem.title = @"天气";
    
        NSLog(@"%@", _cityName);
    if([self isStringContainNumberWith:_cityName]||!(_cityName.length>0)) {
        UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"Warning" message:@"You are not in China or your divice's language is not Simplified Chinese,Will show ShangHai's Weather" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"YES", nil];
        [alert show];
        _cityName = @"上海";
    }
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.weatherVM getDataWithRequestMode:VMRequestModeRefresh withCity:_cityName completionHandler:^(NSError *error) {
            [self.tableView.mj_header endRefreshing];
            if (error) {
                DDLogError(@"error %@", error);
            }else{
                    self.tableView.tableHeaderView = self.head;
                    self.skyID = self.weatherVM.nowWeather.skyId;
                    [self.tableView reloadData];
            }
        }];
    }];
    [self.tableView.mj_header beginRefreshing];
    
    
    NSTimer *timer = [NSTimer timerWithTimeInterval:2 target:self selector:@selector(changeText:) userInfo:@"123" repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
    
    
    [self.tableView setBackgroundImageWithString:self.weatherVM.nowWeather.sky];
//    }];

}

- (BOOL)isStringContainNumberWith:(NSString *)str {
    NSString *tmp = nil;
    for (int i = 0; i < str.length; i++) {
        tmp = [str substringWithRange:NSMakeRange(i, 1)];
        const char *s = [tmp cStringUsingEncoding:NSUTF8StringEncoding];
        if ((*s >= 'A' && *s <= 'Z') || (*s >= 'a' && *s <= 'z')) {
            return YES;
        }
    }
    return NO;
}
////4.通知用户的状态(同意/不同意)
//- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status{
//    if (status == kCLAuthorizationStatusDenied  ) {
//        //不同意
//        NSLog(@"用户不允许定位");
//    }else if(status == kCLAuthorizationStatusAuthorizedWhenInUse){
//        //设定更新最小距离(减少更新频率,真机,单位:米)
//        self.locationMgr.distanceFilter = 100.0;
//        //定位的准确性
//        self.locationMgr.desiredAccuracy = kCLLocationAccuracyBest;
//        //开启定位功能
//        [self.locationMgr startUpdatingLocation];
//
//    }
//}
////5.通知用户的位置
//- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations{
//    //location数组至少包含一个用户的位置,去数组中的最后一项(最近更新的位置)
//    CLLocation *latestLocation = [locations lastObject];
//    NSLog(@"%f, %f", latestLocation.coordinate.latitude, latestLocation.coordinate.longitude);
//    //添加下面两行代码, 可以绝对只返回一次用户的位置
//    [self.locationMgr stopUpdatingLocation];
//    self.locationMgr = nil;
//}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.weatherVM.rowNumber; 
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger row = indexPath.row;
    YXWeatheroneCell *cell = [tableView dequeueReusableCellWithIdentifier:kWeatheroneCell forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.dateLb.text = [self.weatherVM dateForRow:row];
    //要改动
    [cell.iconView imgViewSetImageWithString:[self.weatherVM weatherForRow:row]];
    cell.weatherLb.text = [self.weatherVM weatherForRow:row];
    cell.lowTemtLb.text = [self.weatherVM lowTempForRow:row];
    cell.highTemtLb.text = [self.weatherVM highTempForRow:row];
    cell.lowHeight.constant = [self.weatherVM lowHeightForRow:row];
    cell.highHeight.constant = [self.weatherVM highHeightForRow:row];
    
    return cell;
}

- (YXWeatherViewModel *)weatherVM {
	if(_weatherVM == nil) {
		_weatherVM = [[YXWeatherViewModel alloc] init];
	}
	return _weatherVM;
}

- (YXWeatherHeaderCell *)head {
	if(_head == nil) {
        _head = [[YXWeatherHeaderCell alloc] initWithFrame:CGRectMake(0, 0, kScreenW, 350)];
        _head.dateLb.text = [self.weatherVM HdataForRow];
        _head.cityLb.text = self.cityName;
        _head.weatherLb.text = self.weatherVM.nowWeather.sky;
 
        [_head.weatherImageView imgViewSetImageWithString:self.weatherVM.nowWeather.sky];
        _head.tmptLb.text = [self.weatherVM HtmptForRow];
        _head.airLb.text = [self.weatherVM HairForRow];
        _head.windLb.text = [self.weatherVM HwindForRow];
        _head.shiduLb.text = [self.weatherVM HshiduForRow];
	}
	return _head;
}
- (void)changeText:sender{
    self.head.scrolLb.text = [self.weatherVM icLbForRow:_intIndex %self.weatherVM.rowNumber];
    _intIndex += 1;
}

@end
