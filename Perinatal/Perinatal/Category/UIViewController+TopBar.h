//
//  UIViewController+TopBar.h
//  UTVGO
//
//  Created by fute on 16/6/6.
//  Copyright © 2016年 www.UTVGO.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (TopBar)

/**
 *  显示顶部提示按钮
 */
-(void)showItemImg;
/**
 *  显示顶部右边个人中心按钮
 */
-(void)showItem;

/**
 *  显示右边radio按钮和个人中心按钮
 */
-(void)showMenuMessageAndLoginOut;

/**
 *  显示默认的返回按钮
 */
-(void)showBack;

/**
 *  显示返回按钮，按钮按照指定的颜色
 *
 *  @param tintColor 按钮图片的颜色
 */
-(void)showBackWithTintColor:(UIColor *)tintColor;

/**
 *  中间title
 *
 *  @param title 中间的title值
 */
-(void)showTitle:(NSString *)title;

/**
 *  显示右边搜索按钮
 *  @param channelId 搜索的频道id
 */
-(void)showRightSearch:(NSInteger) channelId;



@end
