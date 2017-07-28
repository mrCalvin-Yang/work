//
//  PerinatalMyConsultDetailVC.m
//  Perinatal
//
//  Created by OY on 2017/7/25.
//  Copyright © 2017年 OY. All rights reserved.
//

#import "PerinatalMyConsultDetailVC.h"
#import "MyConsultationModel.h"
#import "QuestionConsultationVM.h"
#import "QuestionModel.h"
#import "MyConsultationDetailTV.h"

@interface PerinatalMyConsultDetailVC ()

@end

@implementation PerinatalMyConsultDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self showTitle:@"问题详情"];
    [self showBack];
    [self getData];
}

-(void)getData{
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [QuestionConsultationVM getMyConsultationDetailWithId:_model.questionId sucess:^(NSDictionary *respone) {
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        if ([respone[@"code"] integerValue] == 0) {
            NSDictionary *data = respone[@"data"];
            _dataArr = [NSMutableArray array];
            if (data) {
                QuestionModel *model = [[QuestionModel alloc] initWithDictionary:data error:nil];
                [_dataArr addObject:model];
                if (_dataArr.count > 0) {
                    self.detailTV.dataList = _dataArr;
                    [self.detailTV reloadData];
//                    [self setSubviews];
                    [self.view addSubview:self.detailTV];
                }
            }
        }else{
            [self showToastWithMessage:respone[@"message"] detaly:2.f];
        }
    } fail:^(NSString *error) {
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        [self showButtonWithTip:error clickBlock:^{
            [self getData];
        }];
    }];
}

-(ProblemMyDetailIsPayTV *)detailTV{
    if (!_detailTV) {
        _detailTV = [[ProblemMyDetailIsPayTV alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT-48-64) style:UITableViewStyleGrouped];
        _detailTV.separatorColor = clear_color;
        _detailTV.backgroundColor = kBackColor;
    }
    return _detailTV;
}

-(UIButton *)deleteBt{
    if (!_deleteBt) {
        _deleteBt = [UIButton buttonWithType:UIButtonTypeCustom];
        _deleteBt.layer.masksToBounds = YES;
        _deleteBt.layer.borderWidth = 1.f;
        _deleteBt.layer.borderColor = global_color.CGColor;
        _deleteBt.layer.cornerRadius = 4.f;
        _deleteBt.titleLabel.font = H14;
        [_deleteBt setTitleColor:global_color forState:UIControlStateNormal];
    }
    return _deleteBt;
}

-(UIButton *)payBt{
    if (!_payBt) {
        _payBt = [UIButton buttonWithType:UIButtonTypeCustom];
        _payBt.layer.masksToBounds = YES;
        _payBt.layer.borderWidth = 1.f;
        _payBt.layer.borderColor = global_color.CGColor;
        _payBt.layer.cornerRadius = 4.f;
        _payBt.titleLabel.font = H14;
        [_payBt setTitleColor:global_color forState:UIControlStateNormal];
    }
    return _payBt;
}

-(void)setSubviews{
    UIView *toolView = [[UIView alloc] init];
    toolView.backgroundColor = RGBCOLOR(248, 248, 248);
    [self.view addSubview:toolView];
    [self.deleteBt setTitle:@"删除" forState:UIControlStateNormal];
    [toolView addSubview:self.deleteBt];
    [toolView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.offset(0);
        make.height.offset(48);
    }];
    
    [self.deleteBt mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(6);
        make.right.offset(-15);
        make.bottom.offset(-6);
        make.width.offset(58);
    }];
}

