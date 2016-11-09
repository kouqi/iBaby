//
//  kqWeekActivitiesDetailViewController.m
//  KindergartenPro
//
//  Created by 海峰 on 14-8-8.
//  Copyright (c) 2014年 海峰. All rights reserved.
//

#import "kqWeekActivitiesDetailViewController.h"
#import "kqWeekActivitiesDetailCell.h"
#import "kqCreatNewActivitiesViewController.h"
@interface kqWeekActivitiesDetailViewController ()
@property (strong, nonatomic) NSMutableArray *dataArray;
@property (strong, nonatomic) UITableView *tableView;
@end

@implementation kqWeekActivitiesDetailViewController

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
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, SCREEN_H - 64)];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.tableView];
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0){
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    [self sortArray];
    // Do any additional setup after loading the view from its nib.
}

-(void) sortArray
{
    NSArray *arr = [self.dictionary valueForKey:@"array"];
    if (arr.count != 0) {
        self.dataArray = [NSMutableArray array];
        for (int i = 0; i < arr.count; i++) {
            [self.dataArray addObject:[arr objectAtIndex:i]];
        }
    }
    [self.tableView reloadData];
}

-(void) initTopBar
{
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftButton addTarget:self action:@selector(tapBackButton) forControlEvents:UIControlEventTouchUpInside];
    leftButton.frame =CGRectMake(0.0f, 6.0f, 23.0f, 23.0f);
    [leftButton setImage:[UIImage imageNamed:@"leftBack.png"] forState:UIControlStateNormal];
    UIBarButtonItem* left = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
    self.navigationItem.leftBarButtonItem = left;
//    if (self.isEditMode) {
//        UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
//        [rightButton addTarget:self action:@selector(tapEditButton) forControlEvents:UIControlEventTouchUpInside];
//        rightButton.frame =CGRectMake(0.0f, 0.0f, 60.0f, 44.0f);
//        [rightButton setTitle:@"编辑" forState:UIControlStateNormal];
//        [rightButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//        UIBarButtonItem* right = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
//        self.navigationItem.rightBarButtonItem = right;
//    }
}

-(void) tapBackButton
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void) tapEditButton
{
    kqCreatNewActivitiesViewController *cndfVc = [[kqCreatNewActivitiesViewController alloc] initWithNibName:@"kqCreatNewActivitiesViewController" bundle:nil];
    cndfVc.title = @"日期";
    [self.navigationController pushViewController:cndfVc animated:YES];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat height = 50.0f;
    NSDictionary *dic = [self.dataArray objectAtIndex:indexPath.row];
    NSString *contentStr = [dic valueForKey:@"activityContent"];
    CGSize size = [contentStr sizeWithFont:[UIFont systemFontOfSize:12.0f] constrainedToSize:CGSizeMake(280, 1000) lineBreakMode:NSLineBreakByCharWrapping];
    if (size.height < 50.0f) {
        height = 100.0f;
    }else{
        height += size.height;
    }
    return height;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    kqWeekActivitiesDetailCell *cell = (kqWeekActivitiesDetailCell *)[[[NSBundle mainBundle] loadNibNamed:@"kqWeekActivitiesDetailCell" owner:self options:nil] objectAtIndex:0];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    NSDictionary *dic = [self.dataArray objectAtIndex:indexPath.row];
    NSString *ti = [dic valueForKey:@"activityTime"];
    if ([ti isKindOfClass:[NSString class]] && ![ti isEqualToString:@""]) {
        cell.timeLabel.text = [NSString stringWithFormat:@"%@ %@",[[dic valueForKey:@"activityDate"] substringToIndex:10],[dic valueForKey:@"activityTime"]];
    }
    cell.titleLabel.text = [dic valueForKey:@"activityTitle"];
    NSString *contentStr = [dic valueForKey:@"activityContent"];
    CGSize size = [contentStr sizeWithFont:[UIFont systemFontOfSize:12.0f] constrainedToSize:CGSizeMake(280, 1000) lineBreakMode:NSLineBreakByCharWrapping];
    if (size.height >= 50.0f) {
        cell.contentLabel.frame = CGRectMake(20, 45, 280, size.height);
    }
    cell.contentLabel.numberOfLines = 0;
    cell.contentLabel.text = [dic valueForKey:@"activityContent"];
    cell.lineLabel.frame = CGRectMake(0, 45 + cell.contentLabel.frame.size.height + 4.5f, 320, 0.5f);
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