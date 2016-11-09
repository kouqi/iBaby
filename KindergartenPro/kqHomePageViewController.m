//
//  kqHomePageViewController.m
//  KindergartenPro
//
//  Created by 海峰 on 14-7-25.
//  Copyright (c) 2014年 海峰. All rights reserved.
//
#import "LoginApi.h"
#import "PushApi.h"
#import "LogApi.h"
#import "EAGLExView.h"
#import "CallApi.h"
#import "SysApi.h"
#import "MeetingApi.h"
#ifndef HW_SCREEN_HEIGHT
#define HW_SCREEN_HEIGHT [[UIScreen mainScreen]bounds].size.height
#endif

#import "kqBabyHomeHeadeView.h"
#import "kqHomePageViewController.h"
#import "kqPlayRtspViewController.h"
#import "kqHomePageMessageCell.h"
#import "kqBabyInformationManualViewController.h"
#import "kqBabyKindergartenNoticeViewController.h"
#import "kqBabySignInListViewController.h"
#import "kqWeekFoodListViewController.h"
#import "kqWeekActivitiesViewController.h"
#import "kqFoundViewController.h"
@interface kqHomePageViewController ()<NSXMLParserDelegate>
@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *dataArray,*babyInformationArray,*kindergartenNoticeArray,*babySignInListArray,*weekActivitiesArray,*weekFoodListArray,*yuanArr,*qunArr,*shiArr;
@property (strong, nonatomic) NSString *weekFoodListUrlstr;

@property(strong, nonatomic) NSMutableArray *xmlArray,*appArray,*huaweiArray;
@property(strong, nonatomic) NSString *currentElementValue;
@property(strong, nonatomic) NSMutableDictionary *mdic,*cameraDictionary;
@property(assign, nonatomic) BOOL isFirstRequest;
@end

@implementation kqHomePageViewController
static kqHomePageViewController *info;
+(kqHomePageViewController *)sharedkqHomePageViewController
{
    @synchronized(self)
    {
        if (info == nil) {
            info = [[self alloc] init];
        }
    }
    return info;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)tapLogOutButton {
    kqAppDelegate *appdelegate = (kqAppDelegate *)[UIApplication sharedApplication].delegate;
    kqLoginViewController *loginVC = [[kqLoginViewController alloc] initWithNibName:@"kqLoginViewController" bundle:nil];
    loginVC.delegate = appdelegate;
    appdelegate.window.rootViewController = loginVC;
    [loginVC setRemeber:NO andShow:NO];
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    NSDictionary *userInfo = [ud objectForKey:@"login"];
    if (userInfo != nil) {
        [APService setAlias:@"" callbackSelector:nil object:nil];
    }
}

//TODO:收到推送时
-(void)recieveNotificationWithDictionary:(NSDictionary *)notificationDictionary
{
    if (notificationDictionary) {
        NSLog(@"-------%@",notificationDictionary);
        NSString *alertString = [NSString stringWithFormat:@"%@",[[notificationDictionary valueForKey:@"aps"] valueForKey:@"alert"]];
        NSLog(@"----------%@",alertString);
        if ([alertString isEqualToString:@"您的帐号在另外一个设备登录"]) {
            [self tapLogOutButton];
            [HNAGeneral showAlertViewWithTitle:@"警告" andMessage:alertString];
            return;
        }
        NSInteger msgType = [[notificationDictionary valueForKey:@"msgType"] integerValue];
        NSIndexPath *indexPath;
        switch (msgType) {
            case 1:
            {
                indexPath = [NSIndexPath indexPathForRow:1 inSection:0];
            }
                break;
            case 2:
            {
                indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
            }
                break;
            case 3:
                indexPath = [NSIndexPath indexPathForRow:2 inSection:0];
                break;
            case 4:
                indexPath = [NSIndexPath indexPathForRow:3 inSection:0];
                break;
            case 5:
                indexPath = [NSIndexPath indexPathForRow:4 inSection:0];
                break;
            case 6:
                indexPath = [NSIndexPath indexPathForRow:5 inSection:0];
                break;
            case 7:
                indexPath = [NSIndexPath indexPathForRow:6 inSection:0];
                break;
            case 8:
            {
                indexPath = [NSIndexPath indexPathForRow:7 inSection:0];
            }
                break;
                
            default:
                break;
        }
        kqHomePageMessageCell *cell = (kqHomePageMessageCell *) [self.tableView cellForRowAtIndexPath:indexPath];
        cell.cellDetailLabel.text = [notificationDictionary valueForKey:@"msgContent"];
        if (cell.unreaderNumber.hidden) {
            cell.unreaderNumber.hidden = NO;
            cell.unreaderNumber.text = @"1";
        }else{
            NSInteger nu = [cell.unreaderNumber.text integerValue];
            nu++;
            cell.unreaderNumber.text = [NSString stringWithFormat:@"%ld",(long)nu];
        }
    }
}

//TODO:接口相关
-(void) downLoadUnReadMessage
{
    [HNAGeneral showOnWindow:@"加载中"];
    HNADownLoadManager *dl = [HNADownLoadManager sharedDownLoadManager];
    dl.delegate = self;
    [dl downLoadUnReadMessage];
}

-(NSMutableArray *) teacherOperArr:(NSArray *) array andFileUrl:(NSString *) urlStr
{
    NSMutableArray *messageArray = [NSMutableArray array];
    for (NSDictionary *dic in array) {
        NSMutableDictionary *dics = [NSMutableDictionary dictionary];
        [dics setValue:[dic valueForKey:@"msgContent"] forKey:@"content"];
        [dics setValue:[dic valueForKey:@"sendDate"] forKey:@"time"];
        [dics setValue:@"0" forKey:@"flag"];
        kqPersonalInfoMation *info = [kqPersonalInfoMation sharedPersonalInfoMation];
        if ([[dic valueForKey:@"sendUserName"] isEqualToString:info.realName]) {
            [dics setValue:@"1" forKey:@"who"];
        }else{
            [dics setValue:@"0" forKey:@"who"];
        }
        NSString *sondPath = [NSString stringWithFormat:@"%@%@",urlStr,[dic valueForKey:@"msgSoundPath"]];
        [dics setValue:sondPath forKey:@"soundPath"];
        NSString *headerImagePath = [NSString stringWithFormat:@"%@%@",urlStr,[dic valueForKey:@"sendUserImgPath"]];
        [dics setValue:headerImagePath forKey:@"headerImagePath"];
        [messageArray addObject:dics];
    }
    messageArray = [self teacherSortDate:messageArray];
    return messageArray;
}

