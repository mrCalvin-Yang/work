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
    self.ProblemLabel.font = H14;
    self.ProblemLabel.textColor = kNormalFontColor;
    self.payLabel.layer.masksToBounds = YES;
    self.payLabel.layer.cornerRadius = 5.0f;
    self.userImageView.layer.masksToBounds = YES;
    self.userImageView.layer.cornerRadius = 20.f;
    self.askMsgLabel.textColor = kFontColor;
    self.sourceLabel.layer.masksToBounds = YES;
    self.sourceLabel.layer.cornerRadius = 8.f;
    self.sourceLabel.layer.borderWidth = 0.5f;
    self.sourceLabel.layer.borderColor = gray_color.CGColor;
    self.CombinedImageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.userImageView.right + 15, self.userImageView.y, 187, 40)];
    UIImage *image = V_IMAGE(@"Combined Shape Red");
    image = [image resizableImageWithCapInsets:UIEdgeInsetsMake(10, 15, 10, 15) resizingMode:UIImageResizingModeStretch];
    self.CombinedImageView.image = image;
    [self.contentView addSubview:self.CombinedImageView];
    
    self.payLabel = [[UILabel alloc] init];
    self.payLabel.text = @"支付一元围观";
    self.payLabel.frame = self.CombinedImageView.frame;
    self.payLabel.font = H14;
    self.payLabel.textColor = white_color;
    self.payLabel.textAlignment = NSTextAlignmentRight;
    [self.contentView addSubview:self.payLabel];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
