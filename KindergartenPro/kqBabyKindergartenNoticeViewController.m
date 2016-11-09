//
//  kqBabyKindergartenNoticeViewController.m
//  KindergartenPro
//
//  Created by 海峰 on 15/1/22.
//  Copyright (c) 2015年 海峰. All rights reserved.
//

#import "kqBabyKindergartenNoticeViewController.h"
#import "kqKindergartenNoticeViewController.h"
@interface kqBabyKindergartenNoticeViewController ()

@property (weak, nonatomic) IBOutlet UILabel *schoolActiveLabel;
@property (weak, nonatomic) IBOutlet UILabel *schoolNoticeLabel;

@end

@implementation kqBabyKindergartenNoticeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initTopBar];
//    UIImageView *topView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"wave.png"]];
//    topView.frame = CGRectMake(0, 0, 320, 10);
//    [self.view addSubview:topView];
    [self initView];
    // Do any additional setup after loading the view from its nib.
}

-(void) initView
{
    kqDistingKindergartenAndSchool *dkas = [kqDistingKindergartenAndSchool sharedDistingKindergartenAndSchool];
    self.schoolActiveLabel.text = dkas.schoolActive;
    self.schoolNoticeLabel.text = dkas.schoolNotice;
}

-(void) initTopBar
{
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftButton addTarget:self action:@selector(tapBackButton) forControlEvents:UIControlEventTouchUpInside];
    leftButton.frame =CGRectMake(0.0f, 6.0f, 23.0f, 23.0f);
    [leftButton setImage:[UIImage imageNamed:@"leftBack.png"] forState:UIControlStateNormal];
    UIBarButtonItem* left = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
    self.navigationItem.leftBarButtonItem = left;
}

-(void) tapBackButton
{
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)tapNoticeButton:(UIButton *)sender {
    self.hidesBottomBarWhenPushed = YES;
    kqDistingKindergartenAndSchool *dkas = [kqDistingKindergartenAndSchool sharedDistingKindergartenAndSchool];
    kqKindergartenNoticeViewController *knVC = [[kqKindergartenNoticeViewController alloc] initWithNibName:@"kqKindergartenNoticeViewController" bundle:nil];
    knVC.babyNoticeTypeId = 1;
    knVC.title = dkas.schoolNotice;
    knVC.isTeacher = NO;
    [self.navigationController pushViewController:knVC animated:YES];
}
- (IBAction)tapShouceButton:(UIButton *)sender {
    self.hidesBottomBarWhenPushed = YES;
    kqKindergartenNoticeViewController *knVC = [[kqKindergartenNoticeViewController alloc] initWithNibName:@"kqKindergartenNoticeViewController" bundle:nil];
    knVC.babyNoticeTypeId = 2;
    knVC.title = @"安全手册";
    knVC.isTeacher = NO;
    [self.navigationController pushViewController:knVC animated:YES];
}
- (IBAction)tapHuodongButton:(id)sender {
    self.hidesBottomBarWhenPushed = YES;
    kqDistingKindergartenAndSchool *dkas = [kqDistingKindergartenAndSchool sharedDistingKindergartenAndSchool];
    kqKindergartenNoticeViewController *knVC = [[kqKindergartenNoticeViewController alloc] initWithNibName:@"kqKindergartenNoticeViewController" bundle:nil];
    knVC.babyNoticeTypeId = 3;
    knVC.title = dkas.schoolActive;
    knVC.isTeacher = NO;
    [self.navigationController pushViewController:knVC animated:YES];
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
