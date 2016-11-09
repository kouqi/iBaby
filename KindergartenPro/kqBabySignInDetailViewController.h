//
//  kqBabySignInDetailViewController.h
//  KindergartenPro
//
//  Created by 海峰 on 16/4/9.
//  Copyright © 2016年 海峰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface kqBabySignInDetailViewController : UIViewController
@property (strong, nonatomic) NSArray *signArray;
@property (assign, nonatomic) BOOL isBaby;
@property (strong, nonatomic) NSString *babyId;
@property (strong, nonatomic) NSDictionary *dataDictionary;
@end
