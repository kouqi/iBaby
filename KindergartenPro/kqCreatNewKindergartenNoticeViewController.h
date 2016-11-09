//
//  kqCreatNewKindergartenNoticeViewController.h
//  KindergartenPro
//
//  Created by 海峰 on 14-10-15.
//  Copyright (c) 2014年 海峰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface kqCreatNewKindergartenNoticeViewController : UIViewController<UITextFieldDelegate,UITextViewDelegate,HNADownLoadDelegate>
@property (strong, nonatomic) NSDictionary *dataDictionary;
@property (assign, nonatomic) long babyNoticeTypeId;
@end
