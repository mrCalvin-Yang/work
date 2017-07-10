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

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.rowHeight = UITableViewAutomaticDimension;
        self.estimatedRowHeight = 60;
    }
    return self;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"tableviewcell";
    MessageCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[MessageCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.statuLabel.textColor = kNormalFontColor;
    MessageModel *model = [self.dataList objectAtIndex:indexPath.section];
    cell.model = model;
    return cell;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.dataList.count;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100.f;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return section == 0 ? 40 : 0.1f;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return section == 2 ? 0.1f : 15.f;
}


-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section > 0) {
        return nil;
    }
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20, 10, SCREENWIDTH-40, 20)];
    label.backgroundColor = white_color;
    label.textColor = global_color;
    label.font = H12;
    label.text = @"\t距预产期：221天|胎重：19g|身长：2.15cm";
    return label;
}

@end
