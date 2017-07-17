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


@implementation DoctorHomeTV

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        static NSString *identifer = @"homecell";
        DoctorHomeCell *cell = [tableView dequeueReusableCellWithIdentifier:identifer];
        if (!cell) {
            cell = [[DoctorHomeCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifer];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        return cell;
    }else if(indexPath.section == 1){
        static NSString *idteifer = @"problem";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:idteifer];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:idteifer];
            cell.textLabel.text = @"医生简介";
            cell.detailTextLabel.text = @"毕业于中山大学医学部，2014年获得博士学位，至今在中山大学附属第一医院妇产科工作，专业";
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else{
        static NSString *identifer = @"ProblemAskCell";
        ProblemAskCell *cell = [tableView dequeueReusableCellWithIdentifier:identifer];
        if (!cell) {
            cell = [[NSBundle mainBundle] loadNibNamed:@"ProblemAskCell" owner:self options:nil].firstObject;
        }
        cell.selectionStyle = UITableViewCellEditingStyleNone;
        
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
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 46)];
        label.text = @"孕期问答";
        label.font = HB18;
        label.textColor = kImportFontColor;
        return label;
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
        return 153.f;
    }
    return 127.f;
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return section == 2 ? 2 : 1;
}
@end
