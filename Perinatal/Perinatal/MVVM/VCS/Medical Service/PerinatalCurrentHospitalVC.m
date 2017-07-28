//
//  PerinatalCurrentHospitalVC.m
//  Perinatal
//
//  Created by OY on 2017/7/17.
//  Copyright © 2017年 OY. All rights reserved.
//

#import "PerinatalCurrentHospitalVC.h"
#import <CoreLocation/CoreLocation.h>
#import "CurrentHospitalTV.h"
#import "PerinatalSelectCityVC.h"

@interface PerinatalCurrentHospitalVC ()<CLLocationManagerDelegate>
{
    CLLocationManager *loacationManager;
    NSString *currentCity;
}
@property(nonatomic,strong)CurrentHospitalTV *crrentTv;
@end

@implementation PerinatalCurrentHospitalVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self showBack];
    [self showTitle:@"当前医院"];
    [self locate];
    [self.view addSubview:self.crrentTv];
}

-(void)locate{
    if ([CLLocationManager locationServicesEnabled]) {
        loacationManager = [[CLLocationManager alloc] init];
        loacationManager.delegate = self;
        [loacationManager startUpdatingLocation];
        if (FSystemVersion >8.0)
        {
            // 设置定位权限仅iOS8以上有意义,而且iOS8以上必须添加此行代码
            [loacationManager requestWhenInUseAuthorization];//前台定位
        }
    }
}

#pragma mark CoreLocation delegate

//定位失败则执行此代理方法
//定位失败弹出提示框,点击"打开定位"按钮,会打开系统的设置,提示打开定位服务
- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    UIAlertController * alertVC = [UIAlertController alertControllerWithTitle:@"允许\"定位\"提示" message:@"请在设置中打开定位" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction * ok = [UIAlertAction actionWithTitle:@"打开定位" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //打开定位设置
        NSURL *settingsURL = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
        [[UIApplication sharedApplication] openURL:settingsURL options:nil completionHandler:^(BOOL success) {
            
        }];
    }];
    UIAlertAction * cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alertVC addAction:cancel];
    [alertVC addAction:ok];
    [self presentViewController:alertVC animated:YES completion:nil];
    
}
//定位成功
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    [loacationManager stopUpdatingLocation];
    CLLocation *currentLocation = [locations lastObject];
    CLGeocoder * geoCoder = [[CLGeocoder alloc] init];
    
    //反编码
    [geoCoder reverseGeocodeLocation:currentLocation completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        if (placemarks.count > 0) {
            CLPlacemark *placeMark = placemarks[0];
            currentCity = placeMark.locality;
            if (!currentCity) {
                currentCity = @"无法定位当前城市";
            }
            NSLog(@"%@",currentCity); //这就是当前的城市
            NSLog(@"%@",placeMark.name);//具体地址:  xx市xx区xx街道
        }
        else if (error == nil && placemarks.count == 0) {
            NSLog(@"No location and error return");
        }
        else if (error) {
            NSLog(@"location error: %@ ",error);
        }
        
    }];
}

-(CurrentHospitalTV *)crrentTv{
    if (!_crrentTv) {
        _crrentTv = [[CurrentHospitalTV alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT) style:UITableViewStyleGrouped];
        _crrentTv.backgroundColor = kBackColor;
        _crrentTv.selectItemSignal = [RACSubject subject];
        [_crrentTv.selectItemSignal subscribeNext:^(NSIndexPath *x) {
            switch (x.section) {
                case 0:
                    [self pushVC:[PerinatalSelectCityVC new]];
                    break;
                    
                default:
                    break;
            }
        }];
    }
    return _crrentTv;
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
