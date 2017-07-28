//
//  SystemCell.m
//  Perinatal
//
//  Created by OY on 2017/7/27.
//  Copyright © 2017年 OY. All rights reserved.
//

#import "SystemCell.h"

const CGFloat totalSecond = 86400;

@interface SystemCell ()
{
    CGSize labelSize;
    NSInteger Second;
}
@property(nonatomic,strong)UIImageView *bgView;
@property(nonatomic,strong)NSTimer *timer;
@end
@implementation SystemCell

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
        make.left.offset(15);
        make.top.offset(15);
        make.size.mas_equalTo(CGSizeMake(40, 40));
    }];
    
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(15);
        make.left.equalTo(self.doctorHeadView.mas_right).with.offset(15);
        make.size.mas_equalTo(CGSizeMake(187, 40));
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
    self.doctorAskLabel.text = askText;
}

-(void)setSecond:(NSInteger)second{
    if (second > 0 && second < totalSecond) {
        _second = second;
        Second = totalSecond-second;
        
        NSString *str_hour = [NSString stringWithFormat:@"%02ld小时",Second/3600];
        
        NSString *str_minute = [NSString stringWithFormat:@"%02ld分",(Second%3600)/60];
        
        NSString *format_time = [NSString stringWithFormat:@"剩%@%@退款",str_hour,str_minute];
        if (Second/3600 == 0) {
            format_time = [NSString stringWithFormat:@"剩%@退款",str_minute];
        }
        self.doctorAskLabel.text = format_time;
        [self.timer fire];
    }
}

-(NSTimer *)timer{
    if (!_timer) {
        _timer = [NSTimer scheduledTimerWithTimeInterval:1.f target:self selector:@selector(timeHand) userInfo:nil repeats:YES];
    }
    return _timer;
}

-(void)timeHand{
    Second --;
    
    NSString *str_hour = [NSString stringWithFormat:@"%02ld小时",Second/3600];
    NSString *str_minute = [NSString stringWithFormat:@"%02ld分",(Second%3600)/60];
    NSString *format_time = [NSString stringWithFormat:@"剩%@%@退款",str_hour,str_minute];
    if (Second/3600 == 0) {
        format_time = [NSString stringWithFormat:@"剩%@退款",str_minute];
    }
    self.doctorAskLabel.text = format_time;
    if (Second <= 0) {
        [self.timer invalidate];
    }
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
        _doctorAskLabel.textColor = white_color;
        _doctorAskLabel.text = self.askText;
        _doctorAskLabel.numberOfLines = 0;
        _doctorAskLabel.textAlignment = NSTextAlignmentRight;
        _doctorAskLabel.font = H14;
        [_doctorAskLabel sizeToFit];
    }
    return _doctorAskLabel;
}

-(UIImageView *)bgView{
    if (!_bgView) {
        _bgView = [[UIImageView alloc] init];
        UIImage *image = V_IMAGE(@"Combined Shape Red");
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

@end
