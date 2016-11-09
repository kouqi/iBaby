//
//  kqTBabyContactListViewController.m
//  KindergartenPro
//
//  Created by 海峰 on 14-9-26.
//  Copyright (c) 2014年 海峰. All rights reserved.
//

#import "kqTBabyContactListViewController.h"
#import "kqTBabyInfomationViewController.h"
#import "kqTBabyContactDetailViewController.h"
@interface kqTBabyContactListViewController ()
@property (strong, nonatomic) UIImageView *topView;
@property (strong, nonatomic) NSMutableArray *sectionArray,*dataArray;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *tableViewBottomConstraint;
@property (strong, nonatomic) AIMTableViewIndexBar *indexBar;
@end

@implementation kqTBabyContactListViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)didSelectedContactWithDataDictionary:(NSDictionary *)dictionary
{
    self.hidesBottomBarWhenPushed = YES;
//    kqTBabyContactDetailViewController *tbcdVC = [[kqTBabyContactDetailViewController alloc] initWithNibName:@"kqTBabyContactDetailViewController" bundle:nil];
//    tbcdVC.title = [NSString stringWithFormat:@"家长%@",[dictionary valueForKey:@"name"]];
//    tbcdVC.dataDictionary = [NSMutableDictionary dictionaryWithDictionary:dictionary];
//    [self.navigationController pushViewController:tbcdVC animated:YES];
    if (self.isBabyInfo) {
        kqTBabyInfomationViewController *tbcdVC = [[kqTBabyInfomationViewController alloc] initWithNibName:@"kqTBabyInfomationViewController" bundle:nil];
        tbcdVC.title = [NSString stringWithFormat:@"%@",[dictionary valueForKey:@"babyName"]];
        tbcdVC.dataDictionary = [NSMutableDictionary dictionaryWithDictionary:dictionary];
        [self.navigationController pushViewController:tbcdVC animated:YES];
    }else{
        kqTBabyContactDetailViewController *tbcdVC = [[kqTBabyContactDetailViewController alloc] initWithNibName:@"kqTBabyContactDetailViewController" bundle:nil];
        tbcdVC.title = [NSString stringWithFormat:@"家长%@",[dictionary valueForKey:@"name"]];
        tbcdVC.dataDictionary = [NSMutableDictionary dictionaryWithDictionary:dictionary];
        [self.navigationController pushViewController:tbcdVC animated:YES];
    }
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    if (self.isBabyInfo) {
        self.hidesBottomBarWhenPushed = NO;
    }else{
        self.hidesBottomBarWhenPushed = YES;
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
//    self.topView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"wave.png"]];
//    self.topView.frame = CGRectMake(0, 0, 320, 10);
//    [self.view addSubview:self.topView];
    if (self.isBabyInfo) {
        self.tableViewBottomConstraint.constant = 49.0f;
    }else{
        self.tableViewBottomConstraint.constant = 0.0f;
    }
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = [UIColor clearColor];
    if (!self.isBabyInfo) {
        [self initTopBar];
    }
//    self.sectionArray = [NSMutableArray arrayWithObjects:@"A",@"B",@"C",@"D",@"E", nil];
//    self.dataArray = [NSMutableArray arrayWithObjects:@[@"as",@"as",@"as",@"as"],@[@"bs",@"bs",@"bs",@"bs"],@[@"cs",@"cs",@"cs",@"cs"],@[@"ds",@"ds",@"ds",@"ds"],@[@"es",@"es",@"es",@"es"], nil];
    self.indexBar = [[AIMTableViewIndexBar alloc] initWithFrame:CGRectMake(SCREEN_W - 20, 54, 20, SCREEN_H - 54)];
    self.indexBar.delegate = self;
    self.indexBar.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.indexBar];
    self.indexBar.hidden = YES;
    [HNAGeneral showOnWindow:@"加载中"];
    HNADownLoadManager *dl = [HNADownLoadManager sharedDownLoadManager];
    dl.delegate = self;
    if (self.isBabyList) {
        [dl teacherGetAllBaby];
    }else{
        [dl teacherGetAllTeacher];
    }
    
    // Do any additional setup after loading the view from its nib.
}

