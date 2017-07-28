//
//  AppDelegate.m
//  Perinatal
//
//  Created by OY on 2017/7/6.
//  Copyright © 2017年 OY. All rights reserved.
//

#import "AppDelegate.h"
#import "BaseTabarController.h"
#import <IQKeyboardManager.h>
#import <UMSocialCore/UMSocialCore.h>
#import "WXApi.h"
#import <AlipaySDK/AlipaySDK.h>
#import "PerinatalLoginVC.h"
#import "BaseNavigationController.h"
@interface AppDelegate ()<WXApiDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    NSString *userId =SEEKPLISTTHING(KTerminalUserId);
    if (!userId) {
        PerinatalLoginVC *login = [PerinatalLoginVC new];
        BaseNavigationController *nav = [[BaseNavigationController alloc] initWithRootViewController:login];
        self.window.rootViewController = nav;
        
    }else{
        BaseTabarController *rootController = [[BaseTabarController alloc] init];
        self.window.rootViewController = rootController;
    }
    
    [self.window makeKeyAndVisible];
    
    
    //键盘管理
    IQKeyboardManager *manager = [IQKeyboardManager sharedManager];
    manager.enable = YES;
    manager.shouldResignOnTouchOutside = YES;
    manager.shouldToolbarUsesTextFieldTintColor = YES;
    manager.enableAutoToolbar = NO;
    
    [self setupUMeng];
    
    return YES;
}

-(void)setupUMeng{
    [[UMSocialManager defaultManager] openLog:YES];
    [[UMSocialManager defaultManager] setUmSocialAppkey:UMengAppkey];
    [WXApi registerApp:WeChatAPPID];
    
    [self configUSharePlatforms];
    
}

-(void)configUSharePlatforms{
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_WechatSession appKey:WeChatAppID appSecret:WeChatAppSecret redirectURL:@"http://mobile.umeng.com/social"];
    
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_QQ appKey:QQAppID appSecret:QQAppKey redirectURL:@"http://mobile.umeng.com/social"];
}

-(BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation{
    BOOL result = [[UMSocialManager defaultManager] handleOpenURL:url sourceApplication:sourceApplication annotation:annotation];
    if (!result) {
        result = [WXApi handleOpenURL:url delegate:self];
    }
    if (!result) {
        if ([url.host isEqualToString:@"safepay"]) {
            //跳转支付宝钱包进行支付，处理支付结果
            [[AlipaySDK defaultService] processOrderWithPaymentResult:url standbyCallback:^(NSDictionary *resultDic) {
                NSLog(@"result = %@",resultDic);
            }];
        }
        return YES;
    }
    return result;
}


-(void)onResp:(BaseResp *)resp{
    NSString *payResoult = [NSString stringWithFormat:@"errcode:%d", resp.errCode];
    if([resp isKindOfClass:[PayResp class]]){
        //支付返回结果，实际支付结果需要去微信服务器端查询
        switch (resp.errCode) {
            case 0:
                payResoult = @"支付结果：成功！";
                [[NSNotificationCenter defaultCenter] postNotificationName:@"paysucess" object:nil userInfo:nil];
                break;
            case -1:
                payResoult = @"支付结果：失败！";
                break;
            case -2:
                payResoult = @"用户已经退出支付！";
                break;
            default:
                payResoult = [NSString stringWithFormat:@"支付结果：失败！retcode = %d, retstr = %@", resp.errCode,resp.errStr];
                break;
        }
    }
    
}



//-(BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options{
//}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
