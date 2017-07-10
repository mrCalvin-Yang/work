//
//  CanEatModel.h
//  Perinatal
//
//  Created by OY on 2017/7/7.
//  Copyright © 2017年 OY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CanEatModel : NSObject

@property (nonatomic, copy)NSString *imageUrl;

@property (nonatomic, copy)NSString *title;

-(instancetype)initWithImg:(NSString *)img title:(NSString *)title;

@end
