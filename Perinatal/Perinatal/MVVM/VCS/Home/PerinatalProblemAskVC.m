//
//  PerinatalProblemAskVC.m
//  Perinatal
//
//  Created by OY on 2017/7/11.
//  Copyright © 2017年 OY. All rights reserved.
//

#import "PerinatalProblemAskVC.h"
#import "ProblemAskTV.h"
#import "PerinatalProblemAskTypeVC.h"
#import "ProblemAskListVM.h"
#import "QuestionModel.h"
#import "PerinatalProblemDetailVC.h"
@interface PerinatalProblemAskVC ()
{
    NSInteger pageNo,pageSize;
}
@property(nonatomic, strong)ProblemAskTV *tv;
@property(nonatomic,strong)NSMutableArray *dataArr;
@end

@implementation PerinatalProblemAskVC

- (void)viewDidLoad {
    [super viewDidLoad];
    pageNo = 1;
    pageSize = 20;
    self.title = @"孕期问答";
    self.view.backgroundColor = kBackColor;
    [self showTitle:self.title];
    [self showBack];
    [self.view addSubview:self.tv];
    [_tv setMj_header:[MJRefreshHeader headerWithRefreshingBlock:^{
        pageNo = 1;
        [self getData];
    }]];
    [_tv.mj_header setBackgroundColor:kBackColor];
    [_tv setMj_footer:[MJRefreshFooter footerWithRefreshingBlock:^{
        pageNo += 1;
        [self getData];
    }]];
    
    [_tv.mj_header beginRefreshing];
    
    
    
}

-(ProblemAskTV *)tv{
    if (!_tv) {
        _tv = [[ProblemAskTV alloc] initWithFrame:CGRectMake(0, 64, SCREENWIDTH, SCREENHEIGHT -50- 64) style:UITableViewStyleGrouped];
        _tv.showsVerticalScrollIndicator = NO;
        _tv.selectItemSignal = [RACSubject subject];
        [_tv.selectItemSignal subscribeNext:^(NSIndexPath *x) {
            PerinatalProblemDetailVC *detaivc = [PerinatalProblemDetailVC new];
            detaivc.model = _dataArr[x.row];
            [self pushVC:detaivc];
        }];
    }
    return _tv;
}

-(void)getData{
    [ProblemAskListVM getProblemAskListWithPage:pageNo pageSize:pageSize sucess:^(NSArray *respone) {
        [_tv.mj_header endRefreshing];
        if (pageNo == 1) {
            [self.dataArr removeAllObjects];
        }
        self.dataArr = [NSMutableArray arrayWithArray:respone];
        [self setSubviews];
    } fail:^(NSString *error) {
        
    }];
}

-(void)setSubviews{
    _tv.dataList = _dataArr;
    [_tv reloadData];
    
    UIButton *bt = [[UIButton alloc] init];
    [bt setTitle:@"我要咨询" forState:UIControlStateNormal];
    [bt setTitleColor:white_color forState:UIControlStateNormal];
    bt.backgroundColor = global_color;
    [[bt rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        [self pushVC:[ PerinatalProblemAskTypeVC new]];
    }];
    [self.view addSubview:bt];
    [bt mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(SCREENWIDTH, 50));
        make.left.bottom.right.offset(0);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
