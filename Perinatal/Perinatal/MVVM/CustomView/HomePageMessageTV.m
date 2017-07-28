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


@interface MessageCell ()
@property(nonatomic,strong)MessageCell * msgCell;
@end
@implementation HomePageMessageTV


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"tableviewcell";
    MessageCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[MessageCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
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
    
    MessageModel *model = self.dataList[indexPath.section];
    CGFloat height = [MessageCell cellHeight:model];
    return height;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return section == 0 ? 32 : 0.1f;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return section == 2 ? 0.1f : 15.f;
}


-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section > 0) {
        return nil;
    }
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 32)];
    view.backgroundColor = white_color;
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(15.f, 15, SCREENWIDTH-30.f, 17.f)];
    label.backgroundColor = white_color;
    label.textColor = global_color;
    label.font = H12;
    label.text = @"距预产期：221天|胎重：19g|身长：2.15cm";
    [view addSubview:label];
    return view;
}

-(CGFloat)totalHeight{
    CGFloat height = 0;
    for (MessageModel *model in self.dataList) {
        height += [MessageCell cellHeight:model];
    }
    return height + 77.f;
}

@end
