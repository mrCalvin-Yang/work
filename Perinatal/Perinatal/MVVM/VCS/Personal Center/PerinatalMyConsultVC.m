//
//  PerinatalMyConsultVC.m
//  Perinatal
//
//  Created by OY on 2017/7/16.
//  Copyright © 2017年 OY. All rights reserved.
//

#import "PerinatalMyConsultVC.h"
#import "PerinatalMyConsultView.h"
#import "PerinatalProblemAskTypeVC.h"
#import "QuestionConsultationVM.h"
#import "MyConsultationTV.h"
#import "MyConsultationModel.h"
#import "PerinatalMyConsultDetailVC.h"
#import "PerinatalMyConsultIsPayDetailVC.h"
#import "PerinatalMyConsultNoPayDetailVC.h"
#import "PerinatalMyConsultNoAskDetailVC.h"
#import "PerinatalMyConsultAskedDetailVC.h"
#import "PerinatalMyConsultIsCommentDetailVC.h"
#import "PerinatalMyConsultShutDownDetailVC.h"
#import "PerinatalMyConsultClosedDetailVC.h"

@interface PerinatalMyConsultVC (){
    BOOL isLoad;
    NSInteger pageNumber;
    NSInteger pageSize;
}
@property(nonatomic,strong)PerinatalMyConsultView *NoConsultView;
@property(nonatomic,strong)UISegmentedControl *segmentControl;
@property(nonatomic,assign)NSInteger selectIndex;
@property(nonatomic,strong)MyConsultationTV *tableView1;
@property(nonatomic,strong)MyConsultationTV *tableView2;
@property(nonatomic,strong)NSMutableArray *isConsultArr, *noConsultArr;
@end

@implementation PerinatalMyConsultVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self showBack];
    _isConsultArr = [NSMutableArray array];
    _noConsultArr = [NSMutableArray array];
    pageSize = 20;
    pageNumber = 1;
    isLoad = NO;
    if (_code == 1) {
        self.navigationItem.titleView = self.segmentControl;
        [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        [self getData];
    }else{
        [self showTitle:@"我的咨询"];
        [self.view addSubview:self.NoConsultView];
    }
}


-(void)getData{
    if (_selectIndex == 0) {
        [QuestionConsultationVM getMyConsultationWithStatus:_selectIndex pageNumber:pageNumber pagesize:pageSize sucess:^(NSDictionary *respone) {
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            
            if ([[respone valueForKeyPath:@"code"] integerValue] == 0) {
                NSDictionary *data = [respone valueForKeyPath:@"data"];
                NSArray *list = data[@"list"];
                if (![NSArray isEmpty:list]) {
                    for (NSDictionary *dic in list) {
                        MyConsultationModel *model = [[MyConsultationModel alloc] initWithDictionary:dic error:nil];
                        [_isConsultArr addObject:model];
                    }
                    self.tableView1.dataList = _isConsultArr;
                    [self.tableView1 reloadData];
                    [self.view addSubview:self.tableView1];
                }
            }else{
                [self showToastWithMessage:respone[@"message"] detaly:2.f];
            }
        } fail:^(NSString *error) {
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            [self showToastWithMessage:error detaly:2.f];
        }];
    }else{
        [QuestionConsultationVM getMyConsultationWithStatus:_selectIndex pageNumber:pageNumber pagesize:pageSize sucess:^(NSDictionary *respone) {
            isLoad = YES;
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            NSArray *data = [respone valueForKeyPath:@"data"];
            if (![NSArray isEmpty:data]) {
                for (NSDictionary *dic in data) {
                    MyConsultationModel *model = [[MyConsultationModel alloc] initWithDictionary:dic error:nil];
                    [_noConsultArr addObject:model];
                }
                self.tableView2.dataList = _noConsultArr;
                [self.tableView2 reloadData];
                [self.view addSubview:self.tableView2];
            }else{
                [self showToastWithMessage:respone[@"message"] detaly:2.f];
            }
        } fail:^(NSString *error) {
            [MBProgressHUD hideHUDForView:self.view animated:YES];
        }];
    }
}

-(UISegmentedControl *)segmentControl{
    if (!_segmentControl) {
        _segmentControl = [[UISegmentedControl alloc] initWithItems:@[@"咨询中",@"已解决"]];
        _segmentControl.frame = CGRectMake(0, 0, 202, 28);
        _segmentControl.tintColor = global_color;
        _segmentControl.selectedSegmentIndex = 0;
        _selectIndex = _segmentControl.selectedSegmentIndex;
        [_segmentControl addTarget:self action:@selector(swithOnVlaueChange:) forControlEvents:UIControlEventValueChanged];
    }
    return _segmentControl;
}

