//
//  HomePageTV.m
//  Perinatal
//
//  Created by OY on 2017/7/6.
//  Copyright © 2017年 OY. All rights reserved.
//

#import "HomePageMessageTV.h"
#import "MessageCell.h"
#import "MessageModel.h"

@implementation HomePageMessageTV

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"tableviewcell";
    MessageCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[MessageCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.statuLabel.textColor = black_color;
    cell.messageLabel.textColor = black_color;
//    MessageModel *model = [self.dataList firstObject];
    switch (indexPath.row) {
        case 0:
            cell.statuLabel.text = @"今日胎宝宝发育变化";
            cell.messageLabel.text = @"asdasdasdfasdfasdgasdf";
            break;
        case 1:
            cell.statuLabel.text = @"今日孕妈需要注意";
            cell.messageLabel.text = @"asdfadsagdafdsafasfasdfas";
            break;
        case 2:
            cell.statuLabel.text = @"每日胎教";
            cell.messageLabel.text = @"asdfadagadsdafasdfadsfasf";
            break;
            
        default:
            break;
    }
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100.f;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 40;
}



-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20, 10, SCREENWIDTH-40, 20)];
    label.backgroundColor = white_color;
    label.textColor = global_color;
    label.font = H12;
    label.text = @"\t距预产期：221天|胎重：19g|身长：2.15cm";
    return label;
}

@end
