//
//  DoctorQuestionList.m
//  Perinatal
//
//  Created by OY on 2017/7/18.
//  Copyright © 2017年 OY. All rights reserved.
//

#import "DoctorQuestionList.h"

@implementation DoctorQuestionList

+(void)getDoctorQuestionListWithDoctorId:(NSString *)doctorId pageNumber:(NSInteger)pageNum pageSize:(NSInteger)size sucess:(void (^)(NSDictionary *))success fail:(void (^)(NSString *))fail{
    NSString *url = [NSString stringWithFormat:[PerinatalAppApi GetFormatURLString:URLTypeDoctorProblems],doctorId,pageNum,size];
    if (url) {
        [HttpRequest sendGetUrl:url param:nil success:^(id respone) {
            success(respone);
        } fail:^(NSString *respone) {
            fail(respone);
        }];
    }
}

@end
