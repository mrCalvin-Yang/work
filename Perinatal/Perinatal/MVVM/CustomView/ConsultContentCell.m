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
    self.contentTextview.delegate = self;
    [self.photoView removeFromSuperview];
    HXPhotoManager *manager = [[HXPhotoManager alloc] initWithType:HXPhotoManagerSelectedTypePhoto];
    manager.openCamera = YES;
    manager.photoMaxNum = 4;
    HXPhotoView *view = [[HXPhotoView alloc] initWithFrame:CGRectMake(15, self.contentTextview.bottom + 80, SCREENWIDTH - 30, 75) WithManager:manager];
    view.delegate = self;
    self.photoView = view;
    [self.contentView addSubview:self.photoView];
}
- (void)photoViewChangeComplete:(NSArray<HXPhotoModel *> *)allList Photos:(NSArray<HXPhotoModel *> *)photos Videos:(NSArray<HXPhotoModel *> *)videos Original:(BOOL)isOriginal{
    self.photoCountLabel.text = [NSString stringWithFormat:@"%ld/4",allList.count];
    [HXPhotoTools fetchHDImageForSelectedPhoto:photos completion:^(NSArray<UIImage *> *images) {
        self.images = images;
//        self.complete(images);
        
    }];
}

- (BOOL)textViewShouldBeginEditing:(UITextView *)textView;
{
    if (!_textViewStr) {
       textView.text = @"";
    }else{
        textView.text = _textViewStr;
    }
    textView.textColor = black_color;
    return (textView.text.length < 240);

}
- (BOOL)textViewShouldEndEditing:(UITextView *)textView{
    _textViewStr = textView.text;
    return YES;
}

-(void)textViewDidChange:(UITextView *)textView{
    NSInteger number = textView.text.length;
    _textViewStr = textView.text;
    self.numberLabel.text = [NSString stringWithFormat:@"%ld/240",number];
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if ([text isEqualToString:@"\n"])
    {
        [textView resignFirstResponder];
        return NO;
    }
    else
    {
        return YES;
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
