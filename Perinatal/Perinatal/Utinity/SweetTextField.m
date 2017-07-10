//
//  SweetTextField.m
//  Perinatal
//
//  Created by OY on 2017/7/10.
//  Copyright © 2017年 OY. All rights reserved.
//

#import "SweetTextField.h"

@interface SweetTextField ()<UITextFieldDelegate>
@property(nonatomic,strong)UITextField *inputField;
@property(nonatomic,strong)UIImageView *titleImg;
@end

@implementation SweetTextField

-(instancetype)initWithFrame:(CGRect)frame fieldStyle:(TextFieldStyle)style{
    if (self = [super initWithFrame:frame]) {
        _inputField = [[UITextField alloc] initWithFrame:frame];
    }
    return self;
}

@end
