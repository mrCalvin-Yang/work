//
//  MyConsultationModel.h
//  Perinatal
//
//  Created by OY on 2017/7/24.
//  Copyright © 2017年 OY. All rights reserved.
//

#import "JSONModel.h"
#import "QuestionModel.h"
/*
 **
 * 支付状态组
 //已支付
 public static final String PAYMENT_STATUS_ALREADY_PAID = "PAYMENT_STATUS_ALREADY_PAID";
 //未支付
 public static final String PAYMENT_STATUS_UNPAID = "PAYMENT_STATUS_UNPAID";
 //订单超时
 public static final String PAYMENT_STATUS_TIMEOUT = "PAYMENT_STATUS_TIMEOUT";
 //已退款
 public static final String PAYMENT_STATUS_REFNNDED = "PAYMENT_STATUS_REFNNDED";
 //退款中
 public static final String PAYMENT_STATUS_REFUND = "PAYMENT_STATUS_REFUND";
 
 *
 * 问题状态组
 //已回答
 public static final String QUESTION_STATUS_ANSWERED = "QUESTION_STATUS_ANSWERED";
 //待关闭/已超过48小时
 public static final String QUESTION_STATUS_SHUTDOWN = "QUESTION_STATUS_SHUTDOWN";
 //已关闭/已经超72小时/已解决
 public static final String QUESTION_STATUS_CLOSED = "QUESTION_STATUS_CLOSED";
 //已评价
 public static final String QUESTION_STATUS_HAVE_BEEN_EVALUATED = "QUESTION_STATUS_HAVE_BEEN_EVALUATED";
 //待回答
 public static final String QUESTION_STATUS_ANSWER = "QUESTION_STATUS_ANSWER";
 */
typedef NS_ENUM(NSInteger,OrderStatus) {
    OrderStatusNoPay = 0,//未支付
    OrderStatusIsPay,//已支付
    OrderStatusTimeOut,//订单超时
    OrderStatusRefunding,//退款中
    OrderStatusRefunded,//已退款
    OrderStatusAnswerd,//已回答
    OrderStatusShutDown,//待关闭
    OrderStatusClosed,//已关闭
    OrderStatusEvaluate,//已评价
    OrderStatusBeAnswerd//待回答
};

@interface MyConsultationModel : JSONModel

@property(nonatomic,copy)NSString<Optional> *content;

@property(nonatomic,assign)NSInteger createTime;

@property(nonatomic,copy)NSString<Optional> *imageUrl;

@property(nonatomic,copy)NSString<Optional> *questionId;

@property(nonatomic,copy)NSString<Optional> *questionStatus;

@property(nonatomic,copy)NSString<Optional> *registeredDoctorId;

@property(nonatomic,strong)tQuestionOrder<Optional> *tQuestionOrder;

-(OrderStatus)getOrderStatusWithQuestionStatus:(NSString *)status;

@end
