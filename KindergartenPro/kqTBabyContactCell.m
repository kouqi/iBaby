//
//  kqTBabyContactCell.m
//  KindergartenPro
//
//  Created by 海峰 on 14-9-26.
//  Copyright (c) 2014年 海峰. All rights reserved.
//

#import "kqTBabyContactCell.h"

@implementation kqTBabyContactCell

- (void)awakeFromNib
{
    // Initialization code
}

-(void) initCellWithDic:(NSDictionary *) dic withIsBabyList:(BOOL) isBabyList andIsBabyInfo:(BOOL) isBabyInfo
{
    
    if (isBabyList) {
//        self.relationLabel.text = [NSString stringWithFormat:@"家长：%@",[dic valueForKey:@"name"]];
        self.nameLabel.text = [NSString stringWithFormat:@"%@的家长",[dic valueForKey:@"babyName"]];
    }else{
        self.nameLabel.text = [NSString stringWithFormat:@"%@",[dic valueForKey:@"name"]];
    }
    if (isBabyInfo) {
        self.messageButton.hidden = YES;
        self.telPhoneButton.hidden = YES;
    }else{
        kqPersonalInfoMation *pi = [kqPersonalInfoMation sharedPersonalInfoMation];
        if ([pi.babyId isEqualToString:[[dic valueForKey:@"id"] stringValue]]) {
            self.messageButton.hidden = YES;
            self.telPhoneButton.hidden = YES;
        }
    }
}

- (IBAction)tapMessageButton:(id)sender {
    [self.delegate didTapMessageButtonWith:self.indexPath];
}

- (IBAction)tapCallButton:(id)sender {
    [self.delegate didTapCallButtonWith:self.indexPath];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
