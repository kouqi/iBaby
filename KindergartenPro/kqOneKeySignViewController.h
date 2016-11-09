//
//  kqOneKeySignViewController.h
//  KindergartenPro
//
//  Created by 海峰 on 15/3/16.
//  Copyright (c) 2015年 海峰. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "kqOneKeySignTbabyView.h"
#import "HNACallPhoneView.h"
@protocol PiLiangChangeBabyStatuesDelegate <NSObject>

-(void) didChangeBabyStatues;

@end



@interface kqOneKeySignViewController : UIViewController<HNADownLoadDelegate,kqPersonalPhotosImageViewSelectedDelegate,CallSelectPhoneDelegate>
@property (strong, nonatomic) NSMutableArray *dataArray;
@property (assign, nonatomic) id<PiLiangChangeBabyStatuesDelegate>delegate;
@end
