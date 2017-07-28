//
//  DoctorHomeTV.m
//  Perinatal
//
//  Created by OY on 2017/7/13.
//  Copyright © 2017年 OY. All rights reserved.
//

#import "DoctorHomeTV.h"
#import "DoctorHomeCell.h"
#import "ProblemAskCell.h"
#import "DoctorMsgModel.h"


@implementation DoctorHomeTV

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    DoctorMsgModel *model = self.doctorModel;
    if (indexPath.section == 0) {
        static NSString *identifer = @"homecell";
        DoctorHomeCell *cell = [tableView dequeueReusableCellWithIdentifier:identifer];
        if (!cell) {
            cell = [[DoctorHomeCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifer];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        cell.nameLabel.text = model.realName;
        cell.titleLabel.text = model.jobTitle;
        cell.hospitalLabel.text = model.hospitalName;
        cell.workLabel.text = model.departmentName;
        cell.skillLabel.text = string(@"擅长：", model.labelContext);
        if (!model.doctorStar) {
            [cell.tqStartView setScore:0.01 withAnimation:YES];
        }else{
            [cell.tqStartView setScore:model.doctorStar.integerValue / 5.f withAnimation:YES];
        }
        cell.askLabel.text = [NSString stringWithFormat:@"%@个回答",model.answerNum];
        return cell;
    }else if(indexPath.section == 1){
        static NSString *idteifer = @"problem";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:idteifer];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:idteifer];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        UILabel *introduceLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 15, 88, 22)];
        introduceLabel.text = @"医生简介";
        introduceLabel.font = H17;
        [cell.contentView addSubview:introduceLabel];
        UILabel *detailLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, introduceLabel.bottom + 15, SCREENWIDTH - 30, 60)];
        detailLabel.font = H14;
        detailLabel.numberOfLines = 0;
        detailLabel.text = model.doctorDescription;
        [cell.contentView addSubview:detailLabel];
        return cell;
    }else{
        QuestionModel *question = self.dataList[indexPath.row];
        static NSString *identifer = @"ProblemAskCell";
        ProblemAskCell *cell = [tableView dequeueReusableCellWithIdentifier:identifer];
        if (!cell) {
            cell = [[NSBundle mainBundle] loadNibNamed:@"ProblemAskCell" owner:self options:nil].firstObject;
        }
        cell.selectionStyle = UITableViewCellEditingStyleNone;
        cell.model = question;
        return cell;
    }
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return section == 2 ? 0.1f:15;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return section == 2 ? 45.f : 0.1f;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section == 2) {
        if (self.dataList.count == 0) {
            return nil;
        }
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 46)];
        view.backgroundColor = white_color;
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, SCREENWIDTH-30, 46)];
        label.text = @"孕期问答";
        label.font = H17;
        label.textColor = kImportFontColor;
        [view addSubview:label];
        return view;
    }
    return nil;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 15)];
    view.backgroundColor = kBackColor;
    return view;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 142.f;
    }
    if (indexPath.section == 2) {
        return 175.f;
    }
    return 127.f;
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 2) {
        return self.dataList.count;
    }
    return 1;
}
@end
