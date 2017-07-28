//
//  MyconsultaitonControlCell.m
//  Perinatal
//
//  Created by OY on 2017/7/24.
//  Copyright © 2017年 OY. All rights reserved.
//

#import "MyconsultaitonControlCell.h"

@implementation MyconsultaitonControlCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.leftBtn.layer.masksToBounds = YES;
    self.leftBtn.layer.cornerRadius = 4.f;
    self.leftBtn.layer.borderWidth = 1.f;
    self.leftBtn.layer.borderColor = global_color.CGColor;
    
    self.rightBtn.layer.masksToBounds = YES;
    self.rightBtn.layer.cornerRadius = 4.f;
    self.rightBtn.layer.borderWidth = 1.f;
    self.rightBtn.layer.borderColor = global_color.CGColor;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
