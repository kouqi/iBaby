//
//  HNACallPhoneView.m
//  HNA_WorkLife
//
//  Created by 海峰 on 14/11/28.
//  Copyright (c) 2014年 杨帅. All rights reserved.
//

#import "HNACallPhoneView.h"

@implementation HNACallPhoneView
- (IBAction)tapCancelView:(id)sender {
    [self.delegate didTapCancelView:self];
}

-(void) initView
{
    kqDistingKindergartenAndSchool *dkas = [kqDistingKindergartenAndSchool sharedDistingKindergartenAndSchool];
    self.signInLabel.text = dkas.signIn;
    self.signOutLabel.text = dkas.signOut;
}

- (IBAction)tapStatusButton:(UIButton *)sender {
    kqDistingKindergartenAndSchool *dkas = [kqDistingKindergartenAndSchool sharedDistingKindergartenAndSchool];
    switch (sender.tag) {
        case 1000:
            [self.delegate didTapStatusWithString:dkas.signIn andView:self];
            break;
        case 1001:
            [self.delegate didTapStatusWithString:dkas.signOut andView:self];
            break;
        case 1002:
            [self.delegate didTapStatusWithString:@"事假" andView:self];
            break;
        case 1003:
            [self.delegate didTapStatusWithString:@"病假" andView:self];
            break;
            
        default:
            break;
    }
}

-(void)chageViewFrame
{
    self.contentView.frame = CGRectMake((self.frame.size.width - self.contentView.frame.size.width) / 2, 35, self.contentView.frame.size.width, self.contentView.frame.size.height);
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
