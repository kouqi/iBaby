//
//  kqBabyInformationManualViewController.m
//  KindergartenPro
//
//  Created by 海峰 on 14-7-26.
//  Copyright (c) 2014年 海峰. All rights reserved.
//

#import "kqBabyInformationManualViewController.h"
#import "kqBabyInformationManualCell.h"
@interface kqBabyInformationManualViewController ()
@property (strong, nonatomic) UITableView *tableView;
@end

@implementation kqBabyInformationManualViewController

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
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, SCREEN_H - 64)];
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0){
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.tableView];
    [HNAGeneral showOnWindow:@"加载中"];
    HNADownLoadManager *dlm = [HNADownLoadManager sharedDownLoadManager];
    dlm.delegate = self;
    [dlm downLoadBabyInfomationWith:@"0"];

    // Do any additional setup after loading the view from its nib.
}

-(void)downLoadBabyInfomationDelegate:(NSDictionary *)dic
{
    [HNAGeneral hidenHUD];
    NSDictionary *dataMap = [dic valueForKey:@"dataMap"];
    if ([[dataMap valueForKey:@"state"] isEqualToString:SU]) {
        NSArray *arr = [dataMap valueForKey:@"data"];
        if (arr.count != 0) {
            self.dataArray = [NSMutableArray arrayWithArray:arr];
            [self.tableView reloadData];
        }
    }else if ([[dataMap valueForKey:@"state"] isEqualToString:ER]){
//        [HNAGeneral showAlertViewWithTitle:nil andMessage:[dataMap valueForKey:@"stateMsg"]];
        [HNAGeneral showTipTextOnWindow:[dataMap valueForKey:@"stateMsg"]];
    }
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

-(void)viewWillDisappear:(BOOL)animated
{
    for (int i = 0; i < 5; i++) {
        kqBabyInformationManualCell *cell = (kqBabyInformationManualCell *)[self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:i inSection:0]];
        if (cell.isPlaying) {
            [cell.moviePlayer stop];
            [cell stopAnimation];
        }
    }
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 180.0f;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    kqBabyInformationManualCell *cell = (kqBabyInformationManualCell *)[[[NSBundle mainBundle] loadNibNamed:@"kqBabyInformationManualCell" owner:self options:nil] objectAtIndex:0];
    NSDictionary *infoDic = [self.dataArray objectAtIndex:indexPath.row];
    cell.dataDictionary = [NSDictionary dictionaryWithDictionary:infoDic];
    [cell initCell];
    return cell;
}



-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

@end
