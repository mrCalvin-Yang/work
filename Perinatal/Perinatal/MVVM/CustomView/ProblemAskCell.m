//
//  ProblemAskCell.m
//  Perinatal
//
//  Created by OY on 2017/7/7.
//  Copyright © 2017年 OY. All rights reserved.
//

#import "ProblemAskCell.h"

@implementation ProblemAskCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.payLabel.layer.masksToBounds = YES;
    self.payLabel.layer.cornerRadius = 5.0f;
    self.userImageView.layer.masksToBounds = YES;
    self.userImageView.layer.cornerRadius = 25.f;
    self.sourceLabel.layer.masksToBounds = YES;
    self.sourceLabel.layer.cornerRadius = 5.f;
    self.sourceLabel.layer.borderWidth = 0.5f;
    self.sourceLabel.layer.borderColor = gray_color.CGColor;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
