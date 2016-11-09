//
//  kqDatePickerView.m
//  KindergartenPro
//
//  Created by 海峰 on 14-9-11.
//  Copyright (c) 2014年 海峰. All rights reserved.
//

#import "kqDatePickerView.h"

@implementation kqDatePickerView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
- (IBAction)tapChoseButton:(id)sender {
    [self.delegate didChoseDate:self.datePicker.date WithView:self];
}

- (IBAction)tapCancelButton:(id)sender {
    [self.delegate didCacelChoseDateWithView:self];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
