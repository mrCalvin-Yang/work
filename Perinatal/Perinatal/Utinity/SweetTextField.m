//
//  SweetTextField.m
//  Perinatal
//
//  Created by OY on 2017/7/10.
//  Copyright © 2017年 OY. All rights reserved.
//

#import "SweetTextField.h"
#import "CountdownButton.h"

@interface SweetTextField ()<UITextFieldDelegate>
@property(nonatomic,strong)UITextField *inputField;
@property(nonatomic,strong)UIImageView *titleImg;
@property(nonatomic,strong)CountdownButton *cutDownBtn;
@property(nonatomic,assign)TextFieldStyle style;
@property(nonatomic,strong)UILabel *lineLabel;
@end

@implementation SweetTextField

-(instancetype)initWithFrame:(CGRect)frame fieldStyle:(TextFieldStyle)style{
    if (self = [super initWithFrame:frame]) {
        self.style = style;
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    [self addSubview:self.titleImg];
    [self addSubview:self.inputField];
    [self addSubview:self.cutDownBtn];
    if (self.style == TextFieldStyleCaptcha) {
        self.cutDownBtn.hidden = NO;
    }
    [self addSubview:self.lineLabel];
    [self addConstraint];
}

-(void)addConstraint{
    UIImage *image = V_IMAGE(self.imgName);
    [_titleImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(0);
        make.top.offset(14);
        make.size.mas_equalTo(CGSizeMake(image.size.width, image.size.height));
    }];
    
        [_cutDownBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.offset(11);
            make.bottom.offset(-10);
            make.right.offset(0);
            make.width.offset(76);
        }];
    
    [_inputField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(14);
        make.bottom.offset(-14);
        make.left.equalTo(_titleImg.mas_right).with.offset(15);
        make.right.equalTo(_cutDownBtn.mas_left).with.offset(-15);
    }];
    
    [_lineLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(image.size.width + 14);
        make.size.mas_equalTo(CGSizeMake(self.frame.size.width-image.size.width - 14, 1));
        make.bottom.offset(0);
    }];
}

-(UIImageView *)titleImg{
    if (!_titleImg) {
        _titleImg = [[UIImageView alloc] initWithImage:V_IMAGE(self.imgName)];
    }
    return _titleImg;
}

-(UITextField *)inputField{
    if (!_inputField) {
        _inputField = [[UITextField alloc] init];
        _inputField.placeholder = self.placeholder;
        _inputField.font = H14;
        _inputField.textAlignment = NSTextAlignmentLeft;
        _inputField.secureTextEntry = self.isSecureTextEntry;
    }
    return _inputField;
}

-(void)setText:(NSString *)text{
    if (text) {
        _text = text;
        _inputField.text = text;
    }
}

-(void)setKeyboardType:(UIKeyboardType)keyboardType{
    if (keyboardType) {
        _keyboardType = keyboardType;
        _inputField.keyboardType = keyboardType;
    }
}

-(UIButton *)cutDownBtn{
    if (!_cutDownBtn) {
        _cutDownBtn = [CountdownButton buttonWithType:UIButtonTypeCustom];
        [[_cutDownBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(CountdownButton *x) {
            [self.btnSelect sendNext:x];
        }];
        _cutDownBtn.hidden = YES;
    }
    return _cutDownBtn;
}

-(UILabel *)lineLabel{
    if (!_lineLabel) {
        _lineLabel = [[UILabel alloc] init];
        _lineLabel.backgroundColor = kLineColor;
    }
    return _lineLabel;
    
}

@end
