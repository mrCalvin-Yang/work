//
//  PerinatalPaymentVC.m
//  Perinatal
//
//  Created by OY on 2017/7/13.
//  Copyright © 2017年 OY. All rights reserved.
//

#import "PerinatalPaymentVC.h"

@interface PerinatalPaymentVC ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;
@end

@implementation PerinatalPaymentVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self showTitle:@"支付方式"];
    self.view.backgroundColor = kBackColor;
    [self.view addSubview:self.tableView];
}

-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, SCREENWIDTH, SCREENHEIGHT-48 - 64) style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorColor = kLineColor;
        _tableView.separatorInset = UIEdgeInsetsMake(0, 15, 0, 0);
    }
    return _tableView;
}

-(void)setSubviews{
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, SCREENHEIGHT - 48.f, SCREENWIDTH - 150,48)];
    titleLabel.text = @"付费咨询:";
    titleLabel.font = H14;
    titleLabel.backgroundColor = RGBCOLOR(255, 236, 240);
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(SCREENWIDTH - 150, SCREENHEIGHT - 48.f, 150, 48);
    [button setTitle:@"确认支付" forState:UIControlStateNormal];
    button.titleLabel.font = H14;
    [button setTitleColor:white_color forState:UIControlStateNormal];
    button.backgroundColor = RGBCOLOR(255, 69, 106);
    [button addTarget:self action:@selector(btnCommit:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    [self.view addSubview:titleLabel];
}

-(void)btnCommit:(UIButton *)bt{
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifer = @"";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifer];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifer];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    if (indexPath.row == 0) {
        cell.imageView.image = V_IMAGE(@"img");
        cell.textLabel.text = @"微信支付";
    }else{
        cell.imageView.image = V_IMAGE(@"img");
        cell.textLabel.text = @"支付宝支付";
    }
    UIButton *bt = [UIButton buttonWithType:UIButtonTypeCustom];
    bt.frame = CGRectMake(0, 0, 24, 24);
    [bt setImage:V_IMAGE(@"img") forState:UIControlStateNormal];
    [bt setImage:V_IMAGE(@"img") forState:UIControlStateSelected];
    [[bt rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        bt.selected = !bt.selected;
    }];
    cell.accessoryView = bt;
    return cell;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 45.f)];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(15, 11, 150, 22)];
    label.text = @"选择支付方式";
    label.font = H17;
    view.backgroundColor = white_color;
    [view addSubview:label];
    return view;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    UIButton *bt = (UIButton *)cell.accessoryView;
    bt.selected = !bt.selected;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return .1f;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 45.f;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
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
