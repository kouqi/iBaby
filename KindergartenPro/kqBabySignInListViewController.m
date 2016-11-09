//
//  kqBabySignInListViewController.m
//  KindergartenPro
//
//  Created by 海峰 on 14-8-6.
//  Copyright (c) 2014年 海峰. All rights reserved.
//

#import "kqBabySignInListViewController.h"
#import "kqBabySignInListCell.h"
#import "kqBabySignInDetailViewController.h"
@interface kqBabySignInListViewController ()
@property (strong, nonatomic) UITableView *tableView;

@end

@implementation kqBabySignInListViewController

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
//    [self initArray];
//    UIImageView *topView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"wave.png"]];
//    topView.frame = CGRectMake(0, 0, 320, 10);
//    [self.view addSubview:topView];
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, SCREEN_H - 64)];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.tableView];
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0){
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    [HNAGeneral showOnWindow:@"加载中"];
    HNADownLoadManager *dlm = [HNADownLoadManager sharedDownLoadManager];
    dlm.delegate = self;
    [dlm downLoadBabySignInWith:@"0"andBabyID:nil];
//    self.dataArray = [NSMutableArray arrayWithObjects:@[@"3日"],@[@"31日",@"30日",@"29日"], nil];
//    self.sectionTitleArray = [NSMutableArray arrayWithObjects:@"5月",@"4月", nil];
    // Do any additional setup after loading the view from its nib.
}

-(void)downLoadBabySignInDelegate:(NSDictionary *)dic
{
    [HNAGeneral hidenHUD];
    NSDictionary *dataMap = [dic valueForKey:@"dataMap"];
    if ([[dataMap valueForKey:@"state"] isEqualToString:SU]) {
        NSArray *arr = [dataMap valueForKey:@"data"];
        if (arr.count != 0) {
            self.dataArray = [NSMutableArray arrayWithArray:arr];
            [self initArray];
        }
    }else if ([[dataMap valueForKey:@"state"] isEqualToString:ER]){
        [HNAGeneral showAlertViewWithTitle:@"提示" andMessage:[dataMap valueForKey:@"stateMsg"]];
        
    }
}

-(void) initArray
{
    if (self.dataArray.count != 0) {
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        NSArray *arr = [self.dataArray sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
            
            NSDictionary *dic1 = (NSDictionary *) obj1;
            NSDictionary *dic2 = (NSDictionary *) obj2;
            NSString *ti1 = [dic1 valueForKey:@"inOutDate"];
            NSString *ti2 = [dic2 valueForKey:@"inOutDate"];
            NSComparisonResult result;
            if ([ti1 isKindOfClass:[NSNull class]] || [ti2 isKindOfClass:[NSNull class]]) {
                result = NSOrderedSame;
            }else{
                NSArray *arr1 = [ti1 componentsSeparatedByString:@"T"];
                NSDate *d1 = [formatter dateFromString:[NSString stringWithFormat:@"%@ %@",[arr1 objectAtIndex:0],[arr1 objectAtIndex:1]]];
                NSArray *arr2 = [ti2 componentsSeparatedByString:@"T"];
                NSDate *d2 = [formatter dateFromString:[NSString stringWithFormat:@"%@ %@",[arr2 objectAtIndex:0],[arr2 objectAtIndex:1]]];
                result = [d2 compare:d1];
            }
            return result;
        }];
        [self.dataArray removeAllObjects];
        arr = [self classArray:arr];
        
        NSMutableArray *dasa = [NSMutableArray array];
        for (NSUInteger i = 0; i < arr.count; i++) {
            NSArray *asr = [arr objectAtIndex:i];
            NSArray *adsr = [asr sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
                NSArray *a1 = (NSArray *) obj1;
                NSArray *a2 = (NSArray *) obj2;
                NSDictionary *dic1 = [a1 objectAtIndex:0];
                NSDictionary *dic2 = [a2 objectAtIndex:0];
                NSString *str1 = [[dic1 valueForKey:@"inOutDate"] stringByReplacingOccurrencesOfString:@"T" withString:@" "];
                NSString *str2 = [[dic2 valueForKey:@"inOutDate"] stringByReplacingOccurrencesOfString:@"T" withString:@" "];
                NSDate *date1 = [formatter dateFromString:str1];
                NSDate *date2 = [formatter dateFromString:str2];
                NSComparisonResult result = [date2 compare:date1];
                return result;
            }];
            [dasa addObject:adsr];
        }
        NSArray *dasarrs = [dasa sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
            NSArray *arr1 = (NSArray *) obj1;
            NSArray *arr2 = (NSArray *) obj2;
            NSArray *arr01 = [arr1 objectAtIndex:0];
            NSArray *arr02 = [arr2 objectAtIndex:0];
            NSDictionary *dic1 = [arr01 objectAtIndex:0];
            NSDictionary *dic2 = [arr02 objectAtIndex:0];
            NSString *str1 = [[dic1 valueForKey:@"inOutDate"] stringByReplacingOccurrencesOfString:@"T" withString:@" "];
            NSString *str2 = [[dic2 valueForKey:@"inOutDate"] stringByReplacingOccurrencesOfString:@"T" withString:@" "];
            NSDate *date1 = [formatter dateFromString:str1];
            NSDate *date2 = [formatter dateFromString:str2];
            NSComparisonResult result = [date2 compare:date1];
            return result;
        }];
        self.dataArray = [NSMutableArray arrayWithArray:dasarrs];
        [self.tableView reloadData];
    }
}

