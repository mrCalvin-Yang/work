//
//  MyConsultationTV.m
//  Perinatal
//
//  Created by OY on 2017/7/24.
//  Copyright © 2017年 OY. All rights reserved.
//

#import "MyConsultationTV.h"
#import "MyconsultationCell.h"
#import "MyconsultaitonControlCell.h"
#import "MyConsultationModel.h"
#import "NSString+Formatter.h"

@implementation MyConsultationTV

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MyConsultationModel *model = self.dataList[indexPath.section];
    if (indexPath.row == 0) {
        static NSString *idetifer = @"MyconsultationCell";
        MyconsultationCell *cell = [tableView dequeueReusableCellWithIdentifier:idetifer];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:idetifer owner:self options:nil] firstObject];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        cell.problemLabel.text = model.content;
        NSString *timeStr = [NSString timeWithTimeIntervalString:[NSString stringWithFormat:@"%ld",model.createTime]];
        cell.timeLabel.text = timeStr;
        switch ([model getOrderStatusWithQuestionStatus:model.questionStatus]) {
            case 0:
                cell.orderStatusLabel.text = @"订单未支付";
                break;
            case 1:
                cell.orderStatusLabel.text = @"订单已支付";
                break;
            case 2:
                cell.orderStatusLabel.text = @"订单已失效";
                break;
            case 3:
                cell.orderStatusLabel.text = @"订单退款中";
                break;
            case 4:
                cell.orderStatusLabel.text = @"订单已退款";
                break;
            case 5:
                cell.orderStatusLabel.text = @"点击查看回复";
                cell.bgImage = V_IMAGE(@"Combined Shape Orange");
                break;
            case 6:
                cell.orderStatusLabel.text = @"点击查看回复";
                cell.bgImage = V_IMAGE(@"Combined Shape Orange");
                break;
            case 7:
                cell.orderStatusLabel.text = @"咨询结束，点击查看";
                cell.bgImage = V_IMAGE(@"Combined Shape Orange");
                break;
            case 8:
                cell.orderStatusLabel.text = @"咨询结束，点击查看结果";
                cell.bgImage = V_IMAGE(@"Combined Shape Orange");
                break;
            case 9:
                cell.orderStatusLabel.text = @"订单已支付";
                break;
            default:
                break;
        }
        return cell;
    }else{
        static NSString *idetifer = @"MyconsultaitonControlCell";
        MyconsultaitonControlCell *cell = [tableView dequeueReusableCellWithIdentifier:idetifer];
        if (!cell) {
            cell = [[NSBundle mainBundle] loadNibNamed:idetifer owner:self options:nil].firstObject;
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }else{
            [cell.contentView respondsToSelector:@selector(removeAllObjects)];
        }
        switch ([model getOrderStatusWithQuestionStatus:model.questionStatus]) {
            case 0:
                [cell.leftBtn setTitle:@"删除" forState:UIControlStateNormal];
                [cell.rightBtn setTitle:@"支付" forState:UIControlStateNormal];
                break;
            case 1:
                cell.leftBtn.hidden = YES;
                [cell.rightBtn setTitle:@"已支付" forState:UIControlStateNormal];
                break;
            case 2:
                cell.leftBtn.hidden = YES;
                [cell.rightBtn setTitle:@"删除" forState:UIControlStateNormal];
                break;
            case 3:
                cell.leftBtn.hidden = YES;
                [cell.rightBtn setTitle:@"已支付" forState:UIControlStateNormal];
                break;
            case 4:
                cell.leftBtn.hidden = YES;
                [cell.rightBtn setTitle:@"删除" forState:UIControlStateNormal];
                break;
            case 5:
                cell.leftBtn.hidden = YES;
                [cell.rightBtn setTitle:@"追问" forState:UIControlStateNormal];
                break;
            case 6:
                cell.leftBtn.hidden = YES;
                [cell.rightBtn setTitle:@"删除" forState:UIControlStateNormal];
                break;
            case 7:
                cell.leftBtn.hidden = YES;
                [cell.rightBtn setTitle:@"删除" forState:UIControlStateNormal];
                break;
            case 8:
                cell.leftBtn.hidden = YES;
                [cell.rightBtn setTitle:@"删除" forState:UIControlStateNormal];
                break;
            case 9:
                cell.leftBtn.hidden = YES;
                [cell.rightBtn setTitle:@"已支付" forState:UIControlStateNormal];
                break;
            default:
                break;
        }
        return cell;
    }
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.dataList.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return indexPath.row == 0 ? 157.f : 55.f;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.1f;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 15.f;
}

@end
