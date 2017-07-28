//
//  PerinatalMyConsultNoPayDetailVC.m
//  Perinatal
//
//  Created by OY on 2017/7/26.
//  Copyright © 2017年 OY. All rights reserved.
//

#import "PerinatalMyConsultNoPayDetailVC.h"
#import "MyConsultationModel.h"
#import "QuestionConsultationVM.h"
#import "QuestionModel.h"
#import "MyConsultationDetailTV.h"
#import "PerinatalPaymentVC.h"

@interface PerinatalMyConsultNoPayDetailVC ()
@end

@implementation PerinatalMyConsultNoPayDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addDeleteAndCutdownPayBtn];
    [self setSubviews];
}
-(void)setSubviews{
    [[self.payBt rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        PerinatalPaymentVC *pay = [PerinatalPaymentVC new];
        QuestionModel *model = self.dataArr[0];
        if (model.tQuestionOrder) {
            tQuestionOrder *oder = [[tQuestionOrder alloc] initWithDictionary:model.tQuestionOrder error:nil];
            pay.questionId = model.questionId;
            pay.orderType = oder.orderType;
            pay.questionOrderId = oder.questionOrderId;
            pay.payNo = oder.payNo;
            pay.cost = model.cost;
            [self pushVC:pay];
        }
        
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
