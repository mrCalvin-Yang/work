//
//  MyconsultationDetailCell.m
//  Perinatal
//
//  Created by OY on 2017/7/25.
//  Copyright © 2017年 OY. All rights reserved.
//

#import "MyconsultationDetailCell.h"
#import "QuestionModel.h"

@implementation MyconsultationDetailCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.sourceLabel.layer.masksToBounds = YES;
    self.sourceLabel.layer.cornerRadius = 9.f;
    self.sourceLabel.layer.borderWidth = 1.f;
    self.sourceLabel.layer.borderColor = kLineColor.CGColor;
    self.logoImageView.layer.masksToBounds = YES;
    self.logoImageView.layer.cornerRadius = 20.f;
    [self.ImageView1 removeFromSuperview];
    self.ImageView1 = [[UIImageView alloc] initWithFrame:CGRectMake(15, self.problemDtailLabel.bottom + 15, (SCREENWIDTH-75)/4, (SCREENWIDTH-75)/4)];
    self.ImageView1.backgroundColor = kBackColor;
    [self.contentView addSubview:self.ImageView1];
    [self.imageView2 removeFromSuperview];
    self.imageView2 = [[UIImageView alloc] initWithFrame:CGRectMake(self.ImageView1.right + 15, self.problemDtailLabel.bottom + 15, (SCREENWIDTH-75)/4, (SCREENWIDTH-75)/4)];
    self.imageView2.backgroundColor = kBackColor;
    [self.contentView addSubview:self.imageView2];
    [self.imageView3 removeFromSuperview];
    self.imageView3 = [[UIImageView alloc] initWithFrame:CGRectMake(self.imageView2.right + 15, self.problemDtailLabel.bottom + 15, (SCREENWIDTH-75)/4, (SCREENWIDTH-75)/4)];
    self.imageView3.backgroundColor = kBackColor;
    [self.contentView addSubview:self.imageView3];
    [self.imageView4 removeFromSuperview];
    self.imageView4 = [[UIImageView alloc] initWithFrame:CGRectMake(self.imageView3.right + 15, self.problemDtailLabel.bottom + 15, (SCREENWIDTH-75)/4, (SCREENWIDTH-75)/4)];
    self.imageView4.backgroundColor = kBackColor;
    [self.contentView addSubview:self.imageView4];
    
    UIImage *image = V_IMAGE(@"Combined Shape Red");
    image = [image resizableImageWithCapInsets:UIEdgeInsetsMake(10, 15, 10, 15) resizingMode:UIImageResizingModeStretch];
    self.bgImageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.logoImageView.right + 14, self.logoImageView.y, 187, 40)];
    self.bgImageView.image = image;
    [self.contentView addSubview:self.bgImageView];
    [self.orderStatusLabel removeFromSuperview];
    UILabel *label = [[UILabel alloc] init];
    label.text = @"订单未支付";
    label.frame = CGRectMake(20, 10, 153, 20);
    label.font = H14;
    label.textColor = white_color;
    label.textAlignment = NSTextAlignmentRight;
    [self.bgImageView addSubview:label];
    self.orderStatusLabel = label;
    
}

-(void)setModel:(QuestionModel *)model{
    if (model) {
        _model = model;
        self.costLabel.text = string(@"¥", model.cost);
        self.sourceLabel.text = model.questionCategoryName;
        self.problemDtailLabel.text = model.content;
        
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
