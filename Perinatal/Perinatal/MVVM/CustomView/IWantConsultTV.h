//
//  IWantConsultTV.h
//  Perinatal
//
//  Created by OY on 2017/7/12.
//  Copyright © 2017年 OY. All rights reserved.
//

#import "BaseTV.h"
#import "QuestionCategoryTypeModel.h"

@interface IWantConsultTV : BaseTV
@property(nonatomic,strong)QuestionCategoryTypeModel *typeModel;
@property(nonatomic,strong)NSArray *typeList;
@end
