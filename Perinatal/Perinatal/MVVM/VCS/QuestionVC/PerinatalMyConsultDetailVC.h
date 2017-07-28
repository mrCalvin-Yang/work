//
//  PerinatalMyConsultDetailVC.h
//  Perinatal
//
//  Created by OY on 2017/7/25.
//  Copyright © 2017年 OY. All rights reserved.
//

#import "BaseVC.h"
#import "ProblemMyDetailIsPayTV.h"
@class MyConsultationModel;

@interface PerinatalMyConsultDetailVC : BaseVC
@property(nonatomic,strong)MyConsultationModel *model;
@property(nonatomic,strong)ProblemMyDetailIsPayTV *detailTV;
@property(nonatomic,strong)NSMutableArray *dataArr;
@property(nonatomic,strong)UIButton *payBt, *deleteBt, *isPayBt, *askAginBt;

-(void)addDeleteAndCutdownPayBtn;
-(void)addUnselectedDeleteBtn;
-(void)adddeleteBtn;
-(void)addCommentBtn;
-(void)addisCommentBtn;
-(void)addAskCutDownBtn;
-(void)addIsAskBtn;
-(void)addIsPay;

@end
