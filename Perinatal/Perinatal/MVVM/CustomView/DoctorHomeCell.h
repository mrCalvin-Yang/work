//
//  DoctorHomeCell.h
//  Perinatal
//
//  Created by OY on 2017/7/13.
//  Copyright © 2017年 OY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TQStarRatingView.h"

@interface DoctorHomeCell : UITableViewCell
@property(nonatomic,strong)UIImageView *topImageView;
@property(nonatomic,strong)UILabel *nameLabel;
@property(nonatomic,strong)UILabel *titleLabel;
@property(nonatomic,strong)UILabel *hospitalLabel;
@property(nonatomic,strong)UILabel *workLabel;
@property(nonatomic,strong)UILabel *skillLabel;
@property(nonatomic,strong)TQStarRatingView *tqStartView;
@property(nonatomic,strong)UILabel *askLabel;
@end
