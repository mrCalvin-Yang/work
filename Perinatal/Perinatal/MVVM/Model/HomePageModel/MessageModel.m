//
//  MessageModel.m
//  Perinatal
//
//  Created by OY on 2017/7/7.
//  Copyright © 2017年 OY. All rights reserved.
//

#import "MessageModel.h"

@implementation MessageModel

-(instancetype)initWithDic:(NSDictionary *)dic withIndex:(NSInteger)index{
    if (self = [super init]) {
        self.babyHeight = [[dic valueForKeyPath:@"babyHeight"] integerValue];
        self.babyImageUrl = [dic valueForKeyPath:@"babyImageUrl"];
        self.babyNote = [dic valueForKeyPath:@"babyNote"];
        self.babyWeight = [[dic valueForKeyPath:@"babyWeight"] integerValue];
        self.dateOfPregnancy = [dic valueForKeyPath:@"dateOfPregnancy"];
        self.pregnantWomanNote = [dic valueForKeyPath:@"pregnantWomanNote"];
        self.prenatalEducation = [dic valueForKeyPath:@"prenatalEducation"];
        self.sectionNumber = index;
    }
    return self;
}

@end
