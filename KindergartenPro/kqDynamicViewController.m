//
//  kqDynamicViewController.m
//  KindergartenPro
//
//  Created by 海峰 on 14-9-3.
//  Copyright (c) 2014年 海峰. All rights reserved.
//

#import "kqDynamicViewController.h"
#import "kqWeekFoodListViewController.h"
#import "kqWeekActivitiesViewController.h"
#import "kqKindergartenNoticeViewController.h"
#import "kqFoundViewController.h"
@interface kqDynamicViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UILabel *schoolNoticeLabel;
@property (weak, nonatomic) IBOutlet UILabel *schoolActiveLabel;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation kqDynamicViewController

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
    [self initView];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    // Do any additional setup after loading the view from its nib.
}

#pragma mark tableViewDelegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return 4;
            break;
            
        default:
            return 2;
            break;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return 20.0f;
            break;
            
        default:
            return 20.0f;
            break;
    };
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.0f;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44.0f;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    switch (indexPath.section) {
        case 0:
        {
            switch (indexPath.row) {
                case 0:
                {
                    cell.imageView.image = [UIImage imageNamed:@"t_yuanneiTongzhi"];
                    cell.textLabel.text = @"园内通知";
                }
                    break;
                case 1:
                {
                    cell.imageView.image = [UIImage imageNamed:@"t_anquanshouce"];
                    cell.textLabel.text = @"安全手册";
                }
                    break;
                case 2:
                {
                    cell.imageView.image = [UIImage imageNamed:@"t_yuanneihuodong"];
                    cell.textLabel.text = @"园内活动";
                }
                    break;
                case 3:
                {
                    cell.imageView.image = [UIImage imageNamed:@"t_jiaoshitongzhi"];
                    cell.textLabel.text = @"教师通知";
                }
                    break;
                    
                default:
                    break;
            }
        }
            break;
            
        default:
        {
            switch (indexPath.row) {
                case 0:
                {
                    cell.imageView.image = [UIImage imageNamed:@"t_meizhouhuodong"];
                    cell.textLabel.text = @"每周活动";
                }
                    break;
                case 1:
                {
                    cell.imageView.image = [UIImage imageNamed:@"t_meizhoushipu"];
                    cell.textLabel.text = @"每周食谱";
                }
                    break;
                default:
                    break;
            }
        }
            break;
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    self.hidesBottomBarWhenPushed = YES;
    switch (indexPath.section) {
        case 0:
        {
            switch (indexPath.row) {
                case 0:
                {
                    [self tapToSameViewControllerWithTag:1000];
                }
                    break;
                case 1:
                {
                    [self tapToSameViewControllerWithTag:1001];
                }
                    break;
                case 2:
                {
                    [self tapToSameViewControllerWithTag:1002];
                }
                    break;
                case 3:
                {
                    [self tapTeacherNoticeButton:nil];
                }
                    break;
                    
                default:
                    break;
            }
        }
            break;
            
        default:
        {
            switch (indexPath.row) {
                case 0:
                {
                    [self tapWeekActivitiesButton:nil];
                }
                    break;
                case 1:
                {
                    [self tapWeekFoodButton:nil];
                }
                    break;
                default:
                    break;
            }
        }
            break;
    }
}

-(void) tapToSameViewControllerWithTag:(int) tag
{
    self.hidesBottomBarWhenPushed = YES;
    kqKindergartenNoticeViewController *knVC = [[kqKindergartenNoticeViewController alloc] initWithNibName:@"kqKindergartenNoticeViewController" bundle:nil];
    kqDistingKindergartenAndSchool *dkas = [kqDistingKindergartenAndSchool sharedDistingKindergartenAndSchool];
    switch (tag) {
        case 1000:
        {
            knVC.babyNoticeTypeId = 1;
            knVC.title = dkas.schoolNotice;
        }
            break;
        case 1001:
        {
            knVC.babyNoticeTypeId = 2;
            knVC.title = @"安全手册";
        }
            break;
        case 1002:
        {
            knVC.babyNoticeTypeId = 3;
            knVC.title = dkas.schoolActive;
        }
            break;
            
        default:
            break;
    }
    knVC.isTeacher = YES;
    [self.navigationController pushViewController:knVC animated:YES];
}

//TODO:老方法
-(void) initView
{
    kqDistingKindergartenAndSchool *dkas = [kqDistingKindergartenAndSchool sharedDistingKindergartenAndSchool];
    self.schoolActiveLabel.text = dkas.schoolActive;
    self.schoolNoticeLabel.text = dkas.schoolNotice;
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.hidesBottomBarWhenPushed = NO;
}

- (IBAction)tapKindergartenActivitiesButton:(id)sender {
    self.hidesBottomBarWhenPushed = YES;
    UIButton *bt = (UIButton *) sender;
    kqKindergartenNoticeViewController *knVC = [[kqKindergartenNoticeViewController alloc] initWithNibName:@"kqKindergartenNoticeViewController" bundle:nil];
    kqDistingKindergartenAndSchool *dkas = [kqDistingKindergartenAndSchool sharedDistingKindergartenAndSchool];
    switch (bt.tag) {
        case 1000:
        {
            knVC.babyNoticeTypeId = 1;
            knVC.title = dkas.schoolNotice;
        }
            break;
        case 1001:
        {
            knVC.babyNoticeTypeId = 2;
            knVC.title = @"安全手册";
        }
            break;
        case 1002:
        {
            knVC.babyNoticeTypeId = 3;
            knVC.title = dkas.schoolActive;
        }
            break;
            
        default:
            break;
    }
    knVC.isTeacher = YES;
    [self.navigationController pushViewController:knVC animated:YES];
}

- (IBAction)tapWeekActivitiesButton:(id)sender {
    self.hidesBottomBarWhenPushed = YES;
    kqWeekActivitiesViewController *waVC = [[kqWeekActivitiesViewController alloc] initWithNibName:@"kqWeekActivitiesViewController" bundle:nil];
    waVC.title = @"每周活动";
    waVC.isTeacher = YES;
    [self.navigationController pushViewController:waVC animated:YES];
}

- (IBAction)tapWeekFoodButton:(id)sender {
    self.hidesBottomBarWhenPushed = YES;
    kqWeekFoodListViewController *wflVC = [[kqWeekFoodListViewController alloc] initWithNibName:@"kqWeekFoodListViewController" bundle:nil];
    wflVC.title = @"每周食谱";
    wflVC.isTeacher = YES;
    [self.navigationController pushViewController:wflVC animated:YES];
}

- (IBAction)tapFoundButton:(UIButton *)sender {
    self.hidesBottomBarWhenPushed = YES;
    kqFoundViewController *fVC = [[kqFoundViewController alloc] initWithNibName:@"kqFoundViewController" bundle:nil];
    fVC.isTeacher = YES;
    fVC.isPush = YES;
    fVC.title = @"发现";
    [self.navigationController pushViewController:fVC animated:YES];
}

- (IBAction)tapTeacherNoticeButton:(UIButton *)sender {
    self.hidesBottomBarWhenPushed = YES;
    kqKindergartenNoticeViewController *knVC = [[kqKindergartenNoticeViewController alloc] initWithNibName:@"kqKindergartenNoticeViewController" bundle:nil];
    knVC.babyNoticeTypeId = 5;
    knVC.title = @"教师通知";
    knVC.isTeacher = YES;
    [self.navigationController pushViewController:knVC animated:YES];
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
