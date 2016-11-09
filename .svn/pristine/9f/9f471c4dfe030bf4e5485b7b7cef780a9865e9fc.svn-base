//
//  WonderfulMomentChangeView.m
//  KindergartenPro
//
//  Created by 海峰 on 15/3/9.
//  Copyright (c) 2015年 海峰. All rights reserved.
//

#import "WonderfulMomentChangeView.h"

@implementation WonderfulMomentChangeView
- (IBAction)tapWonderfulMomentButton:(UIButton *)sender {
    [self.delegate didTapModeViewWithSelectMode:1 andView:self];
}

- (IBAction)tapPersonalPhotoButton:(UIButton *)sender {
    [self.delegate didTapModeViewWithSelectMode:2 andView:self];
}

- (IBAction)tapCancelView:(UITapGestureRecognizer *)sender {
    [self.delegate didtapCancelViewWithView:self];
}

-(void) initView
{
//    self.changeModeView.layer.cornerRadius = 10.0f;
//    self.changeModeView.layer.masksToBounds = YES;
    self.firstLabel.text = [self.dataArray objectAtIndex:0];
    self.secondLabel.text = [self.dataArray objectAtIndex:1];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
