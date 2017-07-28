//
//  CountdownButton.m
//  Perinatal
//
//  Created by OY on 2017/7/18.
//  Copyright © 2017年 OY. All rights reserved.
//

#import "CountdownButton.h"

@interface CountdownButton ()

@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, assign) NSInteger count;

@end

@implementation CountdownButton



- (instancetype)init
{
    self = [super init];
    if (self) {
        
        [self setup];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setup];
    }
    return self;
}

- (void)setup {
    
    [self setTitle:@" 获取验证码 " forState:UIControlStateNormal];
    self.titleLabel.font = [UIFont systemFontOfSize:11];
    self.backgroundColor = global_color;
    self.layer.cornerRadius = 3.0;
    self.titleLabel.adjustsFontSizeToFitWidth = YES;
    [self setTitleColor:white_color forState:UIControlStateNormal];
    
}

- (void)timeFailBeginFrom:(NSInteger)timeCount {
    
    self.count = timeCount;
    self.enabled = NO;
    // 加1个计时器
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerFired) userInfo:nil repeats:YES];
}

- (void)timerFired {
    if (self.count != 1) {
        self.count -= 1;
        self.enabled = NO;
        self.backgroundColor = RGBCOLOR(203, 203, 203);
        [self setTitle:[NSString stringWithFormat:@"%ld秒后重发", self.count] forState:UIControlStateNormal];
        //      [self setTitle:[NSString stringWithFormat:@"剩余%ld秒", self.count] forState:UIControlStateDisabled];
    } else {
        
        self.enabled = YES;
        [self setTitle:@"获取验证码" forState:UIControlStateNormal];
        self.backgroundColor = global_color;
        //        self.count = 60;
        [self.timer invalidate];
    }
}


@end
