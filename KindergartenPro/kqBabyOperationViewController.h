//
//  kqBabyOperationViewController.h
//  KindergartenPro
//
//  Created by 海峰 on 14-9-10.
//  Copyright (c) 2014年 海峰. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "kqDatePickerView.h"
#import "kqTBabyInfomationTableViewCell.h"
#import "kqTBabyInfomationEntryViewController.h"
#import "HNACallPhoneView.h"
#import "kqPersoneralPhotosViewController.h"
#import "ELCImagePickerController.h"
#import "kqSendPictureTuServicesViewController.h"
@protocol ChangeBabyStatues <NSObject>

-(void) changeBabyStatuesWithState:(NSString *) state;

@end








@interface kqBabyOperationViewController : UIViewController<ChoseDateDelegate,UITableViewDataSource,UITableViewDelegate,TapCellButtonsDelegate,HNADownLoadDelegate,FabuBookHandbookDelegate,CallSelectPhoneDelegate,UIActionSheetDelegate,ELCImagePickerControllerDelegate,SendPictureDelegate,UploadPhotoToServerDelegate>
@property (assign, nonatomic) id<ChangeBabyStatues>delegate;
@property (strong, nonatomic) NSString *babyStateString;
@property (strong, nonatomic) NSMutableDictionary *dataDictionary;
@property (strong, nonatomic) NSMutableArray *imagesArray;
@property (strong, nonatomic) NSString *babyId,*albumId;
@end