-(NSArray *) classArray:(NSArray *) array
{
    NSMutableArray *as = [NSMutableArray array];
    NSMutableArray *secArr = [NSMutableArray array];
    NSMutableSet *set = [NSMutableSet set];
    for (NSDictionary *dic in array) {
        NSString *ds = [dic valueForKey:@"inOutDate"];
        ds = [ds substringToIndex:7];
        [set addObject:ds];
    }
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM"];
    for (NSString *ds in set) {
        NSMutableArray *arr = [NSMutableArray array];
        for (NSDictionary *dic in array) {
            NSString *dss = [dic valueForKey:@"inOutDate"];
            dss = [dss substringToIndex:7];
            if ([ds isEqualToString:dss]) {
                [arr addObject:dic];
            }
        }
        arr = [self classThreeArray:arr];
        [as addObject:arr];
        [secArr addObject:ds];
    }
    NSArray *seca = [secArr sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        NSString *str1 = (NSString *) obj1;
        NSString *str2 = (NSString *) obj2;
        NSDate *date1 = [formatter dateFromString:str1];
        NSDate *date2 = [formatter dateFromString:str2];
        NSComparisonResult result = [date2 compare:date1];
        return result;
    }];
    self.sectionTitleArray = [NSMutableArray arrayWithArray:seca];
    return as;
}