-(NSMutableArray *) teacherSortDate:(NSMutableArray *) array
{
    NSArray *arry = [array sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        NSDictionary *dic1 = (NSDictionary *) obj1;
        NSDictionary *dic2 = (NSDictionary *) obj2;
        NSString *ti1 = [dic1 valueForKey:@"time"];
        NSString *ti2 = [dic2 valueForKey:@"time"];
        NSComparisonResult result;
        if ([ti1 isKindOfClass:[NSNull class]] || [ti2 isKindOfClass:[NSNull class]]) {
            result = NSOrderedSame;
        }else{
            NSDate *d1 = [formatter dateFromString:ti1];
            NSDate *d2 = [formatter dateFromString:ti2];
            result = [d1 compare:d2];
        }
        return result;
    }];
    NSMutableArray *arr = [NSMutableArray arrayWithArray:arry];
    return arr;
}


-(void) downLoadUnReadMessageDelegate:(NSDictionary *)dic
{
    [HNAGeneral hidenHUD];
    NSDictionary *dataMap = [dic valueForKey:@"dataMap"];
    NSString *state = [dataMap valueForKey:@"state"];
    if ([state isEqualToString:SU]) {
        NSArray *arr = [dataMap valueForKey:@"data"];
        if (arr.count != 0) {
            NSMutableArray *yuanArr = [NSMutableArray array];
            NSMutableArray *quanArr = [NSMutableArray array];
            NSMutableArray *shiArr = [NSMutableArray array];
            kqPersonalInfoMation *info = [kqPersonalInfoMation sharedPersonalInfoMation];
            for (NSDictionary *dics in arr) {
                if ([[dics valueForKey:@"msgType"] intValue] == 0) {
                    if ([[dics valueForKey:@"sendUserId"] intValue] == [info.teacherID intValue]) {
                        [shiArr addObject:dics];
                    }else if([[dics valueForKey:@"sendUserId"] intValue] == [info.principalID intValue]){
                        [yuanArr addObject:dics];
                    }
                }else if([[dics valueForKey:@"msgType"] intValue] == 1){
                    [quanArr addObject:dics];
                }
            }
            self.yuanArr = [NSMutableArray arrayWithArray:yuanArr];
            self.qunArr = [NSMutableArray arrayWithArray:quanArr];
            self.shiArr = [NSMutableArray arrayWithArray:shiArr];
            [self.tableView reloadData];
            
        }
//        if (self.userinfo) {
//            [self recieveNotificationWithDictionary:self.userinfo];
//        }
        
//        [HNAGeneral showOnWindow:@"加载中"];
//        HNADownLoadManager *dlm = [HNADownLoadManager sharedDownLoadManager];
//        dlm.delegate = self;
//        [dlm downLoadBabyInfomationWith:@"0"];
    }else if([state isEqualToString:ER]){
        [HNAGeneral showAlertViewWithTitle:@"提示" andMessage:[dataMap valueForKey:@"stateMsg"]];
    }
}

-(void)downLoadBabyInfomationDelegate:(NSDictionary *)dic
{
    NSDictionary *dataMap = [dic valueForKey:@"dataMap"];
    if ([[dataMap valueForKey:@"state"] isEqualToString:SU]) {
        NSArray *arr = [dataMap valueForKey:@"data"];
        if (arr.count != 0) {
            self.babyInformationArray = [NSMutableArray arrayWithArray:arr];
        }
        
        [HNAGeneral showOnWindow:@"加载中"];
        HNADownLoadManager *dlm = [HNADownLoadManager sharedDownLoadManager];
        dlm.delegate = self;
        [dlm downLoadKindergartenNoticeWith:@"0" andbabyNoticeTypeId:1];
    }else if ([[dataMap valueForKey:@"state"] isEqualToString:ER]){
        [HNAGeneral showAlertViewWithTitle:nil andMessage:[dataMap valueForKey:@"stateMsg"]];
    }
}

-(void)downLoadKindergartenNoticeDelegate:(NSDictionary *)dic
{
    NSDictionary *dataMap = [dic valueForKey:@"dataMap"];
    if ([[dataMap valueForKey:@"state"] isEqualToString:SU]) {
        NSArray *arr = [dataMap valueForKey:@"data"];
        if (arr.count != 0) {
            self.kindergartenNoticeArray = [NSMutableArray arrayWithArray:arr];
        }
        
        [HNAGeneral showOnWindow:@"加载中"];
        HNADownLoadManager *dlm = [HNADownLoadManager sharedDownLoadManager];
        dlm.delegate = self;
        [dlm downLoadBabySignInWith:@"0" andBabyID:nil];
    }else if ([[dataMap valueForKey:@"state"] isEqualToString:ER]){
        [HNAGeneral showAlertViewWithTitle:nil andMessage:[dataMap valueForKey:@"stateMsg"]];
    }
}

-(void)downLoadBabySignInDelegate:(NSDictionary *)dic
{
    NSDictionary *dataMap = [dic valueForKey:@"dataMap"];
    if ([[dataMap valueForKey:@"state"] isEqualToString:SU]) {
        NSArray *arr = [dataMap valueForKey:@"data"];
        if (arr.count != 0) {
            self.babySignInListArray = [NSMutableArray arrayWithArray:arr];
        }
        
        [HNAGeneral showOnWindow:@"加载中"];
        HNADownLoadManager *dlm = [HNADownLoadManager sharedDownLoadManager];
        dlm.delegate = self;
        [dlm downLoadWeeklyInfomationWith:@"1" andPageNo:@"0"];
    }else if ([[dataMap valueForKey:@"state"] isEqualToString:ER]){
        [HNAGeneral showAlertViewWithTitle:nil andMessage:[dataMap valueForKey:@"stateMsg"]];
    }
}

bool isFirst = YES;

