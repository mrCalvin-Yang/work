//
//  PayVM.m
//  Perinatal
//
//  Created by OY on 2017/7/19.
//  Copyright © 2017年 OY. All rights reserved.
//

#import "PayVM.h"

@implementation PayVM

+(void)PayAliWithPayNo:(NSString *)payNo questionOrderId:(NSString *)questionOrderId orderType:(NSString *)orderType questionId:(NSString *)questionId sucess:(void (^)(NSDictionary *))success fail:(void (^)(NSString *))fail{
    NSString *payUrl = [NSString stringWithFormat:[PerinatalAppApi GetFormatURLString:URLTypePayAli],payNo,questionOrderId,orderType,questionId];
    if (payUrl) {
        [self getDataWithUrl:payUrl sucess:success fail:fail];
    }
}

+(void)PayWeChatWithPayNo:(NSString *)payNo questionOrderId:(NSString *)questionOrderId orderType:(NSString *)orderType questionId:(NSString *)questionId sucess:(void (^)(NSDictionary *))success fail:(void (^)(NSString *))fail{
    NSString *payUrl = [NSString stringWithFormat:[PerinatalAppApi GetFormatURLString:URLTypePayWeChat],payNo,questionOrderId,orderType,questionId];
    if (payUrl) {
        [self getDataWithUrl:payUrl sucess:success fail:fail];
    }
}

+(void)getDataWithUrl:(NSString *)url sucess:(void (^)(NSDictionary *))success fail:(void (^)(NSString *))fail{
    [HttpRequest sendPostUrl:url param:nil success:^(id respone) {
        success(respone);
    } fail:^(NSString *respone) {
        fail(respone);
    }];
}

@end
