//
//  RegisterVM.m
//  Perinatal
//
//  Created by OY on 2017/7/18.
//  Copyright © 2017年 OY. All rights reserved.
//

#import "RegisterVM.h"
#import "NSString+Base64.h"
#import "NSString+Formatter.h"
#import "PerinatalUserModel.h"

@implementation RegisterVM

+(void)registerWithPhoneNumber:(NSString *)phoneNumber code:(NSString *)code password:(NSString *)password sucess:(void (^)(NSDictionary *))success fail:(void (^)(NSString *))fail{
    NSString *url = [NSString stringWithFormat:[PerinatalAppApi GetFormatURLString:URLTypeRegister],code];
    NSMutableDictionary *dic1 = [NSMutableDictionary dictionary];
    [dic1 setObject:SSystemVersion forKey:@"deviceVersion"];
    [dic1 setObject:[NSString getDeviceVersion] forKey:@"osVersion"];
    [dic1 setObject:@"igtInZV/I+8XziGKzQ7Cjg" forKey:@"password"];
    [dic1 setObject:phoneNumber forKey:@"phoneNumber"];
    [dic1 setObject:@"ios" forKey:@"terminalOsType"];
    [HttpRequest sendPostUrl:url param:dic1 success:^(id respone) {
        NSLog(@"%@",respone);
        if ([[respone valueForKeyPath:@"code"] integerValue] == 0) {
            [[APIClient sharedClient].requestSerializer setValue:respone[@"ticketNo"] forHTTPHeaderField:@"ticketNo"];
            [[APIClient sharedClient].requestSerializer setValue:respone[@"terminalUserId"] forHTTPHeaderField:@"terminalUserId"];
            NSDictionary *data = [respone valueForKeyPath:@"data"];
            NSArray *keys = [data allKeys];
            for (NSString *key in keys) {
              DEPOSITLISTTHING(data[key], key);
            }
        }
        success(respone);
    } fail:^(NSString *respone) {
        fail(respone);
    }];
}

@end
