

#import "BaseCV.h"

@implementation BaseCV

- (id)initWithFrame:(CGRect)frame{
    UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    self = [super initWithFrame:frame collectionViewLayout:flowLayout];
    if (self)
    {
        //注册Cell，必须要有
        [self registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"UICollectionViewCell"];
        self.dataSource=self;
        self.delegate=self;
        
        self.backgroundColor = gray_color;
    }
 
    return self;
}

//定义展示的UICollectionViewCell的个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataList.count;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(0, 0);
}

//定义展示的Section的个数
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

//返回这个UICollectionView是否可以被选择
-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}

//每个UICollectionView展示的内容
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * CellIdentifier = @"UICollectionViewCell";
    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    return cell;
}

//定义每个UICollectionView 的 margin
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(5, 5, 5, 5);
}

- (CGFloat)totalHeight{
    
    CGFloat itemWdth = [self collectionView:self layout:nil sizeForItemAtIndexPath:nil].width + [self collectionView:self layout:nil insetForSectionAtIndex:0].left + [self collectionView:self layout:nil insetForSectionAtIndex:0].right;
    
    CGFloat itemHeight = [self collectionView:self layout:nil sizeForItemAtIndexPath:nil].height + [self collectionView:self layout:nil insetForSectionAtIndex:0].top + [self collectionView:self layout:nil insetForSectionAtIndex:0].bottom;
    
    int colCount = [UIScreen mainScreen].bounds.size.width/itemWdth;
    int rowCount = (int)self.dataList.count/colCount;
    if((self.dataList.count%colCount)>0){
        rowCount++;
    }
    
    return itemHeight*rowCount+5;
}

//UICollectionView被选中时调用的方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
//    if (self.selectItemSignal) {
//        [self.selectItemSignal sendNext:indexPath];
//    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
//    if (self.scrollSignal) {
//        [self.scrollSignal sendNext:scrollView];
//    }
}

@end




