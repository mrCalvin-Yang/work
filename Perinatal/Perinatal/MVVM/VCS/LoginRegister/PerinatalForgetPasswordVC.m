//
//  PerinatalForgetPasswordVC.m
//  Perinatal
//
//  Created by OY on 2017/7/10.
//  Copyright © 2017年 OY. All rights reserved.
//

#import "PerinatalForgetPasswordVC.h"
#import <ReactiveCocoa.h>
#import "InputView.h"

@interface PerinatalForgetPasswordVC ()<UITextFieldDelegate>
{
    UIButton *_helpButton, *_checkButton, *_rigisterBtn;
    
    UITextField *_NameTextField, *_AreaTextField, *_CardIDTextField, *_CATVIDTextField, *_PasswordTextField, *_ValidatePasswordTextField, *_accountTextField, *_emailFeild;
    UILabel *_NameLabel, *_AreaTextLabel, *_CardIDLabel, *_CATVIDLabel, *_PasswordLabel, *_ValidatePasswordLabel, *_accountLabel, *_EmailLabel;
    
    NSArray * _areaArray,*_emailArray;
    
    CGRect _scrollFrame;
    
    NSMutableArray *_tipLabelArray;
}
@end

@implementation PerinatalForgetPasswordVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.shadowImage = [UIImage imageWithColor:kLineColor];
    self.title = @"忘记密码";
    CGFloat y = [self loadRigsterView];
    [self addBttonWithMaxY:y];
    
}

/**
 *  添加注册视图
 */
-(CGFloat)loadRigsterView
{
    UIImage *image = V_IMAGE(@"img");
    CGFloat x = ui_offset*4, y = ui_offset, cx = SCREENWIDTH-2*x, cy = image.size.height + 2*ui_offset;
#pragma -mark 邮箱
    InputView *emailView = [[InputView alloc] initWithFrame:CGRectMake(x, y, cx, cy) title:@"" image:image placeHolder:@"输入手机号" isPassword:NO];
    emailView.inputTextfield.keyboardType = UIKeyboardTypePhonePad;
    emailView.inputTextfield.delegate = self;
    [self.view addSubview:emailView];
    _emailFeild = emailView.inputTextfield;
    
    y = CGRectGetMaxY(emailView.frame);
    
    UILabel *lineLabel = [[UILabel alloc] initWithFrame:CGRectMake(x, y, cx, 1)];
    lineLabel.backgroundColor = kLineColor;
    lineLabel.alpha = 0.3;
    [self.view addSubview:lineLabel];
    
#pragma -mark 用户名
    image = V_IMAGE(@"img");
    y = CGRectGetMaxY(lineLabel.frame);
    InputView *acountView = [[InputView alloc] initWithFrame:CGRectMake(x, y, cx, cy) title:@"" image:image placeHolder:@"请输入手机验证码" isPassword:NO];
    acountView.inputTextfield.keyboardType = UIKeyboardTypePhonePad;
    acountView.inputTextfield.delegate = self;
    [self.view addSubview:acountView];
    _accountTextField = acountView.inputTextfield;
    
    y = CGRectGetMaxY(acountView.frame);
    lineLabel = [[UILabel alloc] initWithFrame:CGRectMake(x, y, cx, 1)];
    lineLabel.backgroundColor = kLineColor;
    lineLabel.alpha = 0.3;
    [self.view addSubview:lineLabel];
    
#pragma -mark 密码
    image = V_IMAGE(@"img");
    y = CGRectGetMaxY(lineLabel.frame);
    InputView *pswView = [[InputView alloc] initWithFrame:CGRectMake(x, y, cx, cy) title:@"" image:image placeHolder:@"请设置密码" isPassword:YES];
    pswView.inputTextfield.delegate = self;
    //    pswView.inputTextfield.tag = tagPassword;
    [self.view addSubview:pswView];
    _PasswordTextField = pswView.inputTextfield;
    
    y = CGRectGetMaxY(pswView.frame);
    lineLabel = [[UILabel alloc] initWithFrame:CGRectMake(x, y, cx, 1)];
    lineLabel.backgroundColor = kLineColor;
    lineLabel.alpha = 0.3;
    [self.view addSubview:lineLabel];
    
#pragma -mark 确认密码
    image = V_IMAGE(@"img");
    y = CGRectGetMaxY(lineLabel.frame);
    InputView *vaildPswView = [[InputView alloc] initWithFrame:CGRectMake(x, y, cx, cy) title:@"" image:image placeHolder:@"再次确认密码" isPassword:YES];
    vaildPswView.inputTextfield.delegate = self;
    //    vaildPswView.inputTextfield.tag = tagValidatePassword;
    [self.view addSubview:vaildPswView];
    _ValidatePasswordTextField = vaildPswView.inputTextfield;
    
    y = CGRectGetMaxY(vaildPswView.frame);
    lineLabel = [[UILabel alloc] initWithFrame:CGRectMake(x, y, cx, 1)];
    lineLabel.backgroundColor = kLineColor;
    lineLabel.alpha = 0.3;
    [self.view addSubview:lineLabel];
    
    
    
    return lineLabel.bottom + ui_offset * 4;
}

/**
 *  添加button
 *
 *  @param y y值
 */
-(void)addBttonWithMaxY:(CGFloat)y
{
    CGFloat x = ui_offset * 4, cx = SCREENWIDTH-2*x, cy = 40;
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(x, y + 4*ui_offset, cx, cy);
    [button setTitle: @"下一步" forState:UIControlStateNormal];
    //    button.enabled = NO;
    //    button.backgroundColor = [UIColor grayColor];
    button.backgroundColor = global_color;
    CALayer *layer = button.layer;
    layer.masksToBounds = YES;
    layer.cornerRadius = 5.0f;
    [button addTarget:self action:@selector(onClickedSubmitButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    _rigisterBtn = button;
    
}


-(void)onClickedSubmitButton:(UIButton *)btn{
    
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