-(void)downLoadWeeklyInfomationDelegate:(NSDictionary *)dic
{
    NSDictionary *dataMap = [dic valueForKey:@"dataMap"];
    if ([[dataMap valueForKey:@"state"] isEqualToString:SU]) {
        NSArray *arr = [dataMap valueForKey:@"data"];
        if (arr.count != 0) {
            if (isFirst) {
                self.weekActivitiesArray = [NSMutableArray arrayWithArray:arr];
            }else{
                self.weekFoodListArray = [NSMutableArray arrayWithArray:arr];
                self.weekFoodListUrlstr = [NSString stringWithFormat:@"%@",[dic valueForKey:@"fileUrl"]];
            }
        }
        HNADownLoadManager *dlm = [HNADownLoadManager sharedDownLoadManager];
        dlm.delegate = self;
        if (isFirst) {
            [HNAGeneral showOnWindow:@"加载中"];
            [dlm downLoadWeeklyInfomationWith:@"2" andPageNo:@"0"];
        }else{
            [HNAGeneral hidenHUD];
            [self.tableView reloadData];
        }
    }else if ([[dataMap valueForKey:@"state"] isEqualToString:ER]){
        [HNAGeneral showAlertViewWithTitle:nil andMessage:[dataMap valueForKey:@"stateMsg"]];
    }
    isFirst = NO;
}
//TODO:其他
-(void)viewWillAppear:(BOOL)animated
{
    if (self.cell) {
        kqPersonalInfoMation *info = [kqPersonalInfoMation sharedPersonalInfoMation];
        [self.cell.headImageView setImageWithURL:[NSURL URLWithString:info.imagPath] placeholderImage:[UIImage imageNamed:@"tbabyDefaultHeadImage.png"]];
    }
    [self.tableView reloadData];
}

-(void) setTitleViewWithImage:(BOOL) withImage
{
    UIView *titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 150, 44)];
    titleView.backgroundColor = [UIColor clearColor];
    if (withImage) {
        UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(0, 7, 30, 30)];
        image.layer.cornerRadius = 15.0f;
        image.layer.masksToBounds = YES;
        kqPersonalInfoMation *info = [kqPersonalInfoMation sharedPersonalInfoMation];
        [image setImageWithURL:[NSURL URLWithString:info.imagPath] placeholderImage:[UIImage imageNamed:@"tbabyDefaultHeadImage.png"]];
        [titleView addSubview:image];
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(45, 12, 105, 20)];
        label.text = info.babyName;
        label.textColor = [UIColor whiteColor];
        label.font = [UIFont systemFontOfSize:18];
        [titleView addSubview:label];
    }else{
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 12, 150, 20)];
        label.text = @"中国移动爱宝贝";
        label.textColor = [UIColor whiteColor];
        label.font = [UIFont systemFontOfSize:18];
        [titleView addSubview:label];
        label.center = titleView.center;
    }
    self.navigationItem.titleView = titleView;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSLog(@"------x=%f,y=%f",scrollView.contentOffset.x,scrollView.contentOffset.y);
    if (scrollView.contentOffset.y > 100) {
        [self setTitleViewWithImage:YES];
    }else{
        [self setTitleViewWithImage:NO];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
//    [self addEventResponder];
    
    kqDistingKindergartenAndSchool *dkas = [kqDistingKindergartenAndSchool sharedDistingKindergartenAndSchool];
    kqPersonalInfoMation *info = [kqPersonalInfoMation sharedPersonalInfoMation];
//    self.cell = (kqHomePageBabyCell *)[[[NSBundle mainBundle] loadNibNamed:@"kqHomePageBabyCell" owner:self options:nil] objectAtIndex:0];
//    self.cell.frame = CGRectMake(0, 0, 320, 70);
//    self.cell.babyNameLabel.text = info.babyName;
//    self.cell.headImageView.layer.cornerRadius = 25.0f;
//    self.cell.headImageView.layer.masksToBounds = YES;
//    [self.cell.headImageView setImageWithURL:[NSURL URLWithString:info.imagPath] placeholderImage:[UIImage imageNamed:@"tbabyDefaultHeadImage.png"]];
//    self.cell.babyClassLabel.text = [NSString stringWithFormat:@"%@%@",info.gradeName,info.className];
//    [self.view addSubview:self.cell];
    self.dataArray = [NSMutableArray arrayWithArray:@[@"班级群聊",dkas.babyInfomation,dkas.schoolProclamation,dkas.babySign,@"每周活动",@"每周食谱",dkas.throughLeader,@"亲子频道"]];
//    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, [HNAGeneral fixIP5:297])];
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, SCREEN_H - 64 - 49)];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.tableView];
    
    kqBabyHomeHeadeView *headView = (kqBabyHomeHeadeView *)[[[NSBundle mainBundle] loadNibNamed:@"kqBabyHomeHeadeView" owner:self options:nil] objectAtIndex:0];
    headView.babyNameLabel.text = info.babyName;
    headView.babyHeadImageView.layer.cornerRadius = 20.0f;
    headView.babyHeadImageView.layer.masksToBounds = YES;
    [headView.babyHeadImageView setImageWithURL:[NSURL URLWithString:info.imagPath] placeholderImage:[UIImage imageNamed:@"tbabyDefaultHeadImage.png"]];
    headView.babyInfoLabel.text = [NSString stringWithFormat:@"%@  %@%@",info.schoolName,info.gradeName,info.className];
    self.tableView.tableHeaderView = headView;
    [self setTitleViewWithImage:NO];
    
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0){
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    
    [self downLoadUnReadMessage];
    
    kqPersonalInfoMation *pinfo = [kqPersonalInfoMation sharedPersonalInfoMation];
    if (!(pinfo.cameraAccount == nil || [pinfo.cameraAccount isEqualToString:@""])) {
       [self initTopBar];
    }else{
        self.isFirstRequest = YES;
        HNADownLoadManager *dl = [HNADownLoadManager sharedDownLoadManager];
        dl.delegate = self;
        kqPersonalInfoMation *info = [kqPersonalInfoMation sharedPersonalInfoMation];
        [dl getCamearIDWithClassID:info.classId];
    }
    // Do any additional setup after loading the view from its nib.
}

-(void) initTopBar
{
    kqDistingKindergartenAndSchool *dkas = [kqDistingKindergartenAndSchool sharedDistingKindergartenAndSchool];
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightButton addTarget:self action:@selector(tapLookBabyButton) forControlEvents:UIControlEventTouchUpInside];
    rightButton.frame =CGRectMake(0.0f, 6.0f, 60.0f, 23.0f);
