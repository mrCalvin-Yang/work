//
//  PerinatalProblemAskDetailVC.m
//  Perinatal
//
//  Created by OY on 2017/7/11.
//  Copyright © 2017年 OY. All rights reserved.
//

#import "PerinatalProblemDetailVC.h"
#import "PerinatalWantConsultVC.h"
#import "ProblemDetailTV.h"
#import "PerinatalPaymentVC.h"

@interface PerinatalProblemDetailVC ()

@end

@implementation PerinatalProblemDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self showBack];
    self.title =@"问题详情";
    [self showBack];
    // Do any additional setup after loading the view.
}

-(void)setSubviews{
    ProblemDetailTV *detailTv = [[ProblemDetailTV alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT - 50) style:UITableViewStyleGrouped];
    detailTv.selectItemSignal = [RACSubject subject];
    [detailTv.selectItemSignal subscribeNext:^(id x) {
        [AlerVCManager showAlerWithTitle:@"支付提醒" message:@"围观答案需要支付¥1" employController:self handler:^(UIAlertAction *action) {
            [self pushVC:[PerinatalPaymentVC new]];
        }];
    }];
    [self.view addSubview:detailTv];
    
    UIButton *bt = [UIButton buttonWithType:UIButtonTypeCustom];
    [bt setTitle:@"我要向TA咨询" forState:UIControlStateNormal];
    [bt setTitleColor:white_color forState:UIControlStateNormal];
    bt.backgroundColor = global_color;
    [[bt rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        [self pushVC:[ PerinatalWantConsultVC new]];
    }];
    [self.view addSubview:bt];
    [bt mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.offset(50);
        make.right.bottom.left.offset(0);
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
