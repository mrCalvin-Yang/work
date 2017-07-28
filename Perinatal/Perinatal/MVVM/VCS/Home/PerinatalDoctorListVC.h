//
//  PerinatalDoctorListVC.h
//  Perinatal
//
//  Created by OY on 2017/7/11.
//  Copyright © 2017年 OY. All rights reserved.
//

#import "BaseVC.h"
#import "QuestionCategoryTypeModel.h"
@interface PerinatalDoctorListVC : BaseVC
@property(nonatomic,strong)NSArray *typeList;
@property(nonatomic,strong)QuestionCategoryTypeModel *typeModel;
@end
