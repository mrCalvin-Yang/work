//
//  UserAskCell.m
//  Perinatal
//
//  Created by OY on 2017/7/26.
//  Copyright © 2017年 OY. All rights reserved.
//

#import "UserAskCell.h"

@interface UserAskCell()
{
    CGSize labelSize;
}
@property(nonatomic,strong)UIImageView *bgView;
@end

@implementation UserAskCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self addSubview:self.doctorHeadView];
        [self addSubview:self.bgView];
        [self.bgView addSubview:self.doctorAskLabel];
        [self setUp];
    }
    return self;
}

-(void)setUp{
    [self.doctorHeadView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(0);
        make.right.offset(-15);
        make.size.mas_equalTo(CGSizeMake(40, 40));
    }];
    
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(0);
        make.right.equalTo(self.doctorHeadView.mas_left).with.offset(-15);
        make.size.mas_equalTo(CGSizeMake(SCREENWIDTH - 85, 40));
    }];
    [self.doctorAskLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(10);
        make.left.offset(19);
        make.bottom.offset(-10);
        make.right.offset(-15);
    }];
}

-(void)setAskText:(NSString *)askText{
    _askText = askText;
    CGRect rect = [askText boundingRectWithSize:CGSizeMake(SCREENWIDTH * 0.68, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:H14} context:nil];
    labelSize = rect.size;
    self.bgView.size = labelSize;
    self.doctorAskLabel.text = askText;
}

-(UIImageView *)doctorHeadView{
    if (!_doctorHeadView) {
        _doctorHeadView = [[UIImageView alloc] init];
        _doctorHeadView.backgroundColor = kBackColor;
        _doctorHeadView.layer.masksToBounds = YES;
        _doctorHeadView.layer.cornerRadius = 20.;
    }
    return _doctorHeadView;
}

-(UILabel *)doctorAskLabel{
    if (!_doctorAskLabel) {
        _doctorAskLabel = [[UILabel alloc] init];
        _doctorAskLabel.textColor = black_color;
        _doctorAskLabel.text = self.askText;
        _doctorAskLabel.numberOfLines = 0;
        _doctorAskLabel.font = H14;
        [_doctorAskLabel sizeToFit];
    }
    return _doctorAskLabel;
}

-(UIImageView *)bgView{
    if (!_bgView) {
        _bgView = [[UIImageView alloc] init];
        UIImage *image = V_IMAGE(@"Combined Shape Orange");
        image = [image resizableImageWithCapInsets:UIEdgeInsetsMake(10, 15, 10, 15) resizingMode:UIImageResizingModeStretch];
        _bgView.image = image;
    }
    return _bgView;
    
}

+(CGFloat)cellHeight:(NSString *)text{
    //    CGFloat = [
    CGFloat height = [self addressHeight:text].size.height + 20;
    if (height < 70) {
        height = 70;
    }
    return height;
}

+(CGRect)addressHeight:(NSString *)address{
    CGRect rect = [address boundingRectWithSize:CGSizeMake(SCREENWIDTH - 30, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:H14} context:nil];
    return rect;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
