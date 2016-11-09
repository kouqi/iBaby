//
//  WonderfulMomentChangeView.h
//  KindergartenPro
//
//  Created by 海峰 on 15/3/9.
//  Copyright (c) 2015年 海峰. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol HNAWonderfulMomentChangeViewDelegate <NSObject>

-(void) didTapModeViewWithSelectMode:(NSInteger ) viewMode andView:(UIView *) view;
-(void) didtapCancelViewWithView:(UIView *) view;

@end










@interface WonderfulMomentChangeView : UIView
@property (weak, nonatomic) IBOutlet UILabel *firstLabel;
@property (weak, nonatomic) IBOutlet UIView *changeModeView;
@property (weak, nonatomic) IBOutlet UILabel *secondLabel;
@property (strong, nonatomic) NSMutableArray *dataArray;
@property (assign, nonatomic) id<HNAWonderfulMomentChangeViewDelegate>delegate;
-(void) initView;
@end
