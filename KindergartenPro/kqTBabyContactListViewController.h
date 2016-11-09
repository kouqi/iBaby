//
//  kqTBabyContactListViewController.h
//  KindergartenPro
//
//  Created by 海峰 on 14-9-26.
//  Copyright (c) 2014年 海峰. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "kqTBabySeacherContactListViewController.h"
#import "kqTBabyContactCell.h"
@interface kqTBabyContactListViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate,AIMTableViewIndexBarDelegate,SelectResultContactDelegate,HNADownLoadDelegate,TapContactButtonDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UISearchBar *seacherBar;
@property (assign, nonatomic) BOOL isBabyList,isBabyInfo;
@end
