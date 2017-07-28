//
//  PerinatalDoctorHomeVC.m
//  Perinatal
//
//  Created by OY on 2017/7/12.
//  Copyright © 2017年 OY. All rights reserved.
//

#import "PerinatalDoctorHomeVC.h"
#import "DoctorHomeTV.h"
#import "PerinatalWantConsultVC.h"
#import "DoctorDetailVM.h"
#import "DoctorAddFollowVM.h"
#import "QuestionModel.h"
@interface PerinatalDoctorHomeVC ()
{
    NSMutableArray *questions;
}
@property(nonatomic,strong)DoctorHomeTV *homeTv;
@end

@implementation PerinatalDoctorHomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self showTitle:@"医生主页"];
    [self showBack];
    questions = [NSMutableArray array];
    self.view.backgroundColor = kBackColor;
    [self showRightBarWithNormal:@"关注" selectedImg:@"" block:^(UIBarButtonItem *sender) {
        
    }];
    [self.view addSubview:self.homeTv];
    [self setBottomViews];
    [self getData];
    
}

-(void)getData{
    [DoctorDetailVM getDoctorDetailWithDoctorId:self.doctorMsgModel.registeredDoctorId sucess:^(NSDictionary *respone) {
        if ([respone[@"code"] integerValue] == 0) {
            NSDictionary *data = respone[@"data"];
            NSDictionary *doctor = data[@"doctor"];
            DoctorMsgModel *model = [[DoctorMsgModel alloc] initWithDictionary:doctor error:nil];
            self.doctorMsgModel = model;
            NSArray *questionList = data[@"questionList"];
            if (questionList.count > 0) {
                for (NSDictionary *dic in questionList) {
                    QuestionModel *question = [[QuestionModel alloc] initWithDictionary:dic error:nil];
                    [questions addObject:question];
                }
            }else{
                NSLog(@"暂无数据");
            }
            [self setSubviews];
        }
    } fail:^(NSString *error) {
        
    }];
}

-(void)setBottomViews{
    UILabel *titleLabel = [[UILabel alloc] init];
    //    NSString *cost = string(@"付费咨询：¥", self.doctorMsgModel.cost);
    NSString *cost = [NSString stringWithFormat:@"付费咨询：¥%@",self.doctorMsgModel.cost];
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:cost];
    [string addAttribute:NSForegroundColorAttributeName value:global_color range:NSMakeRange(5, self.doctorMsgModel.cost.stringValue.length+1)];
    titleLabel.attributedText = string;
    titleLabel.font = H14;
    titleLabel.backgroundColor = RGBCOLOR(255, 236, 240);
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    //    button.frame = CGRectMake(SCREENWIDTH - 150, SCREENHEIGHT - 48.f, 150, 48);
    [button setTitle:@"去咨询" forState:UIControlStateNormal];
    button.titleLabel.font = H14;
    [button setTitleColor:white_color forState:UIControlStateNormal];
    button.backgroundColor = RGBCOLOR(255, 69, 106);
    [button addTarget:self action:@selector(btnCommit:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    [self.view addSubview:titleLabel];
    
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(SCREENWIDTH - 150, 48));
        make.left.bottom.offset(0);
    }];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(150, 48));
        make.right.bottom.offset(0);
        make.left.equalTo(titleLabel.mas_right).with.offset(0);
    }];

}

-(void)setSubviews{
    _homeTv.doctorModel = self.doctorMsgModel;
    _homeTv.dataList = questions;;
    [_homeTv reloadData];
    
}

-(DoctorHomeTV *)homeTv{
    if (!_homeTv) {
        _homeTv = [[DoctorHomeTV alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT - 58) style:UITableViewStyleGrouped];
    }
    return _homeTv;
}

-(void)btnCommit:(UIButton *)bt
{
    [self pushVC:[PerinatalWantConsultVC new]];
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
