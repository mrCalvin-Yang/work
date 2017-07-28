//
//  PerinatalSettingVC.m
//  Perinatal
//
//  Created by OY on 2017/7/16.
//  Copyright © 2017年 OY. All rights reserved.
//

#import "PerinatalSettingVC.h"
#import "SettingTV.h"

@interface PerinatalSettingVC ()
@property(nonatomic, strong) SettingTV *settingTV;
@end

@implementation PerinatalSettingVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self showTitle:@"设置"];
    [self showBack];
    [self.view addSubview:self.settingTV];
    
}

-(SettingTV *)settingTV{
    if (!_settingTV) {
        _settingTV = [[SettingTV alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT) style:UITableViewStyleGrouped];
        _settingTV.backgroundColor = kBackColor;
    }
    return _settingTV;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
