//
//  AlerVCManager.m
//  CermarText
//
//  Created by Jason on 11/11/15.
//  Copyright © 2015年 Jason. All rights reserved.
//

#import "AlerVCManager.h"

@implementation AlerVCManager
/**
 *  创建一个Aler
 *
 *  @param title
 *  @param message
 *
 *  @return
 */
+ (UIAlertController *)AlerViewTitle:(NSString *)title message:(NSString *)message
{
    UIAlertController *aler = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    return aler;
}

+ (UIAlertController *)AlerSheetTitle:(NSString *)title message:(NSString *)message
{
    UIAlertController *aler = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleActionSheet];
    return aler;
}

+ (void)showAlerCancelNormalWithTitle:(NSString *)title message:(NSString *)message employController:(UIViewController *)VC
{
    UIAlertController *aler = [[self class] AlerViewTitle:title message:message];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [aler addAction:cancelAction];
    [VC presentViewController:aler animated:YES completion:nil];
}


+ (void)showAlerWithTitle:(NSString *)title message:(NSString *)message employController:(UIViewController *)VC handler:(void (^)(UIAlertAction *))handle
{
    UIAlertController *aler = [[self class] AlerViewTitle:title message:message];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
        [aler dismissViewControllerAnimated:YES completion:^{
            
        }];
    }];
    
    [aler addAction:cancelAction];

    UIAlertAction *sureAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (handle) {
            handle(action);
        }
    }];
    
    [aler addAction:sureAction];
    
    [VC presentViewController:aler animated:YES completion:nil];
}

+ (void)showAlerWithTextFileTitle:(NSString *)title message:(NSString *)message employController:(UIViewController *)VC handler:(void (^)(UIAlertAction *, UITextField *))handle
{
    UIAlertController *aler = [[self class] AlerViewTitle:title message:message];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
        
    }];
    [aler addAction:cancelAction];
    
    UIAlertAction *sureAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        UITextField *texfield = [aler.textFields firstObject];
        if (handle) {
            handle(action,texfield);
        }
    }];
    [aler addAction:sureAction];
    
    [aler addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        
    }];
    [VC presentViewController:aler animated:YES completion:nil];
}

+ (void)showAlertControllerStyleActionSheetWithTitle:(NSString *)title message:(NSString *)message employController:(UIViewController *)VC handler:(void (^)(UIAlertAction *))handle
{
    UIAlertController *aler = [[self class] AlerSheetTitle:title message:message];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
        
    }];
    //修改字体颜色
    [cancelAction setValue:[UIColor redColor] forKey:@"_titleTextColor"];
    [aler addAction:cancelAction];
    
    UIAlertAction *sureAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (handle) {
            handle(action);
        }
    }];
    
    [aler addAction:sureAction];
    
    [VC presentViewController:aler animated:YES completion:nil];
}

+ (void)showArrayTitleSheetWithTitle:(NSString *)title message:(NSString *)message employController:(UIViewController *)VC WithTitleArray:(NSArray *)titles handler:(void (^)(UIAlertAction *, NSInteger))handle
{
    UIAlertController *aler = [[self class] AlerSheetTitle:title message:message];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
        
    }];
    //修改字体颜色
    [cancelAction setValue:[UIColor redColor] forKey:@"_titleTextColor"];
    [aler addAction:cancelAction];
    
    for (int i = 0; i < titles.count; i++) {
        UIAlertAction *sureAction = [UIAlertAction actionWithTitle:titles[i] style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            if (handle) {
                handle(action,i);
            }
        }];
        [aler addAction:sureAction];
    }
    
    [VC presentViewController:aler animated:YES completion:nil];

}


@end