//    [rightButton setImage:[UIImage imageNamed:@"btn5.png"] forState:UIControlStateNormal];
    [rightButton setTitle:dkas.lookBaby forState:UIControlStateNormal];
    rightButton.titleLabel.font = [UIFont systemFontOfSize:12.0f];
    [rightButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [rightButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    UIBarButtonItem* right = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
    self.navigationItem.rightBarButtonItem = right;
}

//TODO:看宝宝
- (void)addEventResponder
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:EVENT_LOGIN_STATUS_CHANGED object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleLoginStatusChanged:) name:EVENT_LOGIN_STATUS_CHANGED object:nil];
}

- (void)removeEventResponder
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:EVENT_LOGIN_STATUS_CHANGED object:nil];
}

#pragma mark - NSNotification : EVENT_LOGIN_STATUS_CHANGED
- (NSString*) mapReasonToString :(int)reason
{
    NSString * reasonStr = nil;
    switch (reason)
    {
        case LOGIN_REASON_NULL:
            reasonStr = @"未知";
            break;
        case LOGIN_REASON_CONNCET_ERR:
            reasonStr = @"连接错误";
            break;
            /**the Server is busy.*/
        case LOGIN_REASON_SERVER_BUSY:
            reasonStr = @"服务器忙";
            break;
            /**authentication failed.*/
        case LOGIN_REASON_AUTH_FAILED:
            reasonStr = @"认证失败";
            break;
            /**local time error.*/
        case LOGIN_REASON_WRONG_LOCAL_TIME:
            reasonStr = @"时间错误";
            break;
            /**network unavailable.*/
        case LOGIN_REASON_NET_UNAVAILABLE:
            reasonStr = @"无网络";
            break;
            /**user cancel login.*/
        case LOGIN_REASON_USER_CANCEL:
            reasonStr = @"用户取消";
            break;
            /**user force logout by IMS Server.*/
        case LOGIN_REASON_SRV_FORCE_LOGOUT:
            reasonStr = @"强制退出";
            break;
            
        case LOGIN_REASON_ACCESSTOKEN_INVALID:
            reasonStr = @"accesstoken无效";
            break;
            
        case LOGIN_REASON_ACCESSTOKEN_EXPIRED:
            reasonStr = @"accesstoken过期";
            break;
            
        case LOGIN_REASON_APPKEY_INVALID:
            reasonStr = @"app无效";
            break;
            
        case LOGIN_REASON_AUTH_FAILED_RELOGIN:
            reasonStr = @"重新登录认证失败";
            break;
            
        default:
            reasonStr = @"未知";
            break;
            
    }
    
    return reasonStr;
}

-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    if ([elementName isEqualToString:@"CameraList"]) {
        self.xmlArray = [[NSMutableArray alloc] init];
    }else if ([elementName isEqualToString:@"Camera"]){
        self.mdic = [NSMutableDictionary dictionary];
    }
}

-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    NSLog(@"---%@",string);
    self.currentElementValue = [NSString stringWithFormat:@"%@",string];
}

-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    if ([elementName isEqualToString:@"CameraList"]) {
        [HNAGeneral hidenHUD];
        for (NSDictionary *dic in self.xmlArray) {
            NSLog(@"devId = %@,msisdn = %@",[dic valueForKey:@"devId"],[dic valueForKey:@"msisdn"]);
        }
        if (self.xmlArray.count != 0) {
            [self parserXmlToHuaweiArray];
            kqSelectedCameraView *scv = (kqSelectedCameraView *)[[[NSBundle mainBundle] loadNibNamed:@"kqSelectedCameraView" owner:self options:nil] objectAtIndex:0];
            scv.delegate = self;
            scv.dataArray = [NSMutableArray arrayWithArray:self.appArray];
            [scv initTableView];
            [self.view addSubview:scv];
        }else{
            [HNAGeneral showAlertViewWithTitle:@"提示" andMessage:@"设备维护中"];
        }
    }else if ([elementName isEqualToString:@"Camera"]){
        NSMutableDictionary *mmdic = [NSMutableDictionary dictionaryWithDictionary:self.mdic];
        [self.xmlArray addObject:mmdic];
    }else{
        [self.mdic setValue:self.currentElementValue forKey:elementName];
    }
}

-(void) parserXmlToHuaweiArray
{
    if (self.huaweiArray) {
        [self.huaweiArray removeAllObjects];
    }else{
        self.huaweiArray = [NSMutableArray array];
    }
    for (NSDictionary *dic in self.xmlArray) {
         NSMutableDictionary *mdic = [NSMutableDictionary dictionary];
        [mdic setValue:[dic valueForKey:@"devId"] forKey:@"devId"];
        NSString *msisdnString  =[dic valueForKey:@"msisdn"];
        NSArray *msisdnArr = [msisdnString componentsSeparatedByString:@";"];
        if (msisdnArr.count > 1) {
            [mdic setValue:[msisdnArr objectAtIndex:0] forKey:@"number"];
            [mdic setValue:[msisdnArr objectAtIndex:1] forKey:@"confId"];
            [mdic setValue:[msisdnArr objectAtIndex:2] forKey:@"password"];
            [mdic setValue:[msisdnArr objectAtIndex:3] forKey:@"isHost"];
            [mdic setValue:[msisdnArr objectAtIndex:4] forKey:@"CameraName"];
        }else{
            [mdic setValue:[msisdnArr objectAtIndex:0] forKey:@"number"];
        }
        [self.huaweiArray addObject:mdic];
    }
}

