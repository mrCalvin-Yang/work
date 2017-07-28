//
//  LoginVM.h
//  Perinatal
//
//  Created by OY on 2017/7/18.
//  Copyright © 2017年 OY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LoginVM : NSObject

+(void)loginWithPhoneNum:(NSString *)phoneNum password:(NSString *)password sucess:(void(^)(NSDictionary *respone)) success fail:(void(^)(NSString *error))fail;

+(void)otherLoginWithDic:(NSDictionary *)dic sucess:(void(^)(NSDictionary *respone)) success fail:(void(^)(NSString *error))fail;

+(void)loginOutsucess:(void(^)(NSDictionary *respone))success fail:(void(^)(NSString *error))fail;

+(void)userBindPhoneNumber:(NSString *)phonenumber userId:(NSString *)userId messageCode:(NSString *)code sucess:(void(^)(NSDictionary *respone))success fail:(void(^)(NSString *error))fail;

@end
