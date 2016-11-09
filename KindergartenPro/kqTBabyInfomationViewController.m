//
//  kqTBabyInfomationViewController.m
//  KindergartenPro
//
//  Created by 海峰 on 16/5/13.
//  Copyright © 2016年 海峰. All rights reserved.
//

#import "kqTBabyInfomationViewController.h"
#import "kqTBabyInfomationTableViewCell.h"
#import "kqTBabyInfomationDetailViewController.h"
@interface kqTBabyInfomationViewController ()<UITableViewDelegate,UITableViewDataSource,TapCellButtonsDelegate,FabuBookHandbookDelegate,HNADownLoadDelegate>
//信息手册
@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *infomationDataArray;
@property (strong, nonatomic) NSString *sendJPUSHContent;
@end

@implementation kqTBabyInfomationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initTopBar];
    [self initTableView];
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
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 42, 42);
//    [button setTitle:@"新建" forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"新建"] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:14.0f];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
    [button addTarget:self action:@selector(tapEntryInfomationButton) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem* right = [[UIBarButtonItem alloc] initWithCustomView:button];
    self.navigationItem.rightBarButtonItem = right;
}

-(void) tapBackButton
{
    [self.navigationController popViewControllerAnimated:YES];
}



#pragma mark - 信息手册
- (void)tapEntryInfomationButton{
    self.hidesBottomBarWhenPushed = YES;
    kqTBabyInfomationEntryViewController *tbieVC = [[kqTBabyInfomationEntryViewController alloc] initWithNibName:@"kqTBabyInfomationEntryViewController" bundle:nil];
    tbieVC.title = @"新增信息手册";
    tbieVC.babyId = [NSString stringWithFormat:@"%d",[[self.dataDictionary valueForKey:@"id"] intValue]];
    tbieVC.delegate = self;
    [self.navigationController pushViewController:tbieVC animated:YES];
}

-(void)didFabuHandBookSucessWithTitle:(NSString *)title
{
    [self getBabyHandBook];
}

//TODO:下载相关
-(void) getBabyHandBook
{
    [HNAGeneral showOnWindow:@"加载中"];
    HNADownLoadManager *dl = [HNADownLoadManager sharedDownLoadManager];
    dl.delegate = self;
    NOWTIME;
    [dl getBabyHandBookFromBabyID:[self.dataDictionary valueForKey:@"id"] andEditDate:nowTime];
}

-(void)getBabyHandBookDelegate:(NSDictionary *)dic
{
    
    NSDictionary *dataMap = [dic valueForKey:@"dataMap"];
    NSString *state = [dataMap valueForKey:@"state"];
    if ([state isEqualToString:SU]) {
        NSArray *arr = [dataMap valueForKey:@"data"];
        if (arr.count != 0) {
            self.infomationDataArray = [NSMutableArray arrayWithArray:arr];
        }else{
            if (self.infomationDataArray != nil) {
                [self.infomationDataArray removeAllObjects];
            }
            [HNAGeneral showAlertViewWithTitle:@"提示" andMessage:@"暂无信息手册，您可以点击右上角新建"];
        }
        [HNAGeneral hidenHUD];
//        NSArray *signArr = [dataMap valueForKey:@"dataSignPage"];
//        [self initBabyState:signArr];
        [self.tableView reloadData];
    }else if([state isEqualToString:ER]){
        [HNAGeneral hidenHUD];
        [HNAGeneral showAlertViewWithTitle:@"提示" andMessage:[dataMap valueForKey:@"stateMsg"]];
    }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - tableViewDelegate
-(void) initTableView
{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 5, SCREEN_W, SCREEN_H - 5)];
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
    [self getBabyHandBook];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.infomationDataArray.count;
    //    return 5;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100.0f;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    kqTBabyInfomationTableViewCell *cell = (kqTBabyInfomationTableViewCell *)[[[NSBundle mainBundle] loadNibNamed:@"kqTBabyInfomationTableViewCell" owner:self options:nil] objectAtIndex:0];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.indexPath = indexPath;
    cell.delegate = self;
