//
//  MyConsultationDetailTV.m
//  Perinatal
//
//  Created by OY on 2017/7/25.
//  Copyright © 2017年 OY. All rights reserved.
//

#import "MyConsultationDetailTV.h"
#import "MyconsultationDetailCell.h"
#import "QuestionModel.h"
#import "NSString+Formatter.h"

@implementation MyConsultationDetailTV

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    MyconsultationDetailCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"MyconsultationDetailCell" owner:self options:nil] firstObject];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.model = self.dataList.firstObject;
    return cell;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 367.f;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.1f;
}


@end
