//
//  MyConsultationModel.m
//  Perinatal
//
//  Created by OY on 2017/7/24.
//  Copyright © 2017年 OY. All rights reserved.
//

#import "MyConsultationModel.h"

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

@implementation MyConsultationModel

-(OrderStatus)getOrderStatusWithQuestionStatus:(NSString *)status{
    if ([status isEqualToString:@"PAYMENT_STATUS_UNPAID"]) {
        return 0;//未支付
    }
    if ([status isEqualToString:@"PAYMENT_STATUS_ALREADY_PAID"]) {
        return 1;//已支付
    }
    if ([status isEqualToString:@"PAYMENT_STATUS_TIMEOUT"]) {
        return 2;//订单超时
    }
    if ([status isEqualToString:@"PAYMENT_STATUS_REFUND"]) {
        return 3;//退款中
    }
    if ([status isEqualToString:@"PAYMENT_STATUS_REFNNDED"]) {
        return 4;//已退款
    }
    if ([status isEqualToString:@"QUESTION_STATUS_ANSWERED"]) {
        return 5;//已回答
    }
    if ([status isEqualToString:@"QUESTION_STATUS_SHUTDOWN"]) {
        return 6;//待关闭/已超过48小时
    }
    if ([status isEqualToString:@"QUESTION_STATUS_CLOSED"]) {
        return 7;////已关闭/已经超72小时/已解决
    }
    if ([status isEqualToString:@"QUESTION_STATUS_HAVE_BEEN_EVALUATED"]) {
        return 8;////已评价
    }
    if ([status isEqualToString:@"QUESTION_STATUS_ANSWER"]) {
        return 9;//待回答
    }
    return -1;
}

@end
