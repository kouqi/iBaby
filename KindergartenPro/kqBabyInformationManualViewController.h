//
//  kqBabyInformationManualViewController.h
//  KindergartenPro
//
//  Created by 海峰 on 14-7-26.
//  Copyright (c) 2014年 海峰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface kqBabyInformationManualViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,HNADownLoadDelegate>
@property (strong, nonatomic) NSMutableArray *dataArray;
@end
