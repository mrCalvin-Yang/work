//
//  MyconsultationDetailCell.h
//  Perinatal
//
//  Created by OY on 2017/7/25.
//  Copyright © 2017年 OY. All rights reserved.
//

#import <UIKit/UIKit.h>
@class QuestionModel;

@interface MyconsultationDetailCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *costLabel;
@property (weak, nonatomic) IBOutlet UILabel *sourceLabel;
@property (strong, nonatomic) IBOutlet UILabel *problemDtailLabel;
@property (strong, nonatomic) IBOutlet UIImageView *ImageView1;
@property (strong, nonatomic) IBOutlet UIImageView *imageView2;
@property (strong, nonatomic) IBOutlet UIImageView *imageView3;
@property (strong, nonatomic) IBOutlet UIImageView *imageView4;
@property (strong, nonatomic) IBOutlet UIImageView *logoImageView;
@property (strong, nonatomic) IBOutlet UIImageView *bgImageView;
@property (strong, nonatomic) IBOutlet UILabel *orderStatusLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property(nonatomic,strong)QuestionModel *model;
@end
