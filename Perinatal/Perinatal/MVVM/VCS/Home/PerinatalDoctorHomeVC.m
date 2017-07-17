//
//  PerinatalDoctorHomeVC.m
//  Perinatal
//
//  Created by OY on 2017/7/12.
//  Copyright © 2017年 OY. All rights reserved.
//

#import "PerinatalDoctorHomeVC.h"
#import "DoctorHomeTV.h"
#import "PerinatalWantConsultVC.h"
@interface PerinatalDoctorHomeVC ()
@property(nonatomic,strong)DoctorHomeTV *homeTv;
@end

@implementation PerinatalDoctorHomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self showTitle:@"医生主页"];
    [self showBack];
    [self showRightBarWithNormal:@"关注" selectedImg:@"" block:^(UIBarButtonItem *sender) {
        
    }];
    
}

-(void)setSubviews{
    [self.view addSubview:self.homeTv];
    
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.text = @"付费咨询:¥50";
    titleLabel.font = H14;
    titleLabel.backgroundColor = RGBCOLOR(255, 236, 240);
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
//    button.frame = CGRectMake(SCREENWIDTH - 150, SCREENHEIGHT - 48.f, 150, 48);
    [button setTitle:@"去咨询" forState:UIControlStateNormal];
    button.titleLabel.font = H14;
    [button setTitleColor:white_color forState:UIControlStateNormal];
    button.backgroundColor = RGBCOLOR(255, 69, 106);
    [button addTarget:self action:@selector(btnCommit:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    [self.view addSubview:titleLabel];
    
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(SCREENWIDTH - 150, 48));
        make.left.bottom.offset(0);
    }];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(150, 48));
        make.right.bottom.offset(0);
        make.left.equalTo(titleLabel.mas_right).with.offset(0);
    }];
}

-(DoctorHomeTV *)homeTv{
    if (!_homeTv) {
        _homeTv = [[DoctorHomeTV alloc] initWithFrame:CGRectMake(0, 64, SCREENWIDTH, SCREENHEIGHT-64 - 58) style:UITableViewStyleGrouped];
        [_homeTv reloadData];
    }
    return _homeTv;
}

-(void)btnCommit:(UIButton *)bt
{
    [self pushVC:[PerinatalWantConsultVC new]];
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
