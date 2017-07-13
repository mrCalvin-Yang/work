//
//  ConsultContentCell.m
//  Perinatal
//
//  Created by OY on 2017/7/12.
//  Copyright © 2017年 OY. All rights reserved.
//

#import "ConsultContentCell.h"

@implementation ConsultContentCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.contentTextview.text = @"请详细输入你想咨询的内容，例如发生部分、主要症状";
    HXPhotoManager *manager = [[HXPhotoManager alloc] initWithType:HXPhotoManagerSelectedTypePhoto];
    manager.openCamera = YES;
    manager.photoMaxNum = 4;
    HXPhotoView *view = [[HXPhotoView alloc] initWithFrame:self.photoView.frame WithManager:manager];
    view.delegate = self;
    [self.contentView addSubview:view];
    self.photoView = view;
}
- (void)photoViewChangeComplete:(NSArray<HXPhotoModel *> *)allList Photos:(NSArray<HXPhotoModel *> *)photos Videos:(NSArray<HXPhotoModel *> *)videos Original:(BOOL)isOriginal{
    self.photoCountLabel.text = [NSString stringWithFormat:@"%ld/4",allList.count];
    [HXPhotoTools fetchHDImageForSelectedPhoto:photos completion:^(NSArray<UIImage *> *images) {
        self.images = images;
        self.imageSignal = [RACSubject subject];
        [self.imageSignal sendNext:self.images];
//        self.complete(images);
        
    }];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
