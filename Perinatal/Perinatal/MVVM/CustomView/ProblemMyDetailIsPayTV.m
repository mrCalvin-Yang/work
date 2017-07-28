//
//  ProblemMyDetailIsPayTV.m
//  Perinatal
//
//  Created by OY on 2017/7/27.
//  Copyright © 2017年 OY. All rights reserved.
//

#import "ProblemMyDetailIsPayTV.h"
#import <UIKit+AFNetworking.h>
#import "QuestionHeadView.h"
#import "QuestionFooterView.h"
#import "DoctorAskCell.h"
#import "UserAskCell.h"
#import "SystemCell.h"
#import "NSString+Formatter.h"

@implementation ProblemMyDetailIsPayTV

-(QuestionModel *)model{
    if (!_model) {
        _model = [[QuestionModel alloc] init];
        _model = self.dataList.firstObject;
    }
    return _model;
}

-(tQuestionOrder *)tqModel{
    if (!_tqModel) {
        if (self.model.tQuestionOrder || ![self.model.tQuestionOrder isKindOfClass:[NSNull class]]) {
            _tqModel = [[tQuestionOrder alloc] initWithDictionary:self.model.tQuestionOrder error:nil];
        }
    }
    return _tqModel;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [NSArray isEmpty:self.model.answerList] ? 1 : self.model.answerList.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (![NSArray isEmpty:self.model.answerList]) {
        NSDictionary *dic = self.model.answerList[indexPath.row];
        NSString *key = [[dic allKeys] firstObject];
        NSDictionary *data = [dic objectForKey:key];
        CGFloat height = [UserAskCell cellHeight:data[@"content"]];
        return height;
    }
    return 70.f;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *userIdenter = @"UserAskCell";
    static NSString *identifer = @"ProblemAskCell";
    if (![NSArray isEmpty:self.model.answerList]) {
        NSDictionary *dic = self.model.answerList[indexPath.row];
        NSString *key = [[dic allKeys] firstObject];
        if ([key isEqualToString:@"doctor"]) {
            NSDictionary *data = [dic objectForKey:key];
            DoctorAskCell *cell = [tableView dequeueReusableCellWithIdentifier:identifer];
            if (!cell) {
                cell = [[DoctorAskCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifer];
            }
            cell.selectionStyle = UITableViewCellEditingStyleNone;
            cell.askText = data[@"content"];
            [cell.doctorHeadView setImageWithURL:URL(data[@"doctorImageUrl"])];
            return cell;
        }else{
            NSDictionary *data = [dic objectForKey:key];
            UserAskCell *cell = [tableView dequeueReusableCellWithIdentifier:userIdenter];
            if (!cell) {
                cell = [[UserAskCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:userIdenter];
            }
            cell.selectionStyle = UITableViewCellEditingStyleNone;
            cell.askText = data[@"content"];
            [cell.doctorHeadView setImageWithURL:URL(data[@"userImageUrl"])];
            return cell;
        }
        
    }else if (self.model.tQuestionOrder || ![self.model.tQuestionOrder isKindOfClass:[NSNull class]]){
        static NSString *identifer = @"systemcell";
        SystemCell *cell = [tableView dequeueReusableCellWithIdentifier:identifer];
        if (!cell) {
            cell = [[SystemCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifer];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        if ([self.tqModel.orderStatus isEqualToString:@"PAYMENT_STATUS_TIMEOUT"]) {
            cell.askText = @"订单已失效";
            cell.second = 0;
        }
        if ([self.tqModel.orderStatus isEqualToString:@"PAYMENT_STATUS_UNPAID"]) {
            cell.askText = @"订单未支付";
        }
        if ([self.tqModel.orderStatus isEqualToString:@"PAYMENT_STATUS_ALREADY_PAID"]) {
            cell.askText = nil;
            cell.second = [NSString getTimeDifferenceWithString:self.model.createTime];
        }
        return cell;
        
    }
    return nil;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    QuestionHeadView *bg = [[QuestionHeadView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 112) Images:self.model.thumbImageList content:self.model.content];
    bg.cost = self.model.cost;
    bg.backgroundColor = white_color;
    bg.resource = self.model.questionCategoryName;
    bg.height = bg.viewHeight;
    return bg;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    CGFloat height = [self tableView:tableView heightForFooterInSection:section];
    UIView *bg = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, height)];
    NSString *timeStr = [NSString timeWithTimeIntervalString:self.model.createTime];
    QuestionFooterView *footer = [[QuestionFooterView alloc] initWithFrame:bg.frame timeStr:timeStr];
    [bg addSubview:footer];
    bg.backgroundColor = white_color;
    return bg;
   
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (self.model.thumbImageList.count > 0) {
        return 82.f + (SCREENWIDTH -15)/4 + [QuestionHeadView contentHeight:self.model.content];
    }
    return 82.f + [QuestionHeadView contentHeight:self.model.content];
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 35.f;
    
}

@end
