//
//  SendMessageViewModel.m
//  Perinatal
//
//  Created by OY on 2017/7/18.
//  Copyright © 2017年 OY. All rights reserved.
//

#import "SendMessageViewModel.h"


@implementation SendMessageViewModel

+(void)sendMessageWithPhoneNumber:(NSString *)phoneNmb sucess:(void (^)(NSDictionary *))success fail:(void (^)(NSString *))fail{
    if (!phoneNmb) {
        return;
    }
    NSString *sendUrl = [NSString stringWithFormat:[PerinatalAppApi GetFormatURLString:URLTypeGetVerificationCode],phoneNmb];
    [HttpRequest sendGetUrl:sendUrl param:nil success:^(id respone) {
        success(respone);
    } fail:^(NSString *respone) {
        fail(respone);
    }];
}

@end
