//
//  SettingTV.m
//  Perinatal
//
//  Created by OY on 2017/7/23.
//  Copyright © 2017年 OY. All rights reserved.
//

#import "SettingTV.h"

@implementation SettingTV

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return section == 2 ? 1 : 2;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifer = @"setting";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifer];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifer];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 110.f, 22.f)];
    label.text = @"12.30M";
    label.textColor = kFontColor;
    label.textAlignment = NSTextAlignmentRight;
    if (indexPath.section == 0) {
        switch (indexPath.row) {
            case 0:
                cell.textLabel.text = @"消息通知";
                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                break;
            case 1:
                cell.textLabel.text = @"清除本地缓存";
                cell.accessoryView = label;
                break;
            default:
                break;
        }
    }else if (indexPath.section == 1){
        switch (indexPath.row) {
            case 0:
                cell.textLabel.text = @"功能反馈";
                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                break;
            case 1:
                cell.textLabel.text = @"关于";
                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                break;
            default:
                break;
        }
    }else{
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, [self tableView:tableView heightForRowAtIndexPath:indexPath])];
        label.text = @"退出登录";
        label.textAlignment = NSTextAlignmentCenter;
        label.font = H17;
        [cell.contentView addSubview:label];
        
    }
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 45.f;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 15.f;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.1f;
}

@end
