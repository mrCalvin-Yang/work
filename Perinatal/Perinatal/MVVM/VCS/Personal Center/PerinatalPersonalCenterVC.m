//
//  PersonalCenterVC.m
//  Perinatal
//
//  Created by OY on 2017/7/6.
//  Copyright © 2017年 OY. All rights reserved.
//

#import "PerinatalPersonalCenterVC.h"
#import <CoreLocation/CoreLocation.h>
#import "PerinatalUserMessageVC.h"
#import "PerinatalMyCardVC.h"
#import "PrinatalCareDcotorVC.h"
#import "PerinatalSettingVC.h"
#import "PerinatalMyIncomeVC.h"
#import "PerinatalMyConsultVC.h"

@interface PerinatalPersonalCenterVC ()<UITableViewDelegate,UITableViewDataSource,CLLocationManagerDelegate>
{
    NSArray *_imageArr, *_titleArr;
    UIImageView *_topImageView;
    UILabel *_nameLabel,*_statusLabel;
    UIButton *_rightBt;
}
@property(nonatomic, strong) UITableView *personTableView;
//http://www.jianshu.com/p/ef09929aa931
@end

@implementation PerinatalPersonalCenterVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = white_color;
    [self showItemImg];
    [self getData];
    [self.view addSubview:self.personTableView];
}

-(void)getData{
    _titleArr = @[@"当前医院",@"我的就诊卡",@"我的咨询",@"关注的医生",@"我的收益"];
    _imageArr = @[@"icon-Hospital",@"icon-Treatment Card",@"icon-My Advisory",@"icon-My Follow",@"icon-My Wallet"];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self setNavsubview];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self showWhiteNav];
}
//setnav
-(void)setNavsubview{
    self.navigationItem.titleView = [UIView new];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:global_color] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
}

//lazy init
-(UITableView *)personTableView{
    if (!_personTableView) {
        _personTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT) style:UITableViewStyleGrouped];
        _personTableView.contentInset = UIEdgeInsetsMake(-64, 0, 0, 0);
        _personTableView.delegate = self;
        _personTableView.dataSource = self;
        _personTableView.separatorColor = kLineColor;
        _personTableView.tableHeaderView = [self creatTableHeadview];
    }
    return _personTableView;
}

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleDefault;
}

//datasource
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifer = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifer];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifer];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    if (indexPath.section == 0) {
        cell.imageView.image = V_IMAGE(_imageArr[indexPath.row]);
        cell.textLabel.text = _titleArr[indexPath.row];
        if (indexPath.row == 0) {
            cell.detailTextLabel.text = @"中山大学附属医院";
        }
    }else{
        cell.imageView.image = V_IMAGE(@"icon-Setting");
        cell.textLabel.text = @"设置";
    }
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return section == 0 ? 5 : 1;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

-(UIView *)creatTableHeadview{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 150)];
    view.backgroundColor = global_color;
    _topImageView = [[UIImageView alloc] init];
    _topImageView.backgroundColor = kBackColor;
    _topImageView.layer.masksToBounds = YES;
    _topImageView.layer.cornerRadius = 32.f;
    [view addSubview:_topImageView];
    
    _nameLabel = [[UILabel alloc] init];
    _nameLabel.font = H16;
    _nameLabel.textColor = white_color;
    [view addSubview:_nameLabel];
    
    _statusLabel = [[UILabel alloc] init];
    _statusLabel.font = H12;
    _statusLabel.textColor = white_color;
    [view addSubview:_statusLabel];
    
    _rightBt = [UIButton buttonWithType:UIButtonTypeCustom];
    [_rightBt setImage:V_IMAGE(@"icon-arrow") forState:UIControlStateNormal];
    [view addSubview:_rightBt];
    
#if DEBUG
    _nameLabel.text = @"朴泰贤";
    _statusLabel.text = @"孕9周+5天";
#endif
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] init];
    [[tap rac_gestureSignal] subscribeNext:^(id x) {
        [self pushVC:[PerinatalUserMessageVC new]];
    }];
    [view addGestureRecognizer:tap];
    [_topImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(64, 64));
        make.left.offset(21);
        make.top.offset(75);
    }];
    
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(60, 22));
        make.left.equalTo(_topImageView.mas_right).with.offset(15);
        make.top.offset(84);
    }];
    
    [_statusLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_topImageView.mas_right).with.offset(15);
        make.top.equalTo(_nameLabel.mas_bottom).with.offset(6);
        make.size.mas_equalTo(CGSizeMake(80, 17));
        
    }];
    
    [_rightBt mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(16, 16));
        make.centerY.equalTo(_topImageView);
        make.right.offset(-12);
    }];
    
    return view;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return section == 0 ? 15.f : 0.1f;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        switch (indexPath.row) {
            case 0:
                
                break;
            case 1:
                [self pushVC:[PerinatalMyCardVC new]];
                break;
            case 2:
                
                break;
            case 3:
                [self pushVC:[PrinatalCareDcotorVC new]];
                break;
            case 4:
                [self pushVC:[PerinatalMyIncomeVC new]];
                break;
            default:
                break;
        }
    }else{
        [self pushVC:[PerinatalSettingVC new]];
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