-(void)addDeleteAndCutdownPayBtn{
    UIView *toolView = [[UIView alloc] init];
    toolView.backgroundColor = RGBCOLOR(248, 248, 248);
    [self.view addSubview:toolView];
    
    [self.payBt setTitle:@"支付" forState:UIControlStateNormal];
    [toolView addSubview:self.payBt];
    [self.deleteBt setTitle:@"删除" forState:UIControlStateNormal];
    [toolView addSubview:self.deleteBt];
    
    [toolView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.offset(0);
        make.height.offset(48);
    }];
    
    [_payBt mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(6);
        make.right.offset(-15);
        make.bottom.offset(-6);
        make.width.offset(129);
    }];
    [_deleteBt mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(6);
        make.right.equalTo(self.payBt.mas_left).with.offset(-15);
        make.bottom.offset(-6);
        make.width.offset(58);
    }];
}
-(void)addUnselectedDeleteBtn{
    UIView *toolView = [[UIView alloc] init];
    toolView.backgroundColor = RGBCOLOR(248, 248, 248);
    [self.view addSubview:toolView];
    [self.deleteBt setTitle:@"删除" forState:UIControlStateNormal];
    [toolView addSubview:self.deleteBt];
    
    [toolView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.offset(0);
        make.height.offset(48);
    }];
    
    [_deleteBt mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(6);
        make.right.offset(-15);
        make.bottom.offset(-6);
        make.width.offset(58);
    }];
}
-(void)adddeleteBtn{
    UIView *toolView = [[UIView alloc] init];
    toolView.backgroundColor = RGBCOLOR(248, 248, 248);
    [self.view addSubview:toolView];
    [self.deleteBt setTitle:@"删除" forState:UIControlStateNormal];
    [toolView addSubview:self.deleteBt];
    
    [toolView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.offset(0);
        make.height.offset(48);
    }];
    
    [_deleteBt mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(6);
        make.right.offset(-15);
        make.bottom.offset(-6);
        make.width.offset(58);
    }];
}
-(void)addCommentBtn{
    UIView *toolView = [[UIView alloc] init];
    toolView.backgroundColor = RGBCOLOR(248, 248, 248);
    [self.view addSubview:toolView];
    [self.deleteBt setTitle:@"去评价" forState:UIControlStateNormal];
    [toolView addSubview:self.deleteBt];
    
    [toolView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.offset(0);
        make.height.offset(48);
    }];
    
    [_deleteBt mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(6);
        make.right.offset(-15);
        make.bottom.offset(-6);
        make.width.offset(58);
    }];
}
-(void)addisCommentBtn{
    UIView *toolView = [[UIView alloc] init];
    toolView.backgroundColor = RGBACOLOR(248, 248, 248, 0.5);
    [self.view addSubview:toolView];
    [self.deleteBt setTitle:@"去评价" forState:UIControlStateNormal];
    [toolView addSubview:self.deleteBt];
    
    [toolView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.offset(0);
        make.height.offset(48);
    }];
    
    [_deleteBt mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(6);
        make.right.offset(-15);
        make.bottom.offset(-6);
        make.width.offset(58);
    }];
    [toolView bringSubviewToFront:self.view];
}
-(void)addAskCutDownBtn{
    
}
-(void)addIsAskBtn{
    UIView *toolView = [[UIView alloc] init];
    toolView.backgroundColor = RGBCOLOR(248, 248, 248);
    [self.view addSubview:toolView];
    [self.deleteBt setTitle:@"追问" forState:UIControlStateNormal];
    [toolView addSubview:self.deleteBt];
    
    [toolView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.offset(0);
        make.height.offset(48);
    }];
    
    [_deleteBt mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(6);
        make.right.offset(-15);
        make.bottom.offset(-6);
        make.width.offset(58);
    }];
}

-(void)addIsPay{
    UIView *toolView = [[UIView alloc] init];
    toolView.backgroundColor = RGBACOLOR(248, 248, 248, 0.5);
    [self.view addSubview:toolView];
    [self.payBt setTitle:@"已支付" forState:UIControlStateNormal];
    [self.payBt setImage:[UIImage imageWithColor:RGBACOLOR(248, 248, 248, 0.4)] forState:UIControlStateNormal];
    [toolView addSubview:self.payBt];
    
    [toolView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.offset(0);
        make.height.offset(48);
    }];
    
    [_payBt mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(6);
        make.right.offset(-15);
        make.bottom.offset(-6);
        make.width.offset(58);
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
