//
//  kqCreatNewBabyContactViewController.m
//  KindergartenPro
//
//  Created by 海峰 on 14-10-16.
//  Copyright (c) 2014年 海峰. All rights reserved.
//

#import "kqCreatNewBabyContactViewController.h"

@interface kqCreatNewBabyContactViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *cnTBabyDefaultHeadImageView;
@property (weak, nonatomic) IBOutlet UITextField *tFatherNameTextField;
@property (weak, nonatomic) IBOutlet UILabel *tFatherNameLabel;
@property (weak, nonatomic) IBOutlet UITextField *tFatherPhoneTextField;
@property (weak, nonatomic) IBOutlet UILabel *tFatherPhoneLabel;
@property (weak, nonatomic) IBOutlet UIButton *tFatherPhoneButon;
@property (weak, nonatomic) IBOutlet UITextField *tMotherNameTextField;
@property (weak, nonatomic) IBOutlet UILabel *tMotherNameLabel;
@property (weak, nonatomic) IBOutlet UITextField *tMotherPhoneTextField;
@property (weak, nonatomic) IBOutlet UILabel *tMotherPhoneLabel;
@property (weak, nonatomic) IBOutlet UIButton *tMotherPhoneButton;
@property (weak, nonatomic) IBOutlet UITextField *tHomeAddressTextField;
@property (weak, nonatomic) IBOutlet UILabel *tHomeAddressLabel;
@property (weak, nonatomic) IBOutlet UIButton *deletButton;

@end

@implementation kqCreatNewBabyContactViewController

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
    if (self.isEditMode) {
        self.tFatherNameLabel.hidden = YES;
        self.tFatherPhoneButon.hidden = YES;
        self.tFatherPhoneLabel.hidden = YES;
        self.tMotherNameLabel.hidden = YES;
        self.tMotherPhoneButton.hidden = YES;
        self.tMotherPhoneLabel.hidden = YES;
        self.tHomeAddressLabel.hidden = YES;
        if (self.dataDictionary) {
            self.deletButton.hidden = NO;
            self.tFatherNameTextField.text = [self.dataDictionary valueForKey:@"name"];
            self.tFatherPhoneTextField.text = [self.dataDictionary valueForKey:@"loginName"];
            self.tHomeAddressTextField.text = [self.dataDictionary valueForKey:@"userAddress"];
        }else{
            self.deletButton.hidden = YES;
        }
    }else{
        self.tFatherNameTextField.hidden = YES;
        self.tFatherPhoneTextField.hidden = YES;
        self.tMotherNameTextField.hidden = YES;
        self.tMotherPhoneTextField.hidden = YES;
        self.tHomeAddressTextField.hidden = YES;
        self.deletButton.hidden = YES;
        if (self.dataDictionary) {
            self.tFatherNameLabel.text = [self.dataDictionary valueForKey:@"name"];
            self.tFatherPhoneLabel.text = [self.dataDictionary valueForKey:@"loginName"];
            self.tHomeAddressLabel.text = [self.dataDictionary valueForKey:@"userAddress"];
        }
    }
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
    [rightButton addTarget:self action:@selector(tapCreatNewButon) forControlEvents:UIControlEventTouchUpInside];
    if (self.isEditMode) {
        rightButton.frame =CGRectMake(0.0f, 10.5f, 25.0f, 25.0f);
        [rightButton setImage:[UIImage imageNamed:@"completed.png"] forState:UIControlStateNormal];
    }else{
        rightButton.frame =CGRectMake(0.0f, 10.5f, 25.0f, 25.0f);
//        [rightButton setTitle:@"编辑" forState:UIControlStateNormal];
        [rightButton setBackgroundImage:[UIImage imageNamed:@"editImage.png"] forState:UIControlStateNormal];
    }
    UIBarButtonItem* right = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
    self.navigationItem.rightBarButtonItem = right;
}

-(void) tapCreatNewButon
{
    if (!self.isEditMode) {
        self.hidesBottomBarWhenPushed = YES;
        kqCreatNewBabyContactViewController *cnbcVC = [[kqCreatNewBabyContactViewController alloc] initWithNibName:@"kqCreatNewBabyContactViewController" bundle:nil];
        cnbcVC.isEditMode = YES;
        cnbcVC.dataDictionary = self.dataDictionary;
        [self.navigationController pushViewController:cnbcVC animated:YES];
    }
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

-(UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}

- (IBAction)tapDeletedContactButton:(id)sender {
    
}

- (IBAction)tapCallButton:(UIButton *)sender {
    NSURL *phoneURL = [NSURL URLWithString:[NSString stringWithFormat:@"tel://%@",[self.dataDictionary valueForKey:@"loginName"]]];
    UIWebView *phoneCallWebView = [[UIWebView alloc] initWithFrame:CGRectZero];
    [phoneCallWebView loadRequest:[NSURLRequest requestWithURL:phoneURL]];
    [self.view addSubview:phoneCallWebView];
}

@end