-(void)teacherGetAllTeacherDelegate:(NSDictionary *)dic
{
    [HNAGeneral hidenHUD];
    NSDictionary *dataMap = [dic valueForKey:@"dataMap"];
    NSString *state = [dataMap valueForKey:@"state"];
    if ([state isEqualToString:SU]) {
        NSArray *arr = [dataMap valueForKey:@"data"];
        if (arr.count != 0) {
            self.dataArray = [NSMutableArray arrayWithArray:[self classArray:arr]];
            [self.tableView reloadData];
        }
    }else if([state isEqualToString:ER]){
        [HNAGeneral showAlertViewWithTitle:@"提示" andMessage:[dataMap valueForKey:@"stateMsg"]];
    }
}

-(void)teacherGetAllBabyDelegate:(NSDictionary *)dic
{
    [HNAGeneral hidenHUD];
    NSDictionary *dataMap = [dic valueForKey:@"dataMap"];
    NSString *state = [dataMap valueForKey:@"state"];
    if ([state isEqualToString:SU]) {
        NSArray *arr = [dataMap valueForKey:@"data"];
        if (arr.count != 0) {
            self.dataArray = [NSMutableArray arrayWithArray:[self classArray:arr]];
            [self.tableView reloadData];
        }
    }else if([state isEqualToString:ER]){
        [HNAGeneral showAlertViewWithTitle:@"提示" andMessage:[dataMap valueForKey:@"stateMsg"]];
    }
}

-(NSMutableArray *) classArray:(NSArray *) array
{
    NSString *cs;
//    if (self.isBabyList) {
//        cs = @"babyName";
//    }else{
        cs = @"name";
//    }
    NSMutableSet *set = [NSMutableSet set];
    for (NSDictionary *dic in array) {
        NSString *babyNameYuan = [dic valueForKey:cs];
        NSString *babyNamePinyin = [ChineseToPinyin pinyinFromChiniseString:babyNameYuan];
        if (babyNamePinyin.length > 0) {
            babyNamePinyin = [babyNamePinyin substringWithRange:NSMakeRange(0, 1)];
            [set addObject:babyNamePinyin];
        }
    }
    NSMutableArray *sectionArray = [NSMutableArray array];
    for (NSString *babyNamePinyiny in set) {
        [sectionArray addObject:babyNamePinyiny];
    }
    self.sectionArray = [NSMutableArray arrayWithArray:[sectionArray sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        NSString *ba1 = (NSString *) obj1;
        NSString *ba2 = (NSString *) obj2;
        NSComparisonResult result = [ba1 compare:ba2];
        return result;
    }]];
    NSMutableArray *data = [NSMutableArray array];
    for (NSString *babyNamePinyiny in self.sectionArray) {
        NSMutableArray *arr = [NSMutableArray array];
        for (NSDictionary *dic in array) {
            NSString *babyNameYuan = [dic valueForKey:cs];
            NSString *babyNamePinyin = [ChineseToPinyin pinyinFromChiniseString:babyNameYuan];
            if (babyNamePinyin.length > 0) {
                babyNamePinyin = [babyNamePinyin substringWithRange:NSMakeRange(0, 1)];
                if ([babyNamePinyiny isEqualToString:babyNamePinyin]) {
                    [arr addObject:dic];
                }
            }
        }
        [data addObject:[arr sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
            NSDictionary *dic1 = (NSDictionary *) obj1;
            NSDictionary *dic2 = (NSDictionary *) obj2;
            NSString *ba1 = [dic1 valueForKey:cs];
            NSString *ba2 = [dic2 valueForKey:cs];
            NSString *bap1 = [ChineseToPinyin pinyinFromChiniseString:ba1];
            NSString *bap2 = [ChineseToPinyin pinyinFromChiniseString:ba2];
            NSComparisonResult result;
            if (bap1.length < bap2.length) {
                result = NSOrderedAscending;
            }else if (bap1.length == bap2.length){
                result = [bap1 compare:bap2];
            }else if (bap1.length > bap2.length){
                result = NSOrderedDescending;
            }
            return result;
        }]];
    }
    return data;
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

