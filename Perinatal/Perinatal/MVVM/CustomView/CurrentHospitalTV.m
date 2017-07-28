//
//  CurrentHospitalTV.m
//  Perinatal
//
//  Created by OY on 2017/7/26.
//  Copyright © 2017年 OY. All rights reserved.
//

#import "CurrentHospitalTV.h"

@implementation CurrentHospitalTV

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }else if (section == 1){
        return 1;
    }else{
        return 3;
    }
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return @"当前城市";
    }else if (section == 1){
        return @"关联医院";
    }else{
        return @"附近医院";
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *idetifer = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:idetifer];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idetifer];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    UILabel *locationLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 70, 22)];
    locationLabel.textAlignment = NSTextAlignmentRight;
    locationLabel.text = @"重新定位";
    locationLabel.textColor = kFontColor;
    switch (indexPath.section) {
        case 0:
            cell.textLabel.text = @"广州市";
            cell.accessoryView = locationLabel;
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            
            break;
        case 1:
            cell.textLabel.text = @"中山大学附属第一医院";
            break;
        case 2:
            switch (indexPath.row) {
                case 0:
                    cell.textLabel.text = @"中山大学附属第一医院";
                    break;
                case 1:
                    cell.textLabel.text = @"南方医科大学南方医院";
                    break;
                case 2:
                    cell.textLabel.text = @"广州市妇女儿童医疗中心";
                    break;
                
                default:
                    break;
            }
            break;
        default:
            break;
    }
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 45.;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return .1f;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 35.;
}

@end
