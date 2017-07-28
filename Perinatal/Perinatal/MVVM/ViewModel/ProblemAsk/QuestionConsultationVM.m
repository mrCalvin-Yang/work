//
//  QuestionConsultationVM.m
//  Perinatal
//
//  Created by OY on 2017/7/19.
//  Copyright © 2017年 OY. All rights reserved.
//

#import "QuestionConsultationVM.h"

@implementation QuestionConsultationVM

+(void)haveConsultationsucess:(void(^)(NSDictionary *respone))success fail:(void(^)(NSString *error))fail{
    NSString *url = [PerinatalAppApi GetFormatURLString:URLTypeProblemConsultation];
    [HttpRequest sendGetUrl:url param:nil success:^(id respone) {
        success(respone);
    } fail:^(NSString *respone) {
        fail(respone);
    }];
}

+(void)getMyConsultationWithStatus:(NSInteger)status pageNumber:(NSInteger)number pagesize:(NSInteger)size sucess:(void(^)(NSDictionary *respone))success fail:(void(^)(NSString *error))fail{
    NSString *url = [NSString stringWithFormat:[PerinatalAppApi GetFormatURLString:URLTypeProblemMyList],status,number,size];
    [HttpRequest sendGetUrl:url param:nil success:^(id respone) {
        success(respone);
    } fail:^(NSString *respone) {
        fail(respone);
    }];
}

+(void)getMyConsultationDetailWithId:(NSString *)questionId sucess:(void (^)(NSDictionary *))success fail:(void (^)(NSString *))fail{
    NSString *url = [NSString stringWithFormat:[PerinatalAppApi GetFormatURLString:URLTypeProblemMyDetail],questionId];
    [HttpRequest sendGetUrl:url param:nil success:^(id respone) {
        success(respone);
    } fail:^(NSString *respone) {
        fail(respone);
    }];
}

@end
