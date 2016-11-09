//
//  kqTBabyInfomationEntryViewController.h
//  KindergartenPro
//
//  Created by 海峰 on 14-9-17.
//  Copyright (c) 2014年 海峰. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol FabuBookHandbookDelegate <NSObject>
-(void) didFabuHandBookSucessWithTitle:(NSString *) title;

@end



@interface kqTBabyInfomationEntryViewController : UIViewController<HNADownLoadDelegate>
@property (assign, nonatomic) id<FabuBookHandbookDelegate>delegate;
@property (strong, nonatomic) NSMutableDictionary *dataDictionary;
@property (strong, nonatomic) NSString *babyId;
@end
