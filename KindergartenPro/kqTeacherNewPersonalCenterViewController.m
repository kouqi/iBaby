//
//  kqTeacherNewPersonalCenterViewController.m
//  KindergartenPro
//
//  Created by 程海峰 on 16/7/14.
//  Copyright © 2016年 海峰. All rights reserved.
//

#import "kqTeacherNewPersonalCenterViewController.h"
#import "kqTeacherPersonalBabyListCell.h"
#import "kqTeacherPersonalViewController.h"
@interface kqTeacherNewPersonalCenterViewController ()<UITableViewDelegate,UITableViewDataSource,HNADownLoadDelegate>
@property (weak, nonatomic) IBOutlet UIButton *editeButton;
@property (weak, nonatomic) IBOutlet UIImageView *headImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *classLabel;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *sectionArray,*dataArray;
@end

@implementation kqTeacherNewPersonalCenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我";
    self.headImageView.layer.cornerRadius = 20.0f;
    self.headImageView.layer.masksToBounds = YES;
    
    self.editeButton.layer.cornerRadius = 5.0f;
    self.editeButton.layer.borderWidth = 0.5f;
    self.editeButton.layer.borderColor = [UIColor whiteColor].CGColor;
    self.editeButton.layer.masksToBounds = YES;
    
    kqPersonalInfoMation *info = [kqPersonalInfoMation sharedPersonalInfoMation];
    [self.headImageView setImageWithURL:[NSURL URLWithString:info.imagPath] placeholderImage:[UIImage imageNamed:@"tbabyDefaultHeadImage.png"]];
    self.nameLabel.text = info.realName;
    self.classLabel.text = [NSString stringWithFormat:@"%@",info.className];
    [self initTopBar];
    
    [HNAGeneral showOnWindow:@"加载中"];
    HNADownLoadManager *dl = [HNADownLoadManager sharedDownLoadManager];
    dl.delegate = self;
    [dl teacherGetAllBaby];

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
    [rightButton addTarget:self action:@selector(tapCompletedButton) forControlEvents:UIControlEventTouchUpInside];
    rightButton.frame =CGRectMake(0.0f, 10.5f, 25.0f, 25.0f);
    [rightButton setImage:[UIImage imageNamed:@"personalSetting"] forState:UIControlStateNormal];
    UIBarButtonItem* right = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
    self.navigationItem.rightBarButtonItem = right;
}

-(void) tapCompletedButton
{
    self.hidesBottomBarWhenPushed = YES;
    kqTeacherPersonalViewController *oksvc = [[kqTeacherPersonalViewController alloc] initWithNibName:@"kqTeacherPersonalViewController" bundle:nil];
    [self.navigationController pushViewController:oksvc animated:YES];

}

-(void) tapBackButton
{
    [self.navigationController popViewControllerAnimated:YES];
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
    NSMutableSet *set = [NSMutableSet set];
    for (NSDictionary *dic in array) {
        NSString *babyNameYuan = [dic valueForKey:@"babyName"];
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
            NSString *babyNameYuan = [dic valueForKey:@"babyName"];
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
            NSString *ba1 = [dic1 valueForKey:@"babyName"];
            NSString *ba2 = [dic2 valueForKey:@"babyName"];
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

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
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
    kqTeacherPersonalBabyListCell *cell = (kqTeacherPersonalBabyListCell *)[[[NSBundle mainBundle] loadNibNamed:@"kqTeacherPersonalBabyListCell" owner:self options:nil] objectAtIndex:0];
    NSDictionary *dic = [[self.dataArray objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    [cell initCellWithDic:dic];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    //    self.hidesBottomBarWhenPushed = YES;
    //    kqCreatNewBabyContactViewController *cnbcVC = [[kqCreatNewBabyContactViewController alloc] initWithNibName:@"kqCreatNewBabyContactViewController" bundle:nil];
    //    cnbcVC.isEditMode = NO;
    //    cnbcVC.dataDictionary = [[self.dataArray objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    //    cnbcVC.title = @"创建联系人";
    //    [self.navigationController pushViewController:cnbcVC animated:YES];
    NSURL *phoneURL = [NSURL URLWithString:[NSString stringWithFormat:@"tel://%@",[[[self.dataArray objectAtIndex:indexPath.section] objectAtIndex:indexPath.row] valueForKey:@"loginName"]]];
    UIWebView *phoneCallWebView = [[UIWebView alloc] initWithFrame:CGRectZero];
    [phoneCallWebView loadRequest:[NSURLRequest requestWithURL:phoneURL]];
    [self.view addSubview:phoneCallWebView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
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
