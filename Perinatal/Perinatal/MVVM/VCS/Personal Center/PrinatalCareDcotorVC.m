//
//  PrinatalCareDcotorVC.m
//  Perinatal
//
//  Created by OY on 2017/7/16.
//  Copyright © 2017年 OY. All rights reserved.
//

#import "PrinatalCareDcotorVC.h"
#import "DoctorMsgTV.h"

@interface PrinatalCareDcotorVC ()
@property(nonatomic,strong)DoctorMsgTV *messageTv;
@end

@implementation PrinatalCareDcotorVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self showBack];
    [self showTitle:@"关注的医生"];
    [self.view addSubview:self.messageTv];
}

-(DoctorMsgTV *)messageTv{
    if (!_messageTv) {
        _messageTv = [[DoctorMsgTV alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT)];
        
    }
    return _messageTv;
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