-(PerinatalMyConsultView *)NoConsultView{
    if (!_NoConsultView) {
        _NoConsultView = [[PerinatalMyConsultView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT)];
        _NoConsultView.btnSelete = [RACSubject subject];
        [_NoConsultView.btnSelete subscribeNext:^(id x) {
            [self pushVC:[PerinatalProblemAskTypeVC new]];
        }];
    }
    return _NoConsultView;
}

-(MyConsultationTV *)tableView1{
    if (!_tableView1) {
        _tableView1 = [[MyConsultationTV alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT) style:UITableViewStyleGrouped];
        _tableView1.backgroundColor = kBackColor;
        _tableView1.selectItemSignal = [RACSubject subject];
        [_tableView1.selectItemSignal subscribeNext:^(NSIndexPath *x) {
            if (x.row == 0) {
                [self pushVCWithOrdstatus:_isConsultArr[x.section]];
            }
        }];
    }
    return _tableView1;
}

-(void)pushVCWithOrdstatus:(MyConsultationModel *)model{
    OrderStatus status = [model getOrderStatusWithQuestionStatus:model.questionStatus];
    PerinatalMyConsultDetailVC *vc;
//    if (status == OrderStatusNoPay) {
//        PerinatalMyConsultNoPayDetailVC *vc = [PerinatalMyConsultNoPayDetailVC new];
//        
//    }else if (status == OrderStatusIsPay){
//        
//    }else if (status == OrderStatusTimeOut){
//        
//    }else if (status == OrderStatusRefunding){
//        
//    }else if (status == OrderStatusRefunded){
//        
//    }else if (status == OrderStatusAnswerd){
//        
//    }else if (status == OrderStatusShutDown){
//        
//    }else if (status == OrderStatusClosed){
//        
//    }else if (status == OrderStatusEvaluate){
//        
//    }else{
//        
//    }
    switch (status) {
        case OrderStatusNoPay:
            vc = [PerinatalMyConsultNoPayDetailVC new];
            break;
        case OrderStatusIsPay:
            vc = [PerinatalMyConsultIsPayDetailVC new];
            break;
        case OrderStatusTimeOut:
            vc = [PerinatalMyConsultClosedDetailVC new];
            break;
        case OrderStatusRefunding:
            vc = [PerinatalMyConsultNoAskDetailVC new];
            break;
        case OrderStatusRefunded:
            vc = [PerinatalMyConsultClosedDetailVC new];
            break;
        case OrderStatusAnswerd:
            vc = [PerinatalMyConsultAskedDetailVC new];
            break;
        case OrderStatusShutDown:
            vc = [PerinatalMyConsultShutDownDetailVC new];
            break;
        case OrderStatusClosed:
            vc = [PerinatalMyConsultClosedDetailVC new];
            break;
        case OrderStatusEvaluate:
            vc = [PerinatalMyConsultIsCommentDetailVC new];
            break;
        case OrderStatusBeAnswerd:
            vc = [PerinatalMyConsultIsPayDetailVC new];
            break;
        default:
            break;
    }
    vc.model = model;
    [self pushVC:vc];
}

-(MyConsultationTV *)tableView2{
    _tableView2 = [[MyConsultationTV alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT) style:UITableViewStyleGrouped];
    _tableView2.backgroundColor = kBackColor;
    _tableView2.selectItemSignal = [RACSubject subject];
    [_tableView2.selectItemSignal subscribeNext:^(NSIndexPath *x) {
        if (x.row == 0) {
            PerinatalMyConsultDetailVC *vc = [PerinatalMyConsultDetailVC new];
            vc.model = _noConsultArr[x.section];
            [self pushVC:vc];
        }
    }];
    return _tableView2;
}

-(void)swithOnVlaueChange:(UISegmentedControl *)control{
    _selectIndex = control.selectedSegmentIndex;
    if (control.selectedSegmentIndex == 1) {
        if (!isLoad) {
            [self getData];
        }
        self.tableView1.hidden = YES;
        self.tableView2.hidden = NO;
    }else{
        self.tableView2.hidden = YES;
        self.tableView1.hidden = NO;
    }
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
