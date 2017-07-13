//
//  PerinatalWantConsultVC.m
//  Perinatal
//
//  Created by OY on 2017/7/12.
//  Copyright © 2017年 OY. All rights reserved.
//

#import "PerinatalWantConsultVC.h"
#import "IWantConsultTV.h"
#import "ConsultContentCell.h"
#import "PerinatalPaymentVC.h"

@interface PerinatalWantConsultVC ()
{
    IWantConsultTV *tv;
}
@end

@implementation PerinatalWantConsultVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self showTitle:@"我要咨询"];
    self.view.backgroundColor = kBackColor;
}

-(void)setSubviews{
    tv = [[IWantConsultTV alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT-64 - 58) style:UITableViewStyleGrouped];
    [tv reloadData];
    [self.view addSubview:tv];
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, tv.bottom + 10, SCREENWIDTH - 150,48)];
    titleLabel.text = @"付费咨询:";
    titleLabel.font = H14;
    titleLabel.backgroundColor = RGBCOLOR(255, 236, 240);
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(SCREENWIDTH - 150, tv.bottom + 10, 150, 48);
    [button setTitle:@"提交咨询" forState:UIControlStateNormal];
    button.titleLabel.font = H14;
    [button setTitleColor:white_color forState:UIControlStateNormal];
    button.backgroundColor = RGBCOLOR(255, 69, 106);
    [button addTarget:self action:@selector(btnCommit:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    [self.view addSubview:titleLabel];
    
    
}

-(void)btnCommit:(UIButton *)bt
{
    ConsultContentCell *cell = [tv cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:2]];
    NSLog(@"%@",cell.images);
    [self pushVC:[PerinatalPaymentVC new]];
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
