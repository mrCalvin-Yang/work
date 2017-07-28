//
//  QuestionHeadView.m
//  Perinatal
//
//  Created by OY on 2017/7/26.
//  Copyright © 2017年 OY. All rights reserved.
//

#import "QuestionHeadView.h"
#import <UIKit+AFNetworking.h>

@interface QuestionHeadView ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic,strong)UILabel *costLabel;
@property(nonatomic,strong)UILabel *sourceLabel;
@property(nonatomic,strong)UILabel *lineLabel;
@property(nonatomic,strong)UILabel *askLabel;
@property(nonatomic,strong)UILabel *contentLabel;
@property(nonatomic,strong)UICollectionView *imageView;
@property(nonatomic,strong)NSMutableArray *imageArr;
@property(nonatomic,copy)NSString *content;
@property(nonatomic,assign)CGFloat viewHeight,contenHeight;
@end

@implementation QuestionHeadView

-(instancetype)initWithFrame:(CGRect)frame Images:(NSArray *)images content:(NSString *)content{
    if (self = [super initWithFrame:frame]) {
        if (images.count > 0) {
            self.imageArr = [NSMutableArray arrayWithArray:images];
        }
        self.contenHeight = 0;
        if (content) {
            self.content = content;
            CGRect rect = [content boundingRectWithSize:CGSizeMake(SCREENWIDTH-30, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:H14} context:nil];
            self.contenHeight = rect.size.height;
        }
        [self setUp];
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    if (self.imageArr) {
        self.viewHeight = self.imageView.bottom;
    }else{
        self.viewHeight = self.contentLabel.bottom;
    }
}

-(void)setUp{
    [self.costLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(14);
        make.left.offset(15);
        make.size.mas_equalTo(CGSizeMake(50, 20));
    }];
    [self.sourceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(15);
        make.right.offset(-15);
        make.size.mas_equalTo(CGSizeMake(60, 18));
    }];
    [self.lineLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(15);
        make.top.equalTo(self.costLabel.mas_bottom).with.offset(14);
        make.right.offset(0);
        make.height.offset(1);
    }];
    [self.askLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(15);
        make.top.equalTo(self.lineLabel.mas_bottom).with.offset(15);
        make.size.mas_equalTo(CGSizeMake(80, 18));
    }];
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(15);
        make.top.equalTo(self.askLabel.mas_bottom).with.offset(15);
        make.right.offset(-15);
        make.height.offset(self.contenHeight);
    }];
    if (self.imageArr) {
        [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.offset(15);
            make.top.equalTo(self.contentLabel.mas_bottom).with.offset(15);
            make.right.offset(-15);
            make.height.offset((SCREENWIDTH-15)/4 + 15);
        }];
    }
}

-(void)setCost:(NSString *)cost{
    if (cost) {
        _cost = cost;
        self.costLabel.text = string(@"¥", cost);
    }
}

-(void)setResource:(NSString *)resource{
    if (resource) {
        _resource = resource;
        self.sourceLabel.text = resource;
    }
}

-(UILabel *)costLabel{
    if (!_costLabel) {
        _costLabel = [[UILabel alloc] init];
        _costLabel.font = H14;
        _costLabel.textColor = RGBCOLOR(227, 21, 25);
        [self addSubview:_costLabel];
    }
    return _costLabel;
}

-(UILabel *)sourceLabel{
    if (!_sourceLabel) {
        _sourceLabel = [[UILabel alloc] init];
        _sourceLabel.font = H10;
        _sourceLabel.textColor = kFontColor;
        _sourceLabel.textAlignment = NSTextAlignmentCenter;
        _sourceLabel.layer.masksToBounds = YES;
        _sourceLabel.layer.borderWidth = 1.f;
        _sourceLabel.layer.borderColor = kLineColor.CGColor;
        _sourceLabel.layer.cornerRadius = 9.f;
        [self addSubview:_sourceLabel];
    }
    return _sourceLabel;
}

-(UILabel *)lineLabel{
    if (!_lineLabel) {
        _lineLabel = [[UILabel alloc] init];
        _lineLabel.backgroundColor = kLineColor;
        [self addSubview:_lineLabel];
    }
    return _lineLabel;
}

-(UILabel *)askLabel{
    if (!_askLabel) {
        _askLabel = [[UILabel alloc] init];
        _askLabel.text = @"患者提问";
        _askLabel.font = H14;
        _askLabel.textColor = kFontColor;
        [_askLabel sizeToFit];
        [self addSubview:_askLabel];
    }
    return _askLabel;
}

-(UILabel *)contentLabel{
    if (!_contentLabel) {
        _contentLabel = [[UILabel alloc] init];
        _contentLabel.font = H14;
        _contentLabel.text = self.content;
        [_contentLabel sizeToFit];
        _contentLabel.numberOfLines = 0;
        [self addSubview:_contentLabel];
    }
    return _contentLabel;
}

+(CGFloat)contentHeight:(NSString *)problemstr{
    CGRect rect = [problemstr boundingRectWithSize:CGSizeMake(SCREENWIDTH-30, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:H14} context:nil];
    return rect.size.height + 30;
}

-(UICollectionView *)imageView{
    if (!_imageView) {
        UICollectionViewFlowLayout *collectionViewLayout = [[UICollectionViewFlowLayout alloc] init];
        [collectionViewLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
        collectionViewLayout.minimumLineSpacing = 1;
        collectionViewLayout.minimumInteritemSpacing = 15;
        collectionViewLayout.itemSize = CGSizeMake((SCREENWIDTH-15)/4, (SCREENWIDTH-15)/4);
        _imageView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, self.contentLabel.bottom, SCREENWIDTH, (SCREENWIDTH-15)/4) collectionViewLayout:collectionViewLayout];
        [_imageView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"imageviewcell"];
        [_imageView setBackgroundColor:[UIColor clearColor]];
        [_imageView setShowsHorizontalScrollIndicator:NO];
        [_imageView setAllowsMultipleSelection:NO];
        _imageView.dataSource = self;
        _imageView.delegate = self;
        _imageView.scrollsToTop = NO;
        [self addSubview:_imageView];
    }
    return _imageView;
}

#pragma mark - UICollectionView Delegate

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return  self.imageArr.count;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"imageviewcell" forIndexPath:indexPath];
    if (!cell) {
        cell = [[UICollectionViewCell alloc] initWithFrame:CGRectMake(0, 0, (SCREENWIDTH-15)/4, (SCREENWIDTH-15)/4)];
    }
    UIImageView *view = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, (SCREENWIDTH-15)/4, (SCREENWIDTH-15)/4)];
    [view setImageWithURL:URL(self.imageArr[indexPath.row])];
    [cell addSubview:view];
    
    return cell;
}

//-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
//{
//    JZDatepickerMonthView *view = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:kJZDatepickerHeaderIdentifier forIndexPath:indexPath];
//    // use first date's month
//    NSDate *date = [self daysArrayInSection:indexPath.section].firstObject;
//    view.date = date;
//    return view;
//}



- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    //[self.datesCollectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
}

@end
