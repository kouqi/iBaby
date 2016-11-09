//
//  kqTBabyInfomationTableViewCell.m
//  KindergartenPro
//
//  Created by 海峰 on 14-9-25.
//  Copyright (c) 2014年 海峰. All rights reserved.
//

#import "kqTBabyInfomationTableViewCell.h"

@implementation kqTBabyInfomationTableViewCell

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)tapSendButton:(id)sender {
    [self.delegate didTapCellSendButtonWithIndexPath:self.indexPath];
}
- (IBAction)tapDeleteButton:(id)sender {
    [self.delegate didTapCellDeleteButtonWithIndexPath:self.indexPath];
}

@end
