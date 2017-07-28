//
//  PerinatalMyConsultView.m
//  Perinatal
//
//  Created by OY on 2017/7/24.
//  Copyright © 2017年 OY. All rights reserved.
//

#import "PerinatalMyConsultView.h"

@interface PerinatalMyConsultView ()
@property(nonatomic,strong)UIImageView *LogoView;
@property(nonatomic,strong)UILabel *titleLabel;
@property(nonatomic,strong)UILabel *howConsultLabel;
@property(nonatomic,strong)UILabel *detalLabel;
@property(nonatomic,strong)UIButton *consultBt;
@end

@implementation PerinatalMyConsultView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.LogoView];
        [self addSubview:self.titleLabel];
        [self addSubview:self.howConsultLabel];
        [self addSubview:self.detalLabel];
        [self addSubview:self.consultBt];
        [self addConstraints];
    }
    return self;
}

-(UIImageView *)LogoView{
    if (!_LogoView) {
        _LogoView = [[UIImageView alloc] init];
        _LogoView.backgroundColor = kBackColor;
    }
    return _LogoView;
}

-(UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.font = HB20;
        _titleLabel.text = @"您还没有咨询记录";
    }
    return _titleLabel;
}

-(UILabel *)howConsultLabel{
    if (!_howConsultLabel) {
        _howConsultLabel = [[UILabel alloc] init];
        _howConsultLabel.textColor = kImportFontColor;
        _howConsultLabel.textAlignment = NSTextAlignmentLeft;
        _howConsultLabel.font = HB14;
        _howConsultLabel.text = @"如何咨询医生：";
    }
    return _howConsultLabel;
}

-(UILabel *)detalLabel{
    if (!_detalLabel) {
        _detalLabel = [[UILabel alloc] init];
        _detalLabel.textAlignment = NSTextAlignmentLeft;
        _detalLabel.textColor = RGBCOLOR(102, 102, 102);
        _detalLabel.font = H14;
        _detalLabel.numberOfLines = 3;
        _detalLabel.adjustsFontSizeToFitWidth = YES;
        _detalLabel.text = @"① 进入医疗服务界面，点击咨询医生\n② 选择咨询科室类别并详细描述您的疑问\n③ 选择感兴趣的医师解答您的问题";
        [_detalLabel sizeToFit];
    }
    return _detalLabel;
}

-(UIButton *)consultBt{
    if (!_consultBt) {
        _consultBt = [UIButton buttonWithType:UIButtonTypeCustom];
        [_consultBt setBackgroundImage:[UIImage imageWithColor:RGBCOLOR(255, 69, 106)] forState:UIControlStateNormal];
        [_consultBt setBackgroundImage:[UIImage imageWithColor:RGBCOLOR(255, 103, 103)] forState:UIControlStateSelected];
        [_consultBt setTitle:@"快速咨询" forState:UIControlStateNormal];
        [_consultBt setTitleColor:white_color forState:UIControlStateNormal];
        [[_consultBt rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
            if (self.btnSelete) {
                [self.btnSelete sendNext:x];
            }
        }];
        _consultBt.layer.masksToBounds = YES;
        _consultBt.layer.cornerRadius = 4.f;
    }
    return _consultBt;
}

-(void)addConstraints{
    [_LogoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(40.f);
        make.size.mas_equalTo(CGSizeMake(132, 132));
        make.centerX.equalTo(self);
    }];
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_LogoView.mas_bottom).with.offset(24);
        make.left.offset(20.f);
        make.right.offset(-20.f);
        make.height.offset(28.f);
    }];
    
    [_howConsultLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_titleLabel.mas_bottom).with.offset(20);
        make.left.offset(40.f);
        make.right.offset(-40.f);
        make.height.offset(20.f);
    }];
    CGSize size = _detalLabel.size;
    [_detalLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_howConsultLabel.mas_bottom).with.offset(6);
        make.left.offset(40.f);
        make.right.offset(-40.f);
        make.height.offset(size.height);
    }];
    
    [_consultBt mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_detalLabel.mas_bottom).with.offset(30);
        make.left.offset(40.f);
        make.right.offset(-40.f);
        make.height.offset(40.f);
    }];
}

@end
