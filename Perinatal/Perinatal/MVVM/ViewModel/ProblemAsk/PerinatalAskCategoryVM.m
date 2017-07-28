//
//  PerinatalAskCategoryVM.m
//  Perinatal
//
//  Created by OY on 2017/7/18.
//  Copyright © 2017年 OY. All rights reserved.
//

#import "PerinatalAskCategoryVM.h"

@implementation PerinatalAskCategoryVM

+(void)getAskCategorySucess:(void (^)(NSDictionary *))success fail:(void (^)(NSString *))fail{
    NSString *url = [PerinatalAppApi GetFormatURLString:URLTypeProblemCategorys];
    if (url) {
        [HttpRequest sendGetUrl:url param:nil success:^(id respone) {
            success(respone);
        } fail:^(NSString *respone) {
            fail(respone);
        }];
    }
}

@end
