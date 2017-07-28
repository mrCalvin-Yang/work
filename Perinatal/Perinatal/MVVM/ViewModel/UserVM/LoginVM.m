//
//  LoginVM.m
//  Perinatal
//
//  Created by OY on 2017/7/18.
//  Copyright © 2017年 OY. All rights reserved.
//

#import "LoginVM.h"
#import "NSString+Formatter.h"

@implementation LoginVM

+(void)loginWithPhoneNum:(NSString *)phoneNum password:(NSString *)password sucess:(void (^)(NSDictionary *))success fail:(void (^)(NSString *))fail{
    NSString *url = [PerinatalAppApi GetFormatURLString:URLTypeLogin];
    NSMutableDictionary *dic1 = [NSMutableDictionary dictionary];
    [dic1 setObject:[NSString getDeviceVersion] forKey:@"deviceVersion"];
    [dic1 setObject:SSystemVersion forKey:@"osVersion"];
    [dic1 setObject:@"igtInZV/I+8XziGKzQ7Cjg" forKey:@"password"];
    [dic1 setObject:phoneNum forKey:@"phoneNumber"];
    [dic1 setObject:@"ios" forKey:@"terminalOsType"];
    [HttpRequest sendPostUrl:url param:dic1 success:^(id respone) {
        if ([[respone valueForKeyPath:@"code"] integerValue] == 0) {
            NSDictionary *data = [respone valueForKeyPath:@"data"];
            NSArray *keys = [data allKeys];
            for (NSString *key in keys) {
                if (!data[key] || ![data[key] isKindOfClass:[NSNull class]]) {
                   DEPOSITLISTTHING(data[key], key);
                }
            }
        }
        success(respone);
    } fail:^(NSString *respone) {
        fail(respone);
    }];
}

+(void)loginOutsucess:(void (^)(NSDictionary *))success fail:(void (^)(NSString *))fail{
    NSString *url = [PerinatalAppApi GetFormatURLString:URLTypeLoginOut];
    if (url) {
        [HttpRequest sendGetUrl:url param:nil success:^(id respone) {
            if ([[respone valueForKeyPath:@"code"] integerValue] == 0) {
                [kUserDefaults removeObjectForKey:KTerminalUserId];
                [kUserDefaults removeObjectForKey:KtickNo];
            }
            success(respone);
        } fail:^(NSString *respone) {
            fail(respone);
        }];
    }
}

+(void)otherLoginWithDic:(NSDictionary *)dic sucess:(void (^)(NSDictionary *))success fail:(void (^)(NSString *))fail{
    NSString *url = [PerinatalAppApi GetFormatURLString:URLTypeOAuthLogin];
    if (url&&dic) {
        [HttpRequest sendPostUrl:url param:dic success:^(id respone) {
            if ([[respone valueForKeyPath:@"code"] integerValue] == 0) {
                NSDictionary *data = [respone valueForKeyPath:@"data"];
                NSArray *keys = [data allKeys];
                for (NSString *key in keys) {
                    if (!data[key] || ![data[key] isKindOfClass:[NSNull class]]) {
                        DEPOSITLISTTHING(data[key], key);
                    }
                }
            }
            success(respone);
        } fail:^(NSString *respone) {
            fail(respone);
        }];
    }
}

+(void)userBindPhoneNumber:(NSString *)phonenumber userId:(NSString *)userId messageCode:(NSString *)code sucess:(void (^)(NSDictionary *))success fail:(void (^)(NSString *))fail{
    NSString *url = [NSString stringWithFormat:[PerinatalAppApi GetFormatURLString:URLTypeOtherBind],phonenumber,userId,code];
    if (url) {
        [HttpRequest sendPutUrl:url param:nil success:^(id respone) {
            success(respone);
        } fail:^(NSString *respone) {
            fail(respone);
        }];
    }
}

@end
