//
//  MyCardCell.h
//  Perinatal
//
//  Created by OY on 2017/7/23.
//  Copyright © 2017年 OY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyCardCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *bgImageView;
@property (weak, nonatomic) IBOutlet UIImageView *logoImageView;
@property (weak, nonatomic) IBOutlet UILabel *hospitalLabel;
@property (weak, nonatomic) IBOutlet UILabel *numberLabel;

@end
