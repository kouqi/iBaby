//
//  kqWonderfulMomentViewController.h
//  KindergartenPro
//
//  Created by 海峰 on 14-8-6.
//  Copyright (c) 2014年 海峰. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "kqTakePhotoViewController.h"
#import "WonderfulMomentChangeView.h"
#import "kqPersoneralPhotosViewController.h"
#import "ELCImagePickerController.h"
#import "kqSendPictureTuServicesViewController.h"
@interface kqWonderfulMomentViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,HNADownLoadDelegate,HNAWonderfulMomentChangeViewDelegate,kqPersonalPhotosImageViewSelectedDelegate,ELCImagePickerControllerDelegate,SendPictureDelegate>
@property (strong, nonatomic) NSMutableArray *dataArray;
@property (assign, nonatomic) int currentRole;//当前角色0,家长，1教师，2园长
@end