#pragma mark - tableViewDelegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    [self.indexBar setIndexes:self.sectionArray];
    return self.sectionArray.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return ((NSArray *)([self.dataArray objectAtIndex:section])).count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 20.0f;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString *title = [self.sectionArray objectAtIndex:section];
    return title;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    kqTBabyContactCell *cell = (kqTBabyContactCell *)[[[NSBundle mainBundle] loadNibNamed:@"kqTBabyContactCell" owner:self options:nil] objectAtIndex:0];
    NSDictionary *dic = [[self.dataArray objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    cell.delegate = self;
    cell.indexPath = indexPath;
    [cell initCellWithDic:dic withIsBabyList:self.isBabyList andIsBabyInfo:self.isBabyInfo];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

-(void)didTapMessageButtonWith:(NSIndexPath *)indexPath
{
    self.hidesBottomBarWhenPushed = YES;
    NSDictionary *dic = [[self.dataArray objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    kqChatWindowViewController *cwVC = [[kqChatWindowViewController alloc] initWithNibName:@"kqChatWindowViewController" bundle:nil];
    cwVC.roleID = [dic valueForKey:@"id"];
    cwVC.roleName = [dic valueForKey:@"deviceid"];
    cwVC.title = [dic valueForKey:@"name"];
    if (self.isBabyList) {
        cwVC.roleType = JiazhangType;
    }else{
        cwVC.roleType = TeacherandTeacherType;
    }
    [self.navigationController pushViewController:cwVC animated:YES];

}

-(void)didTapCallButtonWith:(NSIndexPath *)indexPath
{
    NSURL *phoneURL = [NSURL URLWithString:[NSString stringWithFormat:@"tel://%@",[[[self.dataArray objectAtIndex:indexPath.section] objectAtIndex:indexPath.row] valueForKey:@"loginName"]]];
    UIWebView *phoneCallWebView = [[UIWebView alloc] initWithFrame:CGRectZero];
    [phoneCallWebView loadRequest:[NSURLRequest requestWithURL:phoneURL]];
    [self.view addSubview:phoneCallWebView];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    self.hidesBottomBarWhenPushed = YES;
    NSDictionary *dic = [[self.dataArray objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    if (self.isBabyInfo) {
        kqTBabyInfomationViewController *tbcdVC = [[kqTBabyInfomationViewController alloc] initWithNibName:@"kqTBabyInfomationViewController" bundle:nil];
        tbcdVC.title = [NSString stringWithFormat:@"%@",[dic valueForKey:@"babyName"]];
        tbcdVC.dataDictionary = [NSMutableDictionary dictionaryWithDictionary:dic];
        [self.navigationController pushViewController:tbcdVC animated:YES];
    }else{
        if (self.isBabyList) {
            kqTBabyContactDetailViewController *tbcdVC = [[kqTBabyContactDetailViewController alloc] initWithNibName:@"kqTBabyContactDetailViewController" bundle:nil];
            tbcdVC.title = [NSString stringWithFormat:@"家长%@",[dic valueForKey:@"name"]];
            tbcdVC.dataDictionary = [NSMutableDictionary dictionaryWithDictionary:dic];
            [self.navigationController pushViewController:tbcdVC animated:YES];
        }
    }
//    self.hidesBottomBarWhenPushed = YES;
//    kqChatWindowViewController *cwVC = [[kqChatWindowViewController alloc] initWithNibName:@"kqChatWindowViewController" bundle:nil];
//    cwVC.roleID = [dic valueForKey:@"id"];
//    cwVC.title = [dic valueForKey:@"name"];
//    cwVC.roleType = JiazhangType;
//    [self.navigationController pushViewController:cwVC animated:YES];
}

#pragma mark - seacherBarDelegate
-(BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar
{
    kqTBabySeacherContactListViewController *tbsclVC = [[kqTBabySeacherContactListViewController alloc] initWithNibName:@"kqTBabySeacherContactListViewController" bundle:nil];
    [tbsclVC.seacherBar becomeFirstResponder];
    tbsclVC.delegate = self;
    tbsclVC.dataArray = self.dataArray;
    tbsclVC.sectionary = self.sectionArray;
    tbsclVC.isBabyInfo = self.isBabyInfo;
    tbsclVC.isBabyList = self.isBabyList;
    [self.navigationController presentViewController:tbsclVC animated:YES completion:^{
        
    }];
    return NO;
}

#pragma mark - AIMTableViewIndexBarDelegate

- (void)tableViewIndexBar:(AIMTableViewIndexBar *)indexBar didSelectSectionAtIndex:(NSInteger)index{
    if ([self.tableView numberOfSections] > index && index > -1){   // for safety, should always be YES
        [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:index]
                              atScrollPosition:UITableViewScrollPositionTop
                                      animated:YES];
    }
}

@end