//
//  BaseVC.h
//  UTVGO
//
//  Created by fute on 16/5/5.
//  Copyright © 2016年 www.UTVGO.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIViewController+TopBar.h"

typedef void (^ClickBlock)();
typedef void (^ClickRightBarBlock)(UIButton *sender);

@interface BaseVC : UIViewController

@property (nonatomic, assign) BOOL canLand;

/**
 *  显示右侧按钮
 *  @param imageName         普通状态按钮的图片名字
 *  @param selecteImg        选中状态按钮的图片
 *  @param clickRightBarBlock 点击的回调block
 */
-(void)showRightBarWithNormal:(NSString *)imageName selectedImg:(NSString *)selecteImg block:(ClickRightBarBlock)clickRightBarBlock;

/**
 *  显示错误提示按钮
 *
 *  @param tip        显示的文字
 *  @param clickBlock 点击回调的block
 */
-(void)showButtonWithTip:(NSString *)tip clickBlock:(ClickBlock)clickBlock;

/**
 *  显示错误提示按钮
 *
 *  @param tip          显示的文字
 *  @param frame        显示的文字的frame
 *  @param clickBlock   点击回调的block
 */
-(void)showButtonWithTip:(NSString *)tip frame:(CGRect)frame clickBlock:(ClickBlock)clickBlock;

/**
 *  显示loading，小小的
 *
 *  @param centerPoint loading的中心位置
 */
-(void)showLoadingIndicatorWithCenter:(CGPoint) centerPoint;

/**
 *  隐藏loading
 */
-(void)hideLoadingIndicator;

/**
 *  设置导航栏颜色
 */
-(void)setNavigationBar:(UIColor *)color;

-(void)setSubviews;

@end
