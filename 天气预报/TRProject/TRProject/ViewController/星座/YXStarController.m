//
//  YXStarController.m
//  TRProject
//
//  Created by chuchangqing on 16/7/6.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "YXStarController.h"
#import "YXStarFirstpageCell.h"
#import "YXStarViewModel.h"
#import "YXStarSecondController.h"
#import "YXStarSecondModel.h"

@interface YXStarController ()

/** <#属性描述#> */
@property (nonatomic) YXStarViewModel *starVM;
/** <#属性描述#> */
@property (nonatomic) YXStarSecondModel *starSecondVM;
/** <#属性描述#> */
@property (nonatomic) NSMutableArray<NSString *> *starData;
/** <#属性描述#> */
@property (nonatomic) NSMutableArray<YXStarListModel *> *starList;
@end

@implementation YXStarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self starData];
    
    [self starVM];
    self.navigationItem.title = @"星座排行";
    
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.starVM getDataWithRequestMode:VMRequestModeRefresh completionHandler:^(NSError *error) {
            [self.tableView.mj_header endRefreshing];
            if (error) {
                DDLogError(@"error %@", error);
            }else{
                [self.tableView reloadData];
            }
        }];
    }];
    [self.tableView.mj_header beginRefreshing];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.starVM.rowNumber;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger row = indexPath.row;
    YXStarFirstpageCell *cell = [tableView dequeueReusableCellWithIdentifier:kStarFirstpageCell forIndexPath:indexPath];
    [cell.IconView setStarImageWithStarName:self.starVM.starPaihang[row].integerValue - 1];
    cell.IconView.layer.cornerRadius = 10;
    cell.IconView.layer.masksToBounds = YES;
    cell.NameLb.text = self.starVM.starList[self.starVM.starPaihang[row].integerValue - 1].starName;
    cell.introLb.text = self.starVM.starList[self.starVM.starPaihang[row].integerValue - 1].intro;
    cell.age.text = self.starVM.starList[self.starVM.starPaihang[row].integerValue - 1].age;
    cell.emotion1Lb.text = self.starVM.starList[self.starVM.starPaihang[row].integerValue - 1].emotion1;
    cell.emotion1Lb.layer.cornerRadius = 5;
    cell.emotion1Lb.layer.masksToBounds = YES;
    cell.emotion2Lb.text = self.starVM.starList[self.starVM.starPaihang[row].integerValue - 1].emotion2;
    cell.emotion2Lb.layer.cornerRadius = 5;
    cell.emotion2Lb.layer.masksToBounds = YES;
    cell.emotion3Lb.text = self.starVM.starList[self.starVM.starPaihang[row].integerValue - 1].emotion3;
    cell.emotion3Lb.layer.cornerRadius = 5;
    cell.emotion3Lb.layer.masksToBounds = YES;
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%ld", indexPath.row);
    YXStarSecondController *vc = [YXStarSecondController new];
    vc.starIndex = self.starVM.starPaihang[indexPath.row].integerValue - 1;
    vc.starName = self.starVM.starList[self.starVM.starPaihang[indexPath.row].integerValue - 1].starName;
    vc.TVStr = self.starData[vc.starIndex];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
    NSLog(@"1");
}

- (YXStarViewModel *)starVM {
	if(_starVM == nil) {
		_starVM = [[YXStarViewModel alloc] init];
	}
	return _starVM;
}

- (NSMutableArray<NSString *> *)starData {
	if(_starData == nil) {
		_starData = [[NSMutableArray<NSString *> alloc] init];
        [[NSOperationQueue new] addOperationWithBlock:^{
            for (int i = 0; i < 12; i++) {
                [self.starSecondVM getDataWithStarName:self.starList[i].starName RequestMode:VMRequestModeRefresh completionHandler:^(NSError *error) {
                    if (error) {
                        DDLogError(@"error %@", error);
                    }else{
                        [_starData addObject:_starSecondVM.stardata];
                    }
                }];
            }
        }];
        NSLog(@"");
	}
	return _starData;
}

- (YXStarSecondModel *)starSecondVM {
	if(_starSecondVM == nil) {
		_starSecondVM = [[YXStarSecondModel alloc] init];
	}
	return _starSecondVM;
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

@end
