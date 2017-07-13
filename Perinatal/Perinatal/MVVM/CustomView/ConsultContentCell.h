//
//  ConsultContentCell.h
//  Perinatal
//
//  Created by OY on 2017/7/12.
//  Copyright © 2017年 OY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HXPhotoView.h"


@interface ConsultContentCell : UITableViewCell<HXPhotoViewDelegate,UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UITextView *contentTextview;
@property (weak, nonatomic) IBOutlet UILabel *numberLabel;
@property (weak, nonatomic) IBOutlet HXPhotoView *photoView;
@property (weak, nonatomic) IBOutlet UILabel *photoCountLabel;
@property (nonatomic,strong) NSArray *images;
@property (nonnull ,copy) NSString *textViewStr;
@property (nonatomic,strong)RACSubject *imageSignal;
@end
