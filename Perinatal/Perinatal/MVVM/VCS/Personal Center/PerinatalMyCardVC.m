//
//  PerinatalMyCardVC.m
//  Perinatal
//
//  Created by OY on 2017/7/16.
//  Copyright © 2017年 OY. All rights reserved.
//

#import "PerinatalMyCardVC.h"
#import "MyHospitalCardTV.h"

@interface PerinatalMyCardVC ()
@property(nonatomic,strong)MyHospitalCardTV *cardTv;
@end

@implementation PerinatalMyCardVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self showBack];
    [self showTitle:@"我的就诊卡"];
    [self.view addSubview:self.cardTv];
}

-(MyHospitalCardTV *)cardTv{
    if (!_cardTv) {
        _cardTv = [[MyHospitalCardTV alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT)];
        _cardTv.backgroundColor = kBackColor;
    }
    return _cardTv;
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
