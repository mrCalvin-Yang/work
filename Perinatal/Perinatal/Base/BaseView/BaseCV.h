


#import <UIKit/UIKit.h>
#import "RACSubject.h"

@interface BaseCV : UICollectionView <UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic, strong) NSMutableArray *dataList;
@property (nonatomic, strong) UIViewController *vc;
@property (nonatomic, strong) RACSubject *selectItemSignal;
@property (nonatomic, strong) RACSubject *scrollSignal;

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath;
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath;

- (CGFloat)totalHeight;

@end
