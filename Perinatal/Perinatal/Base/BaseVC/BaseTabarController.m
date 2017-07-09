//
//  BaseTabarController.m
//  Perinatal
//
//  Created by OY on 2017/7/6.
//  Copyright © 2017年 OY. All rights reserved.
//

#import "BaseTabarController.h"
#import "HomeVC.h"
#import "MedicalServiceVC.h"
#import "PersonalCenterVC.h"
#import "BaseNavigationController.h"

@interface BaseTabarController ()

@end

@implementation BaseTabarController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBar.tintColor = orange_color;
    [self setupchildVC];
}
//添加子控制器
-(void)setupchildVC{
    [self addchildVCWithVC:[HomeVC new] title:@"首页" imageName:@""];
    [self addchildVCWithVC:[MedicalServiceVC new] title:@"医疗服务" imageName:@""];
    [self addchildVCWithVC:[PersonalCenterVC new] title:@"个人中心" imageName:@""];
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
