//
//  kqViewController.h
//  kqCameroDemo
//
//  Created by 海峰 on 14-8-18.
//  Copyright (c) 2014年 海峰. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "kqSendPictureTuServicesViewController.h"
#import "kqUseTakePickerViewController.h"
#import "ELCImagePickerController.h"

@protocol SelectImageDelegate <NSObject>

-(void) didSelectImageWithArray:(NSMutableArray *) array;

@end







@interface kqTakePhotoViewController : UIViewController<UIImagePickerControllerDelegate,UINavigationControllerDelegate,UsePictureDelegate,ELCImagePickerControllerDelegate,SendPictureDelegate>
@property (assign, nonatomic) BOOL isFood;
@property (assign, nonatomic) int photoNumber;
@property (strong, nonatomic) UIImagePickerController *imagePickerController;
@property (assign, nonatomic) id<SelectImageDelegate>delegate;
@property(assign, nonatomic) BOOL isWonderfulMomentMode;
-(void) addViewToCamera;
@end
