//
//  NSString+Formatter.h
//  UTVGO
//
//  Created by fute on 16/6/7.
//  Copyright © 2016年 www.UTVGO.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Formatter)

/**
 *  对节目表的日期进行格式化  如周二\n6-7 的格式
 *
 *  @return 周二\n6-7 的格式
 */
-(NSString *)getWeekDateString;

//判断字符串是否为空，为啥是静态函数，是因为防止调用改方法的主体为NULL
+ (BOOL)isBlankString:(NSString *)string;

@end
