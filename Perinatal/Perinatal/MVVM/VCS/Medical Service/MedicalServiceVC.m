//
//  MedicalServiceVC.m
//  Perinatal
//
//  Created by OY on 2017/7/6.
//  Copyright © 2017年 OY. All rights reserved.
//

#import "MedicalServiceVC.h"
#import "CanEatCV.h"
#import "CanEatModel.h"

@interface MedicalServiceVC ()
{
    NSMutableArray *dataArr;
}

@end

@implementation MedicalServiceVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = white_color;
    self.navigationController.navigationBar.hidden = YES;
    [self getData];
    [self setsubviews];
}

-(void)getData{
    dataArr = [NSMutableArray array];
    for (NSInteger i = 0; i < 7; i++) {
        CanEatModel *model = [[CanEatModel alloc] init];
        model.title = @"孕e家";
        model.imageUrl = @"img";
        [dataArr addObject:model];
    }
}

-(void)setsubviews{
    CanEatCV *cv = [[CanEatCV alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT)];
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
