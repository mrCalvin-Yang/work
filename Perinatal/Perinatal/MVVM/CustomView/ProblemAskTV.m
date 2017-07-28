//
//  ProblemAskTV.m
//  Perinatal
//
//  Created by OY on 2017/7/7.
//  Copyright © 2017年 OY. All rights reserved.
//

#import "ProblemAskTV.h"
#import "ProblemAskCell.h"
#import "QuestionModel.h"

@implementation ProblemAskTV

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataList.count;
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
    QuestionModel *model = self.dataList[indexPath.row];
    cell.model = model;
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.1f;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.1;
}

@end
