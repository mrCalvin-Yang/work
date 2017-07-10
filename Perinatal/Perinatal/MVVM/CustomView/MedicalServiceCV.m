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
#import <ReactiveCocoa.h>

@implementation MedicalServiceCV

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * CellIdentifier = @"UICollectionViewCell";
    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    [cell.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    NSInteger row = indexPath.row;
    cell.backgroundColor = white_color;
    CanEatModel *dic = [self.dataList objectAtIndex:row];
    TitleBtn *btn = [TitleBtn buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, (collectionView.width-1)/2, ((collectionView.width-1)/2)*0.6);
    btn.title = dic.title;
    btn.imageName = dic.imageUrl;
    [btn setTitleColor:gray_color forState:UIControlStateNormal];
    [cell addSubview:btn];
    return cell;
}

//定义每个Item 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    return CGSizeMake((collectionView.width-1)/2, ((collectionView.width-1)/2)*0.6);
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
    
    view = [[UIView alloc] initWithFrame:CGRectMake(10, 110, SCREENWIDTH-20, 80)];
    view.backgroundColor = white_color;
    CGFloat x = 0, y = 0, cx = (SCREENWIDTH-20)/4, cy = 80;

    for (int i = 0; i < 4; i ++) {
        TitleBtn *titlebtn = [[TitleBtn alloc] initWithFrame:CGRectMake(x, y, cx, cy)];
        titlebtn.title = @"医院介绍";
        titlebtn.imageName = @"img";
        [titlebtn setTitleColor:kNormalFontColor forState:UIControlStateNormal];
        [view addSubview:titlebtn];
        x += cx;
    }
    
    [headerView addSubview:view];
    
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20, view.y - 40, 200, 30)];
    label.text = @"中山大学附属医院";
    label.textColor = white_color;
    label.font = HB14;
    [headerView addSubview:label];
    
    UIImageView *imgview = [[UIImageView alloc] initWithFrame:CGRectMake(SCREENWIDTH - 40, view.y - 40, 30, 30)];
    imgview.backgroundColor = red_color;
    [headerView addSubview:imgview];
    
    UIButton *clickbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    clickbtn.frame = CGRectMake(0, view.y - 40, SCREENWIDTH, 30);
    clickbtn.backgroundColor = clear_color;
    [headerView addSubview:clickbtn];
    
    
    return headerView;
}
@end
