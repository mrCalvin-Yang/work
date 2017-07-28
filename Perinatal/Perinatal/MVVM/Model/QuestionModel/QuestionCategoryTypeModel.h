//
//  QuestionCategoryTypeModel.h
//  Perinatal
//
//  Created by OY on 2017/7/19.
//  Copyright © 2017年 OY. All rights reserved.
//

#import "JSONModel.h"

@interface QuestionCategoryTypeModel : JSONModel

@property(nonatomic,copy)NSString<Optional> *name;

@property(nonatomic,copy)NSString<Optional> *parentId;

@property(nonatomic,copy)NSString<Optional> *questionCategoryId;

@end
