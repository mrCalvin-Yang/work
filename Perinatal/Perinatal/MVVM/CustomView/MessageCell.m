//
//  HomeSectionCell.m
//  Perinatal
//
//  Created by OY on 2017/7/6.
//  Copyright © 2017年 OY. All rights reserved.
//

#import "MessageCell.h"

@implementation MessageCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.statuLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, SCREENWIDTH - 20, 0)];
        
        self.statuLabel.font = H12;
        self.statuLabel.textAlignment = NSTextAlignmentLeft;
        self.statuLabel.numberOfLines = 0;
        [self addSubview:self.statuLabel];
        
    }
    return self;
}

-(void)setModel:(MessageModel *)model{
    if (model) {
        _model = model;
        if (model.sectionNumber == 1) {
            NSString *str = string(@"孕妈每日必看:", model.pregnantWomanNote);
            NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc] initWithString:str];
            [attributedStr addAttribute:NSFontAttributeName value:HB14 range:NSMakeRange(0, 7)];
            self.statuLabel.attributedText = attributedStr;
            
        }else if (model.sectionNumber == 2){
            NSString *str = string(@"孕妈每日必看:", model.pregnantWomanNote);
            NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc] initWithString:str];
            [attributedStr addAttribute:NSFontAttributeName value:HB14 range:NSMakeRange(0, 7)];
            self.statuLabel.attributedText = attributedStr;
        }else{
            NSString *str = string(@"孕妈每日必看:", model.pregnantWomanNote);
            NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc] initWithString:str];
            [attributedStr addAttribute:NSFontAttributeName value:HB14 range:NSMakeRange(0, 7)];
            self.statuLabel.attributedText = attributedStr;
        }
        [self.statuLabel sizeToFit];
        [self layoutIfNeeded];
        self.model.cellHeight = self.statuLabel.bottom + 10;
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
