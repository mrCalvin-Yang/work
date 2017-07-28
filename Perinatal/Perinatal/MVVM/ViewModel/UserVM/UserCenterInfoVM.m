//
//  UserCenterInfoVM.m
//  Perinatal
//
//  Created by OY on 2017/7/19.
//  Copyright © 2017年 OY. All rights reserved.
//

#import "UserCenterInfoVM.h"

@implementation UserCenterInfoVM

+(void)getUserInfoSucess:(void(^)(NSDictionary *respone))success fail:(void(^)(NSString *error))fail{
    NSString *url = [PerinatalAppApi GetFormatURLString:URLTypeInfo];
    if (url) {
        [HttpRequest sendGetUrl:url param:nil success:^(id respone) {
            success(respone);
        } fail:^(NSString *respone) {
            fail(respone);
        }];
    }
}

+(void)getPersonCenterInfoSucess:(void (^)(NSDictionary *))success fail:(void (^)(NSString *))fail{
    NSString *url = [PerinatalAppApi GetFormatURLString:URLTypeUserCenter];
    if (url) {
        [HttpRequest sendGetUrl:url param:nil success:^(id respone) {
            success(respone);
        } fail:^(NSString *respone) {
            fail(respone);
        }];
    }
}

+(void)updateUserInfoWithDic:(NSDictionary *)dic sucess:(void (^)(NSDictionary *))success fail:(void (^)(NSString *))fail{
    NSString *url = [PerinatalAppApi GetFormatURLString:URLTypeUpdateInfo];
    if (url&&dic) {
        [HttpRequest sendPutUrl:url param:dic success:^(id respone) {
            success(respone);
        } fail:^(NSString *respone) {
            fail(respone);
        }];
    }
}

+(void)updatePic:(UIImage *)image sucess:(void (^)(NSDictionary *))success fail:(void (^)(NSString *))fail{
    NSString *url = [PerinatalAppApi GetFormatURLString:URLTypeUpdateAvatar];
    if (url) {
        
    }
}

@end
