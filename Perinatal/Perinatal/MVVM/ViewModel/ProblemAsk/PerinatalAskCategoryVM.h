//
//  PerinatalAskCategoryVM.h
//  Perinatal
//
//  Created by OY on 2017/7/18.
//  Copyright © 2017年 OY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PerinatalAskCategoryVM : NSObject

+(void)getAskCategorySucess:(void(^)(NSDictionary *respone))success fail:(void(^)(NSString *error)) fail;

@end
