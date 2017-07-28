//
//  SystemCell.h
//  Perinatal
//
//  Created by OY on 2017/7/27.
//  Copyright © 2017年 OY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SystemCell : UITableViewCell

@property(nonatomic,strong)UIImageView *doctorHeadView;

@property(nonatomic,strong)UILabel *doctorAskLabel;

@property(nonatomic,copy)NSString *askText;

@property(nonatomic,assign)NSInteger second;

+(CGFloat)cellHeight:(NSString *)text;

@end
