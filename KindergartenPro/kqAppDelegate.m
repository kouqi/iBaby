//
//  kqAppDelegate.m
//  KindergartenPro
//
//  Created by 海峰 on 14-7-14.
//  Copyright (c) 2014年 海峰. All rights reserved.
//

#import "kqAppDelegate.h"
#import "kqWonderfulMomentViewController.h"
#import "kqFoundViewController.h"
#import "kqPersonalSettingViewController.h"
#import "kqTeacherHomePageViewController.h"
#import "kqMessageViewController.h"
#import "kqDynamicViewController.h"
#import "kqTeacherPersonalViewController.h"
#import "kqTBabyContactListViewController.h"
#import "SysApi.h"
#import "LoginApi.h"
#import "HmeVideo.h"
#import "HmeAudio.h"
#import "CallApi.h"
#import "DefaultTlsHelper.h"
#import "NatStgHelper.h"
#import "LogApi.h"
#import "UpgradeApi.h"
#import "CallLogApi.h"
@implementation kqAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
//    int a=0xfec;
//    int j=0;
//    int results = 0;
//    while(a)
//    {
//        results += a%10 * pow(10, j);
//        a/=10;
//        j++;
//    }
//    printf("\n%d",results);
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    [SysApi init:DEFAULT_DM_VERSION];
    [LoginApi init];
    [SysApi loadTls:[[DefaultTlsHelper alloc]init]];
    [SysApi loadStg:[[NatStgHelper alloc]init]];
    [LogApi init];
    [UpgradeApi init];
    [HmeAudio setup];
    [HmeVideo setup];
    [CallApi init];
    [CallLogApi init];
    
    [MobClick startWithAppkey:@"54ae2405fd98c57c57000900" reportPolicy:BATCH channelId:nil];
    
    // Required
#if __IPHONE_OS_VERSION_MAX_ALLOWED > __IPHONE_7_1
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 8.0) {
        //可以添加自定义categories
        [APService registerForRemoteNotificationTypes:(UIUserNotificationTypeBadge |
                                                       UIUserNotificationTypeSound |
                                                       UIUserNotificationTypeAlert)
                                           categories:nil];
    } else {
        //categories 必须为nil
        [APService registerForRemoteNotificationTypes:(UIRemoteNotificationTypeBadge |
                                                       UIRemoteNotificationTypeSound |
                                                       UIRemoteNotificationTypeAlert)
                                           categories:nil];
    }
#else
    //categories 必须为nil
    [APService registerForRemoteNotificationTypes:(UIRemoteNotificationTypeBadge |
                                                   UIRemoteNotificationTypeSound |
                                                   UIRemoteNotificationTypeAlert)
                                       categories:nil];
#endif
    // Required
    [APService setupWithOption:launchOptions];
//    NSDictionary * userInfoDic = [launchOptions objectForKey:UIApplicationLaunchOptionsRemoteNotificationKey];
//    if(userInfoDic)
//    {
//        self.userinfo = userInfoDic;
//    }
    [application setApplicationIconBadgeNumber:0];
    if ([[[UIDevice currentDevice] systemVersion] floatValue] > 7.0) {
        [[UINavigationBar appearance] setBackgroundImage:[UIImage imageWithColor:RGB(61, 209, 188, 1) size:CGSizeMake(SCREEN_W, 64)] forBarMetrics:UIBarMetricsDefault];
    }else{
        [[UINavigationBar appearance] setBackgroundImage:[UIImage imageWithColor:RGB(61, 209, 188, 1) size:CGSizeMake(SCREEN_W, 74)] forBarMetrics:UIBarMetricsDefault];
    }
    [[UINavigationBar appearance] setShadowImage:[UIImage imageWithColor:[UIColor clearColor] size:CGSizeMake(320, 3)]];
    [[UINavigationBar appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor colorWithRed:1 green:1 blue:1 alpha:1],NSForegroundColorAttributeName,nil]];
//    self.currentClient = 1;
//    [self initTeacherRooViewController];
    kqLoginViewController *loginVC = [[kqLoginViewController alloc] initWithNibName:@"kqLoginViewController" bundle:nil];
    loginVC.delegate = self;
    self.window.rootViewController = loginVC;
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    NSDictionary *userInfo = [ud objectForKey:@"login"];
    if (userInfo != nil) {
        NSString *userName = [userInfo valueForKey:@"userName"];
        NSString *password = [userInfo valueForKey:@"password"];
        
        if (password != nil) {
            loginVC.passwordTextField.text = password;
            [HNAGeneral showOnWindow:@"登录中"];
            HNADownLoadManager *dlm = [HNADownLoadManager sharedDownLoadManager];
            dlm.delegate = self;
            [dlm loginWithUserName:userName andPassword:password andAutoLogin:YES];
        }
        loginVC.userNameTextField.text = userName;
        NSNumber *isRemeber = [userInfo valueForKey:@"remeber"];
        NSNumber *isShow = [userInfo valueForKey:@"show"];
        [loginVC setRemeber:[isRemeber boolValue] andShow:[isShow boolValue]];
    }
//    [HNAGeneral initChangLiangWithIsSchool:NO];
    return YES;
}


