//
//  OtherUserBindVM.m
//  Perinatal
//
//  Created by OY on 2017/7/19.
//  Copyright © 2017年 OY. All rights reserved.
//

#import "OtherUserBindVM.h"

@implementation OtherUserBindVM

+(void)userBindHospitalId:(NSString *)hospitalId sucess:(void (^)(NSDictionary *))success fail:(void (^)(NSString *))fail{
    NSString *url = [NSString stringWithFormat:[PerinatalAppApi GetFormatURLString:URLTypeBindHostpital],hospitalId];
    if (url) {
        [HttpRequest sendPutUrl:url param:nil success:^(id respone) {
            success(respone);
        } fail:^(NSString *respone) {
            fail(respone);
        }];
    }
}

@end
