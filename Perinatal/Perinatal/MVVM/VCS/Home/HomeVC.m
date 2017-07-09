//
//  HomeVC.m
//  Perinatal
//
//  Created by OY on 2017/7/6.
//  Copyright © 2017年 OY. All rights reserved.
//

#import "HomeVC.h"
#import "HomePageMessageTV.h"
#import "MessageModel.h"
#import "ProblemAskTV.h"
#import "TitleBtn.h"
@interface HomeVC ()
{
    NSArray *titleArr, *imageArr;
}
@property (nonatomic, strong) UIScrollView *scrollView;
//测试model
@property (nonatomic, strong) NSMutableArray *dataArr;
@end

@implementation HomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self showMenuMessageAndLoginOut];
    [self setNavigationBar];
    [self getdata];
    [self setupSubviews];
    
}
//lazy init
-(UIScrollView *)scrollView{
    if (_scrollView == nil) {
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT+64)];
        _scrollView.backgroundColor = white_color;
        _scrollView.showsVerticalScrollIndicator = NO;
        [self.view addSubview:_scrollView];
    }
    return _scrollView;
}
//set nav
-(void)setNavigationBar{
    self.navigationItem.titleView = [UIView new];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    [self setKeyScrollView:self.scrollView scrolOffsetY:122 options:HYHidenControlOptionLeft | HYHidenControlOptionTitle];
}

//getdata
-(void)getdata{
    _dataArr = [NSMutableArray array];
    MessageModel *model = [[MessageModel alloc] init];
    model.pregnantWomanNote = @"撒上看见阿哥克里斯朵夫加辣酱豆腐";
    model.prenatalEducation = @"撒娇饭卡第十届立法局阿里斯顿放假啦";
    model.babyNote          = @"啊就哭了多少积分卡就是打飞机啦可是江东父老看见阿莱克斯大家费拉达斯肌肤";
    [_dataArr addObject:model];
    titleArr = @[@"孕期能否吃",@"孕期忌做",@"孕期该做",@"孕期食谱"];
    imageArr = @[@"img",@"img",@"img",@"img"];
}
//addsubviews
-(void)setupSubviews{
    HomePageMessageTV *messagetv = [[HomePageMessageTV alloc] initWithFrame:CGRectMake(0, -64, SCREENWIDTH, 0)];
    messagetv.tableHeaderView = [self tableHeaderView];
    messagetv.showsVerticalScrollIndicator = NO;
    messagetv.scrollEnabled = NO;
    messagetv.dataList = self.dataArr;
    [messagetv reloadData];
    messagetv.height = messagetv.totalHeight * 3 + 250;
    [_scrollView addSubview:messagetv];
    CGFloat y = messagetv.bottom + 5;
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, y, SCREENWIDTH, 15)];
    lineView.backgroundColor = gray_color;
    lineView.alpha = 0.4;
    [_scrollView addSubview:lineView];
    y = lineView.bottom;
    UIView *toolView = [self canEatViewWithY:y];
    [_scrollView addSubview:toolView];
    y = toolView.bottom;
    lineView = [[UIView alloc] initWithFrame:CGRectMake(0, y, SCREENWIDTH, 15)];
    lineView.backgroundColor = gray_color;
    lineView.alpha = 0.4;
    [_scrollView addSubview:lineView];
    y = lineView.bottom;
    
    ProblemAskTV *patv = [[ProblemAskTV alloc] initWithFrame:CGRectMake(0, y, SCREENWIDTH, 0)];
    patv.showsVerticalScrollIndicator = NO;
    patv.scrollEnabled = NO;
    [patv reloadData];
    patv.height = 390;
    [_scrollView addSubview:patv];
    y = patv.bottom + 20;
    [_scrollView setContentSize:CGSizeMake(SCREENWIDTH, y)];
    
    
}
//add eatview
-(UIView *)canEatViewWithY:(CGFloat)Y{
    UIView *load = [[UIView alloc] initWithFrame:CGRectMake(0, Y, SCREENWIDTH, 100)];
    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat cx = SCREENWIDTH / 4;
    CGFloat cy = 100;
    for (NSInteger i = 0; i < 4; i++) {
        TitleBtn *button = [TitleBtn buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(x, y, cx, cy);
        NSString *title = titleArr[i];
        button.title = title;
        button.titleLabel.font = H12;
        [button setTitleColor:gray_color forState:UIControlStateNormal];
        button.imageName = imageArr[i];
        [load addSubview:button];
        x += cx;
    }
    return load;
}


-(UIView *)tableHeaderView{
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 250)];
    headerView.backgroundColor = global_color;
    UIImageView *imageview = [[UIImageView alloc] initWithFrame:CGRectMake(headerView.center.x - 40, headerView.center.y - 40, 80, 80)];
    imageview.backgroundColor = gray_color;
    imageview.layer.masksToBounds = YES;
    imageview.layer.cornerRadius = 40;
    imageview.layer.borderColor = white_color.CGColor;
    imageview.layer.borderWidth = 1.0f;
    [headerView addSubview:imageview];
    
    UILabel *statusLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, imageview.bottom + 5, SCREENWIDTH, 20)];
    statusLabel.text = @"孕九周+6天";
    statusLabel.font = HB12;
    statusLabel.textAlignment = NSTextAlignmentCenter;
    statusLabel.textColor = white_color;
    [headerView addSubview:statusLabel];
    return headerView;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
