//
//  ProblemAskCell.m
//  Perinatal
//
//  Created by OY on 2017/7/7.
//  Copyright © 2017年 OY. All rights reserved.
//

#import "ProblemAskCell.h"
#import <AFNetworking/UIKit+AFNetworking.h>

@implementation ProblemAskCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.ProblemLabel.font = H14;
    self.ProblemLabel.textColor = kNormalFontColor;
    self.userImageView.layer.masksToBounds = YES;
    self.userImageView.layer.cornerRadius = 20.f;
    self.askMsgLabel.textColor = kFontColor;
    self.sourceLabel.layer.masksToBounds = YES;
    self.sourceLabel.layer.cornerRadius = 9.f;
    self.sourceLabel.layer.borderWidth = 1.f;
    self.sourceLabel.layer.borderColor = gray_color.CGColor;
}

-(void)setModel:(QuestionModel *)model{
    _model = model;
    NSString *str = string(@"问：", model.content);
    NSMutableAttributedString *content = [[NSMutableAttributedString alloc] initWithString:str];
    [content addAttribute:NSForegroundColorAttributeName value:kFontColor range:NSMakeRange(0, 2)];
    self.ProblemLabel.attributedText = content;
    self.CombinedImageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.userImageView.right + 14, 75, 187, 40)];
    UIImage *image = V_IMAGE(@"Combined Shape Orange");
    if (model.onlookersCost) {
        image = V_IMAGE(@"Combined Shape Red");
    }
    image = [image resizableImageWithCapInsets:UIEdgeInsetsMake(10, 15, 10, 15) resizingMode:UIImageResizingModeStretch];
    self.CombinedImageView.image = image;
    [self.contentView addSubview:self.CombinedImageView];
    
    self.payLabel = [[UILabel alloc] init];
    self.payLabel.frame = CGRectMake(self.CombinedImageView.x + 15, 85, 152, 20);
    self.payLabel.font = H14;
    self.payLabel.textColor = white_color;
    self.payLabel.textAlignment = NSTextAlignmentRight;
    [self.contentView addSubview:self.payLabel];
    if (model.doctorHeadsUrl || model.doctorHeadsUrl != NULL) {
        [self.userImageView setImageWithURL:URL(model.doctorHeadsUrl) placeholderImage:[UIImage imageWithColor:gray_color]];
    }
    self.doctorLabel.text = string(model.doctorName, string(@"\t", model.jobTitle));
    self.askMsgLabel.text = [NSString stringWithFormat:@"%@个回答，%@人看过，%@点赞",model.answerNum,model.onlookersNumber,model.agreeNumber];
    self.sourceLabel.text = model.questionCategoryName;
    self.payLabel.text = [NSString stringWithFormat:@"支付%@元围观",model.onlookersCost];
    if (!model.onlookersCost || model.onlookersCost == NULL) {
        self.payLabel.text = @"免费偷偷围观";
    }
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
