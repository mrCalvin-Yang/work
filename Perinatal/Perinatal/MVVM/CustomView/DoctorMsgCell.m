//
//  DoctorMsgCell.m
//  Perinatal
//
//  Created by OY on 2017/7/12.
//  Copyright © 2017年 OY. All rights reserved.
//

#import "DoctorMsgCell.h"

@implementation DoctorMsgCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self addImageview];
        [self addNameLabel];
        [self addTitleLabel];
        [self addHospitalLabel];
        [self addWorkLabel];
        [self addSkillLabel];
        [self addConstraints];
        
    }
    return self;
}

-(void)addImageview{
    self.topImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 60, 60)];
    self.topImageView.backgroundColor = kBackColor;
    self.topImageView.layer.masksToBounds = YES;
    self.topImageView.layer.cornerRadius = 30.f;
    [self.contentView addSubview:self.topImageView];
}

-(void)addNameLabel{
    self.nameLabel = [[UILabel alloc] init];
    self.nameLabel.font = HB14;
    self.nameLabel.textColor = kImportFontColor;
    self.nameLabel.text = @"张小蕾";
    [self.nameLabel sizeToFit];
    [self.contentView addSubview:self.nameLabel];
}

-(void)addTitleLabel{
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.font = H14;
    self.titleLabel.textColor = kImportFontColor;
    self.titleLabel.text = @"副主任医师";
    [self.contentView addSubview:self.titleLabel];
}

-(void)addHospitalLabel{
    self.hospitalLabel = [[UILabel alloc] init];
    self.hospitalLabel.font = H12;
    self.hospitalLabel.textColor = RGBCOLOR(153, 153, 153);
    self.hospitalLabel.text = @"中山大学附属第一医院";
    [self.hospitalLabel sizeToFit];
    [self.contentView addSubview:self.hospitalLabel];
}

-(void)addWorkLabel{
    self.workLabel = [[UILabel alloc] init];
    self.workLabel.font = H12;
    self.workLabel.textColor = RGBCOLOR(153, 153, 153);
    self.workLabel.text = @"妇产科";
    [self.contentView addSubview:self.workLabel];
}

-(void)addSkillLabel{
    self.skillLabel = [[UILabel alloc] init];
    self.skillLabel.font = H12;
    self.skillLabel.textColor = RGBCOLOR(51, 51, 51);
    self.skillLabel.text = @"擅长：引导盆腔炎、早孕、宫颈、子宫脱垂、尿失禁";
    self.skillLabel.numberOfLines = 2;
    [self.contentView addSubview:self.skillLabel];
}

-(void)addConstraints{
    CGFloat padding15 = 15.f;
    CGFloat padding14 = 14.f;
    CGFloat padding10 = 10.f;
    CGFloat w = 70;
    CGFloat h = 20.f;
    [self.topImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.offset(padding15);
        make.size.mas_equalTo(CGSizeMake(60, 60));
    }];
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(padding15);
        make.left.equalTo(self.topImageView.mas_right).with.offset(padding15);
        make.size.mas_equalTo(CGSizeMake(w, h));
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.nameLabel);
        make.left.equalTo(self.nameLabel.mas_right).with.offset(padding14);
        make.height.equalTo(self.nameLabel);
        make.right.offset(-15);
    }];
    [self.hospitalLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(130, 17));
        make.left.equalTo(self.topImageView.mas_right).with.offset(padding15);
        make.top.equalTo(self.nameLabel.mas_bottom).with.offset(padding10);
    }];
    [self.workLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.hospitalLabel);
        make.height.equalTo(self.hospitalLabel);
        make.left.equalTo(self.hospitalLabel.mas_right).with.offset(padding14);
        make.right.offset(-15);
    }];
    [self.skillLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.hospitalLabel.mas_bottom).with.offset(8);
        make.left.equalTo(self.topImageView.mas_right).with.offset(padding15);
        make.bottom.offset(-padding15);
        make.right.offset(-padding15);
    }];
}

@end
