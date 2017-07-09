//
//  CanEatCV.m
//  Perinatal
//
//  Created by OY on 2017/7/7.
//  Copyright © 2017年 OY. All rights reserved.
//

#import "CanEatCV.h"
#import "CanEatModel.h"
#import "TitleBtn.h"

@implementation CanEatCV

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * CellIdentifier = @"UICollectionViewCell";
    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    [cell.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    NSInteger row = indexPath.row;
    cell.backgroundColor = white_color;
    CanEatModel *dic = [self.dataList objectAtIndex:row];
    TitleBtn *btn = [TitleBtn buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, collectionView.width/3-10, collectionView.width/3-10);
    btn.title = dic.title;
    btn.imageName = dic.imageUrl;
    for (id subView in cell.contentView.subviews) {
        [subView removeFromSuperview];
    }
    [cell addSubview:btn];
    return cell;
}



//定义每个Item 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    return CGSizeMake(collectionView.width/3-10, collectionView.width/3-10);
    
    
}
@end
