//
//  kqMessageViewController.m
//  KindergartenPro
//
//  Created by 海峰 on 14-9-3.
//  Copyright (c) 2014年 海峰. All rights reserved.
//

#import "kqMessageViewController.h"
#import "kqTChatMessageCell.h"
#import "kqTBabyContactListViewController.h"

@interface kqMessageViewController ()
@property (weak, nonatomic) IBOutlet UIView *qunLiaoView;
@property (weak, nonatomic) IBOutlet UILabel *qunLiaoTimeLabel;
@property (weak, nonatomic) IBOutlet UIImageView *qunLiaoImageView;
@property (weak, nonatomic) IBOutlet UILabel *qunLiaoContextLabel;
@property(strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *dataArray;
@property (strong, nonatomic) NSMutableString *fileUrlString;
@property (assign, nonatomic) BOOL isBabyMessageMode;
@property (weak, nonatomic) IBOutlet UILabel *qunLiaoNameLabel;
@property(strong, nonatomic) UIImageView *navBarImageView;
@end

@implementation kqMessageViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)didBackView
{
    HNADownLoadManager *dl = [HNADownLoadManager sharedDownLoadManager];
    dl.delegate = self;
    if (self.isBabyMessageMode) {
        [dl teacherGetMessageListWithMsgType:@"0"];
    }else{
        [dl teacherGetMessageListWithMsgType:@"3"];
    }
}

- (IBAction)tapQunLiaoView:(id)sender {
    self.hidesBottomBarWhenPushed = YES;
    kqChatWindowViewController *cwVC = [[kqChatWindowViewController alloc] initWithNibName:@"kqChatWindowViewController" bundle:nil];
    cwVC.title = @"班级群聊";
    cwVC.delete = self;
    if (self.isBabyMessageMode) {
        cwVC.roleType = ClassQunLiaoType;
    }else{
        cwVC.roleType = TeacherQunLiaoType;
    }
    [self.navigationController pushViewController:cwVC animated:YES];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [HNAGeneral showOnWindow:@"加载中"];
    [self getMessageList];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.isBabyMessageMode = YES;
//    UIImageView *topView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"wave.png"]];
//    topView.frame = CGRectMake(0, 0, 320, 10);
//    [self.view addSubview:topView];
    [self initTopBar];
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 70, SCREEN_W, SCREEN_H - 64 - 49 - 70)];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    // Do any additional setup after loading the view from its nib.
}

-(void) getMessageList
{
    HNADownLoadManager *dl = [HNADownLoadManager sharedDownLoadManager];
    dl.delegate = self;
    if (self.isBabyMessageMode) {
        [dl teacherGetMessageListWithMsgType:@"0"];
    }else{
        [dl teacherGetMessageListWithMsgType:@"3"];
    }
}

-(void)teacherGetBabyMessageListDelegate:(NSDictionary *)dic
{
    [HNAGeneral hidenHUD];
    NSDictionary *dataMap = [dic valueForKey:@"dataMap"];
    NSString *state = [dataMap valueForKey:@"state"];
    if ([state isEqualToString:SU]) {
        NSArray *arr = [dataMap valueForKey:@"data"];
        if (arr.count != 0) {
            self.fileUrlString = [NSMutableString stringWithFormat:@"%@",[dic valueForKey:@"fileUrl"]];
            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
            [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
            arr = [arr sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
                NSDictionary *dic1 = (NSDictionary *) obj1;
                NSDictionary *dic2 = (NSDictionary *) obj2;
                NSString *str1 = [[dic1 valueForKey:@"sendDate"] stringByReplacingOccurrencesOfString:@"T" withString:@" "];
                NSString *str2 = [[dic2 valueForKey:@"sendDate"] stringByReplacingOccurrencesOfString:@"T" withString:@" "];
                NSDate *date1 = [formatter dateFromString:str1];
                NSDate *date2 = [formatter dateFromString:str2];
                NSComparisonResult result = [date2 compare:date1];
                return result;
            }];
            self.dataArray = [NSMutableArray arrayWithArray:arr];
            [self.tableView reloadData];
        }
    }else if([state isEqualToString:ER]){
        [HNAGeneral showAlertViewWithTitle:@"提示" andMessage:[dataMap valueForKey:@"stateMsg"]];
    }
    HNADownLoadManager *dl = [HNADownLoadManager sharedDownLoadManager];
    dl.delegate = self;
    if (self.isBabyMessageMode) {
        [dl babyGetQunLiaoMessage];
    }else{
        [dl teacherGetTeacherQunLiaoMessage];
    }
}

