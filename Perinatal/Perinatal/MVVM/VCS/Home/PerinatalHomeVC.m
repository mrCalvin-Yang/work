//
//  HomeVC.m
//  Perinatal
//
//  Created by OY on 2017/7/6.
//  Copyright © 2017年 OY. All rights reserved.
//

#import "PerinatalHomeVC.h"
#import "HomePageMessageTV.h"
#import "MessageModel.h"
#import "ProblemAskTV.h"
#import "TitleBtn.h"
#import "PerinatalCanEatVC.h"
#import <ReactiveCocoa.h>
#import "PerinatalProblemAskVC.h"
@interface PerinatalHomeVC ()
{
    NSArray *titleArr, *imageArr;
}
@property (nonatomic, strong) UIScrollView *scrollView;
//测试model
@property (nonatomic, strong) NSMutableArray *dataArr;
@end

@implementation PerinatalHomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.scrollView];
    [self showMenuMessageAndLoginOut];
    [self getdata];
    [self setupSubviews];
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self setNavigationBar];
}

-(void)viewWillDisappear:(BOOL)animated{
//    self.hidesBottomBarWhenPushed = YES;;
//    [self hideTabBar];
}
//lazy init
-(UIScrollView *)scrollView{
    if (_scrollView == nil) {
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT+64)];
        _scrollView.backgroundColor = white_color;
        _scrollView.showsVerticalScrollIndicator = NO;
    }
    return _scrollView;
}
//set nav
-(void)setNavigationBar{
    self.navigationItem.titleView = [UIView new];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:global_color] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
//    [self setKeyScrollView:self.scrollView scrolOffsetY:122 options:HYHidenControlOptionLeft | HYHidenControlOptionTitle];
}





//getdata
-(void)getdata{
    _dataArr = [NSMutableArray array];
    MessageModel *model = [[MessageModel alloc] init];
    model.pregnantWomanNote = @"撒上看见阿哥克里斯朵夫加辣酱豆腐啊深刻的高发家里都快解放啦就是领导机构啦快点放假啊深刻的经历可噶家里都是克己奉公啦家里的咖啡机阿莱克斯的经历法就是打飞机啦啊快速的减肥啊深刻的高发家里都快解放啦就是领导机构啦快点放假啊深刻的经历可噶家里都是克己奉公啦家里的咖啡机阿莱克斯的经历法就是打飞机啦啊快速的减肥";
    model.sectionNumber = 1;
    [_dataArr addObject:model];
    model = [[MessageModel alloc] init];
    model.pregnantWomanNote = @"撒上看见阿哥克里斯朵夫加辣酱豆腐啊深刻的高发家里都快解放啦就是领导机构啦快点放假啊深刻的经历可噶家里都是克己奉公啦家里的咖啡机阿莱克斯的经历法就是打飞机啦啊快速的减肥";
    model.sectionNumber = 2;
    [_dataArr addObject:model];
    
    model = [[MessageModel alloc] init];
    model.pregnantWomanNote = @"撒上看见阿哥克里斯朵夫加辣酱豆腐啊深刻的高发家里都快解放啦就是领导机构啦快点放假啊深刻的";
    model.sectionNumber = 3;
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
    messagetv.height = messagetv.rowHeight + messagetv.tableHeaderView.height;
    [_scrollView addSubview:messagetv];
    CGFloat y = messagetv.bottom + 5;
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, y, SCREENWIDTH, 15)];
    lineView.backgroundColor = kBackColor;
    lineView.alpha = 0.4;
    [_scrollView addSubview:lineView];
    y = lineView.bottom;
    UIView *toolView = [self canEatViewWithY:y];
    [_scrollView addSubview:toolView];
    y = toolView.bottom;
    lineView = [[UIView alloc] initWithFrame:CGRectMake(0, y, SCREENWIDTH, 15)];
    lineView.backgroundColor = kBackColor;
    lineView.alpha = 0.4;
    [_scrollView addSubview:lineView];
    y = lineView.bottom;
    
    UIView *askView = [[UIView alloc] initWithFrame:CGRectMake(0, y, SCREENWIDTH - ui_offset *3, 30)];
    askView.backgroundColor = white_color;
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(ui_offset *1.5, 10, SCREENWIDTH - ui_offset *3, 30)];
    label.text = @"孕期问答";
    label.font = HB16;
    [label sizeToFit];
    label.userInteractionEnabled = YES;
    [askView addSubview:label];
    [_scrollView addSubview:askView];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] init];
    RACSignal *signal = [tap rac_gestureSignal];
    [signal subscribeNext:^(id x) {
        [self pushVC:[PerinatalProblemAskVC new]];
    }];
    [askView addGestureRecognizer:tap];
    y = askView.bottom;
    
    ProblemAskTV *patv = [[ProblemAskTV alloc] initWithFrame:CGRectMake(0, y, SCREENWIDTH, 0)];
    patv.showsVerticalScrollIndicator = NO;
    patv.scrollEnabled = NO;
    [patv reloadData];
    patv.height = 350;
    patv.selectItemSignal = [RACSubject subject];
    [patv.selectItemSignal subscribeNext:^(id x) {
        [self pushVC:[PerinatalProblemAskVC new]];
    }];
    [_scrollView addSubview:patv];
    y = patv.bottom + 119;
    [_scrollView setContentSize:CGSizeMake(SCREENWIDTH, y)];
    
    
}
//add eatview
-(UIView *)canEatViewWithY:(CGFloat)Y{
    UIView *load = [[UIView alloc] initWithFrame:CGRectMake(0, Y, SCREENWIDTH, 100)];
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(ui_offset*1.5, 10, 100, 25)];
    
    titleLabel.text = @"孕妈工具";
    titleLabel.textColor = kImportFontColor;
    titleLabel.font = HB16;
    [titleLabel sizeToFit];
    [load addSubview:titleLabel];
    CGFloat x = 0;
    CGFloat y = 25;
    CGFloat cx = SCREENWIDTH / 4;
    CGFloat cy = 75;
    for (NSInteger i = 0; i < 4; i++) {
        TitleBtn *button = [TitleBtn buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(x, y, cx, cy);
        NSString *title = titleArr[i];
        button.title = title;
        button.titleLabel.font = H12;
        [button setTitleColor:kFontColor forState:UIControlStateNormal];
        button.imageName = imageArr[i];
        [[button rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(UIButton *bt) {
            [self pushVC:[PerinatalCanEatVC new]];
        }];
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
