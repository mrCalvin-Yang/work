//
//  DoctorMsgModel.h
//  Perinatal
//
//  Created by OY on 2017/7/20.
//  Copyright © 2017年 OY. All rights reserved.
//

#import "JSONModel.h"

/*
 TRegisteredDoctorVo {
 answerNum (string, optional): 回答问题数 ,
 cost (number, optional): 医生回答问题的费用 ,
 departmentName (string, optional): 医院科室名称 ,
 doctorDescription (string, optional): 医生简介 ,
 doctorStar (integer, optional): 医生综合星级评分 ,
 hospitalName (string, optional): 医院名称 ,
 imageUrl (string, optional): 医生头像 ,
 jobTitle (string, optional): 医生职称 ,
 labelContext (string, optional): 医生擅长标签 ,
 realName (string, optional): 医生姓名 ,
 registeredDoctorId (string, optional): 医生id
 }
 */

@interface DoctorMsgModel : JSONModel

@property(nonatomic,copy)NSString<Optional> *answerNum;

@property(nonatomic,copy)NSNumber<Optional> *cost;

@property(nonatomic,copy)NSString<Optional> *departmentName;

@property(nonatomic,copy)NSString<Optional> *doctorDescription;

@property(nonatomic,copy)NSString<Optional> *doctorStar;

@property(nonatomic,copy)NSString<Optional> *hospitalName;

@property(nonatomic,copy)NSString<Optional> *imageUrl;

@property(nonatomic,copy)NSString<Optional> *jobTitle;

@property(nonatomic,copy)NSString<Optional> *labelContext;

@property(nonatomic,copy)NSString<Optional> *realName;

@property(nonatomic,copy)NSString<Optional> *registeredDoctorId;




@end
