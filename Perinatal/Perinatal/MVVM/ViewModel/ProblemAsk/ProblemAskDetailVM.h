//
//  ProblemAskDetailVM.h
//  Perinatal
//
//  Created by OY on 2017/7/18.
//  Copyright © 2017年 OY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProblemAskDetailVM : NSObject

//孕期问答详情
+(void)getProblemAskDetailWithProblemId:(NSString *)ProblemId sucess:(void(^)(NSDictionary *respone))success fail:(void(^)(NSString *error)) fail;

//孕期问答详情
+(void)getProblemAskDetailWithProblemId:(NSString *)ProblemId problemStatus:(NSString *)status sucess:(void(^)(NSDictionary *respone))success fail:(void(^)(NSString *error)) fail;

@end
