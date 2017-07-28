//
//  ProblemAskDetailVM.m
//  Perinatal
//
//  Created by OY on 2017/7/18.
//  Copyright © 2017年 OY. All rights reserved.
//

#import "ProblemAskDetailVM.h"

@implementation ProblemAskDetailVM

+(void)getProblemAskDetailWithProblemId:(NSString *)ProblemId sucess:(void (^)(NSDictionary *))success fail:(void (^)(NSString *))fail{
    NSString *url = [NSString stringWithFormat:[PerinatalAppApi GetFormatURLString:URLTypeProblemDetail],ProblemId];
    [HttpRequest sendGetUrl:url param:nil success:^(id respone) {
        success(respone);
    } fail:^(NSString *respone) {
        fail(respone);
    }];
}

+(void)getProblemAskDetailWithProblemId:(NSString *)ProblemId problemStatus:(NSString *)status sucess:(void (^)(NSDictionary *))success fail:(void (^)(NSString *))fail{
    NSString *url = [NSString stringWithFormat:[PerinatalAppApi GetFormatURLString:URLTypeProblemDetailStatus],ProblemId,status];
    [HttpRequest sendGetUrl:url param:nil success:^(id respone) {
        success(respone);
    } fail:^(NSString *respone) {
        fail(respone);
    }];
}

@end
