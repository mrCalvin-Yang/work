//
//  CanEatCV.m
//  Perinatal
//
//  Created by OY on 2017/7/7.
//  Copyright © 2017年 OY. All rights reserved.
//

#import "MedicalServiceCV.h"
#import "CanEatModel.h"
#import "TitleBtn.h"

@implementation MedicalServiceCV

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * CellIdentifier = @"UICollectionViewCell";
    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    [cell.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    NSInteger row = indexPath.row;
    cell.backgroundColor = white_color;
    CanEatModel *dic = [self.dataList objectAtIndex:row];
    TitleBtn *btn = [TitleBtn buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, collectionView.width/2-10, (collectionView.width/2 - 10)*0.6);
    btn.title = dic.title;
    btn.imageName = dic.imageUrl;
    [cell addSubview:btn];
    return cell;
}

//定义每个Item 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    return CGSizeMake(collectionView.width/2-10, (collectionView.width/2 - 10)*0.6);
}

-(CGSize)collectionView:(UICollectionView*)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    return CGSizeMake(SCREENWIDTH, 200);
}

-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    NSString *identifer;
    if([kind isEqualToString:UICollectionElementKindSectionHeader])
    {
        identifer = @"headid";
    }
    UICollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:identifer forIndexPath:indexPath];
    if(headerView == nil)
    {
        headerView = [[UICollectionReusableView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 200)];
    }
    headerView.backgroundColor = white_color;
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 150)];
    view.backgroundColor = global_color;
    [headerView addSubview:view];
    view = [[UIView alloc] initWithFrame:CGRectMake(0, 150, SCREENWIDTH, 50)];
    view.backgroundColor = kBackColor;
    [headerView addSubview:view];
    
    view = [[UIView alloc] initWithFrame:CGRectMake(20, 110, SCREENWIDTH-40, 80)];
    view.backgroundColor = white_color;
    [headerView addSubview:view];
    
    for (int i = 0; i < 4; i ++) {
        
    }
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20, view.y - 30, 200, 30)];
    label.text = @"中山大学附属医院";
    label.textColor = white_color;
    label.font = HB14;
    [headerView addSubview:label];
    
    
    return headerView;
}
@end
