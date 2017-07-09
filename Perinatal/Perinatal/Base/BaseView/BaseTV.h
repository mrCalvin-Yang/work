

#import <UIKit/UIKit.h>
#import "RACSubject.h"
@interface BaseTV : UITableView<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) RACSubject *selectItemSignal;
@property (nonatomic, strong) NSMutableArray *dataList;

- (CGFloat)totalHeight;

@end
