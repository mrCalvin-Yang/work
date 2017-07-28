//
//  HomePageVM.m
//  Perinatal
//
//  Created by OY on 2017/7/18.
//  Copyright © 2017年 OY. All rights reserved.
//

#import "HomePageVM.h"
#import "NSString+Formatter.h"

@implementation HomePageVM

+(void)getHomePageDataSucess:(void (^)(NSDictionary *))success fail:(void (^)(NSString *))fail{
    NSString *url = [NSString stringWithFormat:[PerinatalAppApi GetFormatURLString:URLTypeHomePage],[NSString getTodayString]];
    [HttpRequest sendGetUrl:url param:nil success:^(id respone) {
        success(respone);
    } fail:^(NSString *respone) {
        fail(respone);
    }];
}

@end
