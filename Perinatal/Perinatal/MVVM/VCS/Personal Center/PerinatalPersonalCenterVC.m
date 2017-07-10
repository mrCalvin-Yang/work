//
//  PersonalCenterVC.m
//  Perinatal
//
//  Created by OY on 2017/7/6.
//  Copyright © 2017年 OY. All rights reserved.
//

#import "PerinatalPersonalCenterVC.h"
#import <CoreLocation/CoreLocation.h>

@interface PerinatalPersonalCenterVC ()<UITableViewDelegate,UITableViewDataSource,CLLocationManagerDelegate>
@property(nonatomic, strong) UITableView *personTableView;

@end

@implementation PerinatalPersonalCenterVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = white_color;
    [self showItemImg];
    [self setNavsubview];
    [self.view addSubview:self.personTableView];
}
//setnav
-(void)setNavsubview{
    self.navigationItem.titleView = [UIView new];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:global_color] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
}

//lazy init
-(UITableView *)personTableView{
    if (!_personTableView) {
        _personTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, -20, SCREENWIDTH, SCREENHEIGHT+104) style:UITableViewStyleGrouped];
        _personTableView.delegate = self;
        _personTableView.dataSource = self;
        _personTableView.separatorColor = gray_color;
    }
    return _personTableView;
}

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleDefault;
}

//datasource
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifer = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifer];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifer];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    cell.imageView.image = V_IMAGE(@"img");
    cell.textLabel.text = @"当前医院";
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            cell.detailTextLabel.text = @"中山大学附属医院";
        }
    }
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 5;
    }
    return 2;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 150)];
    view.backgroundColor = global_color;
    return view;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 150.f;
    }
    return 0.1f;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
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
