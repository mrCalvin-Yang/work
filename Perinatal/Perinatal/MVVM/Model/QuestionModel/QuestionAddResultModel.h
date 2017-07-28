//
//  QuestionAddResultModel.h
//  Perinatal
//
//  Created by OY on 2017/7/21.
//  Copyright © 2017年 OY. All rights reserved.
//

#import "JSONModel.h"

/*
 {
 "code": 0,
 "message": "操作成功",
 "data": {
 "questionOrderId": "2a8cdd901db04f349420fbf1c991a61c",
 "questionId": null,
 "createTime": 1500623059143,
 "payMoney": null,
 "orderStatus": null,
 "payTime": null,
 "payType": null,
 "orderNo": null,
 "payNo": "76d2df9531c449ea8269b0e412597bcb",
 "terminalUserId": null,
 "orderType": "ORDER_TYPE_BY_QUESTION"
 }
 }
 */

@interface QuestionAddResultModel : JSONModel

@property(nonatomic,copy)NSString<Optional> *questionOrderId;

@property(nonatomic,copy)NSString<Optional> *questionId;

@property(nonatomic,copy)NSString<Optional> *createTime;

@property(nonatomic,copy)NSString<Optional> *payMoney;

@property(nonatomic,copy)NSString<Optional> *orderStatus;

@property(nonatomic,copy)NSString<Optional> *payTime;

@property(nonatomic,copy)NSString<Optional> *payType;

@property(nonatomic,copy)NSString<Optional> *orderNo;

@property(nonatomic,copy)NSString<Optional> *payNo;

@property(nonatomic,copy)NSString<Optional> *terminalUserId;

@property(nonatomic,copy)NSString<Optional> *orderType;



@end
