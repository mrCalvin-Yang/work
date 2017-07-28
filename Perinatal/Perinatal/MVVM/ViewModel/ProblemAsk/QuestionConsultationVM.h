//
//  QuestionConsultationVM.h
//  Perinatal
//
//  Created by OY on 2017/7/19.
//  Copyright © 2017年 OY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QuestionConsultationVM : NSObject

+(void)haveConsultationsucess:(void(^)(NSDictionary *respone))success fail:(void(^)(NSString *error))fail;

+(void)getMyConsultationWithStatus:(NSInteger)status pageNumber:(NSInteger)number pagesize:(NSInteger)size sucess:(void(^)(NSDictionary *respone))success fail:(void(^)(NSString *error))fail;

+(void)getMyConsultationDetailWithId:(NSString *)questionId sucess:(void(^)(NSDictionary *respone))success fail:(void(^)(NSString *error))fail;

@end
