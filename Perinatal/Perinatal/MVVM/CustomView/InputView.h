//
//  LoginView.h
//  UTVGO
//
//  Created by OY on 16/8/11.
//  Copyright © 2016年 www.UTVGO.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InputView : UIView

@property(nonnull,nonatomic,strong)UITextField *inputTextfield;

-(nonnull id)initWithFrame:(CGRect)frame title:(nonnull NSString *)title image:(nonnull UIImage *)image placeHolder:(nonnull NSString *)holder isPassword:(BOOL)bPassword;

@end
