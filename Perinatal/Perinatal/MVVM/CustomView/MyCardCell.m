//
//  MyCardCell.m
//  Perinatal
//
//  Created by OY on 2017/7/23.
//  Copyright © 2017年 OY. All rights reserved.
//

#import "MyCardCell.h"

@implementation MyCardCell

- (void)awakeFromNib {
    [super awakeFromNib];
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bgImageView.bounds byRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii:CGSizeMake(14, 14)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bgImageView.bounds;
    maskLayer.path = maskPath.CGPath;
    self.bgImageView.layer.mask = maskLayer;
    self.logoImageView.layer.masksToBounds = YES;
    self.logoImageView.layer.cornerRadius = 12.f;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
