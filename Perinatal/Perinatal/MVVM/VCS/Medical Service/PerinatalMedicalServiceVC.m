//
//  MedicalServiceVC.m
//  Perinatal
//
//  Created by OY on 2017/7/6.
//  Copyright © 2017年 OY. All rights reserved.
//

#import "PerinatalMedicalServiceVC.h"
#import "MedicalServiceCV.h"
#import "CanEatModel.h"
#import "PerinatalHospitalNewsVC.h"
#import "PerinatalCurrentHospitalVC.h"
#import "PerinatalAutoCreateFileVC.h"
#import "PerinatalDoctorListVC.h"
#import "PerinatalHospitalIntroduceVC.h"

@interface PerinatalMedicalServiceVC ()
{
    NSMutableArray *dataArr;
}

@end

@implementation PerinatalMedicalServiceVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = kBackColor;
    [self getData];
    [self setsubviews];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self setNavsubview];
}


-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self showWhiteNav];
}

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

//setnav
-(void)setNavsubview{
    self.navigationItem.titleView = [UIView new];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:global_color] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
}

-(void)getData{
    dataArr = [NSMutableArray array];
    CanEatModel *model = [[CanEatModel alloc] initWithImg:@"img" title:@"预约挂号"];
    [dataArr addObject:model];
    model = [[CanEatModel alloc] initWithImg:@"img" title:@"我的挂号"];
    [dataArr addObject:model];
    model = [[CanEatModel alloc] initWithImg:@"img" title:@"咨询医生"];
    [dataArr addObject:model];
    model = [[CanEatModel alloc] initWithImg:@"img" title:@"检查报告"];
    [dataArr addObject:model];
}

-(void)setsubviews{
    MedicalServiceCV *cv = [[MedicalServiceCV alloc] initWithFrame:CGRectMake(0, -20, SCREENWIDTH, SCREENHEIGHT-64)];
    cv.dataList = dataArr;
    cv.btnSelectSignal = [RACSubject subject];
    [cv.btnSelectSignal subscribeNext:^(UIButton *x) {
        switch (x.tag) {
            case 100:
                [self pushVC:[PerinatalHospitalIntroduceVC new]];
                break;
            case 101:
                [self pushVC:[PerinatalHospitalNewsVC new]];
                break;
            case 102:
                [self pushVC:[PerinatalAutoCreateFileVC new]];
                break;
            case 103:
                
                break;
            case 104:
                break;
            case 105:
                [self pushVC:[PerinatalCurrentHospitalVC new]];
                break;
            default:
                break;
        }
    }];
    cv.selectItemSignal = [RACSubject subject];
    [cv.selectItemSignal subscribeNext:^(NSIndexPath *x) {
        if (x.row == 2) {
            [self pushVC:[PerinatalDoctorListVC new]];
        }
    }];
    [cv reloadData];
    [self.view addSubview:cv];
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
