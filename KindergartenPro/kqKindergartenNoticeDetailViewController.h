//
//  kqKindergartenNoticeDetailViewController.h
//  KindergartenPro
//
//  Created by 海峰 on 14-8-20.
//  Copyright (c) 2014年 海峰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface kqKindergartenNoticeDetailViewController : UIViewController
@property (strong, nonatomic) NSDictionary *dataDictionary;
@property (assign, nonatomic) BOOL isEditMode;
@property (assign, nonatomic) long babyNoticeTypeId;
@end
