//
//  DoctorListVM.m
//  Perinatal
//
//  Created by OY on 2017/7/18.
//  Copyright © 2017年 OY. All rights reserved.
//

#import "DoctorListVM.h"

@implementation DoctorListVM

+(void)getDoctorHotListWithPageNumber:(NSInteger)pageNum pageSize:(NSInteger)size sucess:(void (^)(NSDictionary *))success fail:(void (^)(NSString *))fail{
    NSString *url = [NSString stringWithFormat:[PerinatalAppApi GetFormatURLString:URLTypeDoctorHots],pageNum,size];
    if (url) {
        [self getListWithUrl:url sucess:success fail:fail];
    }
}

+(void)getDoctorFreeListWithPageNumber:(NSInteger)pageNum pageSize:(NSInteger)size sucess:(void (^)(NSDictionary *))success fail:(void (^)(NSString *))fail{
    NSString *url = [NSString stringWithFormat:[PerinatalAppApi GetFormatURLString:URLTypeDoctorLimitFree],pageNum,size];
    if (url) {
        [self getListWithUrl:url sucess:success fail:fail];
    }
}

+(void)getListWithUrl:(NSString *)url sucess:(void (^)(NSDictionary *))success fail:(void (^)(NSString *))fail{
    [HttpRequest sendGetUrl:url param:nil success:^(id respone) {
        success(respone);
    } fail:^(NSString *respone) {
        fail(respone);
    }];
}

@end
