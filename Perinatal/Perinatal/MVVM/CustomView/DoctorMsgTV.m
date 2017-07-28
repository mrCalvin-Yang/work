//
//  DoctorMsgTV.m
//  Perinatal
//
//  Created by OY on 2017/7/23.
//  Copyright © 2017年 OY. All rights reserved.
//

#import "DoctorMsgTV.h"
#import "DoctorMsgCell.h"
#import "DoctorMsgModel.h"
@implementation DoctorMsgTV

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifer = @"msg";
    DoctorMsgCell *cell = [tableView dequeueReusableCellWithIdentifier:identifer];
    if (!cell) {
        cell = [[DoctorMsgCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifer];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
//    DoctorMsgModel *model = self.dataList[indexPath.row];
//    cell.nameLabel.text = model.realName;
//    cell.titleLabel.text = model.jobTitle;
//    cell.hospitalLabel.text = model.hospitalName;
//    cell.workLabel.text = model.departmentName;
//    cell.skillLabel.text = string(@"擅长：", model.labelContext);
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 119.f;
}

@end