-(void)loginSuccessedWithDic:(NSDictionary *)dic
{
    [HNAGeneral hidenHUD];
    NSDictionary *dataMap = [dic valueForKey:@"dataMap"];
    NSString *state = [dataMap valueForKey:@"state"];
    if ([state isEqualToString:SU]) {
        if (![[[[[[dataMap valueForKey:@"user"] valueForKey:@"babyClass"] valueForKey:@"babyGrade"] valueForKey:@"babyNurserySchool"] valueForKey:@"schoolDesc"] isKindOfClass:[NSNull class]]) {
            int schoolDesc = [[[[[[dataMap valueForKey:@"user"] valueForKey:@"babyClass"] valueForKey:@"babyGrade"] valueForKey:@"babyNurserySchool"] valueForKey:@"schoolDesc"] intValue];
            if (schoolDesc == 1) {
                [HNAGeneral initChangLiangWithIsSchool:YES];
            }else{
                [HNAGeneral initChangLiangWithIsSchool:NO];
            }
        }else{
            [HNAGeneral initChangLiangWithIsSchool:NO];
        }
        kqPersonalInfoMation *info = [kqPersonalInfoMation sharedPersonalInfoMation];
        info.loginName = [[dataMap valueForKey:@"user"] valueForKey:@"loginName"];
//        [APService setAlias:info.loginName callbackSelector:@selector(tagsAliasCallback:tags:alias:) object:info.loginName];
        [APService setAlias:[[HNAGeneral getKeychainIdentifier] stringByReplacingOccurrencesOfString:@"-" withString:@""] callbackSelector:@selector(tagsAliasCallback:tags:alias:) object:[[HNAGeneral getKeychainIdentifier] stringByReplacingOccurrencesOfString:@"-" withString:@""]];
//        [HNAGeneral showAlertViewWithTitle:nil andMessage:[[HNAGeneral getKeychainIdentifier] stringByReplacingOccurrencesOfString:@"-" withString:@""]];
//        [HNAGeneral showAlertViewWithTitle:[NSString stringWithFormat:@"%lu",(unsigned long)yyy.length] andMessage:[HNAGeneral getKeychainIdentifier]];
        info.cameraAccount = [dataMap valueForKey:@"cameraUserName"];
        info.cameraPassword = [dataMap valueForKey:@"cameraPassword"];
        info.loginPassword = [[dataMap valueForKey:@"user"] valueForKey:@"password"];
        info.babyName = [[dataMap valueForKey:@"user"] valueForKey:@"babyName"];
        info.realName = [[dataMap valueForKey:@"user"] valueForKey:@"name"];
        info.babyEmail = [[dataMap valueForKey:@"user"] valueForKey:@"email"];
        info.babyId = [NSString stringWithFormat:@"%@",[[dataMap valueForKey:@"user"] valueForKey:@"id"]];
        info.schoolName = [[[[[dataMap valueForKey:@"user"] valueForKey:@"babyClass"] valueForKey:@"babyGrade"] valueForKey:@"babyNurserySchool"] valueForKey:@"schoolName"];
        info.classId = [[[dataMap valueForKey:@"user"] valueForKey:@"babyClass"] valueForKey:@"id"];
        info.gradeName = [[[[dataMap valueForKey:@"user"] valueForKey:@"babyClass"] valueForKey:@"babyGrade"] valueForKey:@"gradeName"];
        info.className = [[[dataMap valueForKey:@"user"] valueForKey:@"babyClass"] valueForKey:@"className"];
        info.imagPath = [NSString stringWithFormat:@"%@%@",[dic valueForKey:@"fileUrl"],[[dataMap valueForKey:@"user"] valueForKey:@"imgPath"]];
        info.teacherID = [[[[dataMap valueForKey:@"user"] valueForKey:@"babyClass"] valueForKey:@"teacherUser"] valueForKey:@"id"];
        info.teacherImgPath = [NSString stringWithFormat:@"%@%@",[dic valueForKey:@"fileUrl"],[[[[dataMap valueForKey:@"user"] valueForKey:@"babyClass"] valueForKey:@"teacherUser"] valueForKey:@"imgPath"]];
        info.teacherLoginName = [[[[dataMap valueForKey:@"user"] valueForKey:@"babyClass"] valueForKey:@"teacherUser"] valueForKey:@"loginName"];
        info.teacherDeviceIDString = [[[[dataMap valueForKey:@"user"] valueForKey:@"babyClass"] valueForKey:@"teacherUser"] valueForKey:@"deviceid"];
        info.principalID = [[[[[[dataMap valueForKey:@"user"] valueForKey:@"babyClass"] valueForKey:@"babyGrade"] valueForKey:@"babyNurserySchool"] valueForKey:@"schoolUser"] valueForKey:@"id"];
        info.principalLoginName = [[[[[[dataMap valueForKey:@"user"] valueForKey:@"babyClass"] valueForKey:@"babyGrade"] valueForKey:@"babyNurserySchool"] valueForKey:@"schoolUser"] valueForKey:@"loginName"];
        info.principalImgPath = [NSString stringWithFormat:@"%@%@",[dic valueForKey:@"fileUrl"],[[[[[[dataMap valueForKey:@"user"] valueForKey:@"babyClass"] valueForKey:@"babyGrade"] valueForKey:@"babyNurserySchool"] valueForKey:@"schoolUser"] valueForKey:@"imgPath"]];
        NSString *statr = [[dataMap valueForKey:@"user"] valueForKey:@"startDate"];
        if (![statr isKindOfClass:[NSNull class]]) {
            NSArray *arr = [statr componentsSeparatedByString:@"T"];
            info.startDate = [NSString stringWithFormat:@"%@ %@",[arr objectAtIndex:0],[arr objectAtIndex:1]];
        }
        NSString *statrs = [[dataMap valueForKey:@"user"] valueForKey:@"endDate"];
        if (![statrs isKindOfClass:[NSNull class]]) {
            NSArray *arrs = [statrs componentsSeparatedByString:@"T"];
            info.endDae = [NSString stringWithFormat:@"%@ %@",[arrs objectAtIndex:0],[arrs objectAtIndex:1]];
        }
        NSArray *roleIds = [[dataMap valueForKey:@"user"] valueForKey:@"roleIds"];
        info.roleIds = [NSArray arrayWithArray:roleIds];
        if (roleIds.count != 0) {
            int rolesId = [[roleIds objectAtIndex:0] intValue];
            switch (rolesId) {
                case 4:
                {
                    self.currentClient = 0;
                    [self initBabyRooViewController];
                }
                    break;
                case 3:
                {
                    [HNAGeneral hidenHUD];
                    self.currentClient = 1;
                    info.className = [[dataMap valueForKey:@"user"] valueForKey:@"className"];
                    [self initTeacherRooViewController];
                }
                    break;
                case 2:
                {
                    self.currentClient = 2;
                    [self initLeaderRooViewController];
                }
                    break;
                    
                default:
                    break;
            }
        }else{
            [HNAGeneral showAlertViewWithTitle:@"警告" andMessage:@"登录错误"];
            kqLoginViewController *loginVC = [[kqLoginViewController alloc] initWithNibName:@"kqLoginViewController" bundle:nil];
            [loginVC setRemeber:NO andShow:NO];
            [self.homeVC.navigationController presentViewController:loginVC animated:NO completion:^{}];
            [APService setAlias:@"" callbackSelector:nil object:nil];
        }
    }else if([state isEqualToString:ER]){
        [HNAGeneral showAlertViewWithTitle:@"提示" andMessage:[dataMap valueForKey:@"stateMsg"]];
        kqLoginViewController *loginVC = [[kqLoginViewController alloc] initWithNibName:@"kqLoginViewController" bundle:nil];
        [loginVC setRemeber:NO andShow:NO];
        [self.homeVC.navigationController presentViewController:loginVC animated:NO completion:^{}];
        [APService setAlias:@"" callbackSelector:nil object:nil];
    }
}

