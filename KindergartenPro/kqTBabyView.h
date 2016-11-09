//
//  kqTBabyView.h
//  KindergartenPro
//
//  Created by 海峰 on 14-9-3.
//  Copyright (c) 2014年 海峰. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "kqBabySignInDetailViewController.h"
#import "kqBabyOperationViewController.h"
@interface kqTBabyView : UIView<ChangeBabyStatues>
@property (weak, nonatomic) IBOutlet UIImageView *babyHeaderImageView;
@property (weak, nonatomic) IBOutlet UILabel *babyName;
@property (weak, nonatomic) IBOutlet UILabel *BabyState;
@property (strong, nonatomic) NSDictionary *dataDictionary;
@property (weak, nonatomic) IBOutlet UIImageView *YichangImageView;
@property (strong, nonatomic) UIViewController *dependOnViewController;


@end
