//
//  MyHospitalCardTV.m
//  Perinatal
//
//  Created by OY on 2017/7/23.
//  Copyright © 2017年 OY. All rights reserved.
//

#import "MyHospitalCardTV.h"
#import "MyCardCell.h"

@implementation MyHospitalCardTV

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 98;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identfier = @"MyCardCell";
    MyCardCell *cell = [tableView dequeueReusableCellWithIdentifier:identfier];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:identfier owner:self options:nil] firstObject];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

@end
