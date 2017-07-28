//
//  QuestionAddAginVM.h
//  Perinatal
//
//  Created by OY on 2017/7/19.
//  Copyright © 2017年 OY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QuestionAddAginVM : NSObject
//追加评论
+(void)questionAddAginWithQuestionId:(NSString *)questionid content:(NSString *)content sucess:(void(^)(NSDictionary *respone))success fail:(void(^)(NSString *error))fail;

@end
