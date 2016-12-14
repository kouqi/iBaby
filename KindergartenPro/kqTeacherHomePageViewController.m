//
//  kqTeacherHomePageViewController.m
//  KindergartenPro
//
//  Created by 海峰 on 14-9-1.
//  Copyright (c) 2014年 海峰. All rights reserved.
//
#define BASETAG 1000
#import "kqTeacherHomePageViewController.h"
#import "kqTBabyView.h"
#import "kqTeacherPersonalViewController.h"
#import "kqTeacherNewPersonalCenterViewController.h"
@interface kqTeacherHomePageViewController ()
@property (strong, nonatomic) UIScrollView *scrollView;
@property (strong, nonatomic) NSMutableArray *dataArray;
@end

@implementation kqTeacherHomePageViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

#pragma 下载数据代理
-(void)downLoadTeacherHomePageDelegate:(NSDictionary *)dic
{
    [HNAGeneral hidenHUD];
    NSDictionary *dataMap = [dic valueForKey:@"dataMap"];
    NSString *state = [dataMap valueForKey:@"state"];
    if ([state isEqualToString:SU]) {
        NSArray *arr = [dataMap valueForKey:@"data"];
        if (arr.count != 0) {
            self.dataArray = [NSMutableArray array];
            NSString *urlStr = [dic valueForKey:@"fileUrl"];
            for (NSDictionary *dic in arr) {
                NSMutableDictionary *dics = [NSMutableDictionary dictionary];
//                [dics setValue:[dic valueForKey:@"name"] forKey:@"babyName"];
                [dics setValue:[dic valueForKey:@"babyName"] forKey:@"babyName"];
                [dics setValue:[dic valueForKey:@"babyState"] forKey:@"babyState"];
                [dics setValue:[dic valueForKey:@"id"] forKey:@"id"];
                [dics setValue:[dic valueForKey:@"loginName"] forKey:@"loginName"];
                [dics setValue:[NSString stringWithFormat:@"%@%@",urlStr,[dic valueForKey:@"imgPath"]] forKey:@"imgPath"];
                [self.dataArray addObject:dics];
            }
            [self initBabyView];
        }
    }else if([state isEqualToString:ER]){
        [HNAGeneral showAlertViewWithTitle:@"提示" andMessage:[dataMap valueForKey:@"stateMsg"]];
    }
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self initTopBar];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
//    UIImageView *topView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"wave.png"]];
//    topView.frame = CGRectMake(0, 0, 320, 10);
//    [self.view addSubview:topView];
    
    HNADownLoadManager *dlm = [HNADownLoadManager sharedDownLoadManager];
    dlm.delegate = self;
    [dlm downLoadTeacherHomePage];
    [self initTopBar];
    // Do any additional setup after loading the view from its nib.
}

-(void) initBabyView
{
    kqDistingKindergartenAndSchool *dkas = [kqDistingKindergartenAndSchool sharedDistingKindergartenAndSchool];
    if (self.scrollView) {
        [self.scrollView removeFromSuperview];
        self.scrollView = nil;
    }
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, SCREEN_H - 108)];
    self.scrollView.backgroundColor = [UIColor clearColor];
    int locX = 29.0f;
    int locY = 5.0f;
    for (int i = 0; i < self.dataArray.count;) {
        for (int j = 0; j < 3; j++) {
            kqTBabyView *tbv = (kqTBabyView *)[[[NSBundle mainBundle] loadNibNamed:@"kqTBabyView" owner:self options:nil] objectAtIndex:0];
            tbv.dependOnViewController = self;
            tbv.tag = BASETAG + i;
            tbv.babyName.text = [[self.dataArray objectAtIndex:i] valueForKey:@"babyName"];
            int state = [[[self.dataArray objectAtIndex:i] valueForKey:@"babyState"] intValue];
            NSString *stateText;
            switch (state) {
                case 0:
                    stateText = dkas.signIn;
                    break;
                case 1:
                    stateText = dkas.signOut;
                    break;
                case 2:
                    stateText = @"病假";
                    break;
                case 3:
                    stateText = @"事假";
                    break;
                case 4:
                    stateText = @"未纪录";
                    break;
                default:
                    break;
            }
            tbv.babyHeaderImageView.layer.cornerRadius = 21.0f;
            tbv.babyHeaderImageView.layer.masksToBounds = YES;
            [tbv.babyHeaderImageView setImageWithURL:[NSURL URLWithString:[[self.dataArray objectAtIndex:i] valueForKey:@"imgPath"]] placeholderImage:[UIImage imageNamed:@"tbabyDefaultHeadImage.png"]];
            if (state == 4) {
                tbv.YichangImageView.hidden = NO;
            }else{
                tbv.YichangImageView.hidden = YES;
            }
            if ([stateText isEqualToString:@"未记录"]) {
                tbv.BabyState.hidden = YES;
            }
            if (state == 4) {
                tbv.BabyState.hidden = YES;
            }
            tbv.BabyState.text = stateText;
            tbv.dataDictionary = [self.dataArray objectAtIndex:i];
            tbv.frame = CGRectMake(locX, locY, tbv.frame.size.width, tbv.frame.size.height);
            [self.scrollView addSubview:tbv];
            locX = locX + tbv.frame.size.width + 29.0f;
            i++;
            if (i >= self.dataArray.count) {
                break;
            }
        }
        if (i >= self.dataArray.count) {
            break;
        }
        locX = 29.0f;
        locY = locY + 82.0f + 5.0f;
    }
    self.scrollView.contentSize = CGSizeMake(SCREEN_W, locY = locY + 82.0f + 5.0f);
    [self.view addSubview:self.scrollView];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.hidesBottomBarWhenPushed = NO;
}


