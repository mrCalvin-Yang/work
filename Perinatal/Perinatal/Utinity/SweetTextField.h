//
//  SweetTextField.h
//  Perinatal
//
//  Created by OY on 2017/7/10.
//  Copyright © 2017年 OY. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, TextFieldStyle){
    TextFieldStyleDefault,//默认输入
    TextFieldStyleCaptcha,//
    TextFieldStyleSlection
};

@interface SweetTextField : UIView

@property(nonatomic, assign,readonly)TextFieldStyle style;

@property(nonatomic, assign)BOOL isSecureTextEntry;

@property(nonatomic, copy)NSString *text;

@property(nonatomic, copy)NSString *placeholder;

@property(nonatomic, strong)UIColor *bottomLineColor;

@property(nonatomic, assign)UIKeyboardType keyboardType;

@property(nonatomic, copy)NSString *imgName;

@property(nonatomic, strong)RACSubject *btnSelect;

-(instancetype)initWithFrame:(CGRect)frame fieldStyle:(TextFieldStyle)style;

@end
