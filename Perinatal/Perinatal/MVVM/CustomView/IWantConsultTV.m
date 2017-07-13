//
//  IWantConsultTV.m
//  Perinatal
//
//  Created by OY on 2017/7/12.
//  Copyright © 2017年 OY. All rights reserved.
//

#import "IWantConsultTV.h"
#import "DoctorMsgCell.h"
#import "ConsultContentCell.h"

@implementation IWantConsultTV

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            static NSString *idteifer = @"status";
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:idteifer];
            if (!cell) {
                cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idteifer];
            }
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
        }else{
            static NSString *identifer = @"msg";
            DoctorMsgCell *cell = [tableView dequeueReusableCellWithIdentifier:identifer];
            if (!cell) {
                cell = [[DoctorMsgCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifer];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
            }
            return cell;
        }
    }else if(indexPath.section == 1){
        static NSString *idteifer = @"problem";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:idteifer];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idteifer];
            cell.textLabel.text = @"问题类型";
            UILabel *label = [[UILabel alloc] init];
            label.text = @"孕前保健";
            label.textColor = RGBCOLOR(153, 153, 153);
            label.font = H14;
            [label sizeToFit];
            cell.accessoryView = label;
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else{
            static NSString *identifer = @"ConsultContentCell";
            ConsultContentCell *cell = [tableView dequeueReusableCellWithIdentifier:identifer];
            if (!cell) {
                cell = [[NSBundle mainBundle] loadNibNamed:identifer owner:self options:nil].firstObject;
            }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
    }
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return section == 2 ? 44:15;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return section == 2 ? 46.f : 0.1f;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section == 2) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 46)];
        label.text = @"向TA提问";
        label.font = H14;
        label.textColor = RGBCOLOR(255, 69, 106);
        label.textAlignment = NSTextAlignmentCenter;
        return label;
    }
    return nil;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    if (section == 2) {
        
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 44)];
        view.backgroundColor = RGBCOLOR(248, 248, 248);
        UIButton *bt = [UIButton buttonWithType:UIButtonTypeCustom];
        bt.frame = CGRectMake(15, 15, 14, 14);
        bt.backgroundColor = gray_color;
        [[bt rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
            
        }];
        [view addSubview:bt];
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(bt.right + 7, 15, SCREENWIDTH - bt.right- 7 - 15, 16)];
        label.textColor = kFontColor;
        label.font = H10;
        [label setNeedsDisplay];
        NSString *str = @"允许匿名公开，答案每被人付费围观一次，你可分成¥0.4";
        NSMutableAttributedString *attributestr = [[NSMutableAttributedString alloc] initWithString:str];
        [attributestr addAttribute:NSForegroundColorAttributeName value:RGBCOLOR(255, 0, 31) range:NSMakeRange(23, 4)];
        label.attributedText = attributestr;
        [view addSubview:label];
        return view;
    }
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 15)];
    view.backgroundColor = kBackColor;
    return view;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return indexPath.row == 0 ? 97.f : 119.f;
    }
    if (indexPath.section == 2) {
        return 485.f;
    }
    return 46.f;
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return section == 0 ? 2 : 1;
}

@end
