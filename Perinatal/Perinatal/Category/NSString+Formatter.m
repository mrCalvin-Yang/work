//
//  NSString+Formatter.m
//  UTVGO
//
//  Created by fute on 16/6/7.
//  Copyright © 2016年 www.UTVGO.com. All rights reserved.
//

#import "NSString+Formatter.h"

@implementation NSString (Formatter)

-(NSString *)getWeekDateString{
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekdayCalendarUnit |
    NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    NSDateFormatter *inputFormatter = [[NSDateFormatter alloc] init];
    [inputFormatter setDateFormat:@"yyyy-MM-dd"];
    NSArray *dayArray = [NSLocalizedString(@"DayString", nil) componentsSeparatedByString:@"|"];//星期()
    
    NSDate *date = [inputFormatter dateFromString:self];
    NSDateComponents *components = [calendar components:unitFlags fromDate:date];
    NSString *weekday = [dayArray objectAtIndex:(components.weekday - 1)];//今天的日期
    long day=[components day];//获取日期对应的长整形字符串
    long month=[components month];//获取月对应的长整形字符串
    return [NSString stringWithFormat:@"周%@\n%ld-%ld", weekday, month, day];
}

+ (BOOL)isBlankString:(NSString *)string {
    if (string == nil || string == NULL) {
        return YES;
    }
    if ([string isKindOfClass:[NSNull class]]) {
        return YES;
    }
    if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]==0) {
        return YES;
    }
    return NO;
}

@end