-(NSMutableArray *)classThreeArray:(NSArray *) array
{
    NSMutableArray *as = [NSMutableArray array];
    NSMutableSet *set = [NSMutableSet set];
    for (NSDictionary *dic in array) {
        NSString *ds = [dic valueForKey:@"inOutDate"];
        ds = [ds substringToIndex:10];
        [set addObject:ds];
    }
    for (NSString *ds in set) {
        NSMutableArray *arr = [NSMutableArray array];
        for (NSDictionary *dic in array) {
            NSString *dss = [dic valueForKey:@"inOutDate"];
            dss = [dss substringToIndex:10];
            if ([ds isEqualToString:dss]) {
                [arr addObject:dic];
            }
        }
        [as addObject:arr];
    }
    return as;
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
    [rightButton addTarget:self action:@selector(tapLookBabyButton) forControlEvents:UIControlEventTouchUpInside];
    rightButton.frame =CGRectMake(0.0f, 6.0f, 60.0f, 23.0f);
    [rightButton setBackgroundImage:[UIImage imageNamed:@"挂失背景按钮"] forState:UIControlStateNormal];
    [rightButton setTitle:@"挂失" forState:UIControlStateNormal];
    rightButton.titleLabel.font = [UIFont systemFontOfSize:12.0f];
    [rightButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [rightButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    UIBarButtonItem* right = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
    self.navigationItem.rightBarButtonItem = right;

}

-(void) tapBackButton
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void) tapLookBabyButton
{
    [HNAGeneral showOnWindow:@"加载中"];
    HNADownLoadManager *dl = [HNADownLoadManager sharedDownLoadManager];
    dl.delegate = self;
    [dl reportCard];
}

-(void)reportCardDelegate:(NSDictionary *)dic
{
    [HNAGeneral hidenHUD];
    NSDictionary *dataMap = [dic valueForKey:@"dataMap"];
    if ([[dataMap valueForKey:@"state"] isEqualToString:SU]) {
        [HNAGeneral showAlertViewWithTitle:@"提示" andMessage:[dataMap valueForKey:@"stateMsg"]];
    }else if ([[dataMap valueForKey:@"state"] isEqualToString:ER]){
        [HNAGeneral showAlertViewWithTitle:@"提示" andMessage:[dataMap valueForKey:@"stateMsg"]];
    }
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.sectionTitleArray.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *arr = [self.dataArray objectAtIndex:section];
    return arr.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80.0f;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    kqDistingKindergartenAndSchool *dkas = [kqDistingKindergartenAndSchool sharedDistingKindergartenAndSchool];
    kqBabySignInListCell *cell = (kqBabySignInListCell *)[[[NSBundle mainBundle] loadNibNamed:@"kqBabySignInListCell" owner:self options:nil] objectAtIndex:0];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    NSArray *tdArr = [[self.dataArray objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    if (tdArr.count == 1) {
        NSDictionary *tdic = [tdArr objectAtIndex:0];
        FORMATTER
        NSString *dateStr = [tdic valueForKey:@"inOutDate"];
        NSString *dayStr = [dateStr substringWithRange:NSMakeRange(0, 10)];
        NSString *hourStr = [dateStr substringWithRange:NSMakeRange(11, 8)];
        NSDate *dd = [formatter dateFromString:dayStr];
        NSDate *nd = [formatter dateFromString:[formatter stringFromDate:[NSDate date]]];
        if ([dd isEqualToDate:nd]) {
            cell.dayLabel.text = @"今天";
        }else{
            int d = [[dayStr substringWithRange:NSMakeRange(8, 2)] intValue];
            cell.dayLabel.text = [NSString stringWithFormat:@"%d日",d];
        }
        
        cell.comeTimeLabel.text = hourStr;
        int io = [[tdic valueForKey:@"inOut"] intValue];
        switch (io) {
            case 0:
                cell.startLabel.text = [NSString stringWithFormat:@"%@时间：",dkas.signIn];
                break;
            case 1:
                cell.startLabel.text = [NSString stringWithFormat:@"%@时间：",dkas.signOut];
                break;
            case 2:
                cell.startLabel.text = @"病假时间：";
                break;
            case 3:
                cell.startLabel.text = @"事假时间：";
                break;
            case 4:
                cell.startLabel.text = @"未知时间：";
                break;
            default:
                break;
        }
    }else if(tdArr.count > 1){
        NSDictionary *tdic = [tdArr objectAtIndex:0];
        FORMATTER
        NSString *dateStr = [tdic valueForKey:@"inOutDate"];
        NSString *dayStr = [dateStr substringWithRange:NSMakeRange(0, 10)];
        NSString *hourStr = [dateStr substringWithRange:NSMakeRange(11, 8)];
        NSDate *dd = [formatter dateFromString:dayStr];
        NSDate *nd = [formatter dateFromString:[formatter stringFromDate:[NSDate date]]];
        if ([dd isEqualToDate:nd]) {
            cell.dayLabel.text = @"今天";
        }else{
            int d = [[dayStr substringWithRange:NSMakeRange(8, 2)] intValue];
            cell.dayLabel.text = [NSString stringWithFormat:@"%d日",d];
        }
        cell.comeTimeLabel.text = hourStr;
        int io = [[tdic valueForKey:@"inOut"] intValue];
        switch (io) {
            case 0:
                cell.startLabel.text = [NSString stringWithFormat:@"%@时间：",dkas.signIn];
                break;
            case 1:
                cell.startLabel.text = [NSString stringWithFormat:@"%@时间：",dkas.signOut];
                break;
            case 2:
                cell.startLabel.text = @"病假时间：";
                break;
            case 3:
                cell.startLabel.text = @"事假时间：";
                break;
            case 4:
                cell.startLabel.text = @"未知时间：";
                break;
            default:
                break;
        }
        NSDictionary *sdic = [tdArr objectAtIndex:1];
        NSString *sdateStr = [sdic valueForKey:@"inOutDate"];
        NSString *shourStr = [sdateStr substringWithRange:NSMakeRange(11, 8)];
        cell.LeaveTimeLabel.hidden = NO;
        cell.endLabel.hidden = NO;
        cell.LeaveTimeLabel.text = shourStr;
        int sio = [[sdic valueForKey:@"inOut"] intValue];
        switch (sio) {
            case 0:
                cell.endLabel.text = [NSString stringWithFormat:@"%@时间：",dkas.signIn];
                break;
            case 1:
                cell.endLabel.text = [NSString stringWithFormat:@"%@时间：",dkas.signOut];
                break;
            case 2:
                cell.endLabel.text = @"病假时间：";
                break;
            case 3:
                cell.endLabel.text = @"事假时间：";
                break;
            case 4:
                cell.endLabel.text = @"未知时间：";
                break;
            default:
                break;
        }
    }
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 50.0f;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 50)];
    view.backgroundColor = [UIColor clearColor];
    UIImageView *sectionImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 300, 30)];
    sectionImageView.image = [UIImage imageNamed:@"babySignInSection.png"];
    [view addSubview:sectionImageView];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 300, 30)];
    label.textAlignment = NSTextAlignmentCenter;
    label.backgroundColor = [UIColor clearColor];
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont systemFontOfSize:16.0f];
    FORMATTER
    NSString *ns = [formatter stringFromDate:[NSDate date]];
    ns = [ns substringToIndex:4];
    NSString *bs = [self.sectionTitleArray objectAtIndex:section];
    NSString *ms = [bs substringWithRange:NSMakeRange(5, 2)];
    bs = [bs substringToIndex:4];
    if ([bs isEqualToString:ns]) {
        label.text = [NSString stringWithFormat:@"%d月",[ms intValue]];
    }else{
        label.text = [NSString stringWithFormat:@"%@年%d月",bs,[ms intValue]];
    }
    [view addSubview:label];
    return view;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    self.hidesBottomBarWhenPushed = YES;
    kqBabySignInDetailViewController *bsidvc = [[kqBabySignInDetailViewController alloc] initWithNibName:@"kqBabySignInDetailViewController" bundle:nil];
    bsidvc.signArray = [NSArray arrayWithArray:[[self.dataArray objectAtIndex:indexPath.section] objectAtIndex:indexPath.row]];
    bsidvc.isBaby = YES;
    [self.navigationController pushViewController:bsidvc animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
