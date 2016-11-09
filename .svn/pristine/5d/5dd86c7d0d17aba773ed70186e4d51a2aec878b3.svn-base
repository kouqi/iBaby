//
//  kqPersoneralPhotosViewController.h
//  KindergartenPro
//
//  Created by 海峰 on 15/3/10.
//  Copyright (c) 2015年 海峰. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "kqPersonalPhotosImageView.h"
#import "ELCImagePickerController.h"
#import "kqSendPictureTuServicesViewController.h"

@protocol UploadPhotoToServerDelegate <NSObject>

@optional
-(void) didUploadPhotosWithArray:(NSArray *) array;

@end










@interface kqPersoneralPhotosViewController : UIViewController<kqPersonalPhotosImageViewSelectedDelegate,UIActionSheetDelegate,HNADownLoadDelegate,ELCImagePickerControllerDelegate,SendPictureDelegate>
@property (strong, nonatomic) NSMutableArray *dataArray;
@property (strong, nonatomic) NSString *babyId,*albumId;
@property (assign, nonatomic) int currentRole;//当前角色0,家长，1教师，2园长
@property (assign, nonatomic) BOOL isRightButton,isDeleteMode;
@property (assign, nonatomic) id<UploadPhotoToServerDelegate>delegate;
@end
