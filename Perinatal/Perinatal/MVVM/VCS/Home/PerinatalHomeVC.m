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
#import "PerinatalProblemDetailVC.h"
#import "UIViewController+NavBarHidden.h"
#import "PerinatalLoginVC.h"
#import "HomePageVM.h"
#import "PerinatalPregnacyVC.h"
#import "QuestionModel.h"
#import "BaseNavigationController.h"
#import "JZDatepicker.h"
#import "PerinatalMsgVC.h"
@interface PerinatalHomeVC ()<LogInVCDelegate>
{
    NSArray *titleArr, *imageArr;
}
@property (nonatomic, strong) UIScrollView *scrollView;
//测试model
@property (nonatomic, strong) NSMutableArray *dataArr, *questionArr;

@property (strong, nonatomic) JZDatepicker *datepicker;
@property(nonatomic,strong)UILabel *dataLabel;

@end

@implementation PerinatalHomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.scrollView];
    self.navigationItem.titleView = [UIView new];
    [self setNavBarBackgroundImage:[UIImage imageWithColor:global_color]];
    [self setKeyScrollView:self.scrollView scrolOffsetY:200 options:HYHidenControlOptionLeft];
    self.navigationItem.rightBarButtonItems = @[[self loginOut],[self message]];
    self.navigationItem.leftBarButtonItems = @[[self dataImage],[self dateLabels]];
    [self getdata];
    
}

-(UIBarButtonItem *)dataImage{
    UIBarButtonItem *dateImage = [[UIBarButtonItem alloc] initWithImage:V_IMAGE(@"icon-Calendar") style:UIBarButtonItemStylePlain target:self action:nil];
    dateImage.tintColor = white_color;
    return dateImage;
}

-(UIBarButtonItem *)dateLabels{
    UIBarButtonItem *dateImage = [[UIBarButtonItem alloc] initWithCustomView:self.dataLabel];
    return dateImage;
}

-(UIBarButtonItem *)loginOut{
    UIBarButtonItem *rightBar = [[UIBarButtonItem alloc] initWithImage:V_IMAGE(@"icon-Messages On") style:UIBarButtonItemStylePlain target:self action:@selector(onClick:)];
    rightBar.tag = 1000;
    rightBar.tintColor = white_color;
    return rightBar;
}
-(UIBarButtonItem *)message{
    UIBarButtonItem *rightBar = [[UIBarButtonItem alloc] initWithImage:V_IMAGE(@"icon-Today") style:UIBarButtonItemStylePlain target:self action:@selector(onClick:)];
    rightBar.tag = 1001;
    rightBar.tintColor = white_color;
    return rightBar;
}

-(UILabel *)dataLabel{
    if (!_dataLabel) {
        _dataLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 80, 17)];
        _dataLabel.textColor = white_color;
        _dataLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _dataLabel;
}


-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self hy_viewWillAppear:animated];
//    [self pushVC:[PerinatalPregnacyVC new]];
    
}

-(void)didRecvLogInResult:(id)sender result:(BOOL)flag{
    if (flag) {
        [self getdata];
    }
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self hy_viewWillDisappear:animated];
}

-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    [self hy_viewDidDisappear:animated];
}
//lazy init
-(UIScrollView *)scrollView{
    if (_scrollView == nil) {
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, -64, SCREENWIDTH, SCREENHEIGHT+64)];
        _scrollView.backgroundColor = white_color;
        _scrollView.showsVerticalScrollIndicator = NO;
    }
    return _scrollView;
}
//set nav
-(void)setNavigationBar{
    self.navigationController.navigationBar.hidden = YES;
    UIView *navView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 64)];
    navView.backgroundColor = global_color;
    navView.alpha = 1;
    [navView bringSubviewToFront:self.scrollView];
    [self.view addSubview:navView];
}




