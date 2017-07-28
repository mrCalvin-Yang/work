//
//  PerinatalRigisterVC.m
//  Perinatal
//
//  Created by OY on 2017/7/10.
//  Copyright © 2017年 OY. All rights reserved.
//

#import "PerinatalRigisterVC.h"
#import "InputView.h"
#import "PerinatalPregnacyVC.h"
#import "SweetTextField.h"
#import "CountdownButton.h"
#import "SendMessageViewModel.h"
#import "RegisterVM.h"

@interface PerinatalRigisterVC ()<UITextFieldDelegate>
{
    UIScrollView *_mainScrollView;
    
    UIView *_howToFindSmartCardIDView,*bgView;
    UIButton *_helpButton, *_checkButton, *_rigisterBtn;
    
    UITextField *_PasswordTextField, *_ValidatePasswordTextField, *_accountTextField, *_emailFeild;
    SweetTextField *acountView;
    UILabel *_NameLabel, *_AreaTextLabel, *_CardIDLabel, *_CATVIDLabel, *_PasswordLabel, *_ValidatePasswordLabel, *_accountLabel, *_EmailLabel;
    
    NSArray * _areaArray,*_emailArray;
    
    CGRect _scrollFrame;
    
    NSMutableArray *_tipLabelArray;
}
@end

@implementation PerinatalRigisterVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.shadowImage = [UIImage imageWithColor:kLineColor];
    self.title = @"注册新用户";
    [self showBack];
    CGFloat y = [self loadRigsterView];
    [self addBttonWithMaxY:y];
}

/**
 *  添加注册视图
 */
-(CGFloat)loadRigsterView
{
    UIImage *image = V_IMAGE(@"icon-Cellphone");
    CGFloat x = ui_offset*4, y = ui_offset*1.2, cx = SCREENWIDTH-2*x, cy = 48;
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
    image = V_IMAGE(@"icon-Verification Code");
    y = CGRectGetMaxY(lineLabel.frame);
    acountView = [[SweetTextField alloc] initWithFrame:CGRectMake(x, y, cx, cy) fieldStyle:TextFieldStyleCaptcha];
    acountView.keyboardType = UIKeyboardTypePhonePad;
    acountView.imgName = @"icon-Verification Code";
    acountView.placeholder = @"输入手机验证码";
    acountView.btnSelect = [RACSubject subject];
    [acountView.btnSelect subscribeNext:^(CountdownButton *x) {
        [SendMessageViewModel sendMessageWithPhoneNumber:_emailFeild.text sucess:^(NSDictionary *respone) {
            NSInteger code = [[respone valueForKeyPath:@"code"] integerValue];
            if (code == 0) {
                [x timeFailBeginFrom:60];
#if DEBUG
                NSDictionary *dic = [respone valueForKeyPath:@"data"];
                NSString *varificationCode = [dic valueForKeyPath:@"verificationCode"];
                acountView.text = varificationCode;
#endif
            }
        } fail:^(NSString *error) {
            
        }];
        [x timeFailBeginFrom:60];
    }];
    [self.view addSubview:acountView];
    
    y = CGRectGetMaxY(acountView.frame);
    lineLabel = [[UILabel alloc] initWithFrame:CGRectMake(x, y, cx, 1)];
    lineLabel.backgroundColor = kLineColor;
    lineLabel.alpha = 0.3;
    [self.view addSubview:lineLabel];
    
#pragma -mark 密码
    image = V_IMAGE(@"icon-Confirm Password");
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
    
    CGFloat buttonY = CGRectGetMaxY(lineLabel.frame);
    
    
    //阅读label
    x = ui_offset * 4;
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(x, buttonY + ui_offset*4.7, SCREENWIDTH - 2*x, 16)];
    NSString *agrement = @"使用本平台服务意味着您同意并接受《孕e家用户协议》";
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:agrement];
    [str addAttribute:NSForegroundColorAttributeName value:RGBCOLOR(74, 144, 226) range:NSMakeRange(16, 9)];
    [str addAttribute:NSForegroundColorAttributeName value:kFontColor range:NSMakeRange(0, 16)];
    label.attributedText = str;
    label.adjustsFontSizeToFitWidth = YES;
    label.font = H11;
//    label.frame = CGRectMake(x, buttonY + ui_offset*4.7, SCREENWIDTH - 2*x, label.frame.size.height);
    [self.view addSubview:label];
    
    
    
    return label.bottom;
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
    button.frame = CGRectMake(x, y + 2*ui_offset, cx, cy);
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
    if (![_PasswordTextField.text isEqualToString:_ValidatePasswordTextField.text]) {
        return;
    }
    if (!_emailFeild.text) {
        return;
    }
//    [self pushVC:[PerinatalPregnacyVC new]];
    [RegisterVM registerWithPhoneNumber:_emailFeild.text code:acountView.text password:_ValidatePasswordTextField.text sucess:^(NSDictionary *respone) {
        NSInteger code = [[respone valueForKeyPath:@"code"] integerValue];
        if (code == 0) {
            [self.navigationController pushViewController:[PerinatalPregnacyVC new] animated:YES];
        }
        
    } fail:^(NSString *error) {
        
    }];
    
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