- (void)handleLoginStatusChanged:(NSNotification *)aNotification
{
    NSDictionary *info = [aNotification userInfo];
    int old_status = [[info objectForKey:PARAM_LOGIN_OLD_STATUS] intValue];
    int new_status = [[info objectForKey:PARAM_LOGIN_NEW_STATUS] intValue];
    int reason = [[info objectForKey:PARAM_LOGIN_REASON] intValue];
    
    
    switch (new_status)
    {
        case LOGIN_STATUS_CONNECTED:
        {
            NSString *dm = [SysApi getDMConfig:@"./HuaweiExt/OpenApi/DevCfgParam"];
            [LogApi i:@"UI_DEMO_LOG" formatString:[NSString stringWithFormat:@"getDMConfig:@\"./HuaweiExt/OpenApi/DevCfgParam\""]];
            [LogApi e:@"UI_DEMO_LOG" formatString:[NSString stringWithFormat:@"getDMConfig:@\"./HuaweiExt/OpenApi/DevCfgParam\""]];
            [LogApi d:@"UI_DEMO_LOG" formatString:[NSString stringWithFormat:@"getDMConfig:@\"./HuaweiExt/OpenApi/DevCfgParam\""]];
            NSLog(@"------------%@",dm);
//            [HNAGeneral showAlertViewWithTitle:nil andMessage:dm];
            if (dm == nil || [dm isEqualToString:@""]) {
                [HNAGeneral hidenHUD];
                [HNAGeneral showAlertViewWithTitle:@"提示" andMessage:@"设备维护中"];
            }else{
                NSXMLParser *parser = [[NSXMLParser alloc] initWithData:[dm dataUsingEncoding:NSUTF8StringEncoding]];
                parser.delegate = self;
                [parser parse];
            }
        }
            break;
        case LOGIN_STATUS_DISCONNECTED:
        {
            [HNAGeneral hidenHUD];
            [HNAGeneral showAlertViewWithTitle:@"错误" andMessage:[NSString stringWithFormat:@"链接失败原因：%@",[self mapReasonToString:reason]]];
            [LogApi i:@"UI_DEMO_LOG" formatString:[NSString stringWithFormat:@"connect status:disconnected reason %@", [self mapReasonToString:reason]]];
            
            [[NSNotificationCenter defaultCenter] postNotificationName:@"Event_Logout"  object:nil userInfo:nil];
            NSDictionary* dic =[NSDictionary dictionaryWithObjectsAndKeys:@"logout",@"Connect_Info", nil];
            [[NSNotificationCenter defaultCenter] postNotificationName:@"Connect_Info" object:nil userInfo:dic];
            
        }
            break;
        case LOGIN_STATUS_CONNECTING:
        {
            NSDictionary* dic =[NSDictionary dictionaryWithObjectsAndKeys:@"connecting",@"Connect_Info", nil];
            [[NSNotificationCenter defaultCenter] postNotificationName:@"Connect_Info" object:nil userInfo:dic];
            
        }
            break;
        case LOGIN_STATUS_DISCONNECTING:
        {
            NSDictionary* dic =[NSDictionary dictionaryWithObjectsAndKeys:@"disconnecting",@"Connect_Info", nil];
            [[NSNotificationCenter defaultCenter] postNotificationName:@"Connect_Info" object:nil userInfo:dic];
            
        }
            break;
    }
    
}

-(void)requestToGetCameraListDelegate:(NSDictionary *)dic
{
    NSDictionary *dataMap = [dic valueForKey:@"dataMap"];
    NSString *state = [dataMap valueForKey:@"state"];
    if ([state isEqualToString:SU]) {
        NSArray *arr = [dataMap valueForKey:@"data"];
        if (arr.count != 0) {
//            kqSelectedCameraView *scv = (kqSelectedCameraView *)[[[NSBundle mainBundle] loadNibNamed:@"kqSelectedCameraView" owner:self options:nil] objectAtIndex:0];
//            scv.delegate = self;
//            scv.dataArray = [NSMutableArray arrayWithArray:arr];
//            [scv initTableView];
//            [self.view addSubview:scv];
            self.appArray = [NSMutableArray arrayWithArray:arr];
//            NSString *IpStr = @"58.251.159.213";//自己的IP
            NSString *IpStr = @"111.47.111.201";//华为的IP
            NSString *portStr = @"443";
            [SettingUtil setConfigValue:SETTINGUTIL_CFG_MAJOR_DM_IP minortype:SETTINGUTIL_CFG_MINOR_BUTT configvalue:IpStr];
            [SettingUtil setConfigValue:SETTINGUTIL_CFG_MAJOR_DM_PORT minortype:SETTINGUTIL_CFG_MINOR_BUTT configvalue:portStr];
            UserInfo * uinfo = [[UserInfo alloc]init];
            uinfo.countryCode = @"+86";
            //    uinfo.username = @"15112340041";
            //    uinfo.password = @"May0322";
            kqPersonalInfoMation *pinfo = [kqPersonalInfoMation sharedPersonalInfoMation];
            uinfo.username = pinfo.cameraAccount;
            uinfo.password = pinfo.cameraPassword;
            LoginCfg * cfg = [[LoginCfg alloc]init];
            
            cfg.isAutoLogin = YES;     //can relogin
            cfg.isVerified = NO;       //
            [LoginApi login:uinfo config:cfg];
        }else{
            [HNAGeneral hidenHUD];
            [HNAGeneral showAlertViewWithTitle:@"提示" andMessage:@"设备维护中"];
        }
    }else if([state isEqualToString:ER]){
        [HNAGeneral hidenHUD];
        [HNAGeneral showAlertViewWithTitle:@"提示" andMessage:[dataMap valueForKey:@"stateMsg"]];
    }
}

//TODO:看宝宝结束
-(void) tapLookBabyButton
{
    [HNAGeneral showOnWindow:@"加载中"];
    kqPersonalInfoMation *pinfo = [kqPersonalInfoMation sharedPersonalInfoMation];
    if (pinfo.cameraAccount == nil || [pinfo.cameraAccount isEqualToString:@""]) {
        self.isFirstRequest = NO;
        HNADownLoadManager *dl = [HNADownLoadManager sharedDownLoadManager];
        dl.delegate = self;
        kqPersonalInfoMation *info = [kqPersonalInfoMation sharedPersonalInfoMation];
        [dl getCamearIDWithClassID:info.classId];

    }else{
        [self addEventResponder];
        HNADownLoadManager *dl = [HNADownLoadManager sharedDownLoadManager];
        dl.delegate = self;
        kqPersonalInfoMation *info = [kqPersonalInfoMation sharedPersonalInfoMation];
        [dl requestToGetCameraListWithClassId:info.classId];
    }
}

