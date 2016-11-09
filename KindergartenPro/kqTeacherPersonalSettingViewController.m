//
//  kqTeacherPersonalSettingViewController.m
//  KindergartenPro
//
//  Created by 海峰 on 14-10-16.
//  Copyright (c) 2014年 海峰. All rights reserved.
//

#import "kqTeacherPersonalSettingViewController.h"
#import "kqTeacherSetPushViewController.h"
#import "kqModifyPasswordViewController.h"
@interface kqTeacherPersonalSettingViewController ()

@end

@implementation kqTeacherPersonalSettingViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
//    UIImageView *topView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"wave.png"]];
//    topView.frame = CGRectMake(0, 0, 320, 10);
//    [self.view addSubview:topView];
    [self initTopBar];
    // Do any additional setup after loading the view from its nib.
}

-(void) initTopBar
{
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftButton addTarget:self action:@selector(tapBackButton) forControlEvents:UIControlEventTouchUpInside];
    leftButton.frame =CGRectMake(0.0f, 6.0f, 23.0f, 23.0f);
    [leftButton setImage:[UIImage imageNamed:@"leftBack.png"] forState:UIControlStateNormal];
    UIBarButtonItem* left = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
    self.navigationItem.leftBarButtonItem = left;
    
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightButton addTarget:self action:@selector(tapLogOutButton:) forControlEvents:UIControlEventTouchUpInside];
    rightButton.frame =CGRectMake(0.0f, 6.0f, 52.0f, 27.0f);
    [rightButton setTitle:@"退出" forState:UIControlStateNormal];
    rightButton.titleLabel.font = [UIFont systemFontOfSize:16.0f];
    [rightButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    UIBarButtonItem* right = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
    self.navigationItem.rightBarButtonItem = right;
}

-(void) tapBackButton
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)tapLogOutButton:(id)sender {
    kqAppDelegate *appdelegate = (kqAppDelegate *)[UIApplication sharedApplication].delegate;
    kqLoginViewController *loginVC = [[kqLoginViewController alloc] initWithNibName:@"kqLoginViewController" bundle:nil];
    loginVC.delegate = appdelegate;
    appdelegate.window.rootViewController = loginVC;
    [loginVC setRemeber:NO andShow:NO];
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    NSDictionary *userInfo = [ud objectForKey:@"login"];
    if (userInfo != nil) {
        [ud setObject:nil forKey:@"login"];
        [ud synchronize];
    }
}

- (IBAction)tapModifyPasswordButton:(UIButton *)sender {
    self.hidesBottomBarWhenPushed = YES;
    kqModifyPasswordViewController *mpVC = [[kqModifyPasswordViewController alloc] initWithNibName:@"kqModifyPasswordViewController" bundle:nil];
    mpVC.title = @"密码修改";
    [self.navigationController pushViewController:mpVC animated:YES];
}

- (IBAction)tapSetPushButton:(id)sender {
    self.hidesBottomBarWhenPushed = YES;
    kqTeacherSetPushViewController *tspVC = [[kqTeacherSetPushViewController alloc] initWithNibName:@"kqTeacherSetPushViewController" bundle:nil];
    tspVC.title = @"推送设置";
    [self.navigationController pushViewController:tspVC animated:YES];
}

- (IBAction)tapNewMessageAlertButton:(UIButton *)sender {
    
}

- (IBAction)switchNewMessage:(id)sender {
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
