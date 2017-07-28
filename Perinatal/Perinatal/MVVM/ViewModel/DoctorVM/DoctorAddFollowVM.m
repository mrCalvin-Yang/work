//
//  DoctorAddFollowVM.m
//  Perinatal
//
//  Created by OY on 2017/7/19.
//  Copyright © 2017年 OY. All rights reserved.
//

#import "DoctorAddFollowVM.h"

@implementation DoctorAddFollowVM

+(void)userAddFollowWithDoctorId:(NSString *)doctorId sucess:(void (^)(NSDictionary *))success fail:(void (^)(NSString *))fail{
    NSString *url = [NSString stringWithFormat:[PerinatalAppApi GetFormatURLString:URLTypeFollow],doctorId];
    if (url) {
        [HttpRequest sendPostUrl:url param:nil success:^(id respone) {
            success(respone);
        } fail:^(NSString *respone) {
            fail(respone);
        }];
    }
}

+(void)userCancelFollowWithDoctorId:(NSString *)doctorId sucess:(void (^)(NSDictionary *))success fail:(void (^)(NSString *))fail{
    NSString *url = [NSString stringWithFormat:[PerinatalAppApi GetFormatURLString:URLTypeUnFollow],doctorId];
    [HttpRequest sendDelete:url param:nil success:^(id respone) {
        success(respone);
    } fail:^(NSString *respone) {
        fail(respone);
    }];
}

+(void)followsDoctorWithPageNumber:(NSInteger)number pageSize:(NSInteger)size sucess:(void (^)(NSDictionary *))success fail:(void (^)(NSString *))fail{
    NSString *url = [NSString stringWithFormat:[PerinatalAppApi GetFormatURLString:URLTypeFollows],number,size];
    if (url) {
        [HttpRequest sendGetUrl:url param:nil success:^(id respone) {
            success(respone);
        } fail:^(NSString *respone) {
            fail(respone);
        }];
    }
}

+(void)hadFollowWithDoctorId:(NSString *)doctorId sucess:(void (^)(NSDictionary *))success fail:(void (^)(NSString *))fail{
    NSString *url = [NSString stringWithFormat:[PerinatalAppApi GetFormatURLString:URLTypeIsFollow],doctorId];
    if (url) {
        [HttpRequest sendGetUrl:url param:nil success:^(id respone) {
            success(respone);
        } fail:^(NSString *respone) {
            fail(respone);
        }];
    }
}

@end
