//
//  PerinatalUserMessageVC.m
//  Perinatal
//
//  Created by OY on 2017/7/14.
//  Copyright © 2017年 OY. All rights reserved.
//

#import "PerinatalUserMessageVC.h"
#import "PerinatalUserModel.h"
#import "TextfildCell.h"

@interface PerinatalUserMessageVC ()<UITableViewDelegate,UITableViewDataSource>
{
    NSArray *_firstTitleArr, *_secondTitleArr, *_thirdTitleArr, *_firstFIeldArr, *_secondFieldArr, *_thirdFieldArr;
    PerinatalUserModel *_userModel;
}
@property(nonatomic,strong)UITableView *tableView;
@end

@implementation PerinatalUserMessageVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self showTitle:@"个人信息"];
    [self showBack];
    [self setNavigationBar:white_color];
    [self showItem];
     self.navigationController.navigationBar.shadowImage = [UIImage imageWithColor:kLineColor];
    [self getData];
    [self.view addSubview:self.tableView];
    [self.tableView reloadData];
    
}

- (void)getData{
    _firstTitleArr = @[@"昵称",@"姓名",@"出生日期",@"身份证号",@"性别",@"所在地区"];
    _secondTitleArr = @[@"孕期状态",@"宝宝生日",@"宝宝性别"];
    _thirdTitleArr = @[@"密码",@"手机号"];
    _firstFIeldArr = @[@"",@"请填写真实姓名",@"请选择出生日期",@"请填写身份证号",@"请选择性别",@"请选择地区"];
    _secondFieldArr = @[@"请选择是否生育",@"请选择宝宝的生日",@"请选择宝宝性别"];
    _thirdFieldArr = @[@"修改密码",@"修改手机号码"];
    _userModel = [[PerinatalUserModel alloc] init];
    _userModel.nickName = @"朴泰贤";
    _userModel.Name = @"";
    _userModel.sex = @"女";
    _userModel.address = @"广州市";
    _userModel.isPregnancy = 1;
    _userModel.babySex = @"男";
    
    _userModel.mobliePhone = @"13800099982";
    NSString *number = _userModel.mobliePhone;
    NSMutableString *str = [[NSMutableString alloc] initWithString:number];
    [str replaceCharactersInRange:NSMakeRange(3, 4) withString:@"****"];
    _userModel.mobliePhone = str;
}


-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT-64) style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.separatorColor = kLineColor;
    }
    return _tableView;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 15.f;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.1f;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return indexPath.section == 0 ? 80 : 45;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section > 0) {
        static NSString *identifer = @"TextfildCell";
        TextfildCell *cell = [tableView dequeueReusableCellWithIdentifier:identifer];
        if (!cell) {
            cell = [[NSBundle mainBundle] loadNibNamed:identifer owner:self options:nil].firstObject;
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        switch (indexPath.section) {
            case 1:
                switch (indexPath.row) {
                    case 0:
                        if (_userModel.nickName) {
                          cell.messageTextfiled.text = _userModel.nickName;
                        }else{
                            cell.messageTextfiled.text = _userModel.mobliePhone;
                        }
                        break;
                    case 1:
                        if (_userModel.Name) {
                            cell.messageTextfiled.text = _userModel.Name;
                        }else{
                            cell.messageTextfiled.placeholder = _firstFIeldArr[indexPath.row];
                        }
                        break;
                    case 2:
                        if (_userModel.bornDate) {
                            cell.messageTextfiled.text = _userModel.bornDate;
                        }else{
                            cell.messageTextfiled.placeholder = _firstFIeldArr[indexPath.row];
                        }
                        break;
                    case 3:
                        if (_userModel.IDNumber) {
                            cell.messageTextfiled.text = _userModel.IDNumber;
                        }else{
                            cell.messageTextfiled.placeholder = _firstFIeldArr[indexPath.row];
                        }
                        break;
                    case 4:
                        if (_userModel.sex) {
                            cell.messageTextfiled.text = _userModel.sex;
                        }else{
                            cell.messageTextfiled.placeholder = _thirdFieldArr[indexPath.row];
                        }
                        break;
                    case 5:
                        if (_userModel.address) {
                            cell.messageTextfiled.text = _userModel.address;
                        }else{
                            cell.messageTextfiled.placeholder = _firstFIeldArr[indexPath.row];
                        }
                        break;
                    default:
                        break;
                }
                cell.titleLabel.text = _firstTitleArr[indexPath.row];
                break;
            case 2:
                switch (indexPath.row) {
                    case 0:
                        switch (_userModel.isPregnancy) {
                            case 0:
                                cell.messageTextfiled.text = @"怀孕中";
                                break;
                            case 1:
                                cell.messageTextfiled.text = @"已生育";
                                break;
                            case 2:
                                cell.messageTextfiled.text = @"备孕中";
                            default:
                                break;
                        }
                        break;
                    case 1:
                        if (_userModel.babyBirthday) {
                            cell.messageTextfiled.text = _userModel.babyBirthday;
                        }else{
                            cell.messageTextfiled.placeholder = _secondFieldArr[indexPath.row];
                        }
                        break;
                    case 2:
                        if (_userModel.babySex) {
                            cell.messageTextfiled.text = _userModel.babySex;
                        }else{
                            cell.messageTextfiled.placeholder = _secondFieldArr[indexPath.row];
                        }
                        break;
                        
                    default:
                        break;
                }
                cell.titleLabel.text = _secondTitleArr[indexPath.row];
                break;
            case 3:
                switch (indexPath.row) {
                    case 0:
                        cell.messageTextfiled.text = @"修改密码";
                        break;
                    case 1:
                        cell.messageTextfiled.textColor = kImportFontColor;
                        cell.messageTextfiled.text = _userModel.mobliePhone;
                        break;
                    default:
                        break;
                }
                cell.titleLabel.text = _thirdTitleArr[indexPath.row];
                break;
            default:
                break;
        }
        return cell;
        
    }
    static NSString *idenifer = @"cell";
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:idenifer];
    cell.imageView.image = V_IMAGE(@"icon-Avatar M");
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.detailTextLabel.text = @"修改头像";
    cell.detailTextLabel.textColor = kNormalFontColor;
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    switch (section) {
        case 0:
            return 1;
            break;
        case 1:
            return 6;
            break;
        case 2:
            return 3;
            break;
        case 3:
            return 2;
            break;
        default:
            return 0;
            break;
    }
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
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
