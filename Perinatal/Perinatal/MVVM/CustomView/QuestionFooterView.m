//
//  QuestionFooterView.m
//  Perinatal
//
//  Created by OY on 2017/7/26.
//  Copyright © 2017年 OY. All rights reserved.
//

#import "QuestionFooterView.h"

@implementation QuestionFooterView

-(instancetype)initWithFrame:(CGRect)frame timeStr:(NSString *)timeStr{
    if (self = [super initWithFrame:frame]) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(15, 15, 150, 17)];
        label.textColor = RGBCOLOR(153, 153, 153);
        label.font = H12;
        label.text = timeStr;
        [self addSubview:label];
    }
    return self;
}

@end
