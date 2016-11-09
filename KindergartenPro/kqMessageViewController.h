//
//  kqMessageViewController.h
//  KindergartenPro
//
//  Created by 海峰 on 14-9-3.
//  Copyright (c) 2014年 海峰. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "kqChatWindowViewController.h"
#import "WonderfulMomentChangeView.h"
@interface kqMessageViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,HNADownLoadDelegate,ChatWindowBackDelegate,HNAWonderfulMomentChangeViewDelegate>

@end
