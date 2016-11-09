//
//  kqTBabyInfomationDetailViewController.m
//  KindergartenPro
//
//  Created by 海峰 on 14-9-25.
//  Copyright (c) 2014年 海峰. All rights reserved.
//

#import "kqTBabyInfomationDetailViewController.h"
#import "kqTBabyInfomationEntryViewController.h"
@interface kqTBabyInfomationDetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;

@end

@implementation kqTBabyInfomationDetailViewController

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
    [self initView];
    // Do any additional setup after loading the view from its nib.
}

-(void) initView
{
    NSString *editDate = [self.dataDictionary valueForKey:@"editDate"];
    NSArray *arr = [editDate componentsSeparatedByString:@"T"];
    self.timeLabel.text = [NSString stringWithFormat:@"%@ %@",[arr objectAtIndex:0],[arr objectAtIndex:1]];
    self.contentLabel.text = [HNAGeneral getContent:self.dataDictionary];
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
    [rightButton addTarget:self action:@selector(tapCompletedButton) forControlEvents:UIControlEventTouchUpInside];
    rightButton.frame =CGRectMake(0.0f, 10.5f, 25.0f, 25.0f);
//    [rightButton setTitle:@"编辑" forState:UIControlStateNormal];
    [rightButton setBackgroundImage:[UIImage imageNamed:@"editImage.png"] forState:UIControlStateNormal];
    UIBarButtonItem* right = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
    self.navigationItem.rightBarButtonItem = right;
}

-(void) tapCompletedButton
{
    self.hidesBottomBarWhenPushed = YES;
    kqTBabyInfomationEntryViewController *tbieVC = [[kqTBabyInfomationEntryViewController alloc] initWithNibName:@"kqTBabyInfomationEntryViewController" bundle:nil];
    tbieVC.title = @"编辑信息手册";
    tbieVC.dataDictionary = [NSMutableDictionary dictionaryWithDictionary:self.dataDictionary];
    tbieVC.delegate = self;
    [self.navigationController pushViewController:tbieVC animated:YES];
}

-(void)didFabuHandBookSucessWithTitle:(NSString *)title
{
    self.contentLabel.text = [HNAGeneral getContentString:title];
    [self.delegate didFabuHandBookSucessWithTitle:title];
}

-(void) tapBackButton
{
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end