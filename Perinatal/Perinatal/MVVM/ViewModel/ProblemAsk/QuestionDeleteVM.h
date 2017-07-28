//
//  QuestionDeleteVM.h
//  Perinatal
//
//  Created by OY on 2017/7/19.
//  Copyright © 2017年 OY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QuestionDeleteVM : NSObject

+(void)questionDeleteWithQuestionId:(NSString *)questionid sucess:(void(^)(NSDictionary *respone))success fail:(void(^)(NSString *error))fail;

@end