-(void)downLoadBabyGetQunliaoMessageDelegate:(NSDictionary *)dic
{
    NSDictionary *dataMap = [dic valueForKey:@"dataMap"];
    NSString *state = [dataMap valueForKey:@"state"];
    if ([state isEqualToString:SU]) {
        NSArray *arr = [dataMap valueForKey:@"data"];
        if (arr.count != 0) {
            NSDictionary *tdic = arr.firstObject;
//            self.qunLiaoImageView.layer.cornerRadius = 20.0f;
//            self.qunLiaoImageView.layer.masksToBounds = YES;
            NSString *hstring;
            if (!([[tdic valueForKey:@"receiveUserId"] isKindOfClass:[NSNull class]] || [[tdic valueForKey:@"receiveUserId"] isEqualToString:@""])) {
                NSString *rID = [[tdic valueForKey:@"receiveUserId"] stringValue];
                kqPersonalInfoMation *info = [kqPersonalInfoMation sharedPersonalInfoMation];
                if ([info.babyId isEqualToString:rID]) {
                    hstring = [tdic valueForKey:@"sendUserImgPath"];
                }else{
                    hstring = [tdic valueForKey:@"receiveUserImgPath"];
                }
            }else{
                hstring = [tdic valueForKey:@"sendUserImgPath"];
            }
//            NSURL *hurl = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",self.fileUrlString,hstring]];
//            [self.qunLiaoImageView setImageWithURL:hurl placeholderImage:[UIImage imageNamed:@"tbabyDefaultHeadImage.png"]];
            NSString *msgSoundPath = [tdic valueForKey:@"msgSoundPath"];
            if (!([msgSoundPath isEqualToString:@""] || [msgSoundPath isKindOfClass:[NSNull class]])) {
                self.qunLiaoContextLabel.text = @"语音消息";
            }else{
                self.qunLiaoContextLabel.text = [tdic valueForKey:@"msgContent"];
            }
            self.qunLiaoTimeLabel.text = [[tdic valueForKey:@"sendDate"] stringByReplacingOccurrencesOfString:@"T" withString:@" "];
        }
    }else if([state isEqualToString:ER]){
        [HNAGeneral showAlertViewWithTitle:@"提示" andMessage:[dataMap valueForKey:@"stateMsg"]];
    }
}

-(void)teacherGetTeacherQunLiaoMessageDelegate:(NSDictionary *)dic
{
    NSDictionary *dataMap = [dic valueForKey:@"dataMap"];
    NSString *state = [dataMap valueForKey:@"state"];
    if ([state isEqualToString:SU]) {
        NSArray *arr = [dataMap valueForKey:@"data"];
        if (arr.count != 0) {
            NSDictionary *tdic = arr.firstObject;
//            self.qunLiaoImageView.layer.cornerRadius = 20.0f;
//            self.qunLiaoImageView.layer.masksToBounds = YES;
            NSString *hstring;
            if (!([[tdic valueForKey:@"receiveUserId"] isKindOfClass:[NSNull class]] || [[tdic valueForKey:@"receiveUserId"] isEqualToString:@""])) {
                NSString *rID = [[tdic valueForKey:@"receiveUserId"] stringValue];
                kqPersonalInfoMation *info = [kqPersonalInfoMation sharedPersonalInfoMation];
                if ([info.babyId isEqualToString:rID]) {
                    hstring = [tdic valueForKey:@"sendUserImgPath"];
                }else{
                    hstring = [tdic valueForKey:@"receiveUserImgPath"];
                }
            }else{
                hstring = [tdic valueForKey:@"sendUserImgPath"];
            }
//            NSURL *hurl = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",self.fileUrlString,hstring]];
//            [self.qunLiaoImageView setImageWithURL:hurl placeholderImage:[UIImage imageNamed:@"tbabyDefaultHeadImage.png"]];
            NSString *msgSoundPath = [tdic valueForKey:@"msgSoundPath"];
            if (!([msgSoundPath isEqualToString:@""] || [msgSoundPath isKindOfClass:[NSNull class]])) {
                self.qunLiaoContextLabel.text = @"语音消息";
            }else{
                self.qunLiaoContextLabel.text = [tdic valueForKey:@"msgContent"];
            }
            self.qunLiaoTimeLabel.text = [[tdic valueForKey:@"sendDate"] stringByReplacingOccurrencesOfString:@"T" withString:@" "];
        }
    }else if([state isEqualToString:ER]){
        [HNAGeneral showAlertViewWithTitle:@"提示" andMessage:[dataMap valueForKey:@"stateMsg"]];
    }

}

