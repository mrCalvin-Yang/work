//
//  UserAskCell.h
//  Perinatal
//
//  Created by OY on 2017/7/26.
//  Copyright © 2017年 OY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserAskCell : UITableViewCell

@property(nonatomic,strong)UIImageView *doctorHeadView;

@property(nonatomic,strong)UILabel *doctorAskLabel;

@property(nonatomic,copy)NSString *askText;

+(CGFloat)cellHeight:(NSString *)text;

@end
