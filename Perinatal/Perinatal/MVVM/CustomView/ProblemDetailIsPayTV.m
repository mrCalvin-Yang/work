//
//  ProblemDetailIsPayTV.m
//  Perinatal
//
//  Created by OY on 2017/7/26.
//  Copyright © 2017年 OY. All rights reserved.
//

#import "ProblemDetailIsPayTV.h"
#import <UIKit+AFNetworking.h>
#import "QuestionHeadView.h"
#import "QuestionFooterView.h"
#import "DoctorAskCell.h"
#import "UserAskCell.h"
#import "SystemCell.h"
#import "NSString+Formatter.h"

@implementation ProblemDetailIsPayTV

-(QuestionModel *)model{
    if (!_model) {
        _model = [[QuestionModel alloc] init];
        _model = self.dataList.firstObject;
    }
    return _model;
}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [NSArray isEmpty:self.model.answerList] ? 1 : self.model.answerList.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (![NSArray isEmpty:self.model.answerList]) {
        NSDictionary *dic = self.model.answerList[indexPath.row];
        NSString *key = [[dic allKeys] firstObject];
        NSDictionary *data = [dic objectForKey:key];
        CGFloat height = [UserAskCell cellHeight:data[@"content"]];
        return height;
    }
    return 70.f;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *userIdenter = @"UserAskCell";
    static NSString *identifer = @"ProblemAskCell";
    if (![NSArray isEmpty:self.model.answerList]) {
        NSDictionary *dic = self.model.answerList[indexPath.row];
        NSString *key = [[dic allKeys] firstObject];
        if ([key isEqualToString:@"doctor"]) {
            NSDictionary *data = [dic objectForKey:key];
            DoctorAskCell *cell = [tableView dequeueReusableCellWithIdentifier:identifer];
            if (!cell) {
                cell = [[DoctorAskCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifer];
            }
            cell.selectionStyle = UITableViewCellEditingStyleNone;
            cell.askText = data[@"content"];
            [cell.doctorHeadView setImageWithURL:URL(data[@"doctorImageUrl"])];
            return cell;
        }else{
            NSDictionary *data = [dic objectForKey:key];
            UserAskCell *cell = [tableView dequeueReusableCellWithIdentifier:userIdenter];
            if (!cell) {
                cell = [[UserAskCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:userIdenter];
            }
            cell.selectionStyle = UITableViewCellEditingStyleNone;
            cell.askText = data[@"content"];
            [cell.doctorHeadView setImageWithURL:URL(data[@"userImageUrl"])];
            return cell;
        }
        
    }
    return nil;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    QuestionHeadView *bg = [[QuestionHeadView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 112) Images:self.model.thumbImageList content:self.model.content];
    bg.cost = self.model.cost;
    bg.backgroundColor = white_color;
    bg.resource = self.model.questionCategoryName;
    bg.height = bg.viewHeight;
    return bg;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    CGFloat height = [self tableView:tableView heightForFooterInSection:section];
    UIView *bg = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, height)];
    bg.backgroundColor = RGBCOLOR(248, 248, 248);
    UIImageView *headView = [[UIImageView alloc] init];
    headView.backgroundColor = kBackColor;
    headView.layer.masksToBounds = YES;
    headView.layer.cornerRadius = 20.f;
    [bg addSubview:headView];
    if (self.model.doctorHeadsUrl) {
        [headView setImageWithURL:URL(self.model.doctorHeadsUrl)];
    }
    
    UILabel *nameLabel = [[UILabel alloc] init];
    nameLabel.text = [NSString stringWithFormat:@"%@\t%@",self.model.doctorName,self.model.jobTitle];
    [nameLabel sizeToFit];
    nameLabel.font = H14;
    [bg addSubview:nameLabel];
    
    UILabel *hospitalLabel = [[UILabel alloc] init];
    hospitalLabel.text = [NSString stringWithFormat:@"%@\t%@",self.model.hospitalName,self.model.departmentName];
    [hospitalLabel sizeToFit];
    hospitalLabel.font = H12;
    hospitalLabel.textColor = kFontColor;
    [bg addSubview:hospitalLabel];
    
    UIButton *answerLabel = [[UIButton alloc] init];
    [answerLabel setTitle:[NSString stringWithFormat:@"%@个回答",self.model.answerNum] forState:UIControlStateNormal];
    [answerLabel setImage:V_IMAGE(@"icon-arrow") forState:UIControlStateNormal];
    answerLabel.titleLabel.font = H12;
    answerLabel.titleLabel.adjustsFontSizeToFitWidth = YES;
    [answerLabel setImageEdgeInsets:UIEdgeInsetsMake(0, 59, 0, -59)];
    [answerLabel setTitleColor:kFontColor forState:UIControlStateNormal];
    answerLabel.frame = CGRectMake(bg.width - 87, 33, 62, 17);
    [bg addSubview:answerLabel];
    
    [headView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(21);
        make.left.offset(15);
        make.size.mas_equalTo(CGSizeMake(40, 40));
    }];
    
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(20);
        make.left.equalTo(headView.mas_right).with.offset(15);
        make.size.mas_equalTo(CGSizeMake(nameLabel.size.width, 20));
    }];
    
    [hospitalLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(headView.mas_right).with.offset(15);
        make.bottom.offset(-20);
        make.size.mas_equalTo(CGSizeMake(hospitalLabel.size.width, 20));
    }];
    
    
    return bg;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (self.model.thumbImageList.count > 0) {
        return 82.f + (SCREENWIDTH -15)/4 + [QuestionHeadView contentHeight:self.model.content];
    }
    return 82.f + [QuestionHeadView contentHeight:self.model.content];
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 83.f;
}

@end
