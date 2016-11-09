//
//  kqTBabyContactDetailViewController.m
//  KindergartenPro
//
//  Created by 海峰 on 14-9-29.
//  Copyright (c) 2014年 海峰. All rights reserved.
//

#import "kqTBabyContactDetailViewController.h"
#import "kqChatWindowViewController.h"
@interface kqTBabyContactDetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *babyNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *relationLabel;
@property (weak, nonatomic) IBOutlet UIView *topView;

@end

@implementation kqTBabyContactDetailViewController

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
//    UIView *topView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"wave.png"]];
//    topView.frame = CGRectMake(0, 0, 320, 10);
//    [self.view addSubview:topView];
    self.title = @"联系家长";
    if ([self.dataDictionary valueForKey:@"name"]) {
        self.nameLabel.text = [NSString stringWithFormat:@"姓名：%@",[self.dataDictionary valueForKey:@"name"]];
    }else{
        self.nameLabel.text = [NSString stringWithFormat:@"姓名："];
    }
    self.babyNameLabel.text = [NSString stringWithFormat:@"宝宝：%@",[self.dataDictionary valueForKey:@"babyName"]];
    self.relationLabel.text = @"关系：监护人";
    [self initTopBar];
    self.topView.layer.borderColor = RGB(226, 226, 226, 1.0f).CGColor;
    self.topView.layer.borderWidth = 0.5f;
    
    
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


- (IBAction)tapSendMessageButton:(UIButton *)sender {
    self.hidesBottomBarWhenPushed = YES;
    kqChatWindowViewController *cwVC = [[kqChatWindowViewController alloc] initWithNibName:@"kqChatWindowViewController" bundle:nil];
    cwVC.roleID = [self.dataDictionary valueForKey:@"id"];
    cwVC.title = [self.dataDictionary valueForKey:@"name"];
    cwVC.roleName = [self.dataDictionary valueForKey:@"deviceid"];
    cwVC.roleType = JiazhangType;
    [self.navigationController pushViewController:cwVC animated:YES];
}
- (IBAction)tapCallButton:(UIButton *)sender {
    NSURL *phoneURL = [NSURL URLWithString:[NSString stringWithFormat:@"tel://%@",[self.dataDictionary valueForKey:@"loginName"]]];
    UIWebView *phoneCallWebView = [[UIWebView alloc] initWithFrame:CGRectZero];
    [phoneCallWebView loadRequest:[NSURLRequest requestWithURL:phoneURL]];
    [self.view addSubview:phoneCallWebView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end