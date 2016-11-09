//
//  kqBabySignInListViewController.h
//  KindergartenPro
//
//  Created by 海峰 on 14-8-6.
//  Copyright (c) 2014年 海峰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface kqBabySignInListViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,HNADownLoadDelegate>
@property (strong, nonatomic) NSMutableArray *dataArray,*sectionTitleArray;
@end
