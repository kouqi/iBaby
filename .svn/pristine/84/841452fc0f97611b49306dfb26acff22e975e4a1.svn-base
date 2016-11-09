//
//  HNACallPhoneView.h
//  HNA_WorkLife
//
//  Created by 海峰 on 14/11/28.
//  Copyright (c) 2014年 杨帅. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CallSelectPhoneDelegate <NSObject>

-(void) didTapCancelView:(UIView *) view;
-(void) didTapStatusWithString:(NSString *) statusText andView:(UIView *) view;
@end











@interface HNACallPhoneView : UIView
@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UILabel *signInLabel;
@property (weak, nonatomic) IBOutlet UILabel *signOutLabel;
@property (assign, nonatomic) id<CallSelectPhoneDelegate>delegate;
-(void) initView;
-(void) chageViewFrame;
@end
