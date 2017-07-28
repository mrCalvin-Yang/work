//
//  MyconsultationCell.h
//  Perinatal
//
//  Created by OY on 2017/7/24.
//  Copyright © 2017年 OY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyconsultationCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *problemLabel;
@property (weak, nonatomic) IBOutlet UIImageView *logoImageView;
@property (strong, nonatomic) IBOutlet UIImageView *bgImageView;
@property (weak, nonatomic) IBOutlet UILabel *orderStatusLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (nonatomic, strong) UIImage *bgImage;

@end
