//
//  kqBabySignInDetailViewController.m
//  KindergartenPro
//
//  Created by 海峰 on 16/4/9.
//  Copyright © 2016年 海峰. All rights reserved.
//

#import "kqBabySignInDetailViewController.h"
#import "kqBabySignInDetailCell.h"
#import "kqTBabyContactDetailViewController.h"
@interface kqBabySignInDetailViewController ()<UITableViewDelegate,UITableViewDataSource,HNADownLoadDelegate>
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *signBottomCon;
@property (weak, nonatomic) IBOutlet UITableView *signInTableView;
@property (weak, nonatomic) IBOutlet UIButton *contactJiazhangButton;
@end

@implementation kqBabySignInDetailViewController
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
//    self.hidesBottomBarWhenPushed = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initTopBar];
    self.title = @"签到详情";
    if (!self.isBaby) {
        self.contactJiazhangButton.hidden = NO;
        self.signBottomCon.constant = 60.0f;
        [HNAGeneral showOnWindow:@"加载中"];
        HNADownLoadManager *dlm = [HNADownLoadManager sharedDownLoadManager];
        dlm.delegate = self;
        [dlm downLoadBabySignInWith:@"0" andBabyID:self.babyId];
        //    self.dataArray = [NSMutableArray arrayWithObjects:@[@"3日"],@[@"31日",@"30日",@"29日"], nil];
        //    self.sectionTitleArray = [NSMutableArray arrayWithObjects:@"5月",@"4月", nil];
        // Do any additional setup after loading the view from its nib.
    }else{
        self.signBottomCon.constant = 0.0f;
    }
    // Do any additional setup after loading the view from its nib.
}

-(void)downLoadBabySignInDelegate:(NSDictionary *)dic
{
    [HNAGeneral hidenHUD];
    NSDictionary *dataMap = [dic valueForKey:@"dataMap"];
    if ([[dataMap valueForKey:@"state"] isEqualToString:SU]) {
        NSArray *arr = [dataMap valueForKey:@"data"];
        if (arr.count != 0) {
            self.signArray = [NSMutableArray arrayWithArray:arr];
            [self.signInTableView reloadData];
        }
    }else if ([[dataMap valueForKey:@"state"] isEqualToString:ER]){
        [HNAGeneral showAlertViewWithTitle:@"提示" andMessage:[dataMap valueForKey:@"stateMsg"]];
        
    }
}

- (IBAction)tapJiaZhangButton:(UIButton *)sender {
    self.hidesBottomBarWhenPushed = YES;
    kqTBabyContactDetailViewController *tbcdVC = [[kqTBabyContactDetailViewController alloc] initWithNibName:@"kqTBabyContactDetailViewController" bundle:nil];
    tbcdVC.title = [NSString stringWithFormat:@"家长%@",[self.dataDictionary valueForKey:@"name"]];
    tbcdVC.dataDictionary = [NSMutableDictionary dictionaryWithDictionary:self.dataDictionary];
    [self.navigationController pushViewController:tbcdVC animated:YES];
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.signArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat heightAll = 0,heightImage = 0;
    heightImage = (SCREEN_W - 20.0f) * 0.5;
    heightAll = 200 - 150 + heightImage;
    NSDictionary *dic = [self.signArray objectAtIndex:indexPath.row];
    if ([[dic valueForKey:@"signSource"] intValue] == 1) {
        heightAll = heightAll - heightImage;
    }
    return heightAll;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    kqBabySignInDetailCell *cell = (kqBabySignInDetailCell *)[[[NSBundle mainBundle] loadNibNamed:@"kqBabySignInDetailCell" owner:self options:nil] objectAtIndex:0];
    NSDictionary *dic = [self.signArray objectAtIndex:indexPath.row];
    if ([[dic valueForKey:@"signSource"] intValue] == 1) {
        cell.imageView.hidden = YES;
    }else{
        [cell.imageView setImageWithURL:[NSURL URLWithString:[dic valueForKey:@"imgPath"]]];
    }
    int inOut = [[dic valueForKey:@"inOut"] intValue];
    NSMutableString *labelString = [NSMutableString string];
    switch (inOut) {
        case 0:
            [labelString appendString:@"入园时间 "];
            break;
        case 1:
            [labelString appendString:@"离园时间 "];
            break;
        case 2:
            [labelString appendString:@"病假时间 "];
            break;
        case 3:
            [labelString appendString:@"事假时间 "];
            break;
            
        default:
            break;
    }
    [labelString appendFormat:@"%@",[dic valueForKey:@"inOutDate"]];
    cell.signInLabel.text = [labelString stringByReplacingOccurrencesOfString:@"T" withString:@" "];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
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
