//
//  kqDatePickerView.h
//  KindergartenPro
//
//  Created by 海峰 on 14-9-11.
//  Copyright (c) 2014年 海峰. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ChoseDateDelegate <NSObject>

-(void) didCacelChoseDateWithView:(UIView *) datePickerView;
-(void) didChoseDate:(NSDate *) date WithView:(UIView *) datePickerView;

@end









@interface kqDatePickerView : UIView
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (assign, nonatomic) id<ChoseDateDelegate>delegate;
@end
