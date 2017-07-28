//
//  HttpRequest.m
//  UTVGO
//
//  Created by fute on 16/5/5.
//  Copyright © 2016年 www.UTVGO.com. All rights reserved.
//

#import "HttpRequest.h"

@implementation HttpRequest

+(void)sendGetUrl:(NSString *)url param:(NSDictionary *)param success:(void (^)(id))success fail:(void (^)(NSString *))fail{
    if (SEEKPLISTTHING(KTerminalUserId)) {
        [self sendGetUrl:url headBody1:SEEKPLISTTHING(KtickNo) headBody2:SEEKPLISTTHING(KTerminalUserId) param:param success:success fail:fail];
    }else{
        [[APIClient sharedClient] GET:url parameters:param progress:^(NSProgress * _Nonnull downloadProgress) {
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            success(responseObject);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            if (error.code == NSURLErrorCannotConnectToHost)
            {
                fail(NSLocalizedString(@"未能连接到服务器",nil));
            }else if (error.code == NSURLErrorTimedOut){
                fail(NSLocalizedString(@"连接超时",nil));
            }else{
                fail(NSLocalizedString(@"网络连接失败，请检查网络后重试", nil));
            }
        }];
    }
}


+(void)sendGetUrl:(NSString *)url headBody1:(NSString *)body1 headBody2:(NSString *)body2 param:(NSDictionary *)param success:(void (^)(id))success fail:(void (^)(NSString *))fail{
    url = [url stringByReplacingOccurrencesOfString:@" " withString:@""];
    //    url = [url stringByAddingPercentEncodingWithAllowedCharacters:NSUTF8StringEncoding];
    if (body1 && body2) {
        [[APIClient sharedClient].requestSerializer setValue:body1 forHTTPHeaderField:@"ticketNo"];
        [[APIClient sharedClient].requestSerializer setValue:body2 forHTTPHeaderField:@"terminalUserId"];
    }
    [[APIClient sharedClient] GET:url parameters:param progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (error.code == NSURLErrorCannotConnectToHost)
        {
            fail(NSLocalizedString(@"未能连接到服务器",nil));
        }else if (error.code == NSURLErrorTimedOut){
            fail(NSLocalizedString(@"连接超时",nil));
        }else{
            fail(NSLocalizedString(@"网络连接失败，请检查网络后重试", nil));
        }
    }];
    //
}

+(void)sendPostUrl:(NSString *)url param:(NSDictionary *)param success:(void (^)(id))success fail:(void (^)(NSString *))fail{
    if (SEEKPLISTTHING(KTerminalUserId)){
        [self sendPostUrl:url param:param headBody1:SEEKPLISTTHING(KtickNo) headBody2:SEEKPLISTTHING(KTerminalUserId) success:success fail:fail];
    }else{
        [[APIClient sharedClient] POST:url parameters:param progress:^(NSProgress * _Nonnull uploadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            success(responseObject);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"%@",error.description);
            fail(@"网络连接失败，请检查网络后重试");
        }];
    }
}

+(void) sendPostUrl:(NSString *)url param:(NSDictionary *)param headBody1:(NSString *)body1 headBody2:(NSString *)body2 success:(void (^)(id respone))success fail:(void (^)(NSString *respone))fail{
    url = [url stringByReplacingOccurrencesOfString:@" " withString:@""];
//    [[APIClient sharedClient].requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    if (body1 && body2) {
        [[APIClient sharedClient].requestSerializer setValue:body1 forHTTPHeaderField:@"ticketNo"];
        [[APIClient sharedClient].requestSerializer setValue:body2 forHTTPHeaderField:@"terminalUserId"];
    }
    [[APIClient sharedClient] POST:url parameters:param progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error.description);
        fail(@"网络连接失败，请检查网络后重试");
    }];
}

+(void)sendPutUrl:(NSString *)url param:(NSDictionary *)param success:(void (^)(id))success fail:(void (^)(NSString *))fail{
    if (SEEKPLISTTHING(KTerminalUserId)) {
        [self sendPutUrl:url param:param headBody1:SEEKPLISTTHING(KtickNo) headBody2:SEEKPLISTTHING(KTerminalUserId) success:success fail:fail];
    }else{
        [[APIClient sharedClient] PUT:url parameters:param success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            success(responseObject);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            fail(error.description);
        }];
    }
}

+ (void)sendPutUrl:(NSString *)url param:(NSDictionary *)param headBody1:(NSString *)body1 headBody2:(NSString *)body2 success:(void (^)(id))success fail:(void (^)(NSString *))fail{
    url = [url stringByReplacingOccurrencesOfString:@" " withString:@""];
    if (body1 && body2) {
        [[APIClient sharedClient].requestSerializer setValue:body1 forHTTPHeaderField:@"ticketNo"];
        [[APIClient sharedClient].requestSerializer setValue:body2 forHTTPHeaderField:@"terminalUserId"];
    }
    [[APIClient sharedClient] PUT:url parameters:param success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        fail(error.description);
    }];
}

+(void)sendDelete:(NSString *)url param:(NSDictionary *)param success:(void (^)(id))success fail:(void (^)(NSString *))fail{
    if (SEEKPLISTTHING(KTerminalUserId)) {
        [self sendDelete:url param:param headBody1:SEEKPLISTTHING(KtickNo) headBody2:SEEKPLISTTHING(KTerminalUserId) success:success fail:fail];
    }else{
        [[APIClient sharedClient] DELETE:url parameters:param success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            success(responseObject);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            fail(error.description);
        }];
    }
}

+(void)sendDelete:(NSString *)url param:(NSDictionary *)param headBody1:(NSString *)body1 headBody2:(NSString *)body2 success:(void (^)(id))success fail:(void (^)(NSString *))fail{
    url = [url stringByReplacingOccurrencesOfString:@" " withString:@""];
    if (body1 && body2) {
        [[APIClient sharedClient].requestSerializer setValue:body1 forHTTPHeaderField:@"ticketNo"];
        [[APIClient sharedClient].requestSerializer setValue:body2 forHTTPHeaderField:@"terminalUserId"];
    }
    [[APIClient sharedClient] DELETE:url parameters:param success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        fail(error.description);
    }];
}

+(BOOL) isSuccess:(NSDictionary *)respone{
    NSInteger status = [[respone valueForKey:@"code"] integerValue];
    return status==0;
}

@end