-(void)tagsAliasCallback:(int)iResCode tags:(NSSet *)tags alias:(NSString *)alias
{
    [HNAGeneral showAlertViewWithTitle:nil andMessage:alias];
    NSLog(@"rescode: %d, \ntags: %@, \nalias: %@\n", iResCode, tags , alias);
}

-(void)loginDelegate:(NSDictionary *)dic
{
    [HNAGeneral hidenHUD];
    NSDictionary *dataMap = [dic valueForKey:@"dataMap"];
    NSString *state = [dataMap valueForKey:@"state"];
    if ([state isEqualToString:SU]) {
        if (![[[[[[dataMap valueForKey:@"user"] valueForKey:@"babyClass"] valueForKey:@"babyGrade"] valueForKey:@"babyNurserySchool"] valueForKey:@"schoolDesc"] isKindOfClass:[NSNull class]]) {
            int schoolDesc = [[[[[[dataMap valueForKey:@"user"] valueForKey:@"babyClass"] valueForKey:@"babyGrade"] valueForKey:@"babyNurserySchool"] valueForKey:@"schoolDesc"] intValue];
            if (schoolDesc == 1) {
                [HNAGeneral initChangLiangWithIsSchool:YES];
            }else{
                [HNAGeneral initChangLiangWithIsSchool:NO];
            }
        }else{
            [HNAGeneral initChangLiangWithIsSchool:NO];
        }
        kqPersonalInfoMation *info = [kqPersonalInfoMation sharedPersonalInfoMation];
        info.loginName = [[dataMap valueForKey:@"user"] valueForKey:@"loginName"];
//        [APService setAlias:info.loginName callbackSelector:@selector(tagsAliasCallback:tags:alias:) object:info.loginName];
        [APService setAlias:[[HNAGeneral getKeychainIdentifier] stringByReplacingOccurrencesOfString:@"-" withString:@""] callbackSelector:@selector(tagsAliasCallback:tags:alias:) object:[[HNAGeneral getKeychainIdentifier] stringByReplacingOccurrencesOfString:@"-" withString:@""]];
//        [APService setAlias:[HNAGeneral getKeychainIdentifier] callbackSelector:@selector(tagsAliasCallback:tags:alias:) object:[HNAGeneral getKeychainIdentifier]];
//        NSString *yyy = [[HNAGeneral getKeychainIdentifier] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
//        [HNAGeneral showAlertViewWithTitle:nil andMessage:[[HNAGeneral getKeychainIdentifier] stringByReplacingOccurrencesOfString:@"-" withString:@""]];
        info.cameraAccount = [dataMap valueForKey:@"cameraUserName"];
        info.cameraPassword = [dataMap valueForKey:@"cameraPassword"];
        info.loginPassword = [[dataMap valueForKey:@"user"] valueForKey:@"password"];
        info.babyName = [[dataMap valueForKey:@"user"] valueForKey:@"babyName"];
        info.realName = [[dataMap valueForKey:@"user"] valueForKey:@"name"];
        info.babyEmail = [[dataMap valueForKey:@"user"] valueForKey:@"email"];
        info.babyId = [NSString stringWithFormat:@"%@",[[dataMap valueForKey:@"user"] valueForKey:@"id"]];
        info.schoolName = [[[[[dataMap valueForKey:@"user"] valueForKey:@"babyClass"] valueForKey:@"babyGrade"] valueForKey:@"babyNurserySchool"] valueForKey:@"schoolName"];
        info.gradeName = [[[[dataMap valueForKey:@"user"] valueForKey:@"babyClass"] valueForKey:@"babyGrade"] valueForKey:@"gradeName"];
        info.classId = [[[dataMap valueForKey:@"user"] valueForKey:@"babyClass"] valueForKey:@"id"];
        info.className = [[[dataMap valueForKey:@"user"] valueForKey:@"babyClass"] valueForKey:@"className"];
        info.teacherID = [[[[dataMap valueForKey:@"user"] valueForKey:@"babyClass"] valueForKey:@"teacherUser"] valueForKey:@"id"];
        info.teacherLoginName = [[[[dataMap valueForKey:@"user"] valueForKey:@"babyClass"] valueForKey:@"teacherUser"] valueForKey:@"loginName"];
        info.teacherDeviceIDString = [[[[dataMap valueForKey:@"user"] valueForKey:@"babyClass"] valueForKey:@"teacherUser"] valueForKey:@"deviceid"];
        info.principalID = [[[[[[dataMap valueForKey:@"user"] valueForKey:@"babyClass"] valueForKey:@"babyGrade"] valueForKey:@"babyNurserySchool"] valueForKey:@"schoolUser"] valueForKey:@"id"];
        info.principalLoginName = [[[[[[dataMap valueForKey:@"user"] valueForKey:@"babyClass"] valueForKey:@"babyGrade"] valueForKey:@"babyNurserySchool"] valueForKey:@"schoolUser"] valueForKey:@"loginName"];
        info.imagPath = [NSString stringWithFormat:@"%@%@",[dic valueForKey:@"fileUrl"],[[dataMap valueForKey:@"user"] valueForKey:@"imgPath"]];
        info.principalImgPath = [NSString stringWithFormat:@"%@%@",[dic valueForKey:@"fileUrl"],[[[[[[dataMap valueForKey:@"user"] valueForKey:@"babyClass"] valueForKey:@"babyGrade"] valueForKey:@"babyNurserySchool"] valueForKey:@"schoolUser"] valueForKey:@"imgPath"]];
        info.teacherImgPath = [NSString stringWithFormat:@"%@%@",[dic valueForKey:@"fileUrl"],[[[[dataMap valueForKey:@"user"] valueForKey:@"babyClass"] valueForKey:@"teacherUser"] valueForKey:@"imgPath"]];
        NSString *statr = [[dataMap valueForKey:@"user"] valueForKey:@"startDate"];
        if (![statr isKindOfClass:[NSNull class]]) {
            NSArray *arr = [statr componentsSeparatedByString:@"T"];
            info.startDate = [NSString stringWithFormat:@"%@ %@",[arr objectAtIndex:0],[arr objectAtIndex:1]];
        }
        NSString *statrs = [[dataMap valueForKey:@"user"] valueForKey:@"endDate"];
        if (![statrs isKindOfClass:[NSNull class]]) {
            NSArray *arrs = [statrs componentsSeparatedByString:@"T"];
            info.endDae = [NSString stringWithFormat:@"%@ %@",[arrs objectAtIndex:0],[arrs objectAtIndex:1]];
        }
        
        NSArray *roleIds = [[dataMap valueForKey:@"user"] valueForKey:@"roleIds"];
        info.roleIds = [NSArray arrayWithArray:roleIds];
        if (roleIds.count != 0) {
            int rolesId = [[roleIds objectAtIndex:0] intValue];
            switch (rolesId) {
                case 4:
                {
                    self.currentClient = 0;
                    [self initBabyRooViewController];
                }
                    break;
                case 3:
                {
                    [HNAGeneral hidenHUD];
                    self.currentClient = 1;
                    info.className = [[dataMap valueForKey:@"user"] valueForKey:@"className"];
                    [self initTeacherRooViewController];
                }
                    break;
                case 2:
                {
                    self.currentClient = 2;
                    [self initLeaderRooViewController];
                }
                    break;
                    
                default:
                    break;
            }
        }else{
            [HNAGeneral showAlertViewWithTitle:@"警告" andMessage:@"登录错误"];
            kqLoginViewController *loginVC = [[kqLoginViewController alloc] initWithNibName:@"kqLoginViewController" bundle:nil];
            [loginVC setRemeber:NO andShow:NO];
            [self.homeVC.navigationController presentViewController:loginVC animated:NO completion:^{}];
            [APService setAlias:@"" callbackSelector:nil object:nil];
        }    }else if([state isEqualToString:ER]){
        [HNAGeneral showAlertViewWithTitle:@"提示" andMessage:[dataMap valueForKey:@"stateMsg"]];
        kqLoginViewController *loginVC = [[kqLoginViewController alloc] initWithNibName:@"kqLoginViewController" bundle:nil];
        [loginVC setRemeber:NO andShow:NO];
        [self.homeVC.navigationController presentViewController:loginVC animated:NO completion:^{}];
        [APService setAlias:@"" callbackSelector:nil object:nil];
    }
}

