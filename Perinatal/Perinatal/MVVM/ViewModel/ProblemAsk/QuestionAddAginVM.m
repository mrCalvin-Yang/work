//
//  QuestionAddAginVM.m
//  Perinatal
//
//  Created by OY on 2017/7/19.
//  Copyright © 2017年 OY. All rights reserved.
//

#import "QuestionAddAginVM.h"

@implementation QuestionAddAginVM

+(void)questionAddAginWithQuestionId:(NSString *)questionid content:(NSString *)content sucess:(void (^)(NSDictionary *))success fail:(void (^)(NSString *))fail{
    NSString *url = [NSString stringWithFormat:[PerinatalAppApi GetFormatURLString:URLTypeProblemAdd],questionid,content];
    [HttpRequest sendPostUrl:url param:nil success:^(id respone) {
        success(respone);
    } fail:^(NSString *respone) {
        fail(respone);
    }];
}

@end
