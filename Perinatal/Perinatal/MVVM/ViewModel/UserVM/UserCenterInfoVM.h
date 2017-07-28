//
//  UserCenterInfoVM.h
//  Perinatal
//
//  Created by OY on 2017/7/19.
//  Copyright © 2017年 OY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserCenterInfoVM : NSObject

+(void)getUserInfoSucess:(void(^)(NSDictionary *respone))success fail:(void(^)(NSString *error))fail;

+(void)getPersonCenterInfoSucess:(void(^)(NSDictionary *respone))success fail:(void(^)(NSString *error))fail;

+(void)updateUserInfoWithDic:(NSDictionary *)dic sucess:(void(^)(NSDictionary *respone))success fail:(void(^)(NSString *error))fail;

+(void)updatePic:(UIImage *)image sucess:(void(^)(NSDictionary *respone))success fail:(void(^)(NSString *error))fail;

@end
