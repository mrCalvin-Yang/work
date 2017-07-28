//
//  QuestionsCommentVM.m
//  Perinatal
//
//  Created by OY on 2017/7/19.
//  Copyright © 2017年 OY. All rights reserved.
//

#import "QuestionsCommentVM.h"

@implementation QuestionsCommentVM

+(void)addQuestionCommentsWithContent:(NSString *)content questionId:(NSString *)questionId star:(NSInteger)star terminalUserId:(NSString *)userId sucess:(void (^)(NSDictionary *))success fail:(void (^)(NSString *))fail{
    NSString *url = [PerinatalAppApi GetFormatURLString:URLTypeProblemComment];
    NSDictionary *questionComments = @{
                                       @"content": content,
                                       @"questionId": questionId,
                                       @"star": [NSString stringWithFormat:@"%ld",star],
                                       @"terminalUserId": userId
                                       };
    [HttpRequest sendPostUrl:url param:questionComments success:^(id respone) {
        success(respone);
    } fail:^(NSString *respone) {
        fail(respone);
    }];
}

+(void)addQuestionLikeWithQuestionId:(NSString *)questionId sucess:(void (^)(NSDictionary *))success fail:(void (^)(NSString *))fail{
    NSString *url = [NSString stringWithFormat:[PerinatalAppApi GetFormatURLString:URLTypeProblemLike],questionId];
    if (url) {
        [HttpRequest sendPostUrl:url param:nil success:^(id respone) {
            success(respone);
        } fail:^(NSString *respone) {
            fail(respone);
        }];
    }
}

+(void)changeQuestionOverTimeWithQuestionId:(NSString *)questionId status:(NSString *)status sucess:(void (^)(NSDictionary *))success fail:(void (^)(NSString *))fail{
    NSString *url = [NSString stringWithFormat:[PerinatalAppApi GetFormatURLString:URLTypeProblemOverTime],questionId,status];
    if (url) {
        [HttpRequest sendPutUrl:url param:nil success:^(id respone) {
            success(respone);
        } fail:^(NSString *respone) {
            fail(respone);
        }];
    }
}

@end
