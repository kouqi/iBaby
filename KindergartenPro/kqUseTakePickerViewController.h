//
//  kqUseTakePickerViewController.h
//  kqCameroDemo
//
//  Created by 海峰 on 14-8-18.
//  Copyright (c) 2014年 海峰. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol UsePictureDelegate <NSObject>

-(void) cacelUsePicture;

-(void) usePicture:(UIImage *) image;

@end



@interface kqUseTakePickerViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) UIImage *image;
@property (assign, nonatomic) id<UsePictureDelegate>delegate;
@property(assign, nonatomic) BOOL isWonderfulMomentMode;
@end
