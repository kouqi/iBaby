//
//  kqFoundDetailViewController.m
//  KindergartenPro
//
//  Created by 海峰 on 14-8-21.
//  Copyright (c) 2014年 海峰. All rights reserved.
//

#import "kqFoundDetailViewController.h"

@interface kqFoundDetailViewController ()
@property (strong, nonatomic) UIWebView *webView;

@end

@implementation kqFoundDetailViewController

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
    self.webView = [[UIWebView alloc] init];
    self.webView.frame = CGRectMake(0, 0, SCREEN_W, SCREEN_H - 64);
    [self.view addSubview:self.webView];
    NSMutableString *htmlStr = [NSMutableString stringWithFormat:@"<div style=\"text-align:center;\"><font size=\"5\">%@</font></div><span style=\"float:right;\"><font size=\"2\">%@</font></span><br/><font size=\"3\" color=\"#646464\">%@</font>",[self.dataDictionary valueForKey:@"noticeTitle"],[[self.dataDictionary valueForKey:@"editDate"] stringByReplacingOccurrencesOfString:@"T" withString:@" "],[self.dataDictionary valueForKey:@"noticeContent"]];
    NSArray *imgList = [self.dataDictionary valueForKey:@"imgList"];
    if (imgList.count != 0) {
        for (NSDictionary *dic in imgList) {
            [htmlStr appendFormat:@"<img class=\"littleimg\" src=\"%@\" width=\"300\" height=\"460\" />",[NSString stringWithFormat:@"%@%@",self.fileUrlString,[dic valueForKey:@"imgPath"]]];
        }
    }
    [self.webView loadHTMLString:htmlStr baseURL:nil];
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


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
