//
//  PerinatalWantConsultVC.m
//  Perinatal
//
//  Created by OY on 2017/7/12.
//  Copyright © 2017年 OY. All rights reserved.
//

#import "PerinatalWantConsultVC.h"
#import "IWantConsultTV.h"
#import "ConsultContentCell.h"
#import "PerinatalPaymentVC.h"
#import "QuestionAddVM.h"

@interface PerinatalWantConsultVC ()
{
    IWantConsultTV *tv;
}
@end

@implementation PerinatalWantConsultVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self showTitle:@"我要咨询"];
    [self showBack];
    self.view.backgroundColor = kBackColor;
    [self setSubviews];
}

-(void)setSubviews{
    tv = [[IWantConsultTV alloc] initWithFrame:CGRectMake(0, 64, SCREENWIDTH, SCREENHEIGHT- 48-64) style:UITableViewStyleGrouped];
    if (_typeModel) {
       tv.dataList = [NSMutableArray arrayWithObject:self.doctorMsgModel];
    }
    
    tv.typeModel = self.typeModel;
    tv.typeList = self.typeList;
    [tv reloadData];
    [self.view addSubview:tv];
    
    UIView *bgView = [[UIView alloc] init];
    bgView.backgroundColor = global_color;
    [self.view addSubview:bgView];
    
    UILabel *titleLabel = [[UILabel alloc] init];
    NSString *cost = [NSString stringWithFormat:@"付费咨询：¥%@",self.doctorMsgModel.cost];
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:cost];
    [string addAttribute:NSForegroundColorAttributeName value:global_color range:NSMakeRange(5, self.doctorMsgModel.cost.stringValue.length+1)];
    titleLabel.attributedText = string;
    titleLabel.font = H14;
    titleLabel.backgroundColor = RGBCOLOR(255, 236, 240);
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
//    button.frame = CGRectMake(SCREENWIDTH - 150, SCREENHEIGHT - 48 - 64, 150, 48);
    [button setTitle:@"提交咨询" forState:UIControlStateNormal];
    button.titleLabel.font = H14;
    [button setTitleColor:white_color forState:UIControlStateNormal];
    button.backgroundColor = RGBCOLOR(255, 69, 106);
    [button addTarget:self action:@selector(btnCommit:) forControlEvents:UIControlEventTouchUpInside];
    [bgView addSubview:button];
    [bgView addSubview:titleLabel];
    
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(SCREENWIDTH, 48));
        make.bottom.offset(0);
    }];
    
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(SCREENWIDTH - 150, 47));
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

-(void)btnCommit:(UIButton *)bt
{
    ConsultContentCell *cell = [tv cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:2]];
    NSLog(@"%@",cell.images);
    NSArray *arr = cell.images;
    NSString *content = cell.textViewStr;
    [QuestionAddVM addQuestionWithDoctorId:_doctorMsgModel.registeredDoctorId questionContent:content questionCategoryId:_typeModel.questionCategoryId cost:_doctorMsgModel.cost.stringValue isOpen:NO questionImages:arr sucess:^(NSDictionary *respone) {
        if ([[respone valueForKeyPath:@"code"] integerValue] == 0) {
            NSDictionary *data = [respone valueForKey:@"data"];
            PerinatalPaymentVC *vc = [PerinatalPaymentVC new];
            vc.cost = _doctorMsgModel.cost.stringValue;
            vc.questionOrderId = [data valueForKeyPath:@"questionOrderId"];
            vc.payNo = [data valueForKeyPath:@"payNo"];
            vc.questionId = @"";
            vc.orderType = [data valueForKey:@"orderType"];
           [self pushVC:vc];
        }
    } fail:^(NSString *error) {
        
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
