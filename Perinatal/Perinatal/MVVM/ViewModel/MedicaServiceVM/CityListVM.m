//
//  CityListVM.m
//  Perinatal
//
//  Created by OY on 2017/7/18.
//  Copyright © 2017年 OY. All rights reserved.
//

#import "CityListVM.h"

@implementation CityListVM

+(void)getCityListSucess:(void (^)(NSDictionary *))success fail:(void (^)(NSString *))fail{
    NSString *url = string(REQUEST_URL, @"residence/cityList");
    if (url) {
        [self getDataWithUrl:url sucess:success fail:fail];
    }
}

+(void)getCountryListSucess:(void (^)(NSDictionary *))success fail:(void (^)(NSString *))fail{
    NSString *url = string(REQUEST_URL, @"residence/countryList");
    if (url) {
        [self getDataWithUrl:url sucess:success fail:fail];
    }
}

+(void)getNationListSucess:(void (^)(NSDictionary *))success fail:(void (^)(NSString *))fail{
    NSString *url = string(REQUEST_URL, @"residence/nationList");
    if (url) {
        [self getDataWithUrl:url sucess:success fail:fail];
    }
}

+(void)getProvinceListSucess:(void (^)(NSDictionary *))success fail:(void (^)(NSString *))fail{
    NSString *url = string(REQUEST_URL, @"residence/provinceList");
    if (url) {
        [self getDataWithUrl:url sucess:success fail:fail];
    }
}

+(void)getDataWithUrl:(NSString *)url sucess:(void (^)(NSDictionary *))success fail:(void (^)(NSString *))fail{
    [HttpRequest sendGetUrl:url param:nil success:^(id respone) {
        success(respone);
    } fail:^(NSString *respone) {
        fail(respone);
    }];
}

@end
