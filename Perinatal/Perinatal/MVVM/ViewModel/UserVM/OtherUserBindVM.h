//
//  OtherUserBindVM.h
//  Perinatal
//
//  Created by OY on 2017/7/19.
//  Copyright © 2017年 OY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OtherUserBindVM : NSObject

//绑定医院
+(void)userBindHospitalId:(NSString *)hospitalId sucess:(void(^)(NSDictionary *respone))success fail:(void(^)(NSString *error))fail;


@end
