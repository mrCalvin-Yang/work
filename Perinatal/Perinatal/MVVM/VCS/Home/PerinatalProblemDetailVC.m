//
//  PerinatalProblemAskDetailVC.m
//  Perinatal
//
//  Created by OY on 2017/7/11.
//  Copyright © 2017年 OY. All rights reserved.
//

#import "PerinatalProblemDetailVC.h"
#import "PerinatalWantConsultVC.h"
#import "ProblemDetailTV.h"
#import "PerinatalPaymentVC.h"
#import "ProblemAskDetailVM.h"
#import "BaseNavigationController.h"
#import "PerinatalProblemAskVC.h"
#import "ProblemDetailIsPayTV.h"
#import "NSString+Formatter.h"
#import "DoctorMsgModel.h"
#import "QuestionCategoryTypeModel.h"


@interface PerinatalProblemDetailVC ()
{
    NSMutableArray *dataArr;
}
@end

@implementation PerinatalProblemDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self showBack];
    self.title =@"问题详情";
    dataArr = [NSMutableArray array];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self getData];
}

-(void)getData{
    [ProblemAskDetailVM getProblemAskDetailWithProblemId:self.model.questionId sucess:^(NSDictionary *respone) {
        if ([[respone valueForKeyPath:@"code"] integerValue] == 0) {
            NSDictionary *data = [respone valueForKeyPath:@"data"];
            QuestionModel *model = [[QuestionModel alloc] initWithDictionary:data error:nil];
            [dataArr addObject:model];
            if ([NSString isBlankString:model.isAlreadyPaid] && (model.onlookersCost == nil || model.onlookersCost == NULL)) {
                [self setDetailViews];
            }else{
                [self setSubviews];
            }
        }else{
            [self showToastWithMessage:[respone valueForKeyPath:@"message"] detaly:1.f];
        }
    } fail:^(NSString *error) {
        [self showButtonWithTip:error clickBlock:^{
            [self getData];
        }];
    }];
}

-(void)setSubviews{
    [self clearContentSV];
     CGFloat y = 64;
    ProblemDetailTV *detailTv = [[ProblemDetailTV alloc] initWithFrame:CGRectMake(0, y, SCREENWIDTH, SCREENHEIGHT - 50) style:UITableViewStyleGrouped];
    detailTv.backgroundColor = kBackColor;
    detailTv.dataList = dataArr;
    [detailTv reloadData];
    NSString *cost = [NSString stringWithFormat:@"围观答案需要支付¥%@",self.model.onlookersCost];
    detailTv.selectItemSignal = [RACSubject subject];
    [detailTv.selectItemSignal subscribeNext:^(id x) {
        [AlerVCManager showAlerWithTitle:@"支付提醒" message:cost employController:self handler:^(UIAlertAction *action) {
            QuestionModel *model = dataArr[0];
            PerinatalPaymentVC *payvc = [PerinatalPaymentVC new];
            payvc.cost = model.onlookersCost.stringValue;
            payvc.questionId = model.questionId;
            payvc.orderType = @"ORDER_TYPE_BY_OBLOOKERS";
            payvc.questionOrderId = @"";
            payvc.payNo = @"";
            [self pushVC:payvc];
        }];
    }];
    [self.view addSubview:detailTv];
    
    UIButton *bt = [UIButton buttonWithType:UIButtonTypeCustom];
    [bt setTitle:@"我要向TA咨询" forState:UIControlStateNormal];
    [bt setTitleColor:white_color forState:UIControlStateNormal];
    bt.backgroundColor = global_color;
    [[bt rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        PerinatalWantConsultVC *vc = [PerinatalWantConsultVC new];
        QuestionModel *model = dataArr[0];
        QuestionCategoryTypeModel *typeModel = [[QuestionCategoryTypeModel alloc] init];
        typeModel.name = model.questionCategoryName;
        typeModel.questionCategoryId = model.questionCategoryId;
        vc.typeModel = typeModel;
        DoctorMsgModel *model1 = [[DoctorMsgModel alloc] init];
        model1.cost = [NSNumber numberWithFloat:model.cost.floatValue];
        model1.realName = model.doctorName;
        model1.registeredDoctorId = model.doctorId;
        model1.answerNum = model.answerNum;
        model1.departmentName = model.departmentName;
        model1.labelContext = model.labelContext;
        model1.jobTitle = model.jobTitle;
        model1.hospitalName = model.hospitalName;
        model1.imageUrl = model.doctorHeadsUrl;
        vc.doctorMsgModel = model1;
        vc.typeList = @[typeModel];
        [self pushVC:vc];
    }];
    [self.view addSubview:bt];
    [bt mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.offset(50);
        make.right.bottom.left.offset(0);
    }];
}

-(void)clearContentSV{
    for (UIView *view in [self.view subviews]) {
        [view removeFromSuperview];
    }
}

-(void)setDetailViews{
    [self clearContentSV];
    CGFloat y = 64;
    
    ProblemDetailIsPayTV *detailTv = [[ProblemDetailIsPayTV alloc] initWithFrame:CGRectMake(0, y, SCREENWIDTH, SCREENHEIGHT - 50) style:UITableViewStyleGrouped];
    detailTv.backgroundColor = kBackColor;
    detailTv.separatorColor = clear_color;
    detailTv.dataList = dataArr;
    [detailTv reloadData];
    [self.view addSubview:detailTv];
    
    UIButton *bt = [UIButton buttonWithType:UIButtonTypeCustom];
    [bt setTitle:@"我要向TA咨询" forState:UIControlStateNormal];
    [bt setTitleColor:white_color forState:UIControlStateNormal];
    bt.backgroundColor = global_color;
    [[bt rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        PerinatalWantConsultVC *vc = [PerinatalWantConsultVC new];
        QuestionModel *model = dataArr[0];
        QuestionCategoryTypeModel *typeModel = [[QuestionCategoryTypeModel alloc] init];
        typeModel.name = model.questionCategoryName;
        typeModel.questionCategoryId = model.questionCategoryId;
        vc.typeModel = typeModel;
        DoctorMsgModel *model1 = [[DoctorMsgModel alloc] init];
        model1.cost = [NSNumber numberWithInteger:model.cost.integerValue];
        model1.realName = model.doctorName;
        model1.registeredDoctorId = model.doctorId;
        model1.answerNum = model.answerNum;
        model1.departmentName = model.departmentName;
        model1.doctorDescription = model.labelContext;
        model1.jobTitle = model.jobTitle;
        model1.hospitalName = model.hospitalName;
        model1.imageUrl = model.doctorHeadsUrl;
        vc.doctorMsgModel = model1;
        vc.typeList = @[typeModel];
        [self pushVC:vc];
    }];
    [self.view addSubview:bt];
    [bt mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.offset(50);
        make.right.bottom.left.offset(0);
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
