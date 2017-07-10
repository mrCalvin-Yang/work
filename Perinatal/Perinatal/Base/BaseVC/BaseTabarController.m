//
//  BaseTabarController.m
//  Perinatal
//
//  Created by OY on 2017/7/6.
//  Copyright © 2017年 OY. All rights reserved.
//

#import "BaseTabarController.h"
#import "PerinatalPersonalCenterVC.h"
#import "PerinatalHomeVC.h"
#import "PerinatalMedicalServiceVC.h"
#import "BaseNavigationController.h"

@interface BaseTabarController ()

@end

@implementation BaseTabarController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBar.tintColor = global_color;
    [self setupchildVC];
}
//添加子控制器
-(void)setupchildVC{
    [self addchildVCWithVC:[PerinatalHomeVC new] title:@"首页" imageName:@""];
    [self addchildVCWithVC:[PerinatalMedicalServiceVC new] title:@"医疗服务" imageName:@""];
    [self addchildVCWithVC:[PerinatalPersonalCenterVC new] title:@"个人中心" imageName:@""];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.tabBar.hidden = NO;
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.tabBar.hidden = YES;
}

-(void)addchildVCWithVC:(UIViewController *)vc title:(NSString *)title imageName:(NSString *)imageName{
    vc.tabBarItem.image = V_IMAGE(imageName);
    NSString *selectImg = [NSString stringWithFormat:@"%@_sel",imageName];
    vc.tabBarItem.image = V_IMAGE(selectImg);
    vc.title = title;
    UINavigationController *nav = [[BaseNavigationController alloc] initWithRootViewController:vc];
    [self addChildViewController:nav];
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
