//
//  AlerVCManager.h
//  CermarText
//
//  Created by Jason on 11/11/15.
//  Copyright © 2015年 Jason. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface AlerVCManager : NSObject
/**
 *  显示一个普通只有确定按钮的aler
 *
 *  @param title   标题
 *  @param message 信息
 *  @param VC      用那个控制器弹出
 */
+ (void)showAlerCancelNormalWithTitle:(NSString *)title message:(NSString *)message employController:(UIViewController *)VC;
/**
 *  展示一个带确定回调的aler
 *
 *  @param title   标题
 *  @param message 信息
 *  @param VC      用那个控制器弹出
 *  @param handle  确定按钮的回调
 */
+ (void)showAlerWithTitle:(NSString *)title message:(NSString *)message employController:(UIViewController *)VC handler:(void (^)(UIAlertAction *action))handle;
/**
 *  展示一个带TextField的aler
 *
 *  @param title   标题
 *  @param message 信息
 *  @param VC      用那个控制器弹出
 *  @param handle  确定按钮回调
 */
+ (void)showAlerWithTextFileTitle:(NSString *)title message:(NSString *)message employController:(UIViewController *)VC handler:(void(^)(UIAlertAction *action,UITextField *textField))handle;
/**
 *  展示一个ActionSheet的Aler
 *
 *  @param title   标题
 *  @param message 信息
 *  @param VC      控制器
 *  @param handle  确定按钮回调
 */
+ (void)showAlertControllerStyleActionSheetWithTitle:(NSString *)title message:(NSString *)message employController:(UIViewController *)VC handler:(void(^)(UIAlertAction *action))handle;
/**
 *  展示带多个回调按钮的SheetAler
 *
 *  @param title   标题
 *  @param message 信息
 *  @param VC      控制器
 *  @param titles  按钮标题数组
 *  @param handle  回调
 */
+ (void)showArrayTitleSheetWithTitle:(NSString *)title message:(NSString *)message employController:(UIViewController *)VC WithTitleArray:(NSArray *)titles handler:(void(^)(UIAlertAction *action,NSInteger index))handle;
@end
