//
//  PerinatalAppApi.m
//  Perinatal
//
//  Created by OY on 2017/7/17.
//  Copyright © 2017年 OY. All rights reserved.
//

#import "PerinatalAppApi.h"

@implementation PerinatalAppApi

+(PerinatalAppApi *)defaultApi
{
    static id sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

+(NSString *)GetFormatURLString:(URLType)type{
    return nil;
}



-(NSString *)getFormatURLString:(URLType)type{
    NSString *baseStr = REQUEST_URL;
    if (baseStr) {
        NSString *pathFormatString = nil;
        switch (type) {
            case URLTypeRegister:
                pathFormatString = @"users/register?verificationCode=%@";//post
                break;
            case URLTypeGetVerificationCode:
                pathFormatString = @"verificationCodes/@%";//get
                break;
            case URLTypeLogin:
                pathFormatString = @"users/login";//post
                break;
            case URLTypeInfo:
                pathFormatString = @"users/info";//get
                break;
            case URLTypeUpdateInfo:
                pathFormatString = @"users/updateInfo";//post
                break;
            case URLTypeUpdateAvatar:
                pathFormatString = @"users/uploadPicture";//post
                break;
            case URLTypePerfectPregnancyInfo:
                pathFormatString = @"users/perfectPregnancy";//post
                break;
            case URLTypeFollow:
                pathFormatString = @"users/addFollow/%@";//get
                break;
            case URLTypeUnFollow:
                pathFormatString = @"users/cancelFollow/%@";//get
                break;
            case URLTypeFollows:
                pathFormatString = @"users/myConcern";//post
                break;
            case URLTypeForgotPassword:
                pathFormatString = @"users/forgotPasswor";//post
                break;
            case URLTypeLoginOut:
                pathFormatString = @"users/loginOut";//get
                break;
            case URLTypeOAuthLogin:
                pathFormatString = @"users/otherLogin";//post
                break;
            case URLTypeProblems:
                pathFormatString = @"questions/%ld/%ld";//get page/size
                break;
            case URLTypeProblemDetail:
                pathFormatString = @"questions/detail/%@";//get id
                break;
            case URLTypeProblemCategorys:
                pathFormatString = @"questions/category";//get
                break;
            case URLTypeProblemPublish:
                pathFormatString = @"questions/add";//post 发布一个新问题
                break;
            case URLTypeProblemComment:
                pathFormatString = @"questions/comments";//post 评价
                break;
            case URLTypeDoctorHots:
                pathFormatString = @"doctors/hot/%ld/%ld";//page/size get
                break;
            case URLTypeDoctorLimitFree:
                pathFormatString = @"doctors/free/%ld/%ld"; //get page/size
                break;
            case URLTypeDoctorDetail:
                pathFormatString = @"doctors/detail/%@";//id
                break;
            case URLTypeDoctorProblems:
                pathFormatString = @"doctors/questions/%@/%ld/%ld";//id page  size
                break;
            case URLTypeHomePage:
                pathFormatString = @"index/%@";
                break;
            default:
                break;
        }
        if (pathFormatString) {
           baseStr = string(baseStr, pathFormatString);
        }
    }
    return baseStr;
}
+(NSDictionary *)GetParmasWithType:(URLType)type{
    return nil;
}

+(NSDictionary *)registerWithPhone:(NSString *)phone password:(NSString *)password code:(NSString *)code{
    return nil;
}
@end
