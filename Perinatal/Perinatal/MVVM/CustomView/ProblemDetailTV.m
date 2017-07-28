//
//  ProblemDetailTV.m
//  Perinatal
//
//  Created by OY on 2017/7/13.
//  Copyright © 2017年 OY. All rights reserved.
//

#import "ProblemDetailTV.h"
#import "ProblemAskCell.h"
#import "QuestionModel.h"
#import <UIKit+AFNetworking.h>

@implementation ProblemDetailTV

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 175.f;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifer = @"ProblemAskCell";
    ProblemAskCell *cell = [tableView dequeueReusableCellWithIdentifier:identifer];
    if (!cell) {
        cell = [[NSBundle mainBundle] loadNibNamed:@"ProblemAskCell" owner:self options:nil].firstObject;
    }
    cell.selectionStyle = UITableViewCellEditingStyleNone;
    cell.sourceLabel.hidden = YES;
    cell.model = self.dataList[indexPath.row];
    return cell;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    QuestionModel *model = self.dataList[0];
    CGFloat height = [self tableView:tableView heightForHeaderInSection:section];
    UIView *bg = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, height)];
    bg.backgroundColor = white_color;
    UILabel *costLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 14, 43, 20)];
    costLabel.textColor = RGBCOLOR(227, 21, 25);
    costLabel.font = H14;
    costLabel.textAlignment = NSTextAlignmentCenter;
    costLabel.text = string(@"¥", model.cost);
    [bg addSubview:costLabel];
    UILabel *sourceLabel = [[UILabel alloc] initWithFrame:CGRectMake(bg.width - 69, 15, 54, 18)];
    sourceLabel.text = model.questionCategoryName;
    sourceLabel.textAlignment = NSTextAlignmentCenter;
    sourceLabel.font = H10;
    sourceLabel.textColor = kFontColor;
    sourceLabel.layer.masksToBounds = YES;
    sourceLabel.layer.cornerRadius = 9.f;
    sourceLabel.layer.borderWidth = 1.f;
    sourceLabel.layer.borderColor = kLineColor.CGColor;
    [bg addSubview:sourceLabel];
    return bg;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    QuestionModel *model = self.dataList[0];
    CGFloat height = [self tableView:tableView heightForFooterInSection:section];
    UIView *bg = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, height)];
    bg.backgroundColor = RGBCOLOR(248, 248, 248);
    UIImageView *headView = [[UIImageView alloc] init];
    headView.backgroundColor = kBackColor;
    headView.layer.masksToBounds = YES;
    headView.layer.cornerRadius = 20.f;
    [bg addSubview:headView];
    if (model.doctorHeadsUrl) {
        [headView setImageWithURL:URL(model.doctorHeadsUrl)];
    }
    
    UILabel *nameLabel = [[UILabel alloc] init];
    nameLabel.text = [NSString stringWithFormat:@"%@\t%@",model.doctorName,model.jobTitle];
    [nameLabel sizeToFit];
    nameLabel.font = H14;
    [bg addSubview:nameLabel];
    
    UILabel *hospitalLabel = [[UILabel alloc] init];
    hospitalLabel.text = [NSString stringWithFormat:@"%@\t%@",model.hospitalName,model.departmentName];
    [hospitalLabel sizeToFit];
    hospitalLabel.font = H12;
    hospitalLabel.textColor = kFontColor;
    [bg addSubview:hospitalLabel];
    
    UIButton *answerLabel = [[UIButton alloc] init];
    [answerLabel setTitle:[NSString stringWithFormat:@"%@个回答",model.answerNum] forState:UIControlStateNormal];
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
    return 49.f;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 83.f;
}

@end
