//
//  QuestionsCommentVM.h
//  Perinatal
//
//  Created by OY on 2017/7/19.
//  Copyright © 2017年 OY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QuestionsCommentVM : NSObject

+(void)addQuestionCommentsWithContent:(NSString *)content questionId:(NSString *)questionId star:(NSInteger)star terminalUserId:(NSString *)userId sucess:(void(^)(NSDictionary *respone))success fail:(void(^)(NSString *error))fail;

+(void)addQuestionLikeWithQuestionId:(NSString *)questionId sucess:(void(^)(NSDictionary *respone))success fail:(void(^)(NSString *error))fail;

+(void)changeQuestionOverTimeWithQuestionId:(NSString *)questionId status:(NSString *)status sucess:(void(^)(NSDictionary *respone))success fail:(void(^)(NSString *error))fail;
@end
