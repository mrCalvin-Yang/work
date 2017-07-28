//
//  WeixinPayModel.h
//  Perinatal
//
//  Created by OY on 2017/7/21.
//  Copyright © 2017年 OY. All rights reserved.
//

#import "JSONModel.h"

@interface WeixinPayModel : JSONModel
/*
 appid
 noncestr
 packageStr
 Partnered
 prepayid
 sign
 timestamp
 totalFee
 */
@property(nonatomic,copy)NSString<Optional> *appid;
@property(nonatomic,copy)NSString<Optional> *noncestr;
@property(nonatomic,copy)NSString<Optional> *packageStr;
@property(nonatomic,copy)NSString<Optional> *partnerid;
@property(nonatomic,copy)NSString<Optional> *prepayid;
@property(nonatomic,copy)NSString<Optional> *sign;
@property(nonatomic,copy)NSString<Optional> *timestamp;
@property(nonatomic,copy)NSString<Optional> *totalFee;

@end
