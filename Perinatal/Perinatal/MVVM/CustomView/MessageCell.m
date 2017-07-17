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
        self.messageLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 15, SCREENWIDTH, 20)];
        self.messageLabel.font = HB14;
        [self.contentView addSubview:self.messageLabel];
        
        self.statuLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, self.messageLabel.bottom, SCREENWIDTH - 30, 100)];
        self.statuLabel.font = H12;
        self.statuLabel.textAlignment = NSTextAlignmentLeft;
        self.statuLabel.numberOfLines = 0;
        [self.contentView addSubview:self.statuLabel];
        
    }
    return self;
}

-(void)setModel:(MessageModel *)model{
    if (model) {
        _model = model;
        if (model.sectionNumber == 1) {
            self.messageLabel.text = @"今日胎宝宝发育变化";
            self.statuLabel.text = model.pregnantWomanNote;
            CGRect rect = self.statuLabel.frame;
            rect.size.height = [[self class] addressHeight:model.pregnantWomanNote];
            self.statuLabel.frame = rect;
            
        }else if (model.sectionNumber == 2){
            self.messageLabel.text = @"今日孕妈需要注意";
            self.statuLabel.text = model.pregnantWomanNote;
            CGRect rect = self.statuLabel.frame;
            rect.size.height = [[self class] addressHeight:model.pregnantWomanNote];
            self.statuLabel.frame = rect;
        }else{
            self.messageLabel.text = @"每日胎教";
            self.statuLabel.text = model.pregnantWomanNote;
            CGRect rect = self.statuLabel.frame;
            rect.size.height = [[self class] addressHeight:model.pregnantWomanNote];
            self.statuLabel.frame = rect;
        }
    }
}

+(CGFloat)cellHeight:(MessageModel *)model{
    CGFloat height = [self addressHeight:model.pregnantWomanNote] + 50;
    return height;
}

+(CGFloat)addressHeight:(NSString *)address{
    CGRect rect = [address boundingRectWithSize:CGSizeMake(SCREENWIDTH - 30, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:H12} context:nil];
    return rect.size.height;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
