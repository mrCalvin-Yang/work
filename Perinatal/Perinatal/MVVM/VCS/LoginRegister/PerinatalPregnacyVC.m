//
//  PerinatalPregnacyVC.m
//  Perinatal
//
//  Created by OY on 2017/7/10.
//  Copyright © 2017年 OY. All rights reserved.
//

#import "PerinatalPregnacyVC.h"
#import "SweetTextField.h"
#import "PerfectPernacyVM.h"
#import "BaseTabarController.h"

@interface PerinatalPregnacyVC ()
{
    CGFloat cx;
}

@property(nonatomic,strong)UISegmentedControl *control;

@property(nonatomic,strong)UIView *PregnacyingView;
@property(nonatomic,strong)UIView *pregnacyedView;
@property(nonatomic,strong)UIView *bePregnacyView;
@property(nonatomic,strong)SweetTextField *textField1;
@property(nonatomic,strong)SweetTextField *textField2;
@property(nonatomic,strong)SweetTextField *textField3;
@property(nonatomic,strong)SweetTextField *textField4;
@property(nonatomic,strong)SweetTextField *textField5;
@property(nonatomic,strong)SweetTextField *textField6;



@end

@implementation PerinatalPregnacyVC

-(UISegmentedControl *)control{
    if (!_control) {
        _control = [[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObjects:@"怀孕中",@"已生育",@"备孕中", nil]];
        _control.tintColor = global_color;
        _control.selectedSegmentIndex = 0;
        [_control addTarget:self action:@selector(switchControl:) forControlEvents:UIControlEventValueChanged];
        _control.frame = CGRectMake(40, 74, cx, 28);
    }
    return _control;
}

-(UIView *)pregnacyedView{
    if (!_pregnacyedView) {
        _pregnacyedView = [[UIView alloc] initWithFrame:CGRectMake(40, self.control.bottom +28, cx, 200)];
        _pregnacyedView.autoresizesSubviews = YES;
        _pregnacyedView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, cx, 34)];
        label.font = H12;
        label.text = @"恭喜您生了小宝宝，我们将为您提供孕儿方面的宝贵知识，为宝宝的健康成长保驾护航";
        label.textAlignment = NSTextAlignmentLeft;
        label.numberOfLines = 2;
        label.adjustsFontSizeToFitWidth = YES;
        [_pregnacyedView addSubview:label];
        self.textField1 = [[SweetTextField alloc] initWithFrame:CGRectMake(0, label.bottom + 20, cx, 48) fieldStyle:TextFieldStyleSlection];
        self.textField1.imgName = @"icon-Calendar";
        self.textField1.placeholder = @"请选择宝宝生日";
        self.textField1.bottomLineColor = kLineColor;
        [_pregnacyedView addSubview:self.textField1];
        
        self.textField2 = [[SweetTextField alloc] initWithFrame:CGRectMake(0, self.textField1.bottom + 6, cx, 48) fieldStyle:TextFieldStyleSlection];
        self.textField2.imgName = @"icon-Gender";
        self.textField2.placeholder = @"请选择宝宝性别";
        self.textField2.bottomLineColor = kLineColor;
        [_pregnacyedView addSubview:self.textField2];
        _pregnacyedView.height = self.textField2.bottom;
//        _PregnacyingView.hidden = YES;
        
    }
    return _pregnacyedView;
}

-(UIView *)PregnacyingView{
    if (!_PregnacyingView) {
        _PregnacyingView = [[UIView alloc] initWithFrame:CGRectMake(40, self.control.bottom+28, cx, 200)];
        _PregnacyingView.autoresizesSubviews = YES;
        _PregnacyingView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
//        _PregnacyingView.userInteractionEnabled = YES;
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, cx, 34)];
        label.font = H12;
        label.text = @"请选择产检时医生告知的预产期，如尚未产检可以使用下方的“计算预产期“";
        label.textAlignment = NSTextAlignmentLeft;
        label.numberOfLines = 2;
        label.adjustsFontSizeToFitWidth = YES;
        [_PregnacyingView addSubview:label];
        self.textField3 = [[SweetTextField alloc] initWithFrame:CGRectMake(0, label.bottom + 20, cx, 48) fieldStyle:TextFieldStyleSlection];
        self.textField3.imgName = @"icon-Calendar";
        self.textField3.placeholder = @"请选择预产期";
        self.textField3.bottomLineColor = kLineColor;
        [_PregnacyingView addSubview:self.textField3];
        
        self.textField4 = [[SweetTextField alloc] initWithFrame:self.textField3.frame fieldStyle:TextFieldStyleSlection];
        self.textField4.imgName = @"icon-Gender";
        self.textField4.placeholder = @"请选择末次月经日期";
        self.textField4.bottomLineColor = kLineColor;
        self.textField4.hidden = YES;
        [_PregnacyingView addSubview:self.textField4];
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setTitle:@"不知道预产期,计算预产期" forState:UIControlStateNormal];
        btn.titleLabel.font = H12;
        btn.titleLabel.adjustsFontSizeToFitWidth = YES;
