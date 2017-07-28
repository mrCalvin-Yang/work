//
//  CitySelectTV.m
//  Perinatal
//
//  Created by OY on 2017/7/27.
//  Copyright © 2017年 OY. All rights reserved.
//

#import "CitySelectTV.h"

@implementation CitySelectTV

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }
    NSString *key = self.letterArray[section];
    NSArray *cityArray = self.cityDic[key];
    return cityArray.count;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.letterArray.count;
}
- (NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    return self.letterArray;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identerfier = @"selectCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identerfier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identerfier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }else{
        cell.accessoryView = nil;
    }
    
    if (indexPath.section == 0) {
        cell.textLabel.text = @"广州市";
        UILabel *locationLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 70, 22)];
        locationLabel.textAlignment = NSTextAlignmentRight;
        locationLabel.text = @"重新定位";
        locationLabel.textColor = kFontColor;
        cell.accessoryView = locationLabel;
    }else{
        NSString *key = self.letterArray[indexPath.section];
        NSArray *cityArray = self.cityDic[key];
        cell.textLabel.text = cityArray[indexPath.row];
        
    }
    return cell;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return section == 0 ? @"当前城市": self.letterArray[section];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 45.;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.1f;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 35.f;
}


@end
