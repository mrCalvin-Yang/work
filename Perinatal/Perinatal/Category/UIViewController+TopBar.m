//
//  UIViewController+TopBar.m
//  UTVGO
//
//  Created by fute on 16/6/6.
//  Copyright © 2016年 www.UTVGO.com. All rights reserved.
//

#import "UIViewController+TopBar.h"
//#import "RadioPlayerManage.h"
//#import "UserCenterViewController.h"
//#import <ReactiveCocoa/ReactiveCocoa.h>
//#import "UIViewController+MFSideMenuAdditions.h"
//#import "MFSideMenu.h"
//#import "LeftMenuViewController.h"
//#import "VideoSearchMainVC.h"
//#import "UserCenterVC.h"


@implementation UIViewController (TopBar)

-(void)showLeftBtn{
    
}

-(void)showMenu{
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"top_bar_logo"] style:UIBarButtonItemStylePlain target:self action:@selector(clickBack:)];
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor colorWithRed:235.0/255.0 green:97.0/255.0 blue:0.0 alpha:1];

}

-(void)showBack{
    [self showBackWithTintColor:[UIColor colorWithRed:235.0/255.0 green:97.0/255.0 blue:0.0 alpha:1]];

}

-(void)showBackWithTintColor:(UIColor *)tintColor{
//    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:PNG_IMAGE_NAMED(@"back") style:UIBarButtonItemStylePlain target:self action:@selector(clickBack:)];
    self.navigationItem.leftBarButtonItem.tintColor = tintColor;
}

-(void)showRightSearch:(NSInteger) channelId{
//    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:PNG_IMAGE_NAMED(@"搜索") style:UIBarButtonItemStylePlain target:self action:@selector(clickSearch:)];
//    self.navigationItem.rightBarButtonItem.tintColor = [UIColor colorWithRed:235.0/255.0 green:97.0/255.0 blue:0.0 alpha:1];
    self.navigationItem.rightBarButtonItem.tag = channelId;
}

//点击返回按钮时需要调用的函数，用以显示侧边栏
-(void)clickBack:(UIBarButtonItem *)sender{
    UIViewController *vc = [self.navigationController popViewControllerAnimated:YES];
    
    if (vc == nil) {
//        [self.menuContainerViewController toggleLeftSideMenuCompletion:^{
//            
//        }];
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}



-(void)showTitle:(NSString *)title{
    self.title = title;
    UILabel *titleL=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 120, 20)];
    titleL.textAlignment = NSTextAlignmentCenter;
    titleL.text= self.title;
    titleL.backgroundColor=[UIColor clearColor];
    titleL.font=[UIFont systemFontOfSize:18];
    titleL.textColor=[UIColor colorWithRed:235.0/255.0 green:97.0/255.0 blue:0.0 alpha:1];
    titleL.lineBreakMode=NSLineBreakByTruncatingTail;
    self.navigationItem.titleView=titleL;
}

-(void)showMe{
    self.navigationItem.rightBarButtonItem = [self message];
}

-(void)showMenuMessageAndLoginOut{
    self.navigationItem.rightBarButtonItems = @[[self loginOut],[self message]];
}


-(UIBarButtonItem *)message{
    UIBarButtonItem *rightBar = [[UIBarButtonItem alloc] initWithTitle:@"消息" style:UIBarButtonItemStylePlain target:self action:@selector(gotoUserCenter:)];
    rightBar.tintColor = white_color;
    return rightBar;
}

-(UIBarButtonItem *)loginOut{
    UIBarButtonItem *rightBar = [[UIBarButtonItem alloc] initWithTitle:@"注销" style:UIBarButtonItemStylePlain target:self action:@selector(gotoUserCenter:)];
    rightBar.tintColor = white_color;
    return rightBar;
}
-(void)showItem{
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"保存" style:UIBarButtonItemStylePlain target:self action:@selector(clickSearch:)];
    self.navigationItem.rightBarButtonItem.tintColor = orange_color;
}

-(void)showItemImg{
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:V_IMAGE(@"img") style:UIBarButtonItemStylePlain target:self action:@selector(clickItem:)];
    self.navigationItem.rightBarButtonItem.tintColor = white_color;
}

-(void)clickSearch:(id)sender{
    
}
-(void)clickItem:(id)sender{
    
}
- (void)gotoUserCenter:(id)sender {

}

@end