//    cell.titleLabel.text = [[self.infomationDataArray objectAtIndexedSubscript:indexPath.row] valueForKey:@"bookTitle"];
    cell.titleLabel.text = [HNAGeneral getContent:[self.infomationDataArray objectAtIndexedSubscript:indexPath.row] ];
    NSString *editDate = [[self.infomationDataArray objectAtIndexedSubscript:indexPath.row] valueForKey:@"editDate"];
    NSArray *arr = [editDate componentsSeparatedByString:@"T"];
    cell.timeLabel.text = [NSString stringWithFormat:@"%@ %@",[arr objectAtIndex:0],[arr objectAtIndex:1]];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    self.hidesBottomBarWhenPushed = YES;
    kqTBabyInfomationDetailViewController *tbieVC = [[kqTBabyInfomationDetailViewController alloc] initWithNibName:@"kqTBabyInfomationDetailViewController" bundle:nil];
    tbieVC.title = @"详情";
    tbieVC.dataDictionary = [self.infomationDataArray objectAtIndex:indexPath.row];
    tbieVC.delegate = self;
    [self.navigationController pushViewController:tbieVC animated:YES];
}

#pragma mark - tapCellButtonsDelegate
-(void)didTapCellSendButtonWithIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"-------%ld",(long)indexPath.row);
    [HNAGeneral showOnWindow:@"发送中"];
    HNADownLoadManager *dl = [HNADownLoadManager sharedDownLoadManager];
    dl.delegate = self;
    self.sendJPUSHContent = [HNAGeneral getContent:[self.infomationDataArray objectAtIndex:indexPath.row]];
    [dl sendHandBookByID:[[self.infomationDataArray objectAtIndex:indexPath.row] valueForKey:@"id"]];
}

-(void)didTapCellDeleteButtonWithIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"-------%ld",(long)indexPath.row);
    [HNAGeneral showOnWindow:@"删除中"];
    HNADownLoadManager *dl = [HNADownLoadManager sharedDownLoadManager];
    dl.delegate = self;
    [dl deleteHandBookByID:[[self.infomationDataArray objectAtIndex:indexPath.row] valueForKey:@"id"]];
}

-(void) sendHandBookByIDDelegate:(NSDictionary *)dic
{
    [HNAGeneral hidenHUD];
    NSDictionary *dataMap = [dic valueForKey:@"dataMap"];
    NSString *state = [dataMap valueForKey:@"state"];
    HNADownLoadManager *dl = [HNADownLoadManager sharedDownLoadManager];
    if ([state isEqualToString:SU]) {
        if (self.sendJPUSHContent.length > 20) {
            self.sendJPUSHContent = [self.sendJPUSHContent substringToIndex:20];
        }
        if ([[self.dataDictionary valueForKey:@"deviceid"] isKindOfClass:[NSString class]]) {
            NSArray *arr = [NSArray arrayWithObject:[self.dataDictionary valueForKey:@"deviceid"]];
            [dl sendJPushWithType:@"3" andContent:self.sendJPUSHContent andAlias:arr];
        }
        [HNAGeneral showAlertViewWithTitle:@"提示" andMessage:[dataMap valueForKey:@"stateMsg"]];
    }else if([state isEqualToString:ER]){
        [HNAGeneral showAlertViewWithTitle:@"提示" andMessage:[dataMap valueForKey:@"stateMsg"]];
    }
}

-(void)deleteHandBookDelegate:(NSDictionary *)dic
{
    [HNAGeneral hidenHUD];
    NSDictionary *dataMap = [dic valueForKey:@"dataMap"];
    NSString *state = [dataMap valueForKey:@"state"];
    if ([state isEqualToString:SU]) {
        [self getBabyHandBook];
        [HNAGeneral showAlertViewWithTitle:@"提示" andMessage:[dataMap valueForKey:@"stateMsg"]];
    }else if([state isEqualToString:ER]){
        [HNAGeneral showAlertViewWithTitle:@"提示" andMessage:[dataMap valueForKey:@"stateMsg"]];
    }
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
