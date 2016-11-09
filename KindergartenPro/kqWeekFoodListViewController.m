//
//  kqWeekFoodListViewController.m
//  KindergartenPro
//
//  Created by 海峰 on 14-8-6.
//  Copyright (c) 2014年 海峰. All rights reserved.
//

#import "kqWeekFoodListViewController.h"
#import "kqWeekFoodCell.h"
#import "kqDayFoodListViewController.h"
#import "kqCreatNewFoodViewController.h"
@interface kqWeekFoodListViewController ()
@property (strong, nonatomic) UITableView *tableView;

@end

@implementation kqWeekFoodListViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void) sortDataArray:(NSArray *) array
{
    NSArray *arr = [NSArray arrayWithArray:[self classArray:array]];
    arr = [arr sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"yyyy-MM-dd"];
        NSDictionary *dic1 = (NSDictionary *)obj1;
        NSDictionary *dic2 = (NSDictionary *)obj2;
        NSString *time1 = [dic1 valueForKey:@"activityDate"];
        time1 = [time1 substringWithRange:NSMakeRange(0, 10)];
        NSDate *date1 = [formatter dateFromString:time1];
        NSString *time2 = [dic2 valueForKey:@"activityDate"];
        time2 = [time2 substringWithRange:NSMakeRange(0, 10)];
        NSDate *date2 = [formatter dateFromString:time2];
        NSComparisonResult result = [date2 compare:date1];
        return result;
    }];
    self.dataArray = [NSMutableArray arrayWithArray:arr];
    if (self.dataArray.count != 0) {
        [self initWeekArray];
    }
}

-(NSMutableArray *) classArray:(NSArray *) arr
{
    NSMutableSet *set = [NSMutableSet set];
    for (NSDictionary *dic in arr) {
        NSString *time = [dic valueForKey:@"activityDate"];
        [set addObject:time];
    }
    NSMutableArray *array = [NSMutableArray array];
    for (NSString *time in set) {
        NSMutableDictionary *dics = [NSMutableDictionary dictionary];
        [dics setValue:time forKey:@"activityDate"];
        NSMutableArray *asay = [NSMutableArray array];
        for (NSDictionary *dic in arr) {
            NSString *t1 = [dic valueForKey:@"activityDate"];
            if ([time isEqualToString:t1]) {
                [asay addObject:dic];
            }
        }
        [dics setValue:asay forKey:@"array"];
        [array addObject:dics];
    }
    return array;
}

-(void) initWeekArray
{
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    
    //获取当前时间
    NSDictionary *firstdic = [self.dataArray firstObject];
    NSString *nowTime = [firstdic valueForKey:@"activityDate"];
    nowTime = [nowTime substringWithRange:NSMakeRange(0, 10)];
    NSDate *nowDate = [formatter dateFromString:nowTime];
//    NSString *nowTime = [formatter stringFromDate:nowDate];
    //获取获得的数据的最后时间
    NSDictionary *lastdic = [self.dataArray lastObject];
    NSString *lastTime = [lastdic valueForKey:@"activityDate"];
    lastTime = [lastTime substringWithRange:NSMakeRange(0, 10)];
    //判断最后一条数据时间是周几以确定获取时间循环的终点
    NSDate *date = [formatter dateFromString:lastTime];
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    [calendar setLocale:[NSLocale currentLocale]];
    NSDateComponents *comps = [calendar components:(NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit|NSWeekdayCalendarUnit) fromDate:date];
    lastTime = [HNAGeneral giveMeATimeWith:comps andTime:lastTime withIsBegin:NO];
    comps = [calendar components:(NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit|NSWeekdayCalendarUnit) fromDate:nowDate];
    nowTime = [HNAGeneral giveMeATimeWith:comps andTime:nowTime withIsBegin:YES];
    NSArray *arr = [HNAGeneral giveMeAWeekArrayWithBeginTime:lastTime andEndTime:nowTime];
    self.weekArray = [NSMutableArray arrayWithArray:arr];
    [self.tableView reloadData];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
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
    [self initTopBar];
    [HNAGeneral showOnWindow:@"加载中"];
    HNADownLoadManager *dl = [HNADownLoadManager sharedDownLoadManager];
    dl.delegate = self;
    if (self.isTeacher) {
        [dl teacherGetWeekInfomationListWithEveryweekTypeId:2];
    }else{
        [dl downLoadWeeklyInfomationWith:@"2" andPageNo:@"0"];
    }
    // Do any additional setup after loading the view from its nib.
}

