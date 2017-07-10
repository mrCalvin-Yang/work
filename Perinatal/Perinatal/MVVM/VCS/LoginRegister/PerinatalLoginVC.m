//
//  PerinatalLoginVC.m
//  Perinatal
//
//  Created by OY on 2017/7/10.
//  Copyright © 2017年 OY. All rights reserved.
//

#import "PerinatalLoginVC.h"
#import "InputView.h"
#import "PerinatalForgetPasswordVC.h"
#import "PerinatalRigisterVC.h"
#import <ReactiveCocoa.h>
@interface PerinatalLoginVC ()<UITextFieldDelegate>
{
    __weak UIButton *_loginByUTVGOButton, *_loginByCATVIDButton, *_loginButton, *_scanLoginButton, *_passwordButton;
    __weak UITextField *_passwordTextField;
    
    __weak UITextField *_accountTextField;
    UIActivityIndicatorView* _loadingView;
    __weak UILabel* _errorLabel;
    
    CGPoint _centerPoint;
    BOOL _isLoginByScan, _isAutoLogin;
    BOOL _isStatusBarHide, _validateAutoLogin;
}
@end

@implementation PerinatalLoginVC

//-(instancetype)init
//{
//    if (self = [super init]) {
//        
//        NSArray *notifications = @[UIKeyboardWillShowNotification, UIKeyboardWillHideNotification];
//        for(NSString *notification in notifications)
//        {
//            [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notificatio



- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigationBar:white_color];
    [self showClose];
    [self loadSubViews];
}



-(void)loadSubViews
{
    //背景
    CGFloat globalHeight = self.view.height/3.f;
    UIImage *image = V_IMAGE(@"img");
    CGFloat x = ui_offset*4, y = 2*ui_offset + 64, cx = SCREENWIDTH-2*x, cy = image.size.height + 4*ui_offset;
    
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, -20, SCREENWIDTH, globalHeight)];
    bgView.backgroundColor = white_color;
    [self.view addSubview:bgView];
    
    UIImageView *loginView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 70, 70)];
    loginView.center = bgView.center;
    loginView.backgroundColor = gray_color;
    loginView.layer.masksToBounds = YES;
    loginView.layer.cornerRadius = 35.f;
    [bgView addSubview:loginView];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, loginView.bottom + ui_offset, SCREENWIDTH, 40)];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"登陆账号";
    label.font = HB18;
    [bgView addSubview:label];
    
    
    
    
#pragma -mark 用户名
    x = 0; y = bgView.bottom; cx = SCREENWIDTH; cy = globalHeight + 60;
    bgView = [[UIView alloc] initWithFrame:CGRectMake(0, y-20, SCREENWIDTH, globalHeight)];
    bgView.backgroundColor = white_color;
    x = ui_offset * 4; y = ui_offset; cx = SCREENWIDTH - 2 * x; cy = image.size.height + 2*ui_offset;
    InputView *acoutView = [[InputView alloc] initWithFrame:CGRectMake(x, y, cx, cy) title:@"帐号" image:image placeHolder:@"输入手机号" isPassword:NO];
    acoutView.inputTextfield.delegate = self;
    acoutView.inputTextfield.keyboardType = UIKeyboardTypePhonePad;
    [bgView addSubview:acoutView];
    _accountTextField = acoutView.inputTextfield;
    
