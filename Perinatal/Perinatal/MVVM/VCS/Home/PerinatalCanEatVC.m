//
//  PerinatalCanEatVCViewController.m
//  Perinatal
//
//  Created by OY on 2017/7/10.
//  Copyright © 2017年 OY. All rights reserved.
//

#import "PerinatalCanEatVC.h"
#import "PerinatalCanEatCV.h"
#import "CanEatModel.h"
#import <ReactiveCocoa.h>
#import "PerinatalCanEatDetailVC.h"
@interface PerinatalCanEatVC ()
@property (nonatomic, strong)NSMutableArray *dataArr;
@end

@implementation PerinatalCanEatVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self showTitle:@"能不能吃"];
    [self showBack];
    [self showWhiteNav];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}


-(NSMutableArray *)dataArr
{
    if (!_dataArr) {
        _dataArr = [NSMutableArray array];
        [_dataArr addObject:[[CanEatModel alloc] initWithImg:@"img" title:@"主食"]];
        [_dataArr addObject:[[CanEatModel alloc] initWithImg:@"img" title:@"坚果"]];
        [_dataArr addObject:[[CanEatModel alloc] initWithImg:@"img" title:@"豆／奶制品"]];
        [_dataArr addObject:[[CanEatModel alloc] initWithImg:@"img" title:@"零食小吃"]];
        [_dataArr addObject:[[CanEatModel alloc] initWithImg:@"img" title:@"饮品"]];
        [_dataArr addObject:[[CanEatModel alloc] initWithImg:@"img" title:@"调味品"]];
        [_dataArr addObject:[[CanEatModel alloc] initWithImg:@"img" title:@"海产品"]];
        [_dataArr addObject:[[CanEatModel alloc] initWithImg:@"img" title:@"水果"]];
        [_dataArr addObject:[[CanEatModel alloc] initWithImg:@"img" title:@"肉／蛋类"]];
        [_dataArr addObject:[[CanEatModel alloc] initWithImg:@"img" title:@"蔬菜菌类"]];
        [_dataArr addObject:[[CanEatModel alloc] initWithImg:@"img" title:@"加工食品"]];
        [_dataArr addObject:[[CanEatModel alloc] initWithImg:@"img" title:@"补品／草药"]];
//        [_dataArr addObject:[[CanEatModel alloc] initWithImg:@"img" title:@"主食"]];
//        [_dataArr addObject:[[CanEatModel alloc] initWithImg:@"img" title:@"主食"]];
//        [_dataArr addObject:[[CanEatModel alloc] initWithImg:@"img" title:@"主食"]];
    }
    return _dataArr;
}

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleDefault;
}

-(void)getData{
    
}

-(void)setSubviews{
    PerinatalCanEatCV *cv = [[PerinatalCanEatCV alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT)];
    cv.dataList = self.dataArr;
    [cv reloadData];
    [self.view addSubview:cv];
    cv.selectItemSignal = [RACSubject subject];
    [cv.selectItemSignal subscribeNext:^(NSIndexPath *path) {
        [self pushVC:[PerinatalCanEatDetailVC new]];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
