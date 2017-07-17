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

@interface PerinatalDoctorListVC ()<UIScrollViewDelegate>
{
    PerinatalDoctorTV *tv;
    PerinatalDoctorTV *tv1;
    UISegmentedControl *segment;
}
@property(nonatomic,strong)UIScrollView *scrollView;
@end

@implementation PerinatalDoctorListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self showBack];
//    [self.view addSubview:self.scrollView];
    
    
}

-(void)setSubviews{
    
    segment = [[UISegmentedControl alloc] initWithItems:@[@"热门",@"限时免费"]];
    segment.tintColor = global_color;
    segment.selectedSegmentIndex = 0;
    [segment addTarget:self action:@selector(selectorIndex:) forControlEvents:UIControlEventValueChanged];
    self.navigationItem.titleView = segment;
    tv = [[PerinatalDoctorTV alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT-64)];
    [tv reloadData];
    tv.btnClickSignal = [RACSubject subject];
    [tv.btnClickSignal subscribeNext:^(UIButton *x) {
        NSLog(@"点击table1 %ld %ld",segment.selectedSegmentIndex,x.tag);
        [self pushVC:[PerinatalWantConsultVC new]];
    }];
    tv.selectItemSignal = [RACSubject subject];
    [tv.selectItemSignal subscribeNext:^(id x) {
        [self pushVC:[PerinatalDoctorHomeVC new]];
    }];
    tv.hidden = NO;
    [self.view addSubview:tv];
    tv1 = [[PerinatalDoctorTV alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT-64)];
    [tv1 reloadData];
    tv1.btnClickSignal = [RACSubject subject];
    [tv1.btnClickSignal subscribeNext:^(UIButton *x) {
        NSLog(@"点击table2 %ld %ld",segment.selectedSegmentIndex,x.tag);
        [self pushVC:[PerinatalWantConsultVC new]];
    }];
    tv1.selectItemSignal = [RACSubject subject];
    [tv1.selectItemSignal subscribeNext:^(id x) {
        [self pushVC:[PerinatalDoctorHomeVC new]];
    }];
    tv1.hidden = YES;
    [self.view addSubview:tv1];
    
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
        tv.hidden = YES;
        tv1.hidden = NO;
    }else{
        tv.hidden = NO;
        tv1.hidden = YES;
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
