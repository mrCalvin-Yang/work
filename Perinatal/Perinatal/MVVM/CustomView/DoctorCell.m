//
//  DoctorCell.m
//  Perinatal
//
//  Created by OY on 2017/7/11.
//  Copyright © 2017年 OY. All rights reserved.
//

#import "DoctorCell.h"

@implementation DoctorCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.LogImageView.layer.masksToBounds = YES;
    self.LogImageView.backgroundColor = kBackColor;
    self.LogImageView.layer.cornerRadius = 30.f;
    self.askBtn.layer.masksToBounds = YES;
    self.askBtn.layer.cornerRadius = 2.f;
    self.askBtn.layer.borderWidth = 1.f;
    self.askBtn.layer.borderColor = global_color.CGColor;
    [[self.askBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        
    }];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