-(void) initTopBar
{
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightButton addTarget:self action:@selector(tapContactButton) forControlEvents:UIControlEventTouchUpInside];
    rightButton.frame =CGRectMake(0.0f, 6.0f, 23.0f, 23.0f);
    [rightButton setImage:[UIImage imageNamed:@"tContact.png"] forState:UIControlStateNormal];
    UIBarButtonItem* right = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
    self.navigationItem.rightBarButtonItem = right;
    
    UIView *topMiddleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 160, 44)];
    topMiddleView.backgroundColor = [UIColor clearColor];
//    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 160, 44)];
//    titleLabel.backgroundColor = [UIColor clearColor];
//    titleLabel.textAlignment = NSTextAlignmentCenter;
//    titleLabel.font = [UIFont systemFontOfSize:18];
//    titleLabel.textColor = [UIColor whiteColor];
//    titleLabel.text = @"消息";
//    titleLabel.tag = WONDERFULMOMENTTITLELABELTAG;
//    titleLabel.userInteractionEnabled = YES;
//    [topMiddleView addSubview:titleLabel];
//    UIButton *titleButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    titleButton.frame = CGRectMake(0, 0, 160, 44);
//    [titleButton addTarget:self action:@selector(tapTitleButton) forControlEvents:UIControlEventTouchUpInside];
//    [topMiddleView addSubview:titleButton];
//    self.navBarImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"title_down"]];
//    self.navBarImageView.frame = CGRectMake(100, 12, 20, 20);
//    [topMiddleView addSubview:self.navBarImageView];
//    self.navBarImageView.userInteractionEnabled = YES;
    UISegmentedControl *seg = [[UISegmentedControl alloc] initWithItems:@[@"消息",@"教师消息"]];
    seg.selectedSegmentIndex = 0;
    seg.backgroundColor = RGB(61, 209, 188, 1);
    seg.tintColor = [UIColor whiteColor];
    seg.frame = CGRectMake(0, 7, 160, 30);
    [seg addTarget:self action:@selector(segValueChangeD:) forControlEvents:UIControlEventValueChanged];
    [topMiddleView addSubview:seg];
    self.navigationItem.titleView = topMiddleView;
}

//TODO:新的头部
-(void) segValueChangeD:(UISegmentedControl *)seg
{
    if (seg.selectedSegmentIndex == 1) {
        self.isBabyMessageMode = NO;
        self.qunLiaoNameLabel.text = @"教师群聊";
        self.qunLiaoImageView.image = [UIImage imageNamed:@"老师群聊"];
    }else{
        self.isBabyMessageMode = YES;
        self.qunLiaoImageView.image = [UIImage imageNamed:@"banjiqunliao"];
    }
    [self getMessageList];
}

