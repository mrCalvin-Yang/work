//
//  PerfectPernacyVM.m
//  Perinatal
//
//  Created by OY on 2017/7/18.
//  Copyright © 2017年 OY. All rights reserved.
//

#import "PerfectPernacyVM.h"

@implementation PerfectPernacyVM

+(void)PerfectWithDic:(NSDictionary *)dic sucess:(void (^)(NSDictionary *))success fail:(void (^)(NSString *))fail{
    NSString *url = [PerinatalAppApi GetFormatURLString:URLTypePerfectPregnancyInfo];
    [HttpRequest sendPutUrl:url param:dic success:^(id respone) {
        success(respone);
    } fail:^(NSString *respone) {
        fail(respone);
    }];
}

@end