-(void) initTopBar
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 42, 42);
    [button setTitle:@"刷新" forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:14.0f];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
    [button addTarget:self action:@selector(tapFreshButton) forControlEvents:UIControlEventTouchUpInside];
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    button1.frame = CGRectMake(0, 0, 42, 42);
    [button1 setTitle:@"签到" forState:UIControlStateNormal];
    button1.titleLabel.font = [UIFont systemFontOfSize:14.0f];
    [button1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button1 setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
    [button1 addTarget:self action:@selector(tapPiliangButton) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem* right = [[UIBarButtonItem alloc] initWithCustomView:button];
    UIBarButtonItem* right1 = [[UIBarButtonItem alloc] initWithCustomView:button1];
    self.navigationItem.rightBarButtonItems = [NSArray arrayWithObjects:right,right1, nil];
    
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftButton addTarget:self action:@selector(tapBackButton) forControlEvents:UIControlEventTouchUpInside];
    leftButton.frame =CGRectMake(0.0f, 6.0f, 23.0f, 23.0f);
    [leftButton setImage:[UIImage imageNamed:@"btn4"] forState:UIControlStateNormal];
    UIBarButtonItem* left = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
    self.navigationItem.leftBarButtonItem = left;
}

-(void) tapBackButton
{
    self.hidesBottomBarWhenPushed = YES;
//    kqTeacherPersonalViewController *oksvc = [[kqTeacherPersonalViewController alloc] initWithNibName:@"kqTeacherPersonalViewController" bundle:nil];
//    [self.navigationController pushViewController:oksvc animated:YES];
    kqTeacherNewPersonalCenterViewController *oksvc = [[kqTeacherNewPersonalCenterViewController alloc] initWithNibName:@"kqTeacherNewPersonalCenterViewController" bundle:nil];
    [self.navigationController pushViewController:oksvc animated:YES];
    
}

-(void)didChangeBabyStatues
{
    [HNAGeneral showOnWindow:@"刷新中"];
    HNADownLoadManager *dlm = [HNADownLoadManager sharedDownLoadManager];
    dlm.delegate = self;
    [dlm downLoadTeacherHomePage];
}

-(void) tapFreshButton
{
    [HNAGeneral showOnWindow:@"刷新中"];
    HNADownLoadManager *dlm = [HNADownLoadManager sharedDownLoadManager];
    dlm.delegate = self;
    [dlm downLoadTeacherHomePage];
}

-(void) tapPiliangButton
{
    self.hidesBottomBarWhenPushed = YES;
    kqOneKeySignViewController *oksvc = [[kqOneKeySignViewController alloc] initWithNibName:@"kqOneKeySignViewController" bundle:nil];
    oksvc.dataArray = self.dataArray;
    oksvc.delegate = self;
    [self.navigationController pushViewController:oksvc animated:YES];
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