//        btn.backgroundColor = kBackColor;
        btn.frame = CGRectMake(cx - 82, self.textField3.bottom + 22, 82, 17);
        [btn setTitleColor:kImportFontColor forState:UIControlStateNormal];
        btn.titleLabel.textAlignment = NSTextAlignmentRight;
        [[btn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(UIButton *x) {
            if (!self.textField3.hidden) {
                self.textField3.hidden = YES;
                self.textField4.hidden = NO;
                [x setTitle:@"我知道预产期" forState:UIControlStateNormal];
            }else{
                self.textField4.hidden = YES;
                self.textField3.hidden = NO;
                [x setTitle:@"不知道预产期,计算预产期" forState:UIControlStateNormal];
            }
            
        }];
        [_PregnacyingView addSubview:btn];
        _PregnacyingView.height = btn.bottom;
        
    }
    return _PregnacyingView;
}

-(UIView *)bePregnacyView{
    if (!_bePregnacyView) {
        _bePregnacyView = [[UIView alloc] initWithFrame:CGRectMake(40, self.control.bottom+28, cx, 200)];
        _bePregnacyView.autoresizesSubviews = YES;
        _bePregnacyView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH - 80, 34)];
        label.font = H12;
        label.text = @"这将会是非常令人期待的时刻，请放松心情，调养好身体，用最好的状态迎接宝宝的到来";
        label.textAlignment = NSTextAlignmentLeft;
        label.numberOfLines = 2;
        label.adjustsFontSizeToFitWidth = YES;
        [_bePregnacyView addSubview:label];
        self.textField5 = [[SweetTextField alloc] initWithFrame:CGRectMake(0, label.bottom + 20, cx, 48) fieldStyle:TextFieldStyleDefault];
        self.textField5.imgName = @"icon-Name";
        self.textField5.placeholder = @"请填写真实姓名";
        self.textField5.bottomLineColor = kLineColor;
        [_bePregnacyView addSubview:self.textField5];
        
        self.textField6 = [[SweetTextField alloc] initWithFrame:CGRectMake(0, self.textField5.bottom + 6, cx, 48) fieldStyle:TextFieldStyleSlection];
        self.textField6.imgName = @"icon-Gender";
        self.textField6.placeholder = @"请选择出生日期";
        self.textField6.bottomLineColor = kLineColor;
        [_bePregnacyView addSubview:self.textField6];
        _bePregnacyView.height = self.textField6.bottom;
//        _bePregnacyView.hidden = YES;
        
    }
    return _bePregnacyView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self showBack];
    cx = SCREENWIDTH - 80;
    self.title = @"完善你的孕期信息";
    [self.view addSubview:self.control];
    [self.view addSubview:self.PregnacyingView];
    [self.view addSubview:self.bePregnacyView];
    [self.view addSubview:self.pregnacyedView];
    self.pregnacyedView.hidden = YES;
    self.bePregnacyView.hidden = YES;
    UIButton *bt = [UIButton buttonWithType:UIButtonTypeCustom];
    bt.frame = CGRectMake(40, _bePregnacyView.bottom + 30, cx, 40);
    [bt setBackgroundImage:[UIImage imageWithColor:global_color] forState:UIControlStateNormal];
    [bt setBackgroundImage:[UIImage imageWithColor:RGBCOLOR(255, 103, 103)] forState:UIControlStateSelected];
    bt.layer.masksToBounds = YES;
    bt.layer.cornerRadius = 4.f;
    [bt setTitle:@"确定" forState:UIControlStateNormal];
    [bt addTarget:self action:@selector(onclickCommit) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:bt];
}

-(void)onclickCommit{
    NSDictionary *dic = nil;
    NSString *isEdc = @"";
    NSString *phase = @"";
    if (self.control.selectedSegmentIndex == 0) {
        if (!self.textField3.text || !self.textField3.text) {
            //弹窗
            return;
        }
        if (self.textField3.text) {
            isEdc = @"1";
        }
        if (self.textField4.text) {
            isEdc = @"0";
        }
        phase = @"PREGNANCY_STATE_PREGNANT";
    }else if (self.control.selectedSegmentIndex == 1){
        if (!self.textField1.text && !self.textField2.text) {
            
            return;
        }
        phase = @"PREGNANCY_STATE_ALREADY_BABY";
    }else{
        if (!self.textField5.text && self.textField5.text) {
            
            return;
        }
        phase = @"PREGNANCY_STATE_PREPRAE_PREGNANT";
    }
    dic = @{
            @"babySex": self.textField1.text == nil ? @"":self.textField1.text,
            @"birthday": self.textField6.text == nil ? @"":self.textField6.text,
            @"deliveryDate": self.textField5.text == nil ? @"":self.textField5.text,
            @"dueDate": self.textField3.text == nil ? @"":self.textField3.text,
            @"isEdc": isEdc,
            @"lastMenstrualPeriod": self.textField4.text == nil ? @"":self.textField4.text,
            @"name": self.textField5.text == nil ? @"":self.textField5.text,
            @"phase": phase
            };
//    kWindow.rootViewController = [BaseTabarController new];
    [PerfectPernacyVM PerfectWithDic:dic sucess:^(NSDictionary *respone) {
        if ([respone[@"code"] integerValue] == 0) {
            
        }
    } fail:^(NSString *error) {
        
    }];
}

-(void)switchControl:(UISegmentedControl *)control{
    if (control.selectedSegmentIndex == 1) {
        _PregnacyingView.hidden = YES;
        _bePregnacyView.hidden = YES;
        _pregnacyedView.hidden = NO;
    }else if (control.selectedSegmentIndex == 2){
        _PregnacyingView.hidden = YES;
        _bePregnacyView.hidden = NO;
        _pregnacyedView.hidden = YES;
    }else{
        _PregnacyingView.hidden = NO;
        _bePregnacyView.hidden = YES;
        _pregnacyedView.hidden = YES;
    }
        
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
