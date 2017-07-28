//
//  ProblemAskListVM.h
//  Perinatal
//
//  Created by OY on 2017/7/18.
//  Copyright © 2017年 OY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProblemAskListVM : NSObject
//孕期问答列表
+(void)getProblemAskListWithPage:(NSInteger)page pageSize:(NSInteger)size sucess:(void(^)(NSArray *respone))success fail:(void(^)(NSString *error)) fail;

@end
