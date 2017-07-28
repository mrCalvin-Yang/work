//
//  PerinatalWantConsultVC.h
//  Perinatal
//
//  Created by OY on 2017/7/12.
//  Copyright © 2017年 OY. All rights reserved.
//

#import "BaseVC.h"
#import "DoctorMsgModel.h"
#import "QuestionCategoryTypeModel.h"
@interface PerinatalWantConsultVC : BaseVC
@property(nonatomic,strong)QuestionCategoryTypeModel *typeModel;
@property(nonatomic,strong)NSArray *typeList;
@property(nonatomic,strong)DoctorMsgModel *doctorMsgModel;
@end
