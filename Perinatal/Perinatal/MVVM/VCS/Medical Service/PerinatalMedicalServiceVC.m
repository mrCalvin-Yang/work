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

@interface PerinatalMedicalServiceVC ()
{
    NSMutableArray *dataArr;
}

@end

@implementation PerinatalMedicalServiceVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = kBackColor;
    self.navigationController.navigationBar.hidden = YES;
    [self getData];
    [self setsubviews];
}

-(void)getData{
    dataArr = [NSMutableArray array];
    for (NSInteger i = 0; i < 5; i++) {
        CanEatModel *model = [[CanEatModel alloc] init];
        model.title = @"孕e家";
        model.imageUrl = @"img";
        [dataArr addObject:model];
    }
}

-(void)setsubviews{
    MedicalServiceCV *cv = [[MedicalServiceCV alloc] initWithFrame:CGRectMake(0, -20, SCREENWIDTH, SCREENHEIGHT+80)];
    cv.dataList = dataArr;
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
