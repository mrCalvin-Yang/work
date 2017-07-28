//
//  QuestionHeadView.h
//  Perinatal
//
//  Created by OY on 2017/7/26.
//  Copyright © 2017年 OY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QuestionHeadView : UIView

@property(nonatomic,copy)NSString *cost;

@property(nonatomic,copy)NSString *resource;

@property(nonatomic,readonly,assign)CGFloat viewHeight;

-(instancetype)initWithFrame:(CGRect)frame Images:(NSArray *)images content:(NSString *)content;

+(CGFloat)contentHeight:(NSString *)problemstr;

@end
