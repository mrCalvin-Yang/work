//
//  PerinatalUserModel.h
//  Perinatal
//
//  Created by OY on 2017/7/14.
//  Copyright © 2017年 OY. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface PerinatalUserModel : NSObject

@property(nonatomic, copy) NSString *nickName;//昵称

@property(nonatomic, copy) NSString *Name;//姓名

@property(nonatomic, copy) NSString *bornDate;//出生日期

@property(nonatomic, copy) NSString *IDNumber;//身份证

@property(nonatomic, copy) NSString *sex;//性别

@property(nonatomic, copy) NSString *address;//所在区域

@property(nonatomic, assign) NSInteger isPregnancy;//是否怀孕 1 怀孕 0 未怀孕 2 备孕中

@property(nonatomic, copy) NSString *babyBirthday;//宝宝生日

@property(nonatomic, copy) NSString *babySex;//宝宝性别

@property(nonatomic, copy) NSString *password;//密码

@property(nonatomic, copy) NSString *mobliePhone;//手机号码

@property(nonatomic, copy) NSString *ticketNo;//

@property(nonatomic, copy) NSString *terminalUserId;//用户ID

@property(nonatomic, copy) NSString *loginTime;//登录时间

@property(nonatomic, copy) NSString *ticketVaildTime;//登录限时

@end
