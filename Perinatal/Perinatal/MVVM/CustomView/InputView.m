//
//  LoginView.m
//  UTVGO
//
//  Created by OY on 16/8/11.
//  Copyright © 2016年 www.UTVGO.com. All rights reserved.
//

#import "InputView.h"

@implementation InputView

-(nonnull id)initWithFrame:(CGRect)frame title:(nonnull NSString *)title image:(nonnull UIImage *)image placeHolder:(nonnull NSString *)holder isPassword:(BOOL)bPassword
{
    if (self = [super initWithFrame:frame]) {
        
        CGFloat x = 0, y = ui_offset*1.4, cx = frame.size.width, cy = frame.size.height - 2*ui_offset;
        UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
        imageView.frame = CGRectMake(x, y, image.size.width, image.size.height);
        [self addSubview:imageView];
        
        x = imageView.right + ui_offset*1.5;
        y = ui_offset*1.4;
        
        UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(x, y, cx - x - ui_offset, cy)];
        if (bPassword) {
            textField.secureTextEntry = YES;
        }
        textField.placeholder = holder;
        textField.textAlignment = NSTextAlignmentLeft;
        textField.clearButtonMode = UITextFieldViewModeWhileEditing;
        textField.font = H14;
        [self addSubview:textField];
        if (self.textfieldSingal) {
            [[textField rac_textSignal] subscribeNext:^(id x) {
                [self.textfieldSingal sendNext:x];
            }];
        }
        _inputTextfield = textField;
    }
    return self;
}

@end