-(void)downLoadWeeklyInfomationDelegate:(NSDictionary *)dic
{
    [HNAGeneral hidenHUD];
    NSDictionary *dataMap = [dic valueForKey:@"dataMap"];
    if ([[dataMap valueForKey:@"state"] isEqualToString:SU]) {
        NSArray *arr = [dataMap valueForKey:@"data"];
        if (arr.count != 0) {
            [self sortDataArray:arr];
            self.fileUrlStr = [NSString stringWithFormat:@"%@",[dic valueForKey:@"fileUrl"]];
        }
    }else if ([[dataMap valueForKey:@"state"] isEqualToString:ER]){
        [HNAGeneral showAlertViewWithTitle:nil andMessage:[dataMap valueForKey:@"stateMsg"]];
    }
}

-(void)teacherGetWeekInfomationListDelegate:(NSDictionary *)dic
{
    [HNAGeneral hidenHUD];
    NSDictionary *dataMap = [dic valueForKey:@"dataMap"];
    if ([[dataMap valueForKey:@"state"] isEqualToString:SU]) {
        NSArray *arr = [dataMap valueForKey:@"data"];
        if (arr.count != 0) {
            self.fileUrlStr = [NSString stringWithFormat:@"%@",[dic valueForKey:@"fileUrl"]];
            [self sortDataArray:arr];
        }
    }else if ([[dataMap valueForKey:@"state"] isEqualToString:ER]){
        [HNAGeneral showAlertViewWithTitle:nil andMessage:[dataMap valueForKey:@"stateMsg"]];
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
    if (self.isTeacher) {
        UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [rightButton addTarget:self action:@selector(tapCreatNewButon) forControlEvents:UIControlEventTouchUpInside];
        rightButton.frame =CGRectMake(0.0f, 6.0f, 23.0f, 23.0f);
        [rightButton setImage:[UIImage imageNamed:@"addNewItems.png"] forState:UIControlStateNormal];
        UIBarButtonItem* right = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
        self.navigationItem.rightBarButtonItem = right;
    }
}

-(void) tapBackButton
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void) tapCreatNewButon
{
    self.hidesBottomBarWhenPushed = YES;
    kqCreatNewFoodViewController *cnfVC = [[kqCreatNewFoodViewController alloc] initWithNibName:@"kqCreatNewFoodViewController" bundle:nil];
    cnfVC.title = @"创建食谱";
    cnfVC.isFood = YES;
    [self.navigationController pushViewController:cnfVC animated:YES];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.weekArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 295.0f;
}

