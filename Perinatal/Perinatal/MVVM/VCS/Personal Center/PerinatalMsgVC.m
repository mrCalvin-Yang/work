//
//  PerinatalMsgVC.m
//  Perinatal
//
//  Created by OY on 2017/7/10.
//  Copyright © 2017年 OY. All rights reserved.
//

#import "PerinatalMsgVC.h"


@interface PerinatalMsgVC ()

@end

@implementation PerinatalMsgVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self showBack];
    self.title = @"消息中心";
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self showWhiteNav];
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