-(void) initBabyRooViewController
{
    kqPersonalInfoMation *info = [kqPersonalInfoMation sharedPersonalInfoMation];
    self.tabBarController = [[UITabBarController alloc] init];
    self.tabBarController.delegate = self;
    self.homeVC = [[kqHomePageViewController alloc] initWithNibName:@"kqHomePageViewController" bundle:nil];
//    self.homeVC.userinfo = self.userinfo;
    self.homeVC.title = info.schoolName;
    self.homeVC.tabBarItem.title = @"首页";
    [self.homeVC.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:RGB(61, 209, 188, 1),NSForegroundColorAttributeName,nil] forState:UIControlStateHighlighted];
    [self.homeVC.tabBarItem setImage:[[UIImage imageNamed:@"menu1_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    self.homeVC.tabBarItem.selectedImage = [[UIImage imageNamed:@"menu1_on"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UINavigationController *homeNavi = [[UINavigationController alloc] initWithRootViewController:self.homeVC];
    self.previousViewController = homeNavi;
    kqWonderfulMomentViewController *wmVC = [[kqWonderfulMomentViewController alloc] initWithNibName:@"kqWonderfulMomentViewController" bundle:nil];
    wmVC.title = @"每时每刻";
    wmVC.currentRole = 0;
    [wmVC.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:RGB(61, 209, 188, 1),NSForegroundColorAttributeName,nil] forState:UIControlStateHighlighted];
    [wmVC.tabBarItem setImage:[[UIImage imageNamed:@"menu2_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    wmVC.tabBarItem.selectedImage = [[UIImage imageNamed:@"menu2_on"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UINavigationController *wmNavi = [[UINavigationController alloc] initWithRootViewController:wmVC];
    kqTakePhotoViewController *pVC = [[kqTakePhotoViewController alloc] initWithNibName:@"kqTakePhotoViewController" bundle:nil];
    pVC.isWonderfulMomentMode = YES;
    pVC.title = @"拍照";
    pVC.isFood = NO;
    [pVC.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:RGB(61, 209, 188, 1),NSForegroundColorAttributeName,nil] forState:UIControlStateHighlighted];
    [pVC.tabBarItem setImage:[[UIImage imageNamed:@"menu3_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    pVC.tabBarItem.selectedImage = [[UIImage imageNamed:@"menu3_on"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    kqFoundViewController *fVC = [[kqFoundViewController alloc] initWithNibName:@"kqFoundViewController" bundle:nil];
//    fVC.isTeacher = NO;
//    fVC.isPush = NO;
//    fVC.title = @"发现";
//    UINavigationController *fNavi = [[UINavigationController alloc] initWithRootViewController:fVC];
    kqPersonalSettingViewController *psVC = [[kqPersonalSettingViewController alloc] initWithNibName:@"kqPersonalSettingViewController" bundle:nil];
    psVC.title = @"个人中心";
    [psVC.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:RGB(61, 209, 188, 1),NSForegroundColorAttributeName,nil] forState:UIControlStateHighlighted];
    [psVC.tabBarItem setImage:[[UIImage imageNamed:@"menu4_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    psVC.tabBarItem.selectedImage = [[UIImage imageNamed:@"menu4_on"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UINavigationController *psNavi = [[UINavigationController alloc] initWithRootViewController:psVC];
//    NSArray *arr = [NSArray arrayWithObjects:homeNavi,wmNavi,pVC,fNavi,psNavi, nil];
    NSArray *arr = [NSArray arrayWithObjects:homeNavi,wmNavi,pVC,psNavi, nil];
    self.tabBarController.viewControllers = arr;
//    [self initTabBarWithCurrentRole:self.currentClient];
    self.window.rootViewController = self.tabBarController;
    self.homeVC.cell.babyNameLabel.text = info.babyName;
    self.homeVC.cell.babyClassLabel.text = [NSString stringWithFormat:@"%@%@",info.gradeName,info.className];
}

-(void) initTeacherRooViewController
{
    kqPersonalInfoMation *info = [kqPersonalInfoMation sharedPersonalInfoMation];
    self.tabBarController = [[UITabBarController alloc] init];
    self.tabBarController.delegate = self;
    kqTeacherHomePageViewController *homeVC = [[kqTeacherHomePageViewController alloc] initWithNibName:@"kqTeacherHomePageViewController" bundle:nil];
    homeVC.title = info.className;
    homeVC.tabBarItem.title = info.className;
    [homeVC.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:RGB(61, 209, 188, 1),NSForegroundColorAttributeName,nil] forState:UIControlStateHighlighted];
    [homeVC.tabBarItem setImage:[[UIImage imageNamed:@"t_menu1_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    homeVC.tabBarItem.selectedImage = [[UIImage imageNamed:@"t_menu1_on"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UINavigationController *homeNavi = [[UINavigationController alloc] initWithRootViewController:homeVC];
    self.previousViewController = homeNavi;
    kqWonderfulMomentViewController *wmVC = [[kqWonderfulMomentViewController alloc] initWithNibName:@"kqWonderfulMomentViewController" bundle:nil];
    wmVC.title = @"每时每刻";
    wmVC.currentRole = 1;
    wmVC.tabBarItem.title = @"每时每刻";
    [wmVC.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:RGB(61, 209, 188, 1),NSForegroundColorAttributeName,nil] forState:UIControlStateHighlighted];
    [wmVC.tabBarItem setImage:[[UIImage imageNamed:@"t_menu3_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    wmVC.tabBarItem.selectedImage = [[UIImage imageNamed:@"t_menu3_on"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UINavigationController *wmNavi = [[UINavigationController alloc] initWithRootViewController:wmVC];
    kqMessageViewController *mVC = [[kqMessageViewController alloc] initWithNibName:@"kqMessageViewController" bundle:nil];
    mVC.title = @"消息";
    mVC.tabBarItem.title = @"消息";
    [mVC.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:RGB(61, 209, 188, 1),NSForegroundColorAttributeName,nil] forState:UIControlStateHighlighted];
    [mVC.tabBarItem setImage:[[UIImage imageNamed:@"t_menu2_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    mVC.tabBarItem.selectedImage = [[UIImage imageNamed:@"t_menu2_on"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UINavigationController *mNavi = [[UINavigationController alloc] initWithRootViewController:mVC];
    kqDynamicViewController *dVC = [[kqDynamicViewController alloc] initWithNibName:@"kqDynamicViewController" bundle:nil];
    dVC.title = @"动态";
    dVC.tabBarItem.title = @"动态";
    [dVC.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:RGB(61, 209, 188, 1),NSForegroundColorAttributeName,nil] forState:UIControlStateHighlighted];
    [dVC.tabBarItem setImage:[[UIImage imageNamed:@"t_menu5_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    dVC.tabBarItem.selectedImage = [[UIImage imageNamed:@"t_menu5_on"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UINavigationController *dNavi = [[UINavigationController alloc] initWithRootViewController:dVC];
    
    
    kqTBabyContactListViewController *tpVC = [[kqTBabyContactListViewController alloc] initWithNibName:@"kqTBabyContactListViewController" bundle:nil];
    tpVC.title = @"宝宝信息";
    tpVC.isBabyInfo = YES;
    tpVC.isBabyList = YES;
    tpVC.tabBarItem.title = @"宝宝信息";
    [tpVC.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:RGB(61, 209, 188, 1),NSForegroundColorAttributeName,nil] forState:UIControlStateHighlighted];
    [tpVC.tabBarItem setImage:[[UIImage imageNamed:@"t_menu4_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    tpVC.tabBarItem.selectedImage = [[UIImage imageNamed:@"t_menu4_on"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UINavigationController *tpNavi = [[UINavigationController alloc] initWithRootViewController:tpVC];
//    UINavigationController *dNavi = [[UINavigationController alloc] initWithRootViewController:dVC];
//    kqTeacherPersonalViewController *tpVC = [[kqTeacherPersonalViewController alloc] initWithNibName:@"kqTeacherPersonalViewController" bundle:nil];
//    tpVC.title = @"我";
    
    NSArray *arr = [NSArray arrayWithObjects:homeNavi,mNavi,wmNavi,tpNavi,dNavi, nil];
    self.tabBarController.viewControllers = arr;
//    [self initTabBarWithCurrentRole:self.currentClient];
    self.window.rootViewController = self.tabBarController;
}

-(void) initLeaderRooViewController
{
    
}

-(void) initTabBarWithCurrentRole:(int) role
{
    switch (role) {
        case 0:
        {
            UITabBar *tabBar = self.tabBarController.tabBar;
//            tabBar.backgroundImage = [UIImage imageNamed:@"subtitle.png"];
            tabBar.backgroundImage = [UIImage imageNamed:@"teacherSubtitle.png"];
            UIImageView *backimageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 64, 49)];
            backimageView.tag = TABBARBACKGROUNG_TAG;
            backimageView.image = [UIImage imageNamed:@"back.png"];
            backimageView.userInteractionEnabled = YES;
            [tabBar addSubview:backimageView];
            //消息
            UIButton *homeButoon = [UIButton buttonWithType:UIButtonTypeCustom];
            homeButoon.frame = CGRectMake(0, 0, 64, 49);
            [homeButoon addTarget:self action:@selector(tabBarButton:) forControlEvents:UIControlEventTouchUpInside];
            homeButoon.tag = 1000;
            [tabBar addSubview:homeButoon];
            UIImageView *homeImage = [[UIImageView alloc] initWithFrame:CGRectMake(18, 5, 27, 24)];
            homeImage.userInteractionEnabled = YES;
            homeImage.image = [UIImage imageNamed:@"btn1.png"];
            [tabBar addSubview:homeImage];
            UILabel *homelabel = [[UILabel alloc] initWithFrame:CGRectMake(12, 29, 40, 15)];
            homelabel.font = [UIFont systemFontOfSize:10.0f];
            homelabel.textColor = [UIColor whiteColor];
            homelabel.backgroundColor = [UIColor clearColor];
            homelabel.text = @"首页";
            homelabel.textAlignment = NSTextAlignmentCenter;
            homelabel.userInteractionEnabled = YES;
            [tabBar addSubview:homelabel];
            //每时每刻
            UIButton *wmButoon = [UIButton buttonWithType:UIButtonTypeCustom];
            wmButoon.frame = CGRectMake(64, 0, 64, 49);
            [wmButoon addTarget:self action:@selector(tabBarButton:) forControlEvents:UIControlEventTouchUpInside];
            wmButoon.tag = 1001;
            [tabBar addSubview:wmButoon];
            UIImageView *wmomentImage = [[UIImageView alloc] initWithFrame:CGRectMake(82, 5, 27, 24)];
            wmomentImage.userInteractionEnabled = YES;
            wmomentImage.image = [UIImage imageNamed:@"btn2.png"];
            [tabBar addSubview:wmomentImage];
            UILabel *wmmomentlabel = [[UILabel alloc] initWithFrame:CGRectMake(76, 29, 40, 15)];
            wmmomentlabel.font = [UIFont systemFontOfSize:10.0f];
            wmmomentlabel.textColor = [UIColor whiteColor];
            wmmomentlabel.text = @"每时每刻";
            wmmomentlabel.textAlignment = NSTextAlignmentCenter;
            wmmomentlabel.userInteractionEnabled = YES;
            wmmomentlabel.backgroundColor = [UIColor clearColor];
            [tabBar addSubview:wmmomentlabel];
            //拍照
            UIButton *pfButoon = [UIButton buttonWithType:UIButtonTypeCustom];
            pfButoon.frame = CGRectMake(128, 0, 64, 49);
            [pfButoon addTarget:self action:@selector(tabBarButton:) forControlEvents:UIControlEventTouchUpInside];
            pfButoon.tag = 1002;
            [tabBar addSubview:pfButoon];
            UIImageView *pfImage = [[UIImageView alloc] initWithFrame:CGRectMake(144, 8, 32, 32)];
            pfImage.userInteractionEnabled = YES;
            pfImage.image = [UIImage imageNamed:@"btn5.png"];
            [tabBar addSubview:pfImage];
            //发现
            UIButton *foButoon = [UIButton buttonWithType:UIButtonTypeCustom];
            foButoon.frame = CGRectMake(192, 0, 64, 49);
            [foButoon addTarget:self action:@selector(tabBarButton:) forControlEvents:UIControlEventTouchUpInside];
            foButoon.tag = 1003;
            [tabBar addSubview:foButoon];
            UIImageView *foImage = [[UIImageView alloc] initWithFrame:CGRectMake(219, 2, 8, 27)];
            foImage.userInteractionEnabled = YES;
            foImage.image = [UIImage imageNamed:@"btn3.png"];
            [tabBar addSubview:foImage];
            UILabel *folabel = [[UILabel alloc] initWithFrame:CGRectMake(204, 29, 40, 15)];
            folabel.font = [UIFont systemFontOfSize:10.0f];
            folabel.textColor = [UIColor whiteColor];
            folabel.text = @"发现";
            folabel.backgroundColor = [UIColor clearColor];
            folabel.textAlignment = NSTextAlignmentCenter;
            folabel.userInteractionEnabled = YES;
            [tabBar addSubview:folabel];
            //个人中心
            UIButton *perButoon = [UIButton buttonWithType:UIButtonTypeCustom];
            perButoon.frame = CGRectMake(256, 0, 64, 49);
            [perButoon addTarget:self action:@selector(tabBarButton:) forControlEvents:UIControlEventTouchUpInside];
            perButoon.tag = 1004;
            [tabBar addSubview:perButoon];
            UIImageView *perImage = [[UIImageView alloc] initWithFrame:CGRectMake(278, 4, 19, 25)];
            perImage.userInteractionEnabled = YES;
            perImage.image = [UIImage imageNamed:@"btn4.png"];
            [tabBar addSubview:perImage];
            UILabel *perlabel = [[UILabel alloc] initWithFrame:CGRectMake(268, 29, 40, 15)];
            perlabel.font = [UIFont systemFontOfSize:10.0f];
            perlabel.textColor = [UIColor whiteColor];
            perlabel.text = @"个人中心";
            perlabel.backgroundColor = [UIColor clearColor];
            perlabel.textAlignment = NSTextAlignmentCenter;
            perlabel.userInteractionEnabled = YES;
            [tabBar addSubview:perlabel];
            for (UITabBarItem *tabBarItem in tabBar.items) {
                tabBarItem.title = nil;
            }

        }
            break;
        case 1:
        {
            UITabBar *tabBar = self.tabBarController.tabBar;
            tabBar.backgroundImage = [UIImage imageNamed:@"teacherSubtitle.png"];
            UIImageView *backimageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 64, 49)];
            backimageView.tag = TABBARBACKGROUNG_TAG;
            backimageView.image = [UIImage imageNamed:@"back.png"];
            backimageView.userInteractionEnabled = YES;
            [tabBar addSubview:backimageView];
            //我的班级
            UIButton *homeButoon = [UIButton buttonWithType:UIButtonTypeCustom];
            homeButoon.frame = CGRectMake(0, 0, 64, 49);
            [homeButoon addTarget:self action:@selector(tabBarButton:) forControlEvents:UIControlEventTouchUpInside];
            homeButoon.tag = 1000;
            [tabBar addSubview:homeButoon];
            UIImageView *homeImage = [[UIImageView alloc] initWithFrame:CGRectMake(20, 5, 22, 23)];
            homeImage.userInteractionEnabled = YES;
            homeImage.image = [UIImage imageNamed:@"teacher1.png"];
            [tabBar addSubview:homeImage];
            UILabel *homelabel = [[UILabel alloc] initWithFrame:CGRectMake(12, 29, 40, 15)];
            homelabel.font = [UIFont systemFontOfSize:10.0f];
            homelabel.textColor = [UIColor whiteColor];
            homelabel.backgroundColor = [UIColor clearColor];
            homelabel.text = @"我的班级";
            homelabel.textAlignment = NSTextAlignmentCenter;
            homelabel.userInteractionEnabled = YES;
            [tabBar addSubview:homelabel];
            //消息
            UIButton *wmButoon = [UIButton buttonWithType:UIButtonTypeCustom];
            wmButoon.frame = CGRectMake(64, 0, 64, 49);
            [wmButoon addTarget:self action:@selector(tabBarButton:) forControlEvents:UIControlEventTouchUpInside];
            wmButoon.tag = 1001;
            [tabBar addSubview:wmButoon];
            UIImageView *wmomentImage = [[UIImageView alloc] initWithFrame:CGRectMake(82, 5, 27, 24)];
            wmomentImage.userInteractionEnabled = YES;
            wmomentImage.image = [UIImage imageNamed:@"teacher2.png"];
            [tabBar addSubview:wmomentImage];
            UILabel *wmmomentlabel = [[UILabel alloc] initWithFrame:CGRectMake(76, 29, 40, 15)];
            wmmomentlabel.font = [UIFont systemFontOfSize:10.0f];
            wmmomentlabel.textColor = [UIColor whiteColor];
            wmmomentlabel.text = @"消息";
            wmmomentlabel.textAlignment = NSTextAlignmentCenter;
            wmmomentlabel.userInteractionEnabled = YES;
            wmmomentlabel.backgroundColor = [UIColor clearColor];
            [tabBar addSubview:wmmomentlabel];
            //每时每刻
            UIButton *pfButoon = [UIButton buttonWithType:UIButtonTypeCustom];
            pfButoon.frame = CGRectMake(128, 0, 64, 49);
            [pfButoon addTarget:self action:@selector(tabBarButton:) forControlEvents:UIControlEventTouchUpInside];
            pfButoon.tag = 1002;
            [tabBar addSubview:pfButoon];
            UIImageView *pfImage = [[UIImageView alloc] initWithFrame:CGRectMake(144, 8, 27, 24)];
            pfImage.userInteractionEnabled = YES;
            pfImage.image = [UIImage imageNamed:@"teacher3.png"];
            [tabBar addSubview:pfImage];
            UILabel *wmlabel = [[UILabel alloc] initWithFrame:CGRectMake(138, 29, 40, 15)];
            wmlabel.font = [UIFont systemFontOfSize:10.0f];
            wmlabel.textColor = [UIColor whiteColor];
            wmlabel.text = @"每时每刻";
            wmlabel.textAlignment = NSTextAlignmentCenter;
            wmlabel.userInteractionEnabled = YES;
            wmlabel.backgroundColor = [UIColor clearColor];
            [tabBar addSubview:wmlabel];
            
            //宝宝信息
            UIButton *perButoon = [UIButton buttonWithType:UIButtonTypeCustom];
//            perButoon.frame = CGRectMake(256, 0, 64, 49);
            perButoon.frame = CGRectMake(192, 0, 64, 49);
            [perButoon addTarget:self action:@selector(tabBarButton:) forControlEvents:UIControlEventTouchUpInside];
            perButoon.tag = 1003;
            [tabBar addSubview:perButoon];
//            UIImageView *perImage = [[UIImageView alloc] initWithFrame:CGRectMake(278, 4, 19, 25)];
            UIImageView *perImage = [[UIImageView alloc] initWithFrame:CGRectMake(214, 4, 19, 25)];
            perImage.userInteractionEnabled = YES;
            perImage.image = [UIImage imageNamed:@"teacher5.png"];
            [tabBar addSubview:perImage];
//            UILabel *perlabel = [[UILabel alloc] initWithFrame:CGRectMake(268, 29, 40, 15)];
            UILabel *perlabel = [[UILabel alloc] initWithFrame:CGRectMake(204, 29, 40, 15)];
            perlabel.font = [UIFont systemFontOfSize:10.0f];
            perlabel.textColor = [UIColor whiteColor];
            perlabel.text = @"宝宝信息";
            perlabel.backgroundColor = [UIColor clearColor];
            perlabel.textAlignment = NSTextAlignmentCenter;
            perlabel.userInteractionEnabled = YES;
            [tabBar addSubview:perlabel];
            //动态
            UIButton *foButoon = [UIButton buttonWithType:UIButtonTypeCustom];
//            foButoon.frame = CGRectMake(192, 0, 64, 49);
            foButoon.frame = CGRectMake(256, 0, 64, 49);
            [foButoon addTarget:self action:@selector(tabBarButton:) forControlEvents:UIControlEventTouchUpInside];
            foButoon.tag = 1004;
            [tabBar addSubview:foButoon];
//            UIImageView *foImage = [[UIImageView alloc] initWithFrame:CGRectMake(214, 2, 19, 28)];
            UIImageView *foImage = [[UIImageView alloc] initWithFrame:CGRectMake(278, 2, 19, 28)];
            foImage.userInteractionEnabled = YES;
            foImage.image = [UIImage imageNamed:@"teacher4"];
            [tabBar addSubview:foImage];
//            UILabel *folabel = [[UILabel alloc] initWithFrame:CGRectMake(204, 29, 40, 15)];
            UILabel *folabel = [[UILabel alloc] initWithFrame:CGRectMake(268, 29, 40, 15)];
            folabel.font = [UIFont systemFontOfSize:10.0f];
            folabel.textColor = [UIColor whiteColor];
            folabel.text = @"动态";
            folabel.backgroundColor = [UIColor clearColor];
            folabel.textAlignment = NSTextAlignmentCenter;
            folabel.userInteractionEnabled = YES;
            [tabBar addSubview:folabel];
            for (UITabBarItem *tabBarItem in tabBar.items) {
                tabBarItem.title = nil;
            }
        }
            break;
        default:
            break;
    }
}

-(void)tabBarButton:(UIButton *) button
{
    
    switch (button.tag) {
        case 1000:
        {
            if (self.currentClient == 0) {
                UIViewController *vc = [self.tabBarController.viewControllers objectAtIndex:0];
                self.previousViewController = vc;
                [self.tabBarController.delegate tabBarController:self.tabBarController didSelectViewController:vc];
            }
        }
            break;
        case 1001:
        {
            if (self.currentClient == 0) {
                UIViewController *vc = [self.tabBarController.viewControllers objectAtIndex:1];
                self.previousViewController = vc;
                [self.tabBarController.delegate tabBarController:self.tabBarController didSelectViewController:vc];
            }
        }
            break;
        case 1002:
        {
        }
            break;
        case 1003:
        {
            if (self.currentClient == 0) {
                UIViewController *vc = [self.tabBarController.viewControllers objectAtIndex:3];
                self.previousViewController = vc;
                [self.tabBarController.delegate tabBarController:self.tabBarController didSelectViewController:vc];
            }
        }
            break;
        case 1004:
        {
            if (self.currentClient == 0) {
                UIViewController *vc = [self.tabBarController.viewControllers objectAtIndex:4];
                self.previousViewController = vc;
                [self.tabBarController.delegate tabBarController:self.tabBarController didSelectViewController:vc];
            }
        }
            break;
        default:
            break;
    }
}

-(BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController
{
    if (self.currentClient == 0) {
        if ([viewController isKindOfClass:[kqTakePhotoViewController class]]) {
            kqTakePhotoViewController *pVC = [[kqTakePhotoViewController alloc] initWithNibName:@"kqTakePhotoViewController" bundle:nil];
            pVC.isFood = NO;
            pVC.isWonderfulMomentMode = YES;
            UINavigationController *navi = (UINavigationController *)self.previousViewController;
            UIViewController * vc = [navi.viewControllers objectAtIndex:0];
            [vc presentViewController:pVC animated:NO completion:^{
                pVC.imagePickerController = [[UIImagePickerController alloc] init];
                pVC.imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
                pVC.imagePickerController.showsCameraControls = NO;
                pVC.imagePickerController.delegate = pVC;
                pVC.imagePickerController.allowsEditing = NO;
                [pVC addViewToCamera];
                [pVC presentViewController:pVC.imagePickerController animated:NO completion:^{}];
            }];
            return NO;
        }else{
            return YES;
        }

    }
    return YES;
}

-(void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
    UITabBar *tabBar = self.tabBarController.tabBar;
    UIImageView *back = (UIImageView *)[tabBar viewWithTag:TABBARBACKGROUNG_TAG];
    if (self.currentClient == 0) {
        //程海峰 20160707修改
        return;
        if ([viewController isKindOfClass:[kqTakePhotoViewController class]]) {
            back.frame = CGRectMake(-64, 0, 64, 49);
        }else if([viewController isKindOfClass:[UINavigationController class]]){
            UINavigationController *navi = (UINavigationController *)viewController;
            self.previousViewController = navi;
            UIViewController * vc = [navi.viewControllers objectAtIndex:0];
            if ([vc isKindOfClass:[kqHomePageViewController class]]) {
                back.frame = CGRectMake(0, 0, 64, 49);
            }
            if ([vc isKindOfClass:[kqWonderfulMomentViewController class]]) {
                back.frame = CGRectMake(64, 0, 64, 49);
            }
            if ([vc isKindOfClass:[kqFoundViewController class]]) {
                back.frame = CGRectMake(192, 0, 64, 49);
            }
            if ([vc isKindOfClass:[kqPersonalSettingViewController class]]) {
                
                back.frame = CGRectMake(256, 0, 64, 49);
            }
        }
    }
    if (self.currentClient == 1) {
        //程海峰 20160707修改
        return;
        if([viewController isKindOfClass:[UINavigationController class]]){
            UINavigationController *navi = (UINavigationController *)viewController;
            self.previousViewController = navi;
            UIViewController * vc = [navi.viewControllers objectAtIndex:0];
            if ([vc isKindOfClass:[kqTeacherHomePageViewController class]]) {
                back.frame = CGRectMake(0, 0, 64, 49);
            }
            if ([vc isKindOfClass:[kqMessageViewController class]]) {
                back.frame = CGRectMake(64, 0, 64, 49);
            }
            if ([vc isKindOfClass:[kqWonderfulMomentViewController class]]) {
                back.frame = CGRectMake(128, 0, 64, 49);
            }
            if ([vc isKindOfClass:[kqDynamicViewController class]]) {
//                back.frame = CGRectMake(192, 0, 64, 49);
                back.frame = CGRectMake(256, 0, 64, 49);
            }
//            if ([vc isKindOfClass:[kqTeacherPersonalViewController class]]) {
            if ([vc isKindOfClass:[kqTBabyContactListViewController class]]) {
//                back.frame = CGRectMake(256, 0, 64, 49);
                back.frame = CGRectMake(192, 0, 64, 49);
            }
        }
    }
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    
    // Required
    [APService registerDeviceToken:deviceToken];
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    
    // Required
//    [HNAGeneral showAlertViewWithTitle:nil andMessage:@"收到推送了"];
    if (self.homeVC) {
        [self.homeVC recieveNotificationWithDictionary:userInfo];
    }
    [APService handleRemoteNotification:userInfo];
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
    
    
    // IOS 7 Support Required
    if (self.homeVC) {
        [self.homeVC recieveNotificationWithDictionary:userInfo];
    }
//    [HNAGeneral showAlertViewWithTitle:nil andMessage:@"收到推送了"];
    [APService handleRemoteNotification:userInfo];
    completionHandler(UIBackgroundFetchResultNewData);
}

@end