-(NSDictionary *) giveMeTheDictionaryOfTheDate:(NSString *) dateString
{
    for (NSDictionary *dic in self.dataArray) {
        NSString *timeString = [dic valueForKey:@"activityDate"];
        timeString = [timeString substringWithRange:NSMakeRange(0, 10)];
        if ([dateString isEqualToString:timeString]) {
            return dic;
        }
    }
    return nil;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    kqWeekFoodCell *cell = (kqWeekFoodCell *)[[[NSBundle mainBundle] loadNibNamed:@"kqWeekFoodCell" owner:self options:nil] objectAtIndex:0];
    NSArray *arr = [self.weekArray objectAtIndex:indexPath.row];
    cell.dateIntervalLabel.text = [NSString stringWithFormat:@"%@至%@",[arr firstObject],[arr lastObject]];
    cell.mondayDateString = [arr objectAtIndex:0];
    cell.mondayDictionary = [self giveMeTheDictionaryOfTheDate:cell.mondayDateString];
    if (self.isTeacher) {
        int audioState = [[cell.mondayDictionary valueForKey:@"auditState"] intValue];
        switch (audioState) {
            case 0:
                cell.stateLabel.text = @"待审核";
                break;
            case 1:
                cell.stateLabel.text = @"通过";
                break;
            case 2:
                cell.stateLabel.text = @"未通过";
                break;
            default:
                break;
        }
        
        cell.stateLabel.hidden = NO;
        cell.dateIntervalLabel.frame = CGRectMake(cell.dateIntervalLabel.frame.origin.x, cell.dateIntervalLabel.frame.origin.y, cell.dateIntervalLabel.frame.size.width - 20.0f, cell.dateIntervalLabel.frame.size.height);
    }
    cell.tuesdayDateString = [arr objectAtIndex:1];
    cell.tuesdayDictionary = [self giveMeTheDictionaryOfTheDate:cell.tuesdayDateString];
    cell.wednesdayDateString = [arr objectAtIndex:2];
    cell.wednesdayDictionary = [self giveMeTheDictionaryOfTheDate:cell.wednesdayDateString];
    cell.thursdayDateString = [arr objectAtIndex:3];
    cell.thursdayDictionary = [self giveMeTheDictionaryOfTheDate:cell.thursdayDateString];
    cell.fridayDateString = [arr objectAtIndex:4];
    cell.fridayDictionary = [self giveMeTheDictionaryOfTheDate:cell.fridayDateString];
    [cell setTapMondayButton_Block:^(NSDictionary *dic) {
        if (dic == nil) {
            [HNAGeneral showAlertViewWithTitle:nil andMessage:@"暂无食谱！"];
        }else{
            self.hidesBottomBarWhenPushed = YES;
            kqDayFoodListViewController *dflVC = [[kqDayFoodListViewController alloc] initWithNibName:@"kqDayFoodListViewController" bundle:nil];
            dflVC.title = @"星期一";
            dflVC.dictionary = dic;
            dflVC.fileUrl = self.fileUrlStr;
            dflVC.isEditMode = self.isTeacher;
            [self.navigationController pushViewController:dflVC animated:YES];
        }
        NSLog(@"星期一");
    }];
    [cell setTapTuesdayButton_Block:^(NSDictionary *dic) {
        if (dic == nil) {
            [HNAGeneral showAlertViewWithTitle:nil andMessage:@"暂无食谱！"];
        }else{
            self.hidesBottomBarWhenPushed = YES;
            kqDayFoodListViewController *dflVC = [[kqDayFoodListViewController alloc] initWithNibName:@"kqDayFoodListViewController" bundle:nil];
            dflVC.title = @"星期二";
            dflVC.dictionary = dic;
            dflVC.fileUrl = self.fileUrlStr;
            dflVC.isEditMode = self.isTeacher;
            [self.navigationController pushViewController:dflVC animated:YES];
        }
        NSLog(@"星期二");
    }];
    [cell setTapWednesdayButton_Block:^(NSDictionary *dic) {
        if (dic == nil) {
            [HNAGeneral showAlertViewWithTitle:nil andMessage:@"暂无食谱！"];
        }else{
            self.hidesBottomBarWhenPushed = YES;
            kqDayFoodListViewController *dflVC = [[kqDayFoodListViewController alloc] initWithNibName:@"kqDayFoodListViewController" bundle:nil];
            dflVC.title = @"星期三";
            dflVC.dictionary = dic;
            dflVC.fileUrl = self.fileUrlStr;
            dflVC.isEditMode = self.isTeacher;
            [self.navigationController pushViewController:dflVC animated:YES];
        }
        NSLog(@"星期三");
    }];
    [cell setTapThursdayButton_Block:^(NSDictionary *dic) {
        if (dic == nil) {
            [HNAGeneral showAlertViewWithTitle:nil andMessage:@"暂无食谱！"];
        }else{
            self.hidesBottomBarWhenPushed = YES;
            kqDayFoodListViewController *dflVC = [[kqDayFoodListViewController alloc] initWithNibName:@"kqDayFoodListViewController" bundle:nil];
            dflVC.title = @"星期四";
            dflVC.dictionary = dic;
            dflVC.fileUrl = self.fileUrlStr;
            dflVC.isEditMode = self.isTeacher;
            [self.navigationController pushViewController:dflVC animated:YES];
        }
        NSLog(@"星期四");
    }];
    [cell setTapFridayButton_Block:^(NSDictionary *dic) {
        if (dic == nil) {
            [HNAGeneral showAlertViewWithTitle:nil andMessage:@"暂无食谱！"];
        }else{
            self.hidesBottomBarWhenPushed = YES;
            kqDayFoodListViewController *dflVC = [[kqDayFoodListViewController alloc] initWithNibName:@"kqDayFoodListViewController" bundle:nil];
            dflVC.title = @"星期五";
            dflVC.dictionary = dic;
            dflVC.fileUrl = self.fileUrlStr;
            dflVC.isEditMode = self.isTeacher;
            [self.navigationController pushViewController:dflVC animated:YES];
        }
        NSLog(@"星期五");
    }];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
