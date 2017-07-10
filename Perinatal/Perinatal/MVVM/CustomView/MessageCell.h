//
//  HomeSectionCell.h
//  Perinatal
//
//  Created by OY on 2017/7/6.
//  Copyright © 2017年 OY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MessageModel.h"

@interface MessageCell : UITableViewCell
@property(nonatomic, strong)UILabel *statuLabel;
@property(nonatomic, strong)UILabel *messageLabel;
@property(nonatomic, strong) MessageModel *model;
@end
