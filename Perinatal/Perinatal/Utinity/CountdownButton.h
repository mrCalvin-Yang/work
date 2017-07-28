//
//  CountdownButton.h
//  Perinatal
//
//  Created by OY on 2017/7/18.
//  Copyright © 2017年 OY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CountdownButton : UIButton

// 由于有些时间需求不同，特意露出方法，倒计时时间次数
- (void)timeFailBeginFrom:(NSInteger)timeCount;

@end
