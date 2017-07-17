//
//  HttpRequest.h
//  UTVGO
//
//  Created by fute on 16/5/5.
//  Copyright © 2016年 www.UTVGO.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "APIClient.h"

@interface HttpRequest : NSObject

+(void) sendGetUrl:(NSString *)url headBody1:(NSString *)body1 headBody2:(NSString *)body2 param:(NSDictionary *)param success:(void (^)(id respone))success fail:(void (^)(NSString *respone))fail;


+(void) sendPostUrl:(NSString *)url param:(NSDictionary *)param headBody1:(NSString *)body1 headBody2:(NSString *)body2 success:(void (^)(id respone))success fail:(void (^)(NSString *respone))fail;

+(void) sendPutUrl:(NSString *)url param:(NSDictionary *)param headBody1:(NSString *)body1 headBody2:(NSString *)body2 success:(void (^)(id respone))success fail:(void (^)(NSString *respone))fail;

+(void) sendDelete:(NSString *) url param:(NSDictionary *)param headBody1:(NSString *)body1 headBody2:(NSString *)body2 success:(void (^)(id respone))success fail:(void (^)(NSString *respone))fail;
/**
 *  传入返回报文，检查是否操作成功  通过比较status是否为0  判断是否成功
 *
 *  @param respone 返回报文
 *
 *  @return 是否成功
 */
+(BOOL) isSuccess:(NSDictionary *)respone;

@end
