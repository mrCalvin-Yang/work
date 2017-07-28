//
//  PerinatalAppApi.h
//  Perinatal
//
//  Created by OY on 2017/7/17.
//  Copyright © 2017年 OY. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger,URLType) {
    URLTypeRegister,//注册
    URLTypeGetVerificationCode,//获取验证码
    URLTypePerfectPregnancyInfo,//完善孕期信息
    URLTypeLogin,//登录
    URLTypeOAuthLogin,//第三方登录
    URLTypeOtherBind,//用户绑定
    URLTypeBindHostpital,//绑定医院
    URLTypeLoginOut,//注销
    URLTypeForgotPassword,//修改密码／忘记密码
    URLTypeInfo,//个人信息
    URLTypeUpdateInfo,//更新个人信息
    URLTypeUpdateAvatar,//更新头像
    URLTypeFollow,//关注医生
    URLTypeFollows,//关注的医生
    URLTypeUnFollow,//取消关注医生
    URLTypeCurrenHospital,//当前医院
    URLTypeUserCenter,//个人中心
    URLTypeIsFollow,//是否关注
    
    URLTypeProblems,//问题列表
    URLTypeProblemPublish,//发布一个新问题
    URLTypeProblemAdd,//追加问题
    URLTypeProblemDetail,//问题详情
    URLTypeProblemMyList,//我的问题列表接口
    URLTypeProblemMyDetail,//我的问题详情接口
    URLTypeProblemDetailStatus,//个人问题详情接口
    URLTypeProblemCategorys,//问题类型
    URLTypeProblemComment,//问题评价
    URLTypeProblemDelete,//问题删除
    URLTypeProblemLike,//添加点赞接口
    URLTypeProblemOverTime,//提问超时
    URLTypeProblemConsultation,//是否有咨询问题
    
    
    /*
     // 医生
     case DoctorHots(page: Int, size: Int) // 热门医生列表
     case DoctorLimitFree(page: Int, size: Int) // 限时免费医生列表
     case DoctorDetail(id: String) // 医生详细信息
     case DoctorProblems(id: String, page: Int, size: Int) // 根据医生id获取医生所回答的问题数据
     */
    URLTypeDoctorHots,//热门医生
    URLTypeDoctorLimitFree,//限时免费医生列表
    URLTypeDoctorDetail,//医生详情信息
    URLTypeDoctorProblems,//获取医生所回答问题数据
    
    URLTypePayAli,
    URLTypePayWeChat,
    
    URLTypeHomePage//主页
};

/*
 ar route: Route {
 switch self {
 case .Register:
 return .post("users/register")
 case .GetVerificationCode(let phone):
 return .get("verificationCodes/" + phone)
 case .Login:
 return .post("users/login")
 case .Info:
 return .get("users/info")
 case .UpdateInfo:
 return .put("users/updateInfo")
 case .UpdateAvatar:
 return .post("users/uploadPicture")
 case .PerfectPregnancyInfo:
 return .post("users/perfectPregnancy")
 case let .Follow(id):
 return .get("users/addFollow/\(id)")
 case let .Unfollow(id):
 return .get("users/cancelFollow/\(id)")
 case .ForgotPassword:
 return .put("users/forgotPassword")
 case .Logout:
 return .get("users/loginOut")
 case .Follows:
 return .post("users/myConcern")
 case .OAuthLogin:
 return .post("users/otherLogin")
 
 case let .Problems(page, size):
 return .get("questions/\(page)/\(size)")
 case let .ProblemDetail(id):
 return .get("questions/detail/\(id)")
 case .ProblemCategorys:
 return .get("questions/category")
 case .ProblemPublish:
 return .post("questions/add")
 case .ProblemComment:
 return .post("questions/comments")
 
 case let .DoctorHots(page, size):
 return .get("doctors/hot/\(page)/\(size)")
 case let .DoctorLimitFree(page, size):
 return .get("doctors/free/\(page)/\(size)")
 case let .DoctorDetail(id):
 return .get("doctors/detail/\(id)")
 case let .DoctorProblems(id, page, size):
 return .get("doctors/questions/\(id)/\(page)/\(size)")
 }
 }
 */

@interface PerinatalAppApi : NSObject

+(PerinatalAppApi*)defaultApi;

+(NSString*)GetFormatURLString:(URLType)type;

//注册parameters
+(NSDictionary *)registerWithPhone:(NSString *)phone password:(NSString *)password code:(NSString *)code;
//登录parameters
+(NSDictionary *)loginWithPhone:(NSString *)phone password:(NSString *)password;
//完善孕期信息parameters
+(NSDictionary *)perfectPregnancyWithBabysex:(NSInteger)babysex babyBirthday:(NSString *)babyBirthday deliveryDate:(NSString *)deliveryDate dueDate:(NSString *)dueDate name:(NSString *)name birthday:(NSString *)birthday;
//修改密码／忘记密码
+(NSDictionary *)forgetPasswordWithPhoneNumber:(NSString *)phonenum verificationcode:(NSString *)code password:(NSString *)password;





@end
