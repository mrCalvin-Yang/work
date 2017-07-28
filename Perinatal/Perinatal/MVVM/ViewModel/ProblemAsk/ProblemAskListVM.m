//
//  ProblemAskListVM.m
//  Perinatal
//
//  Created by OY on 2017/7/18.
//  Copyright © 2017年 OY. All rights reserved.
//

#import "ProblemAskListVM.h"
#import "QuestionModel.h"

@implementation ProblemAskListVM

+(void)getProblemAskListWithPage:(NSInteger)page pageSize:(NSInteger)size sucess:(void (^)(NSArray *))success fail:(void (^)(NSString *))fail{
    NSString *url = [NSString stringWithFormat:[PerinatalAppApi GetFormatURLString:URLTypeProblems],page,size];
    [HttpRequest sendGetUrl:url param:nil success:^(id respone) {
        NSMutableArray *arr1 = [NSMutableArray array];
        if ([[respone valueForKeyPath:@"code"] integerValue] == 0) {
            NSLog(@"%@",respone);
            NSDictionary *dic = [respone valueForKeyPath:@"data"];
            NSArray *arr = [dic valueForKeyPath:@"list"];
            for (NSDictionary *dic in arr) {
                QuestionModel *model = [[QuestionModel alloc] initWithDictionary:dic error:nil];
                [arr1 addObject:model];
            }
            if (arr1.count > 0) {
                success(arr1);
            }else{
                fail(@"暂无数据");
            }
        }
    } fail:^(NSString *respone) {
        fail(respone);
    }];
}

@end