#pragma -mark 密码
    image = V_IMAGE(@"img");
    y = acoutView.bottom;
    InputView *pswView = [[InputView alloc] initWithFrame:CGRectMake(x, y, cx, cy) title:@"密码" image:image placeHolder:@"输入登录密码" isPassword:YES];
    pswView.inputTextfield.delegate = self;
    [bgView addSubview:pswView];
    _passwordTextField = pswView.inputTextfield;
    
    
    UILabel *lineLabel = [[UILabel alloc] initWithFrame:CGRectMake(x, y, cx, 1)];
    lineLabel.backgroundColor = kLineColor;
    lineLabel.alpha = 0.3;
    [bgView addSubview:lineLabel];
    
    y = pswView.bottom;
    lineLabel = [[UILabel alloc] initWithFrame:CGRectMake(x, y, cx, 1)];
    lineLabel.backgroundColor = kLineColor;
    lineLabel.alpha = 0.3;
    [bgView addSubview:lineLabel];
    
    //登录按钮
    y = lineLabel.bottom + ui_offset*2;
    UIButton *loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
    loginButton.frame = CGRectMake(x, y, cx, 40);
    [loginButton setTitle:@"登录" forState:UIControlStateNormal];
    loginButton.backgroundColor = kBackColor;
    CALayer *layer = loginButton.layer;
    layer.masksToBounds = YES;
    layer.cornerRadius = 5.0f;
    [loginButton addTarget:self action:@selector(onClickedLoginBtn) forControlEvents:UIControlEventTouchUpInside];
    
    [bgView addSubview:loginButton];
    
    x = ui_offset*4; y = loginButton.bottom + ui_offset;
    
    UIButton *rigsterButton = [UIButton buttonWithType:UIButtonTypeCustom];
    rigsterButton.frame = CGRectMake(x, y, 80, 30);
    [rigsterButton setTitle:@"注册新用户" forState:UIControlStateNormal];
    rigsterButton.titleLabel.font = H10;
    rigsterButton.titleLabel.textAlignment = NSTextAlignmentLeft;
    [rigsterButton setTitleColor:kNormalFontColor forState:UIControlStateNormal];
    [[rigsterButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        PerinatalRigisterVC *viewController = [PerinatalRigisterVC new];
        [self.navigationController pushViewController:viewController animated:YES];
    }];
    [bgView addSubview:rigsterButton];
    
    //找回密码按钮
    x = SCREENWIDTH - 100;cy = 30;
    UIButton *findWordButton = [UIButton buttonWithType:UIButtonTypeCustom];
    findWordButton.frame = CGRectMake(x, y, 60, 30);
    [findWordButton setTitle:@"忘记密码" forState:UIControlStateNormal];
    findWordButton.titleLabel.font = H10;
    findWordButton.titleLabel.textAlignment = NSTextAlignmentRight;
    [findWordButton setTitleColor:kNormalFontColor forState:UIControlStateNormal];
    [[findWordButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        PerinatalForgetPasswordVC *viewController = [PerinatalForgetPasswordVC new];
        [self.navigationController pushViewController:viewController animated:YES];
    }];
    [bgView addSubview:findWordButton];
    
    [self.view addSubview:bgView];
    _loginByUTVGOButton = loginButton;
    
    
    //注册按钮
    y = bgView.bottom;
    
    bgView = [[UIView alloc] initWithFrame:CGRectMake(0, y, SCREENWIDTH, globalHeight)];
    bgView.backgroundColor = white_color;
    [self.view addSubview:bgView];
    y = ui_offset *2;
    x = ui_offset *4;
    
    lineLabel = [[UILabel alloc] initWithFrame:CGRectMake(x, y, SCREENWIDTH - 2*x, 1)];
    lineLabel.backgroundColor = kLineColor;
    [bgView addSubview:lineLabel];
    
    UILabel *otherSiginLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 20)];
    otherSiginLabel.backgroundColor = white_color;
    otherSiginLabel.center = lineLabel.center;
    otherSiginLabel.textAlignment = NSTextAlignmentCenter;
    otherSiginLabel.font = H10;
    otherSiginLabel.text = @"使用其他方式登录";
    otherSiginLabel.textColor = kNormalFontColor;
    [bgView addSubview:otherSiginLabel];
    
    y = otherSiginLabel.bottom + 20; x = bgView.width /2 - 66; cx = 36; cy = cx;
    UIButton *wetchatBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    wetchatBtn.frame = CGRectMake(x, y, cx, cy);
    wetchatBtn.backgroundColor = red_color;
    [[wetchatBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        
    }];
    [bgView addSubview:wetchatBtn];
    
    x = bgView.width/2 +30;
    UIButton *qqbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    qqbtn.frame = CGRectMake(x, y, cx, cy);
    qqbtn.backgroundColor = red_color;
    [[qqbtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        
    }];
    [bgView addSubview:qqbtn];
    
    
    
}

-(void)onClickedLoginBtn{
    
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
