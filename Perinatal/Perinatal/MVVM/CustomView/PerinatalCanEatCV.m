//
//  PerinatalCanEatCV.m
//  Perinatal
//
//  Created by OY on 2017/7/9.
//  Copyright © 2017年 OY. All rights reserved.
//

#import "PerinatalCanEatCV.h"
#import "CanEatModel.h"
#import "TitleBtn.h"
#import <ReactiveCocoa.h>

@implementation PerinatalCanEatCV
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * CellIdentifier = @"UICollectionViewCell";
    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    [cell.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    NSInteger row = indexPath.row;
    cell.backgroundColor = white_color;
    CanEatModel *dic = [self.dataList objectAtIndex:row];
    TitleBtn *btn = [TitleBtn buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, (collectionView.width-2)/3, (collectionView.width-2)/3);
    btn.title = dic.title;
    btn.imageName = dic.imageUrl;
    [[btn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        if (self.selectItemSignal) {
            [self.selectItemSignal sendNext:indexPath];
        }
    }];
    for (id subView in cell.contentView.subviews) {
        [subView removeFromSuperview];
    }
    [cell addSubview:btn];
    return cell;
}

//定义每个Item 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    return CGSizeMake((collectionView.width-2)/3, (collectionView.width-2)/3);
}


@end
