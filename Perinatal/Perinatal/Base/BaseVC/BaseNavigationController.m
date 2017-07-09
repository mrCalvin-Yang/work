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

#ifdef __IPHONE_7_0
-(UIStatusBarStyle)preferredStatusBarStyle NS_AVAILABLE_IOS(7_0)
{
    return UIStatusBarStyleLightContent;
}

-(BOOL)prefersStatusBarHidden NS_AVAILABLE_IOS(7_0)
{
    return NO;
}
#endif

@end
