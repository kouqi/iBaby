//
//  kqTBabySeacherContactListViewController.h
//  KindergartenPro
//
//  Created by 海峰 on 14-9-26.
//  Copyright (c) 2014年 海峰. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "kqTBabyContactCell.h"
@protocol SelectResultContactDelegate <NSObject>

-(void) didSelectedContactWithDataDictionary:(NSDictionary *) dictionary;

@end




@interface kqTBabySeacherContactListViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate,TapContactButtonDelegate>
@property (weak, nonatomic) IBOutlet UISearchBar *seacherBar;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *dataArray,*resultArray,*sectionary;
@property (assign, nonatomic) id<SelectResultContactDelegate>delegate;
@property (assign, nonatomic) BOOL isBabyList,isBabyInfo;
@end
