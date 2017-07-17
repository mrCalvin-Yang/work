//
//  PerinatalCanEatDetailVC.m
//  Perinatal
//
//  Created by OY on 2017/7/11.
//  Copyright © 2017年 OY. All rights reserved.
//

#import "PerinatalCanEatDetailVC.h"
#import "PerinatalCanEatTV.h"

@interface PerinatalCanEatDetailVC ()

@end

@implementation PerinatalCanEatDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self showBack];
    self.title = @"能不能吃";
}

-(void)setSubviews{
    PerinatalCanEatTV *tv = [[PerinatalCanEatTV alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT)];
    tv.showsVerticalScrollIndicator = NO;
    [tv reloadData];
    [self.view addSubview:tv];
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
