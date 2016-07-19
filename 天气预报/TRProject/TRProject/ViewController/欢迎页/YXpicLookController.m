//
//  YXpicLookController.m
//  TRProject
//
//  Created by chuchangqing on 16/7/12.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "YXpicLookController.h"

@interface YXpicLookController ()<MWPhotoBrowserDelegate>

@end

@implementation YXpicLookController

- (NSUInteger)numberOfPhotosInPhotoBrowser:(MWPhotoBrowser *)photoBrowser{
    return 1;
}
- (id<MWPhoto>)photoBrowser:(MWPhotoBrowser *)photoBrowser photoAtIndex:(NSUInteger)index{
    [self.view hideBusyHUD];
    return [MWPhoto photoWithURL:self.url];
}

- (instancetype)initWithUrl:(NSURL *)url{
    if (self = [super init]) {
        _url = url;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = self;
    [self.view showBusyHUD];
    [self reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
