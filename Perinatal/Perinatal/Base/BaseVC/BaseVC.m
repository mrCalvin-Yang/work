//
//  BaseVC.m
//  UTVGO
//
//  Created by fute on 16/5/5.
//  Copyright © 2016年 www.UTVGO.com. All rights reserved.
//

#import "BaseVC.h"
#import "UIView+frameAccessor.h"

#define TIPBUTTONTAG 100

@interface BaseVC (){
    UIButton *tipButton;
    UIActivityIndicatorView *loadingIndicator;
}
@property (nonatomic, copy) ClickBlock clickBlock;
@property (nonatomic, copy) ClickRightBarBlock clickRgihtBarBlock;
@end

@implementation BaseVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = white_color;
    [self setSubviews];
}

-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];

}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = NO;
//    [self showTabBar];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.hidden = YES;
}


-(void)showRightBarWithNormal:(NSString *)imageName selectedImg:(NSString *)selecteImg block:(ClickRightBarBlock)clickRightBarBlock{
    self.clickRgihtBarBlock = clickRightBarBlock;
    UIBarButtonItem *buttonItem = [[UIBarButtonItem alloc] initWithTitle:imageName style:UIBarButtonItemStylePlain target:self action:@selector(clickRightBarBtn:)];
    buttonItem.tintColor = global_color;
    self.navigationItem.rightBarButtonItem = buttonItem;
}

-(void)clickRightBarBtn:(UIBarButtonItem *)sender{
    if(self.clickRgihtBarBlock){
        self.clickRgihtBarBlock(sender);
    }
}

-(void)showButtonWithTip:(NSString *)tip frame:(CGRect)frame clickBlock:(ClickBlock)clickBlock{
    self.clickBlock = clickBlock;
    if (tipButton==nil) {
        tipButton = [UIButton buttonWithType:UIButtonTypeCustom];
        tipButton.backgroundColor = [UIColor clearColor];
        tipButton.titleLabel.numberOfLines = 0;
        [tipButton setTitle:tip forState:UIControlStateNormal];
        tipButton.titleLabel.font = [UIFont systemFontOfSize:14.0f];
        tipButton.tag = TIPBUTTONTAG;
        tipButton.frame = frame;
        [self.view addSubview:tipButton];
        [tipButton addTarget:self action:@selector(clickTip:) forControlEvents:UIControlEventTouchUpInside];
        [self.view bringSubviewToFront:tipButton];
    }else{
        [tipButton setTitle:tip forState:UIControlStateNormal];
        [self.view addSubview:tipButton];
        [self.view bringSubviewToFront:tipButton];
    }
}

-(void)showButtonWithTip:(NSString *)tip clickBlock:(ClickBlock)clickBlock{
    //[self showButtonWithTip:tip frame:CGRectMake(0, (self.view.height-200)/2, WIDTH, 100) clickBlock:clickBlock];
}

-(void)clickTip:(UIButton *)btn{
    if (self.clickBlock) {
        [btn removeFromSuperview];
        self.clickBlock();
    }
}

-(void)showLoadingIndicatorWithCenter:(CGPoint) centerPoint{
    if (loadingIndicator==nil) {
        loadingIndicator = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        loadingIndicator.center = centerPoint;//只能设置中心，不能设置大小
        [self.view addSubview:loadingIndicator];
        loadingIndicator.color = [UIColor orangeColor]; // 改变圈圈的颜色为红色； iOS5引入
        [loadingIndicator setHidesWhenStopped:YES]; //当旋转结束时隐藏
    }
    [loadingIndicator startAnimating]; // 开始旋转
    
}

-(void)hideLoadingIndicator{
    if (loadingIndicator!=nil) {
        [loadingIndicator stopAnimating]; // 结束旋转
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


-(void)setNavigationBar:(UIColor *)color{
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:color] forBarMetrics:UIBarMetricsDefault];
}

//-(UIStatusBarStyle)preferredStatusBarStyle{
//    return UIStatusBarStyleLightContent;
//}

-(void)setSubviews{
    
}

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleDefault;
}

-(void)pushVC:(UIViewController *)vc{
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)presentVC:(UIViewController *)vc{
    [self presentViewController:vc animated:YES completion:^{
        
    }];
}

@end




