//
//  PerinatalPaymentVC.m
//  Perinatal
//
//  Created by OY on 2017/7/13.
//  Copyright © 2017年 OY. All rights reserved.
//

#import "PerinatalPaymentVC.h"
#import "WXApi.h"
#import <AlipaySDK/AlipaySDK.h>
#import "PayVM.h"
#import "WeixinPayModel.h"

static NSString *orderType = @"ORDER_TYPE_BY_QUESTION";

@interface PerinatalPaymentVC ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,assign)NSInteger selectIndex;
@property(nonatomic,strong)WeixinPayModel *wxmodel;
@property(nonatomic,copy)NSString *aliPayStr;
@end

@implementation PerinatalPaymentVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self showTitle:@"支付方式"];
    [self showBack];
    _selectIndex = -1;
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self setSubviews];
}

-(void)getData{
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    if (_selectIndex == 0) {
        [PayVM PayWeChatWithPayNo:self.payNo questionOrderId:self.questionOrderId orderType:self.orderType questionId:self.questionId sucess:^(NSDictionary *respone) {
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            if ([respone[@"code"] integerValue] == 0) {
                NSDictionary *data = respone[@"data"];
                self.wxmodel = [[WeixinPayModel alloc] initWithDictionary:data error:nil];
                [self WXPay];
            }else{
                [self showToastWithMessage:respone[@"message"] detaly:1.0];
            }
        } fail:^(NSString *error) {
            [self showToastWithMessage:error detaly:1.0];
            [MBProgressHUD hideHUDForView:self.view animated:YES];
        }];
    }else{
        [PayVM PayAliWithPayNo:self.payNo questionOrderId:self.questionOrderId orderType:self.orderType questionId:self.questionId sucess:^(NSDictionary *respone) {
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            if ([respone[@"code"] integerValue] == 0) {
                NSDictionary *data = respone[@"data"];
                self.aliPayStr = data[@"aliPayParams"];
                [self aliPay];
            }else{
                [self showToastWithMessage:respone[@"message"] detaly:1.0];
            }
        } fail:^(NSString *error) {
            [self showToastWithMessage:error detaly:1.0];
            [MBProgressHUD hideHUDForView:self.view animated:YES];
        }];
    }
}


-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT-48) style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = kBackColor;
        _tableView.separatorColor = kLineColor;
        _tableView.separatorInset = UIEdgeInsetsMake(0, 15, 0, 0);
        [self.view addSubview:self.tableView];
    }
    return _tableView;
}

-(void)setSubviews{
    
    UILabel *titleLabel = [[UILabel alloc] init];
    NSString *cost = [NSString stringWithFormat:@"付费咨询：¥%@",self.cost];
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:cost];
    [string addAttribute:NSForegroundColorAttributeName value:global_color range:NSMakeRange(5, self.cost.length+1)];
    titleLabel.attributedText = string;
    titleLabel.font = H14;
    titleLabel.backgroundColor = RGBCOLOR(255, 236, 240);
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
//    button.frame = CGRectMake(SCREENWIDTH - 150, SCREENHEIGHT - 48.f, 150, 48);
    [button setTitle:@"确认支付" forState:UIControlStateNormal];
    button.titleLabel.font = H14;
    [button setTitleColor:white_color forState:UIControlStateNormal];
    button.backgroundColor = RGBCOLOR(255, 69, 106);
    [button addTarget:self action:@selector(btnCommit:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:titleLabel];
    [self.view addSubview:button];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(SCREENWIDTH - 150, 48));
        make.left.offset(0);
        make.bottom.offset(0);
    }];
    
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(titleLabel);
        make.right.offset(0);
        make.bottom.offset(0);
        make.left.equalTo(titleLabel.mas_right).with.offset(0);
    }];
    
}

-(void)btnCommit:(UIButton *)bt{
    if (_selectIndex == -1) {
//        [self.view makeToast:@"请选择支付方式"];
        [self showToastWithMessage:@"请选择支付方式" detaly:1.f];
        return;
    }
    [self getData];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifer = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifer];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifer];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    if (indexPath.row == 0) {
        cell.imageView.image = V_IMAGE(@"logo-WeChat Pay");
        cell.textLabel.text = @"微信支付";
    }else{
        cell.imageView.image = V_IMAGE(@"logo-AliPay");
        cell.textLabel.text = @"支付宝支付";
    }
    UIButton *bt = [UIButton buttonWithType:UIButtonTypeCustom];
    bt.frame = CGRectMake(0, 0, 24, 24);
    [bt setImage:V_IMAGE(@"icon-Select Box") forState:UIControlStateNormal];
    [bt setImage:V_IMAGE(@"icon-Select Box Selected") forState:UIControlStateSelected];
    bt.tag = indexPath.row;
    [[bt rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(UIButton *x) {
        x.selected = !x.selected;
        UITableViewCell *cell = [tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
        UIButton *bt = (UIButton *)cell.accessoryView;
        UITableViewCell *cell1 = [tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:0]];
        UIButton *bt1 = (UIButton *)cell1.accessoryView;
        if (x.tag == 0) {
            bt.selected = YES;
            bt1.selected = NO;
        }else{
            bt.selected = NO;
            bt1.selected = YES;
        }
        _selectIndex = x.tag;
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
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    UIButton *bt = (UIButton *)cell.accessoryView;
    UITableViewCell *cell1 = [tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:0]];
    UIButton *bt1 = (UIButton *)cell1.accessoryView;
    if (indexPath.row == 0) {
        bt.selected = YES;
        bt1.selected = NO;
    }else {
        bt.selected = NO;
        bt1.selected = YES;
    }
    _selectIndex = indexPath.row;
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

#pragma mark 微信支付方法
- (void)WXPay{
    
    //需要创建这个支付对象
    PayReq *req   = [[PayReq alloc] init];
    //由用户微信号和AppID组成的唯一标识，用于校验微信用户
    req.openID = self.wxmodel.appid;
    
    // 商家id，在注册的时候给的
    req.partnerId = self.wxmodel.partnerid;
    
    // 预支付订单这个是后台跟微信服务器交互后，微信服务器传给你们服务器的，你们服务器再传给你
    req.prepayId  = self.wxmodel.prepayid;
    
    // 根据财付通文档填写的数据和签名
    //这个比较特殊，是固定的，只能是即req.package = Sign=WXPay
    req.package   = self.wxmodel.packageStr;
    
    // 随机编码，为了防止重复的，在后台生成
    req.nonceStr  = self.wxmodel.noncestr;
    
    // 这个是时间戳，也是在后台生成的，为了验证支付的
    req.timeStamp = self.wxmodel.timestamp.intValue;
    
    // 这个签名也是后台做的
    req.sign = self.wxmodel.sign;
    
    //发送请求到微信，等待微信返回onResp
    [WXApi sendReq:req];
}
#pragma mark 支付宝支付方法
-(void)aliPay{
    [[AlipaySDK defaultService] payOrder:self.aliPayStr fromScheme:@"Perinatal" callback:^(NSDictionary *resultDic) {
        NSLog(@"%@",resultDic);
        
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
