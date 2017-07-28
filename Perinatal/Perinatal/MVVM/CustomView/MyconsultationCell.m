//
//  MyconsultationCell.m
//  Perinatal
//
//  Created by OY on 2017/7/24.
//  Copyright © 2017年 OY. All rights reserved.
//

#import "MyconsultationCell.h"

@implementation MyconsultationCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.logoImageView.layer.masksToBounds = YES;
    self.logoImageView.layer.cornerRadius = 20.f;
    UIImage *image = V_IMAGE(@"Combined Shape Red");
    image = [image resizableImageWithCapInsets:UIEdgeInsetsMake(10, 15, 10, 15) resizingMode:UIImageResizingModeStretch];
    self.bgImageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.logoImageView.right + 14, self.problemLabel.bottom +15, 187, 40)];
    self.bgImageView.image = image;
    [self.contentView addSubview:self.bgImageView];
    
    UILabel *label = [[UILabel alloc] init];
    label.text = @"订单未支付";
    label.frame = CGRectMake(20, 10, 153, 20);
    label.font = H14;
    label.textColor = white_color;
    label.textAlignment = NSTextAlignmentRight;
    [self.bgImageView addSubview:label];
    self.orderStatusLabel = label;
}

-(void)setBgImage:(UIImage *)bgImage{
    _bgImage = bgImage;
    if (!bgImage) {
        bgImage = V_IMAGE(@"Combined Shape Red");
    }
    bgImage = [bgImage resizableImageWithCapInsets:UIEdgeInsetsMake(10, 15, 10, 15) resizingMode:UIImageResizingModeStretch];
    self.bgImageView.image = bgImage;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
