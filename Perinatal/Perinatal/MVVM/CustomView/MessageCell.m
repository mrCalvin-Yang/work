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
        self.statuLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, SCREENWIDTH - 20, 20)];
        self.statuLabel.font = HB14;
        self.statuLabel.textAlignment = NSTextAlignmentLeft;
        [self addSubview:self.statuLabel];
        
        self.messageLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 35, SCREENWIDTH - 20, 50)];
        self.messageLabel.font = H13;
        self.messageLabel.numberOfLines = 0;
        [self addSubview:self.messageLabel];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
