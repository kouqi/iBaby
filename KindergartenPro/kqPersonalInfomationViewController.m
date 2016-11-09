//
//  kqPersonalInfomationViewController.m
//  KindergartenPro
//
//  Created by 海峰 on 14-8-21.
//  Copyright (c) 2014年 海峰. All rights reserved.
//

#import "kqPersonalInfomationViewController.h"

@interface kqPersonalInfomationViewController ()
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *startLabel;
@property (weak, nonatomic) IBOutlet UILabel *deadLineLabel;

@end

@implementation kqPersonalInfomationViewController

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
    kqPersonalInfoMation *info = [kqPersonalInfoMation sharedPersonalInfoMation];
    self.nameLabel.text = [NSString stringWithFormat:@"会员：%@",info.realName];
    self.startLabel.text = [NSString stringWithFormat:@"会员激活日期：%@",info.startDate];
    self.deadLineLabel.text = [NSString stringWithFormat:@"会员截止日期：%@",info.endDae];
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
}

-(void) tapBackButton
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)tapGoOnButton:(id)sender {
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
