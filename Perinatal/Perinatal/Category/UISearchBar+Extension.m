//
//  UISearchBar+Extension.m
//  UTVGO
//
//  Created by fute on 15/9/24.
//  Copyright (c) 2015年 www.UTVGO.com. All rights reserved.
//

#import "UISearchBar+Extension.h"

@implementation UISearchBar (Extension)

- (void)setSearchTextFieldBackgroundColor:(UIColor *)backgroundColor
{
    UIView *searchTextField = nil;
//    if (IOS7 ) {
//        // 经测试, 需要设置barTintColor后, 才能拿到UISearchBarTextField对象
////        self.barTintColor = [UIColor whiteColor];
//        searchTextField = [[[self.subviews firstObject] subviews] lastObject];
//    }
//    else { // iOS6以下版本searchBar内部子视图的结构不一样
        for (UIView *subView in self.subviews) {
            if ([subView isKindOfClass:NSClassFromString(@"UISearchBarTextField")]) {
                searchTextField = subView;
            }
        }
//    }
    
    searchTextField.backgroundColor = backgroundColor;
}

- (CGRect) getSearchTextFieldFrame
{
    UIView *searchTextField = nil;
//    if (IOS7 ) {
//        // 经测试, 需要设置barTintColor后, 才能拿到UISearchBarTextField对象
//        self.barTintColor = [UIColor whiteColor];
//        searchTextField = [[[self.subviews firstObject] subviews] lastObject];
//    }
//    else { // iOS6以下版本searchBar内部子视图的结构不一样
        for (UIView *subView in self.subviews) {
            if ([subView isKindOfClass:NSClassFromString(@"UISearchBarTextField")]) {
                searchTextField = subView;
            }
        }
//    }
    return searchTextField.frame;
}
@end
