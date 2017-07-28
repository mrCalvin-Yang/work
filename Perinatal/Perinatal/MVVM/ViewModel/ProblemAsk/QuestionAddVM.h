//
//  QuestionAddVM.h
//  Perinatal
//
//  Created by OY on 2017/7/19.
//  Copyright © 2017年 OY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QuestionAddVM : NSObject

+(void)addQuestionWithDoctorId:(NSString *)doctorId questionContent:(NSString *)content questionCategoryId:(NSString *)categoryId cost:(NSString *)cost isOpen:(BOOL)isOpen questionImages:(NSArray *)images sucess:(void(^)(NSDictionary *respone))success fail:(void(^)(NSString *error)) fail;

@end
