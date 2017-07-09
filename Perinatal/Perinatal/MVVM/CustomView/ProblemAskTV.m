//
//  ProblemAskTV.m
//  Perinatal
//
//  Created by OY on 2017/7/7.
//  Copyright © 2017年 OY. All rights reserved.
//

#import "ProblemAskTV.h"
#import "ProblemAskCell.h"

@implementation ProblemAskTV

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return 40.f;
    }
    return 175.f;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        static NSString *identifer = @"cell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifer];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifer];
        }
        cell.selectedBackgroundView = [UIView new];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.textLabel.text = @"孕期问答";
        return cell;
    }
    static NSString *identifer = @"ProblemAskCell";
    ProblemAskCell *cell = [tableView dequeueReusableCellWithIdentifier:identifer];
    if (!cell) {
        cell = [[NSBundle mainBundle] loadNibNamed:@"ProblemAskCell" owner:self options:nil].firstObject;
    }
    cell.selectionStyle = UITableViewCellEditingStyleNone;
    
    return cell;
}

@end
