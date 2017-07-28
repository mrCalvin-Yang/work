//
//  AppMacro.h
//  PhoneSearch
//
//  Copyright (c) 2015年 OY. All rights reserved.
//

/**
 *  本类放app相关的宏定义 
 */

//俊杰电脑ip
#define REQUEST_URL @"http://192.168.1.182:8090/"

// 袁程电脑ip
//#define REQUEST_URL @"http://192.168.1.61:8080/"
//内部电脑ip
//#define REQUEST_URL @"hhttp://192.168.1.100:8080/moni-app/"

//云端 39.108.184.189:8081/moni-app
//#define REQUEST_URL @"http://39.108.184.189:8081/moni-app/"

// 首次启动判断
#define CM_FIRST_LAUNCHED @"firstLaunch"

// 动态令牌
#define YC_DYNAMIC_TOKEN_NAME @"yc_dynamic_token"

#define YC_DYNAMIC_TOKEN IF_NULL_TO_STRING(((NSString *)SEEKPLISTTHING(YC_DYNAMIC_TOKEN_NAME)))

/*
 / Umeng
 static let UMengAppkey = "59477c788630f50b68001033"
 
 // QQ互联
 static let QQAppID = "1106230794"
 static let QQAppKey = "DAXOMFrmRzH3GDQ5"
 
 // 微信开发平台
 static let WeChatAppID = "wx9142ac3f43542ab8"
 static let WeChatAppSecret = "1ffa2ce7850a65e650c70d8bf1c6ce0f"
 */

#define UMengAppkey @"59477c788630f50b68001033"

#define QQAppID @"1106230794"
#define QQAppKey @"DAXOMFrmRzH3GDQ5"

#define WeChatAppID @"wx9142ac3f43542ab8"
#define WeChatAppSecret @"1ffa2ce7850a65e650c70d8bf1c6ce0f"

/*
 支付宝合作伙伴身份（PID）：2088721411161114
 支付宝开发文档URL：https://doc.open.alipay.com/doc2/alipayDocIndex.htm?channel=ent
 
 微信支付商户号：1484144012
 微信支付应用APPID：wx9142ac3f43542ab8
 微信支付API密钥：d48acb8e21ef642b905a22c9da52ac4e
 微信支付开发文档URL：https://pay.weixin.qq.com/wiki/doc/api/index.html
 */

#define AliPayPID @"2088721411161114"

#define WeChatNO @"1484144012"

#define WeChatAPPID @"wx9142ac3f43542ab8"

#define WeChatKey @"d48acb8e21ef642b905a22c9da52ac4e"



