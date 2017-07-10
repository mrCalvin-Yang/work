//
//  CanEatModel.m
//  Perinatal
//
//  Created by OY on 2017/7/7.
//  Copyright © 2017年 OY. All rights reserved.
//

#import "CanEatModel.h"

@implementation CanEatModel

-(instancetype)initWithImg:(NSString *)img title:(NSString *)title{
    if (self = [super init]) {
        _imageUrl = img;
        _title = title;
    }
    return self;
}

@end
