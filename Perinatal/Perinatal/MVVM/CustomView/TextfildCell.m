//
//  TextfildCell.m
//  Perinatal
//
//  Created by OY on 2017/7/14.
//  Copyright © 2017年 OY. All rights reserved.
//

#import "TextfildCell.h"

@implementation TextfildCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [[self.messageTextfiled rac_textSignal] subscribeNext:^(NSString *x) {
        self.messageTextfiled.text = x;
    }];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
