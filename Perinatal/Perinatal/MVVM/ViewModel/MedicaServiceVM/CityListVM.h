//
//  CityListVM.h
//  Perinatal
//
//  Created by OY on 2017/7/18.
//  Copyright © 2017年 OY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CityListVM : NSObject

+(void)getCityListSucess:(void(^)(NSDictionary *respone))success fail:(void(^)(NSString *error)) fail;

+(void)getCountryListSucess:(void(^)(NSDictionary *respone))success fail:(void(^)(NSString *error)) fail;

+(void)getNationListSucess:(void(^)(NSDictionary *respone))success fail:(void(^)(NSString *error)) fail;

+(void)getProvinceListSucess:(void(^)(NSDictionary *respone))success fail:(void(^)(NSString *error)) fail;

@end
