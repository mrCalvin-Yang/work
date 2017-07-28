//
//  ProblemAskCell.h
//  Perinatal
//
//  Created by OY on 2017/7/7.
//  Copyright © 2017年 OY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QuestionModel.h"
@interface ProblemAskCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *ProblemLabel;
@property (weak, nonatomic) IBOutlet UIImageView *userImageView;
@property (weak, nonatomic) IBOutlet UILabel *doctorLabel;
@property (weak, nonatomic) IBOutlet UILabel *askMsgLabel;
@property (weak, nonatomic) IBOutlet UILabel *sourceLabel;
@property (strong, nonatomic) UILabel *payLabel;
@property (strong, nonatomic) UIImageView *CombinedImageView;
@property (nonatomic,strong)QuestionModel *model;
@end
