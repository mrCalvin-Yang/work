//
//  PerinatalDoctorListVC.m
//  Perinatal
//
//  Created by OY on 2017/7/11.
//  Copyright © 2017年 OY. All rights reserved.
//

#import "PerinatalDoctorListVC.h"
#import "PerinatalDoctorTV.h"
#import "PerinatalDoctorHomeVC.h"
#import "PerinatalWantConsultVC.h"
#import "DoctorListVM.h"
#import "DoctorMsgModel.h"

@interface PerinatalDoctorListVC ()<UIScrollViewDelegate>
{
    UISegmentedControl *segment;
    NSInteger pageNo,pageSize;
}
@property(nonatomic,strong)PerinatalDoctorTV *tv;
@property(nonatomic,strong)PerinatalDoctorTV *tv1;
@property(nonatomic,strong)UIScrollView *scrollView;
@property(nonatomic,strong)NSMutableArray *hots;
@property(nonatomic,strong)NSMutableArray *frees;
@end

@implementation PerinatalDoctorListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self showBack];
    pageNo = 1;
    pageSize = 20;
    self.hots = [NSMutableArray array];
    self.frees = [NSMutableArray array];
    segment = [[UISegmentedControl alloc] initWithItems:@[@"热门",@"限时免费"]];
    segment.tintColor = global_color;
    segment.selectedSegmentIndex = 0;
    [segment addTarget:self action:@selector(selectorIndex:) forControlEvents:UIControlEventValueChanged];
    self.navigationItem.titleView = segment;
    [self.view addSubview:self.tv];
    [self.view addSubview:self.tv1];
    [self getData];
    
    
}

-(void)getData{
    if (segment.selectedSegmentIndex == 0) {
        [DoctorListVM getDoctorHotListWithPageNumber:pageNo pageSize:pageSize sucess:^(NSDictionary *respone) {
            if ([respone[@"code"] integerValue] == 0) {
                NSDictionary *data = respone[@"data"];
                NSArray *list = data[@"list"];
                for (NSDictionary *dic in list) {
                    NSError *error;
                    DoctorMsgModel *model = [[DoctorMsgModel alloc] initWithDictionary:dic error:&error];
                    if (error) {
                        
                    }
                    [_hots addObject:model];
                }
                [self setSubviews];
            }
        } fail:^(NSString *error) {
            
        }];
    }else{
        [DoctorListVM getDoctorFreeListWithPageNumber:pageNo pageSize:pageSize sucess:^(NSDictionary *respone) {
            if ([respone[@"code"] integerValue] == 0) {
                NSDictionary *data = respone[@"data"];
                NSArray *list = data[@"list"];
                for (NSDictionary *dic in list) {
                    DoctorMsgModel *model = [[DoctorMsgModel alloc] initWithDictionary:dic error:nil];
                    [_frees addObject:model];
                }
                [self setSubviews];
            }else{
                NSLog(@"%@",respone[@"message"]);
            }
        } fail:^(NSString *error) {
            
        }];
    }
}

-(PerinatalDoctorTV *)tv{
    if (!_tv) {
        _tv = [[PerinatalDoctorTV alloc] initWithFrame:CGRectMake(0, 64, SCREENWIDTH, SCREENHEIGHT-64)];
        _tv.btnClickSignal = [RACSubject subject];
        [_tv.btnClickSignal subscribeNext:^(UIButton *x) {
            if (x.tag < _hots.count) {
                PerinatalWantConsultVC *consultvc = [PerinatalWantConsultVC new];
                consultvc.doctorMsgModel = _hots[x.tag];
                consultvc.typeList = self.typeList;
                consultvc.typeModel = self.typeModel;
                [self pushVC:consultvc];
            }
        }];
        _tv.selectItemSignal = [RACSubject subject];
        [_tv.selectItemSignal subscribeNext:^(NSIndexPath *x) {
            if (x.row < _hots.count) {
                PerinatalDoctorHomeVC *homevc = [PerinatalDoctorHomeVC new];
                homevc.doctorMsgModel = _hots[x.row];
                [self pushVC:homevc];
            }
        }];
    }
    return _tv;
}

-(PerinatalDoctorTV *)tv1{
    if (!_tv1) {
        _tv1 = [[PerinatalDoctorTV alloc] initWithFrame:CGRectMake(0, 64, SCREENWIDTH, SCREENHEIGHT-64)];
        
        _tv1.btnClickSignal = [RACSubject subject];
        [_tv1.btnClickSignal subscribeNext:^(UIButton *x) {
            if (x.tag < _hots.count) {
                PerinatalWantConsultVC *consultvc = [PerinatalWantConsultVC new];
                consultvc.doctorMsgModel = _frees[x.tag];
                [self pushVC:consultvc];
            }
        }];
        _tv1.selectItemSignal = [RACSubject subject];
        [_tv1.selectItemSignal subscribeNext:^(NSIndexPath *x) {
            if (x.row < _hots.count) {
                PerinatalDoctorHomeVC *homevc = [PerinatalDoctorHomeVC new];
                homevc.doctorMsgModel = _frees[x.row];
                [self pushVC:homevc];
            }
        }];
        _tv1.hidden = YES;
    }
    return _tv1;
}

-(void)setSubviews{
    if (segment.selectedSegmentIndex == 0) {
        self.tv.dataList = _hots;
        [self.tv reloadData];
    }else{
        if (_frees.count ==0) {
            _tv1.hidden = YES;
            return;
        }
        _tv1.hidden = NO;
        self.tv1.dataList = _frees;
        [self.tv1 reloadData];
    }
}

-(UIScrollView *)scrollView{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT)];
        _scrollView.backgroundColor = kBackColor;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.bounces = NO;
        _scrollView.contentSize = CGSizeMake(SCREENWIDTH *2, SCREENHEIGHT);
    }
    return _scrollView;
}

-(void)selectorIndex:(UISegmentedControl *)contrl{
    NSInteger index = contrl.selectedSegmentIndex;
    if (index == 1) {
        _tv.hidden = YES;
        if (pageNo == 1 && _frees.count == 0) {
            [self getData];
        }
    }else{
        _tv.hidden = NO;
        _tv1.hidden = YES;
        
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
