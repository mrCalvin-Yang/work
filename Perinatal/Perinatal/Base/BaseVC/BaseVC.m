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
    
}

-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];

}


-(void)showRightBarWithNormal:(NSString *)imageName selectedImg:(NSString *)selecteImg block:(ClickRightBarBlock)clickRightBarBlock{
    self.clickRgihtBarBlock = clickRightBarBlock;
    
//    UIImage *img = PNG_IMAGE_NAMED(imageName);
//    CGRect btnFrame = CGRectMake(0,0,img.size.width,img.size.height);
//    UIButton* btn = [[UIButton alloc] initWithFrame:btnFrame];
//    [btn setImage:img forState:UIControlStateNormal];
//    [btn setImage:PNG_IMAGE_NAMED(selecteImg) forState:UIControlStateSelected];
//    [btn addTarget:self action:@selector(clickRightBarBtn:) forControlEvents:UIControlEventTouchUpInside];
//    UIBarButtonItem *buttonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
//    self.navigationItem.rightBarButtonItem = buttonItem;
}

-(void)clickRightBarBtn:(UIButton *)sender{
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
#if SMART
        loadingIndicator.color = [UIColor whiteColor];
#endif
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

- (BOOL)shouldAutorotate{
    if (self.canLand) {
        return [super shouldAutorotate];
    }
    return YES;
}

-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation{
    if (self.canLand) {
        return [super shouldAutorotateToInterfaceOrientation:interfaceOrientation];
    }
    //if ([UTVGO IsHDApp]) {
       // return ((interfaceOrientation ==UIDeviceOrientationLandscapeLeft)||(interfaceOrientation ==UIDeviceOrientationLandscapeRight));
    //}else{
        return UIInterfaceOrientationPortraitUpsideDown;
    //}
    
}

-(NSUInteger)supportedInterfaceOrientations{
    if (self.canLand) {
        return [super supportedInterfaceOrientations];
    }
    //
        return UIInterfaceOrientationPortraitUpsideDown;
}

//-(UIStatusBarStyle)preferredStatusBarStyle{
//    return UIStatusBarStyleLightContent;
//}

@end




