//
//  DoctorAddFollowVM.h
//  Perinatal
//
//  Created by OY on 2017/7/19.
//  Copyright © 2017年 OY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DoctorAddFollowVM : NSObject

+(void)userAddFollowWithDoctorId:(NSString *)doctorId sucess:(void(^)(NSDictionary *respone))success fail:(void(^)(NSString *error))fail;
+(void)userCancelFollowWithDoctorId:(NSString *)doctorId sucess:(void(^)(NSDictionary *respone))success fail:(void(^)(NSString *error))fail;

+(void)followsDoctorWithPageNumber:(NSInteger)number pageSize:(NSInteger)size sucess:(void(^)(NSDictionary *respone))success fail:(void(^)(NSString *error))fail;

+(void)hadFollowWithDoctorId:(NSString *)doctorId sucess:(void(^)(NSDictionary *respone))success fail:(void(^)(NSString *error))fail;

@end
