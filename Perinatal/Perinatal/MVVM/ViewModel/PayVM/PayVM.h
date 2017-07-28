//
//  PayVM.h
//  Perinatal
//
//  Created by OY on 2017/7/19.
//  Copyright © 2017年 OY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PayVM : NSObject

+(void)PayAliWithPayNo:(NSString *)payNo questionOrderId:(NSString *)questionOrderId orderType:(NSString *)orderType questionId:(NSString *)questionId sucess:(void(^)(NSDictionary *respone))success fail:(void(^)(NSString *error)) fail;

+(void)PayWeChatWithPayNo:(NSString *)payNo questionOrderId:(NSString *)questionOrderId orderType:(NSString *)orderType questionId:(NSString *)questionId sucess:(void(^)(NSDictionary *respone))success fail:(void(^)(NSString *error)) fail;


@end
