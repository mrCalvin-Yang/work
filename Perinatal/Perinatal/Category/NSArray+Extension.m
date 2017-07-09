//
//  NSArray+Extension.m
//  UTVGO
//
//  Created by fute on 16/6/14.
//  Copyright © 2016年 www.UTVGO.com. All rights reserved.
//

#import "NSArray+Extension.h"

@implementation NSArray (Extension)

+(BOOL)isEmpty:(NSArray *)array{
    if (array==nil) {
        return YES;
    }
    if ([array isKindOfClass:[NSNull class]]) {
        return YES;
    }
    if (![array isKindOfClass:[NSArray class]]) {
        return YES;
    }
    if (array.count<1) {
        return YES;
    }
    return NO;
}

@end
