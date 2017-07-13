//
//  PerinatalProblemAskVC.m
//  Perinatal
//
//  Created by OY on 2017/7/11.
//  Copyright © 2017年 OY. All rights reserved.
//

#import "PerinatalProblemAskVC.h"
#import "ProblemAskTV.h"
#import "PerinatalProblemAskTypeVC.h"
@interface PerinatalProblemAskVC ()

@end

@implementation PerinatalProblemAskVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"孕期问答";
    [self showTitle:self.title];
    [self showWhiteNav];
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    
}

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleDefault;
}

-(void)setSubviews{
    
    
    ProblemAskTV *tv = [[ProblemAskTV alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT  -50)];
    tv.showsVerticalScrollIndicator = NO;
    [tv reloadData];
    tv.selectItemSignal = [RACSubject subject];
    [tv.selectItemSignal subscribeNext:^(id x) {
        
    }];
    [self.view addSubview:tv];
    
    UIButton *bt = [[UIButton alloc] initWithFrame:CGRectMake(0, self.view.bottom - 114.f, SCREENWIDTH, 50.f)];
    [bt setTitle:@"我要咨询" forState:UIControlStateNormal];
    [bt setTitleColor:white_color forState:UIControlStateNormal];
    bt.backgroundColor = global_color;
    [[bt rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        [self pushVC:[ PerinatalProblemAskTypeVC new]];
    }];
    [self.view addSubview:bt];
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