-(void)getCamearIDDelegate:(NSDictionary *)dic
{
    [HNAGeneral hidenHUD];
    NSDictionary *dataMap = [dic valueForKey:@"dataMap"];
    NSString *state = [dataMap valueForKey:@"state"];
    if ([state isEqualToString:SU]) {
        NSArray *arr = [dataMap valueForKey:@"data"];
        if (arr.count != 0) {
            if (self.isFirstRequest) {
                [self initTopBar];
                return;
            }
            kqSelectedCameraView *scv = (kqSelectedCameraView *)[[[NSBundle mainBundle] loadNibNamed:@"kqSelectedCameraView" owner:self options:nil] objectAtIndex:0];
            scv.delegate = self;
            scv.dataArray = [NSMutableArray arrayWithArray:arr];
            [scv initTableView];
            [self.view addSubview:scv];
        }else{
            if (self.isFirstRequest) {
                return;
            }
            [HNAGeneral showAlertViewWithTitle:@"提示" andMessage:@"设备维护中"];
        }
    }else if([state isEqualToString:ER]){
        if (self.isFirstRequest) {
            return;
        }
        [HNAGeneral showAlertViewWithTitle:@"提示" andMessage:[dataMap valueForKey:@"stateMsg"]];
    }
}

-(void)didTabCameraWithInfomationDictionary:(NSDictionary *)infomationDictionary andView:(UIView *)view
{
//    NSString *IpStr = @"58.251.159.213";
//    NSString *portStr = @"443";
//    [SettingUtil setConfigValue:SETTINGUTIL_CFG_MAJOR_DM_IP minortype:SETTINGUTIL_CFG_MINOR_BUTT configvalue:IpStr];
//    [SettingUtil setConfigValue:SETTINGUTIL_CFG_MAJOR_DM_PORT minortype:SETTINGUTIL_CFG_MINOR_BUTT configvalue:portStr];
//    self.cameraDictionary = [NSMutableDictionary dictionaryWithDictionary:infomationDictionary];
//    UserInfo * uinfo = [[UserInfo alloc]init];
//    uinfo.countryCode = @"+86";
////    uinfo.username = @"15112340041";
////    uinfo.password = @"May0322";
//    uinfo.username = [infomationDictionary valueForKey:@"cameraSn"];
//    uinfo.password = [infomationDictionary valueForKey:@"cameraPassword"];
//    LoginCfg * cfg = [[LoginCfg alloc]init];
//    
//    cfg.isAutoLogin = YES;     //can relogin
//    cfg.isVerified = NO;       //
//    [LoginApi login:uinfo config:cfg];
    kqPersonalInfoMation *pinfo = [kqPersonalInfoMation sharedPersonalInfoMation];
    if (pinfo.cameraAccount == nil || [pinfo.cameraAccount isEqualToString:@""]) {
        self.hidesBottomBarWhenPushed = YES;
        kqPlayRtspViewController *prVC = [[kqPlayRtspViewController alloc] initWithNibName:@"kqPlayRtspViewController" bundle:nil];
        prVC.cameraDictionary = infomationDictionary;
        [self.navigationController pushViewController:prVC animated:YES];
    }else{
        NSString *confString,*confIdString,*passwordString;
        for (NSDictionary *dic in self.huaweiArray) {
            NSLog(@"----------%@",[infomationDictionary valueForKey:@"cameraSrcid"]);
            if ([[infomationDictionary valueForKey:@"cameraSrcid"] isEqualToString:[dic valueForKey:@"devId"]] && [dic valueForKey:@"confId"] != nil) {
                confString = [dic valueForKey:@"number"];
                confIdString = [dic valueForKey:@"confId"];
                passwordString = [dic valueForKey:@"password"];
                break;
            }
        }
        if (confIdString) {
            UIScreen *ms = [UIScreen mainScreen];
            EAGLExView* localView = [[EAGLExView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
            EAGLExView* remoteView = [[EAGLExView alloc] initWithFrame:CGRectMake(0, 0, ms.bounds.size.width, ms.bounds.size.height)];
            //    CallSession* session = [CallApi initiateVideoCall:[infomationDictionary valueForKey:@"msisdn"] localView:localView remoteView:remoteView];
            //        CallSession *session1 = [MeetingApi quickJoinVideoConf:[self.cameraDictionary valueForKey:@"cameraSrcid"] confId:[self.cameraDictionary valueForKey:@"cameraSn"] confPwd:[self.cameraDictionary valueForKey:@"cameraPassword"] localView:localView remoteView:remoteView];
            //            CallSession *session1 = [MeetingApi quickJoinVideoConf:@"+8600111224" confId:@"15112340041" confPwd:@"May0322" localView:localView remoteView:remoteView];
//            [MeetingApi setConfigValue:CALL_CFG_VIDEO_DISPLAY_TYPE minortype:CALL_CFG_MINOR_BUTT configvalue:@"1"];
            NSLog(@"------------%@,%@,%@?=%@",confString,confIdString,passwordString,[infomationDictionary valueForKey:@"cameraPassword"]);
            [CallApi setConfigValue:CALL_CFG_VIDEO_DISPLAY_TYPE minortype:CALL_CFG_MINOR_BUTT configvalue:@"0"];
            CallSession *session1 = [MeetingApi quickJoinVideoConf:confString confId:confIdString confPwd:[infomationDictionary valueForKey:@"cameraPassword"] localView:localView remoteView:remoteView];
            if (_videoCallVC == nil) {
                _videoCallVC = [[VideoCallViewController alloc]init];
            }
            _videoCallVC.title = @"看宝宝";
            [self presentViewController:_videoCallVC animated:YES completion:^{}];
            [_videoCallVC setCallSession:session1];
            [_videoCallVC setUnderView:VIDEO_MAKECALL_UNDERVIEW];
            [_videoCallVC showVideo:session1];
            
        }else{
            [HNAGeneral showAlertViewWithTitle:@"提示" andMessage:@"设备维护中"];
        }
    }
    [self removeEventResponder];
    [view removeFromSuperview];
}

-(void)didTabCancelView:(UIView *)view
{
    [view removeFromSuperview];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    [self removeEventResponder];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.hidesBottomBarWhenPushed = NO;
}

#pragma tableViewDelegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return 1;
            break;
            
        default:
            return 8;
            break;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return 20;
            break;
            
        default:
            return 0;
            break;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70.0f;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    kqHomePageMessageCell *cell = (kqHomePageMessageCell *)[[[NSBundle mainBundle] loadNibNamed:@"kqHomePageMessageCell" owner:self options:nil] objectAtIndex:0];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    
    kqPersonalInfoMation *info = [kqPersonalInfoMation sharedPersonalInfoMation];
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    
    if (indexPath.row == 0 && indexPath.section == 0) {
        if (self.shiArr.count != 0) {
            cell.cellDetailLabel.text = [self.shiArr.lastObject valueForKey:@"msgContent"];
            cell.unreaderNumber.hidden = NO;
            cell.unreaderNumber.text = [NSString stringWithFormat:@"%lu",(unsigned long)self.shiArr.count];
            cell.cellDetailLabel.hidden = NO;
            cell.cellTitleHeightConstraint.constant = 30.0f;
        }else{
            NSDictionary *dd = [ud valueForKey:@"TeacherChatLastDic"];
            if (dd) {
                NSString *content = [dd valueForKey:@"soundPath"];
                if ([content isEqualToString:@""] || [content isKindOfClass:[NSNull class]]) {
                    cell.cellDetailLabel.text = [dd valueForKey:@"content"];
                }else{
                    cell.cellDetailLabel.text = [NSString stringWithFormat:@"语音消息"];
                }
                cell.cellDetailLabel.hidden = NO;
                cell.cellTitleHeightConstraint.constant = 30.0f;
            }
        }
        cell.cellTitleLabel.text = @"班主任老师";
        cell.cellImageView.layer.cornerRadius = 20.5;
        cell.cellImageView.layer.masksToBounds = YES;
        [cell.cellImageView setImageWithURL:[NSURL URLWithString:info.teacherImgPath] placeholderImage:[UIImage imageNamed:@"tbabyDefaultHeadImage.png"]];
        return cell;
    }
    cell.cellTitleLabel.text = [self.dataArray objectAtIndex:indexPath.row];
    //    NSString *imageName = [NSString stringWithFormat:@"icon%ld",(long)indexPath.row - 1];
    //    cell.cellImageView.image = [UIImage imageNamed:imageName];
    cell.unreaderNumber.layer.cornerRadius = 10.0f;
    cell.unreaderNumber.layer.masksToBounds = YES;
    cell.cellDetailLabel.text = @"无内容";
    cell.cellDetailLabel.hidden = YES;
    cell.cellTitleHeightConstraint.constant = 50.0f;
    if (indexPath.row == 0) {
        if (self.qunArr.count != 0) {
            cell.cellDetailLabel.text = [self.qunArr.lastObject valueForKey:@"msgContent"];
            cell.unreaderNumber.hidden = NO;
            cell.unreaderNumber.text = [NSString stringWithFormat:@"%lu",(unsigned long)self.qunArr.count];
            cell.cellDetailLabel.hidden = NO;
            cell.cellTitleHeightConstraint.constant = 30.0f;
        }else{
            NSDictionary *dd = [ud valueForKey:@"BabyQunLiaoChatLastDic"];
            if (dd) {
                NSString *content = [dd valueForKey:@"soundPath"];
                if ([content isEqualToString:@""] || [content isKindOfClass:[NSNull class]]) {
                    cell.cellDetailLabel.text = [dd valueForKey:@"content"];
                }else{
                    cell.cellDetailLabel.text = [NSString stringWithFormat:@"语音消息"];
                }
                cell.cellDetailLabel.hidden = NO;
                cell.cellTitleHeightConstraint.constant = 30.0f;
            }
        }
//        NSString *imageName = [NSString stringWithFormat:@"icon5"];
        
        cell.cellImageView.image = [UIImage imageNamed:@"banjiqunliao"];
    }
   
    if (indexPath.row == 1) {
        if (self.babyInformationArray.count != 0) {
            cell.cellDetailLabel.text = [self.babyInformationArray.lastObject valueForKey:@"bookTitle"];
            cell.cellDetailLabel.hidden = NO;
            cell.cellTitleHeightConstraint.constant = 30.0f;
        }
        cell.cellImageView.image = [UIImage imageNamed:@"baobaoxinxishouce"];
    }
    if (indexPath.row == 2) {
        if (self.kindergartenNoticeArray.count != 0) {
            cell.cellDetailLabel.text = [self.kindergartenNoticeArray.lastObject valueForKey:@"noticeTitle"];
            cell.cellDetailLabel.hidden = NO;
            cell.cellTitleHeightConstraint.constant = 30.0f;
        }
        cell.cellImageView.image = [UIImage imageNamed:@"yougonggao"];
    }
    kqDistingKindergartenAndSchool *dkas = [kqDistingKindergartenAndSchool sharedDistingKindergartenAndSchool];
    
    if (indexPath.row == 3) {
        if (self.babySignInListArray.count != 0) {
            NSDictionary *tdic = self.babySignInListArray.firstObject;
            int io = [[tdic valueForKey:@"inOut"] intValue];
            NSString *st;
            switch (io) {
                case 0:
                    st = [NSString stringWithFormat:@"%@时间：",dkas.signIn];
                    break;
                case 1:
                    st = [NSString stringWithFormat:@"%@时间：",dkas.signOut];
                    break;
                case 2:
                    st = @"病假时间：";
                    break;
                case 3:
                    st = @"事假时间：";
                    break;
                case 4:
                    st = @"未知时间：";
                    break;
                default:
                    break;
            }
            cell.cellDetailLabel.text = [NSString stringWithFormat:@"%@%@",st,[[tdic valueForKey:@"inOutDate"] stringByReplacingOccurrencesOfString:@"T" withString:@" "]];
            cell.cellDetailLabel.hidden = NO;
            cell.cellTitleHeightConstraint.constant = 30.0f;
        }
        cell.cellImageView.image = [UIImage imageNamed:@"baobaoqiandao"];
    }
    if (indexPath.row == 4) {
        if (self.weekActivitiesArray.count != 0) {
            cell.cellDetailLabel.text = [self.weekActivitiesArray.lastObject valueForKey:@"activityTitle"];
            cell.cellDetailLabel.hidden = NO;
            cell.cellTitleHeightConstraint.constant = 30.0f;
        }
        cell.cellImageView.image = [UIImage imageNamed:@"meizhouhuodong"];
    }
    if (indexPath.row == 5) {
        if (self.weekFoodListArray.count != 0) {
            cell.cellDetailLabel.text = [self.weekFoodListArray.lastObject valueForKey:@"activityTitle"];
            cell.cellDetailLabel.hidden = NO;
            cell.cellTitleHeightConstraint.constant = 30.0f;
        }
        cell.cellImageView.image = [UIImage imageNamed:@"meizhoushipu"];
    }
    if (indexPath.row == 6) {
        if (self.yuanArr.count != 0) {
            cell.cellDetailLabel.text = [self.yuanArr.lastObject valueForKey:@"msgContent"];
            cell.unreaderNumber.hidden = NO;
            cell.unreaderNumber.text = [NSString stringWithFormat:@"%lu",(unsigned long)self.yuanArr.count];
            cell.cellDetailLabel.hidden = NO;
            cell.cellTitleHeightConstraint.constant = 30.0f;
        }else{
            NSDictionary *dd = [ud valueForKey:@"YuanZhangChatLastDic"];
            if (dd) {
                NSString *content = [dd valueForKey:@"soundPath"];
                if ([content isEqualToString:@""] || [content isKindOfClass:[NSNull class]]) {
                    cell.cellDetailLabel.text = [dd valueForKey:@"content"];
                }else{
                    cell.cellDetailLabel.text = [NSString stringWithFormat:@"语音消息"];
                }
                cell.cellDetailLabel.hidden = NO;
                cell.cellTitleHeightConstraint.constant = 30.0f;
            }
        }
        cell.cellImageView.layer.cornerRadius = 20.5;
        cell.cellImageView.layer.masksToBounds = YES;
        [cell.cellImageView setImageWithURL:[NSURL URLWithString:info.principalImgPath] placeholderImage:[UIImage imageNamed:@"zhitongyuanzhang"]];
    }
    if (indexPath.row == 7) {
        cell.cellImageView.image = [UIImage imageNamed:@"qinzipindao"];
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    self.hidesBottomBarWhenPushed = YES;
    kqHomePageMessageCell *cell = (kqHomePageMessageCell *)[self.tableView cellForRowAtIndexPath:indexPath];
    cell.unreaderNumber.hidden = YES;
    if (indexPath.row == 0 && indexPath.section == 0) {
        [self.shiArr removeAllObjects];
//        self.index = indexPath.row;
        kqChatWindowViewController *cwVC = [[kqChatWindowViewController alloc] initWithNibName:@"kqChatWindowViewController" bundle:nil];
        cwVC.roleType = TeacherType;
        cwVC.title = @"班主任老师";
        [self.navigationController pushViewController:cwVC animated:YES];
        return;
    }
    if (indexPath.row == 0) {
        [self.qunArr removeAllObjects];
        self.index = indexPath.row;
        kqChatWindowViewController *cwVC = [[kqChatWindowViewController alloc] initWithNibName:@"kqChatWindowViewController" bundle:nil];
        cwVC.roleType = ClassQunLiaoType;
        cwVC.title = [self.dataArray objectAtIndex:self.index];
        [self.navigationController pushViewController:cwVC animated:YES];
    }
    
    if (indexPath.row == 1) {
        kqBabyInformationManualViewController *bimVC = [[kqBabyInformationManualViewController alloc] initWithNibName:@"kqBabyInformationManualViewController" bundle:nil];
        bimVC.title = [self.dataArray objectAtIndex:indexPath.row];
//        bimVC.dataArray = self.babyInformationArray;
        [self.navigationController pushViewController:bimVC animated:YES];
    }
    if (indexPath.row == 2) {
        kqBabyKindergartenNoticeViewController *knVC = [[kqBabyKindergartenNoticeViewController alloc] initWithNibName:@"kqBabyKindergartenNoticeViewController" bundle:nil];
        knVC.title = [self.dataArray objectAtIndex:indexPath.row];
//        knVC.dataArray = self.kindergartenNoticeArray;
        [self.navigationController pushViewController:knVC animated:YES];
    }
    if (indexPath.row == 3) {
        kqBabySignInListViewController *bsiVC = [[kqBabySignInListViewController alloc] initWithNibName:@"kqBabySignInListViewController" bundle:nil];
        bsiVC.title = [self.dataArray objectAtIndex:indexPath.row];
//        bsiVC.dataArray = [NSMutableArray arrayWithArray:self.babySignInListArray];
        [self.navigationController pushViewController:bsiVC animated:YES];
    }
    if (indexPath.row == 4) {
        kqWeekActivitiesViewController *bsiVC = [[kqWeekActivitiesViewController alloc] initWithNibName:@"kqWeekActivitiesViewController" bundle:nil];
        bsiVC.title = [self.dataArray objectAtIndex:indexPath.row];
        bsiVC.isTeacher = NO;
//        bsiVC.dataArray = self.weekActivitiesArray;
        [self.navigationController pushViewController:bsiVC animated:YES];
    }
    if (indexPath.row == 5) {
        kqWeekFoodListViewController *bsiVC = [[kqWeekFoodListViewController alloc] initWithNibName:@"kqWeekFoodListViewController" bundle:nil];
        bsiVC.title = [self.dataArray objectAtIndex:indexPath.row];
        bsiVC.isTeacher = NO;
//        bsiVC.dataArray = self.weekFoodListArray;
//        bsiVC.fileUrlStr = self.weekFoodListUrlstr;
        [self.navigationController pushViewController:bsiVC animated:YES];
    }
    if (indexPath.row == 6) {
        [self.yuanArr removeAllObjects];
        self.index = indexPath.row;
        kqChatWindowViewController *cwVC = [[kqChatWindowViewController alloc] initWithNibName:@"kqChatWindowViewController" bundle:nil];
        cwVC.title = [self.dataArray objectAtIndex:indexPath.row];
        cwVC.roleType = YuanzhangTyoe;
        [self.navigationController pushViewController:cwVC animated:YES];
    }
    if (indexPath.row == 7) {
        kqFoundViewController *fVC = [[kqFoundViewController alloc] initWithNibName:@"kqFoundViewController" bundle:nil];
        fVC.isTeacher = YES;
        fVC.isPush = YES;
        fVC.title = @"发现";
        [self.navigationController pushViewController:fVC animated:YES];
    }
}

@end