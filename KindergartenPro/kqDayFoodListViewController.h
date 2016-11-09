//
//  kqDayFoodListViewController.h
//  KindergartenPro
//
//  Created by 海峰 on 14-8-20.
//  Copyright (c) 2014年 海峰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface kqDayFoodListViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,HNADownLoadDelegate>
@property (strong, nonatomic) NSDictionary *dictionary;
@property (strong, nonatomic) NSString *fileUrl;
@property (assign, nonatomic) BOOL isEditMode;
@end
