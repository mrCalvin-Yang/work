//
//  PerfectPernacyVM.h
//  Perinatal
//
//  Created by OY on 2017/7/18.
//  Copyright © 2017年 OY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PerfectPernacyVM : NSObject

/*
 {
 "babySex": 0,
 "birthday": "string",
 "deliveryDate": "string",
 "dueDate": "string",
 "hospitalId": "string",
 "isEdc": "string",
 "lastMenstrualPeriod": "string",
 "name": "string",
 "phase": "string"
 }
 */

+(void)PerfectWithDic:(NSDictionary *)dic sucess:(void(^)(NSDictionary *respone)) success fail:(void(^)(NSString *error)) fail;

@end