- (void)tapTitleButton {
    [self.navBarImageView setImage:[UIImage imageNamed:@"title_up"]];
    NSString *uuid = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
    NSLog(@"------------%@", uuid);
    kqAppDelegate *appDelegate =
    (kqAppDelegate *)[UIApplication sharedApplication].delegate;
    WonderfulMomentChangeView *emcv =
    [[[NSBundle mainBundle] loadNibNamed:@"WonderfulMomentChangeView"
                                   owner:self
                                 options:nil] objectAtIndex:0];
    emcv.dataArray = [NSMutableArray arrayWithObjects:@"消息",@"教师消息", nil];
    emcv.delegate = self;
    [emcv initView];
    [appDelegate.window addSubview:emcv];
}

-(void)didTapModeViewWithSelectMode:(NSInteger)viewMode andView:(UIView *)view
{
    UILabel *titleLabel = (UILabel *)[self.navigationItem.titleView viewWithTag:WONDERFULMOMENTTITLELABELTAG];
    switch (viewMode) {
        case 1:
        {
            titleLabel.text = @"消息";
            self.navBarImageView.frame = CGRectMake(100, 12, 20, 20);
            self.isBabyMessageMode = YES;
            self.qunLiaoNameLabel.text = @"班级群聊";
        }
            break;
        case 2:
        {
            titleLabel.text = @"教师消息";
            self.navBarImageView.frame = CGRectMake(115, 12, 20, 20);
            self.isBabyMessageMode = NO;
            self.qunLiaoNameLabel.text = @"教师群聊";
        }
            break;
            
        default:
            break;
    }
    [self.navBarImageView setImage:[UIImage imageNamed:@"title_down"]];
    [view removeFromSuperview];
    [self getMessageList];
}

-(void)didtapCancelViewWithView:(UIView *)view
{
    [self.navBarImageView setImage:[UIImage imageNamed:@"title_down"]];
    [view removeFromSuperview];
}

-(void) tapContactButton
{
    self.hidesBottomBarWhenPushed = YES;
    kqTBabyContactListViewController *tbclVC = [[kqTBabyContactListViewController alloc] initWithNibName:@"kqTBabyContactListViewController" bundle:nil];
    tbclVC.title = @"联系人";
    tbclVC.isBabyInfo = NO;
//    UILabel *titleLabel = (UILabel *)[self.navigationItem.titleView viewWithTag:WONDERFULMOMENTTITLELABELTAG];
    if (self.isBabyMessageMode) {
        tbclVC.isBabyList = YES;
    }else{
        tbclVC.isBabyList = NO;
    }
    [self.navigationController pushViewController:tbclVC animated:YES];
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
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.hidesBottomBarWhenPushed = NO;
}

#pragma mark - tableViewDelegate
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
    return 60.0f;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    kqTChatMessageCell *cell = (kqTChatMessageCell *)[[[NSBundle mainBundle] loadNibNamed:@"kqTChatMessageCell" owner:self options:nil] objectAtIndex:0];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    NSDictionary *tdic = [self.dataArray objectAtIndex:indexPath.row];
    cell.fileUrlString = self.fileUrlString;
    [cell initCellWithDic:tdic];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    self.hidesBottomBarWhenPushed = YES;
    kqChatWindowViewController *cwVC = [[kqChatWindowViewController alloc] initWithNibName:@"kqChatWindowViewController" bundle:nil];
    NSDictionary *tdic = [self.dataArray objectAtIndex:indexPath.row];
    NSString *rID = [[tdic valueForKey:@"receiveUserId"] stringValue];
    kqPersonalInfoMation *info = [kqPersonalInfoMation sharedPersonalInfoMation];
    if ([info.babyId isEqualToString:rID]) {
        cwVC.title = [tdic valueForKey:@"sendUserName"];
        cwVC.roleID = [[tdic valueForKey:@"sendUserId"] stringValue];
        cwVC.roleName = [tdic valueForKey:@"sendUserDeviceid"];
    }else{
        cwVC.title = [tdic valueForKey:@"receiveUserName"];
        cwVC.roleName = [tdic valueForKey:@"receiveUserDeviceid"];
        cwVC.roleID = rID;
    }
    cwVC.delete = self;
    if (self.isBabyMessageMode) {
        cwVC.roleType = JiazhangType;
    }else{
        cwVC.roleType = TeacherandTeacherType;
    }
    [self.navigationController pushViewController:cwVC animated:YES];
}

@end
