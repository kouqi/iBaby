//
//  kqPlayRtspViewController.h
//  KindergartenPro
//
//  Created by 海峰 on 14/11/9.
//  Copyright (c) 2014年 海峰. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Vitamio.h"
@interface kqPlayRtspViewController : UIViewController<VMediaPlayerDelegate,HNADownLoadDelegate>
@property (strong, nonatomic) NSString *urlString;
@property (strong, nonatomic) VMediaPlayer *mPlayer;
@property (strong, nonatomic) NSDictionary *cameraDictionary;
@end
