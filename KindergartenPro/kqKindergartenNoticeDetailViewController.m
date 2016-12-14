//
//  kqKindergartenNoticeDetailViewController.m
//  KindergartenPro
//
//  Created by 海峰 on 14-8-20.
//  Copyright (c) 2014年 海峰. All rights reserved.
//

#import "kqKindergartenNoticeDetailViewController.h"
#import "kqCreatNewKindergartenNoticeViewController.h"
@interface kqKindergartenNoticeDetailViewController ()
@property (weak, nonatomic) IBOutlet UITextView *contentTextView;

@end

@implementation kqKindergartenNoticeDetailViewController

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
    [self initTopBar];
//    UIImageView *topView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"wave.png"]];
//    topView.frame = CGRectMake(0, 0, 320, 10);
//    [self.view addSubview:topView];
    self.contentTextView.frame = CGRectMake(0, 5, SCREEN_W, SCREEN_H - 69);
    self.contentTextView.text = [self.dataDictionary valueForKey:@"noticeContent"];
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
    if (self.isEditMode) {
        UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [rightButton addTarget:self action:@selector(tapEditButton) forControlEvents:UIControlEventTouchUpInside];
        rightButton.frame =CGRectMake(0.0f, 10.5f, 25.0f, 25.0f);
//        [rightButton setTitle:@"编辑" forState:UIControlStateNormal];
        [rightButton setBackgroundImage:[UIImage imageNamed:@"editImage.png"] forState:UIControlStateNormal];
        [rightButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        UIBarButtonItem* right = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
        self.navigationItem.rightBarButtonItem = right;
    }
}

-(void) tapBackButton
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void) tapEditButton
{
    kqCreatNewKindergartenNoticeViewController *cndfVc = [[kqCreatNewKindergartenNoticeViewController alloc] initWithNibName:@"kqCreatNewKindergartenNoticeViewController" bundle:nil];
    cndfVc.dataDictionary = self.dataDictionary;
    cndfVc.babyNoticeTypeId = self.babyNoticeTypeId;
    cndfVc.title = @"创建公告";
    [self.navigationController pushViewController:cndfVc animated:YES];
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
@end
