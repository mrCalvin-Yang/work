//
//  PerinatalBindMoblieVC.m
//  Perinatal
//
//  Created by OY on 2017/7/10.
//  Copyright © 2017年 OY. All rights reserved.
//

#import "PerinatalBindMoblieVC.h"
#import "SweetTextField.h"
#import "InputView.h"
#import "CountdownButton.h"
#import "SendMessageViewModel.h"
#import "RegisterVM.h"
#import "PerinatalPregnacyVC.h"
#import "LoginVM.h"

@interface PerinatalBindMoblieVC ()
{
    UIButton *_rigisterBtn;
    
    UITextField *_PasswordTextField, *_ValidatePasswordTextField, *_accountTextField, *_emailFeild;
    SweetTextField *acountView;
    UILabel *_NameLabel, *_AreaTextLabel, *_CardIDLabel, *_CATVIDLabel, *_PasswordLabel, *_ValidatePasswordLabel, *_accountLabel, *_EmailLabel;
    
    NSArray * _areaArray,*_emailArray;
    
    CGRect _scrollFrame;
    
    NSMutableArray *_tipLabelArray;
}
@end

@implementation PerinatalBindMoblieVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self showTitle:@"绑定手机"];
    [self showBack];
    CGFloat y = [self loadRigsterView];
    [self addBttonWithMaxY:y];
    // Do any additional setup after loading the view.
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
    
    
    
    return lineLabel.bottom;
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
    if (!_emailFeild.text) {
        [self showToastWithMessage:@"请输入手机号码" detaly:1.f];
        return;
    }
    if (!acountView.text) {
        [self showToastWithMessage:@"请输入短信验证码" detaly:1.f];
        return;
    }
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [LoginVM userBindPhoneNumber:_emailFeild.text userId:SEEKPLISTTHING(KTerminalUserId) messageCode:acountView.text sucess:^(NSDictionary *respone) {
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        NSInteger code = [[respone valueForKeyPath:@"code"] integerValue];
        if (code == 0) {
            [self pushVC:[PerinatalPregnacyVC new]];
        }else{
            [self showToastWithMessage:[respone valueForKeyPath:@"message"] detaly:1.f];
        }
    } fail:^(NSString *error) {
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        
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
