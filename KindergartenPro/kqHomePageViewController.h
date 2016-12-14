//
//  kqHomePageViewController.h
//  KindergartenPro
//
//  Created by 海峰 on 14-7-25.
//  Copyright (c) 2014年 海峰. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "kqHomePageBabyCell.h"
#import "kqLoginViewController.h"
#import "kqChatWindowViewController.h"
#import "kqSelectedCameraView.h"
#import "VideoCallViewController.h"
@interface kqHomePageViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,HNADownLoadDelegate,SelectCameraDelegate>
{
    
}
+(kqHomePageViewController *)sharedkqHomePageViewController;
@property (strong, nonatomic) kqHomePageBabyCell *cell;
@property (assign, nonatomic) NSDictionary *userinfo;
@property (assign, nonatomic) NSInteger index;
@property (strong, nonatomic) VideoCallViewController* videoCallVC;
-(void) recieveNotificationWithDictionary:(NSDictionary *) notificationDictionary;
@end
