//
//  PerinatalProblemAskTypeVC.m
//  Perinatal
//
//  Created by OY on 2017/7/11.
//  Copyright © 2017年 OY. All rights reserved.
//

#import "PerinatalProblemAskTypeVC.h"
#import "PerinatalDoctorListVC.h"
#import "PerinatalAskCategoryVM.h"
#import "QuestionCategoryTypeModel.h"

@interface PerinatalProblemAskTypeVC ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSMutableArray *dataArr;
@end

@implementation PerinatalProblemAskTypeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"问题类型";
    self.view.backgroundColor = kBackColor;
    [self showTitle:self.title];
    [self.view addSubview:self.tableView];
    [self showBack];
    [self getData];
}

-(NSMutableArray *)dataArr{
    if (!_dataArr) {
        _dataArr = [NSMutableArray array];
    }
    return _dataArr;
}

-(void)getData{
    [PerinatalAskCategoryVM getAskCategorySucess:^(NSDictionary *respone) {
        if ([respone[@"code"] integerValue] == 0) {
            NSArray *dataArr = respone[@"data"];
            for (NSDictionary *dic in dataArr) {
                QuestionCategoryTypeModel *model = [[QuestionCategoryTypeModel alloc] initWithDictionary:dic error:nil];
                [self.dataArr addObject:model];
            }
            [self.tableView reloadData];
        }else{
            NSLog(@"%@",respone[@"message"]);
        }
    } fail:^(NSString *error) {
        NSLog(@"%@",error);
    }];
}

-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, SCREENWIDTH, SCREENHEIGHT-64) style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorColor = kLineColor;
    }
    return _tableView;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return nil;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.1f;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return nil;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.1f;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifer = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifer];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifer];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.selectedBackgroundView = [UIView new];
    QuestionCategoryTypeModel *model = self.dataArr[indexPath.row];
    cell.textLabel.text = model.name;
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArr.count;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    QuestionCategoryTypeModel *model = self.dataArr[indexPath.row];
    PerinatalDoctorListVC *vc = [PerinatalDoctorListVC new];
    vc.typeList = self.dataArr;
    vc.typeModel = model;
    [self pushVC:vc];
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
