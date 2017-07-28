//
//  QuestionModel.h
//  Perinatal
//
//  Created by OY on 2017/7/18.
//  Copyright © 2017年 OY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"

@class tQuestionOrder;
@interface QuestionModel : JSONModel

@property(nonatomic, copy) NSString<Optional> *agreeNumber;

@property(nonatomic, copy) NSArray<Optional> *answerList;

@property(nonatomic, copy)NSString<Optional> *answerNum;

@property(nonatomic, copy) NSString<Optional> *content;

@property(nonatomic, copy) NSString<Optional> *cost;

@property(nonatomic, copy) NSString<Optional> *createTime;

@property(nonatomic, copy) NSString<Optional> *departmentName;

@property(nonatomic, copy) NSString<Optional> *doctorHeadsUrl;

@property(nonatomic, copy) NSString<Optional> *doctorId;

@property(nonatomic, copy) NSString<Optional> *doctorName;

@property(nonatomic, copy) NSString<Optional> *hospitalName;

@property(nonatomic, copy) NSString<Optional> *isAlreadyPaid;

@property(nonatomic, copy) NSString<Optional> *isAnonymous;

@property(nonatomic, copy) NSString<Optional> *isOnlookers;

@property(nonatomic, copy) NSString<Optional> *isOpen;

@property(nonatomic, copy) NSString<Optional> *jobTitle;

@property(nonatomic, copy) NSString<Optional> *labelContext;

@property(nonatomic, copy) NSNumber<Optional> *onlookersCost;

@property(nonatomic, copy) NSString<Optional> *onlookersNumber;

@property(nonatomic, copy) NSArray<Optional> *originalImageList;

@property(nonatomic, copy) NSString<Optional> *questionCategoryId;

@property(nonatomic, copy) NSString<Optional> *questionCategoryName;

@property(nonatomic, copy) NSString<Optional> *questionId;

@property(nonatomic, copy) NSString<Optional> *questionStatus;

@property(nonatomic, strong) NSDictionary<Optional> *tQuestionOrder;

@property(nonatomic, copy) NSArray<Optional> *thumbImageList;

//-(instancetype)initWithDic:(NSDictionary *)dic;

@end

/*
 createTime = 1500879742000;
 orderNo = "<null>";
 orderStatus = "PAYMENT_STATUS_TIMEOUT";
 orderType = "ORDER_TYPE_BY_QUESTION";
 payMoney = "<null>";
 payNo = 426080b656284466878c08b9aa117a6e;
 payTime = "<null>";
 payType = "<null>";
 questionId = "<null>";
 questionOrderId = 2c619b5ee38f4142b9d000e217ba55d4;
 terminalUserId = "<null>";
 */
@interface tQuestionOrder : JSONModel<Optional>

@property(nonatomic,assign)NSInteger createTime;

@property(nonatomic,copy) NSString<Optional> *orderNo;

@property(nonatomic,copy) NSString<Optional> *orderStatus;

@property(nonatomic,copy) NSString<Optional> *orderType;

@property(nonatomic,copy) NSString<Optional> *payMoney;

@property(nonatomic,copy) NSString<Optional> *payNo;

@property(nonatomic,copy) NSString<Optional> *payTime;

@property(nonatomic,copy) NSString<Optional> *payType;

@property(nonatomic,copy) NSString<Optional> *questionId;

@property(nonatomic,copy) NSString<Optional> *questionOrderId;

@property(nonatomic,copy) NSString<Optional> *terminalUserId;



@end
