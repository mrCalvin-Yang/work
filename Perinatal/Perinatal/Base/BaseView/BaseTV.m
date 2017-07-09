//
//  BaseTV.m
//  UTVGO
//
//  Created by fute on 16/5/31.
//  Copyright © 2016年 www.UTVGO.com. All rights reserved.
//

#import "BaseTV.h"

@implementation BaseTV

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self){
        self.dataSource=self;
        self.delegate=self;
        self.backgroundColor = [UIColor whiteColor];
//        self.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return self;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataList.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100.f;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifer = @"tableviewcell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifer];
    if (cell) {
        cell = [UITableViewCell new];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    if (self.selectItemSignal) {
//        [self.selectItemSignal sendNext:indexPath];
//    }
}

- (CGFloat)totalHeight{
    CGFloat itemHeight = [self tableView:self heightForRowAtIndexPath:[NSIndexPath new]];
    return itemHeight*self.dataList.count+5;
}

@end