//getdata
-(void)getdata{
    _dataArr = [NSMutableArray array];
    _questionArr = [NSMutableArray array];
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [HomePageVM getHomePageDataSucess:^(NSDictionary *respone) {
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        if ([[respone valueForKeyPath:@"code"] integerValue] == 0) {
            NSDictionary *data = [respone valueForKeyPath:@"data"];
            for (NSInteger i = 1; i < 4; i++) {
                MessageModel *messageModel = [[MessageModel alloc] initWithDic:data withIndex:i];
                [_dataArr addObject:messageModel];
            }
            NSArray *arr = [data valueForKeyPath:@"questionVoList"];
            if (![NSArray isEmpty:arr]) {
                for (NSDictionary *dic in arr) {
                    QuestionModel *model = [[QuestionModel alloc] initWithDictionary:dic error:nil];
                    [_questionArr addObject:model];
                }
            }
            [self setupSubviews];
        }else if ([[respone valueForKeyPath:@"code"] integerValue] == -7){
            PerinatalLoginVC *login = [PerinatalLoginVC new];
            login.delegate = self;
            [self presentVC:[[BaseNavigationController alloc] initWithRootViewController:login]];
        }else{
            [self showButtonWithTip:respone[@"message"] clickBlock:^{
                [self getdata];
            }];
        }
    } fail:^(NSString *error) {
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        [self showButtonWithTip:error clickBlock:^{
            [self getdata];
        }];
    }];
    titleArr = @[@"孕期能否吃",@"孕期忌做",@"孕期该做",@"孕期食谱"];
    imageArr = @[@"icon-PW Tools1",@"icon-PW Tools2",@"icon-PW Tools3",@"icon-PW Tools4"];
}
//addsubviews
-(void)setupSubviews{
    UIView *headView = [self tableHeaderView];
    [self.scrollView addSubview:headView];
    CGFloat y = headView.bottom;
    HomePageMessageTV *messagetv = [[HomePageMessageTV alloc] initWithFrame:CGRectMake(0, y, SCREENWIDTH, 0)];
    messagetv.showsVerticalScrollIndicator = NO;
    messagetv.scrollEnabled = NO;
    messagetv.dataList = self.dataArr;
    [messagetv reloadData];
    messagetv.height = messagetv.totalHeight;
    [_scrollView addSubview:messagetv];
    y = messagetv.bottom;
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
    if (_questionArr.count > 0) {
        UIView *askView = [[UIView alloc] initWithFrame:CGRectMake(0, y, SCREENWIDTH - ui_offset *3, 45)];
        askView.backgroundColor = white_color;
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(ui_offset *1.5, 11, SCREENWIDTH - ui_offset *3, 22)];
        label.text = @"孕期问答";
        label.font = HB16;
        [label sizeToFit];
        label.userInteractionEnabled = YES;
        [askView addSubview:label];
        [_scrollView addSubview:askView];
        UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(ui_offset *1.5, askView.bottom, SCREENWIDTH-15, 1)];
        lineView.backgroundColor = kLineColor;
        lineView.alpha = 0.4;
        [_scrollView addSubview:lineView];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] init];
        RACSignal *signal = [tap rac_gestureSignal];
        [signal subscribeNext:^(id x) {
            [self pushVC:[PerinatalProblemAskVC new]];
        }];
        [askView addGestureRecognizer:tap];
        y = lineView.bottom;
        
        ProblemAskTV *patv = [[ProblemAskTV alloc] initWithFrame:CGRectMake(0, y, SCREENWIDTH, 0)];
        patv.showsVerticalScrollIndicator = NO;
        patv.scrollEnabled = NO;
        patv.dataList = _questionArr;
        [patv reloadData];
        patv.height = 175*_questionArr.count;
        patv.selectItemSignal = [RACSubject subject];
        [patv.selectItemSignal subscribeNext:^(NSIndexPath *x) {
            PerinatalProblemDetailVC *detaivc = [PerinatalProblemDetailVC new];
            detaivc.model = _questionArr[x.row];
            [self pushVC:detaivc];
        }];
        [_scrollView addSubview:patv];
        y = patv.bottom;
    }
    [_scrollView setContentSize:CGSizeMake(SCREENWIDTH, y+64+44)];
    
    
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
    UIImageView *headerView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT * 0.38)];
    headerView.userInteractionEnabled = YES;
    headerView.image = V_IMAGE(@"homeBg");
    UIImageView *imageview = [[UIImageView alloc] initWithFrame:CGRectMake(headerView.center.x - 40, headerView.center.y - 40, 80, 80)];
    imageview.backgroundColor = gray_color;
    imageview.layer.masksToBounds = YES;
    imageview.layer.cornerRadius = 40;
    imageview.layer.borderColor = white_color.CGColor;
    imageview.layer.borderWidth = 4.0f;
    [headerView addSubview:imageview];
    
    UILabel *statusLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, imageview.bottom + 5, SCREENWIDTH, 20)];
    statusLabel.text = @"孕九周+6天";
    statusLabel.font = HB12;
    statusLabel.textAlignment = NSTextAlignmentCenter;
    statusLabel.textColor = white_color;
    [headerView addSubview:statusLabel];
    
    self.datepicker = [[JZDatepicker alloc] initWithFrame:CGRectMake(0, headerView.bottom - (SCREENWIDTH -10)/7-2, SCREENWIDTH, (SCREENWIDTH -10)/7)];
    [self.datepicker addTarget:self action:@selector(updateSelectedDate) forControlEvents:UIControlEventValueChanged];
    
    [self.datepicker fillDatesFromDate:[NSDate date] numberOfDays:1000];
    
    [self.datepicker selectDateAtIndex:0];
    
    [self.datepicker setTintColor:[UIColor clearColor]];
    [headerView addSubview:self.datepicker];
    return headerView;
}

- (void)updateSelectedDate
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"MM月dd日"];
    self.dataLabel.text = [formatter stringFromDate:self.datepicker.selectedDate];
}

-(void)onClick:(UIBarButtonItem *)item{
    if (item.tag == 1000) {
        [self pushVC:[PerinatalMsgVC new]];
    }else{
        [self.datepicker resetSelectedDate];
    }
}

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
