//
//  PerinatalSelectCityVC.m
//  Perinatal
//
//  Created by OY on 2017/7/17.
//  Copyright © 2017年 OY. All rights reserved.
//

#import "PerinatalSelectCityVC.h"
#import "CityListVM.h"
#import "CitySelectTV.h"
@interface PerinatalSelectCityVC ()
@property(nonatomic,strong)CitySelectTV *cityTV;
@end

@implementation PerinatalSelectCityVC

- (NSDictionary *)loadCityListData{
    
    return [NSDictionary dictionaryWithContentsOfURL:[[NSBundle mainBundle] URLForResource:@"cityList.plist" withExtension:nil]];
}

-(CitySelectTV *)cityTV{
    if (!_cityTV) {
        _cityTV = [[CitySelectTV alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT-64) style:UITableViewStyleGrouped];
        _cityTV.backgroundColor = kBackColor;
        [self.view addSubview:_cityTV];
    }
    return _cityTV;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self showTitle:@"选择城市"];
    [self showBack];
    NSDictionary *dic = [self loadCityListData];
    NSArray *keys = [dic allKeys];
    keys = [keys sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        return [obj1 compare:obj2];
    }];
    self.cityTV.letterArray = [NSMutableArray arrayWithArray:keys];
    [self.cityTV.letterArray insertObject:@"" atIndex:0];
    self.cityTV.cityDic = dic;
    [self.cityTV reloadData];
    
    // Do any additional setup after loading the view.
}

-(void)getData{
    [CityListVM getCityListSucess:^(NSDictionary *respone) {
        NSLog(@"respone=%@",respone);
    } fail:^(NSString *error) {
        
    }];
    [CityListVM getProvinceListSucess:^(NSDictionary *respone) {
//        NSLog(@"respone=%@",respone);
    } fail:^(NSString *error) {
        
    }];
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
