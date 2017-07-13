//
//  BaseNavigationController.m
//  UTVGO
//
//  Created by X on 13-6-6.
//  Copyright (c) 2013年 UTVGO. All rights reserved.
//

#import "BaseNavigationController.h"

@interface BaseNavigationController ()

@end

@implementation BaseNavigationController

-(void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    [viewController.navigationItem.backBarButtonItem setTitleTextAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:10]} forState:UIControlStateNormal];
    if (self.childViewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:YES];
}

#pragma mark - Rotation

-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return UIInterfaceOrientationIsPortrait(interfaceOrientation);
}

-(UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}

- (BOOL)shouldAutorotate
{
    return YES;
}

-(UIStatusBarStyle)preferredStatusBarStyle NS_AVAILABLE_IOS(7_0)
{
    if (self.topViewController) {
        return UIStatusBarStyleLightContent;
    }
    return UIStatusBarStyleDefault;
}

-(BOOL)prefersStatusBarHidden NS_AVAILABLE_IOS(7_0)
{
    return NO;
}

@end
