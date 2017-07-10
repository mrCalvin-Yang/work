//
//  PerinatalLoginVC.h
//  Perinatal
//
//  Created by OY on 2017/7/10.
//  Copyright © 2017年 OY. All rights reserved.
//

#import "BaseVC.h"

@protocol LogInVCDelegate <NSObject>

-(void)didRecvLogInResult:(id)sender result:(BOOL)flag;

@end

@interface PerinatalLoginVC : BaseVC

@property(nonatomic, weak) id<LogInVCDelegate>delegate;
-(void)onClickedLoginBtn;
-(void)login:(NSString*)account password:(NSString*)password;

@end
