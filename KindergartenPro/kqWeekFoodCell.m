//
//  kqWeekFoodCell.m
//  KindergartenPro
//
//  Created by 海峰 on 14-8-6.
//  Copyright (c) 2014年 海峰. All rights reserved.
//

#import "kqWeekFoodCell.h"

@implementation kqWeekFoodCell

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setTapMondayButton_Block:(tapMondayButton_Block)block
{
    if (mondayBlock != block) {
        mondayBlock = block;
    }
}

- (IBAction)tapMondayButton:(id)sender {
    if (mondayBlock) {
        mondayBlock(self.mondayDictionary);
    }
}

-(void)setTapTuesdayButton_Block:(tapTuesdayButton_Block)block
{
    if (tuesdayBlock != block) {
        tuesdayBlock = block;
    }
}

- (IBAction)tapTuesdayButton:(id)sender {
    if (tuesdayBlock) {
        tuesdayBlock(self.tuesdayDictionary);
    }
}

-(void)setTapWednesdayButton_Block:(tapWednesdayButton_Block)block
{
    if (wednesdayBlock != block) {
        wednesdayBlock = block;
    }
}

- (IBAction)tapWensdayButton:(id)sender {
    if (wednesdayBlock) {
        wednesdayBlock(self.wednesdayDictionary);
    }
}

-(void)setTapThursdayButton_Block:(tapThursdayButton_Block)block
{
    if (thursdayBlock != block) {
        thursdayBlock = block;
    }
}

- (IBAction)tapThurdayButton:(id)sender {
    if (thursdayBlock) {
        thursdayBlock(self.thursdayDictionary);
    }
}

-(void)setTapFridayButton_Block:(tapFridayButton_Block)block
{
    if (fridayBlock != block) {
        fridayBlock = block;
    }
}

- (IBAction)tapFraidayButton:(id)sender {
    if (fridayBlock) {
        fridayBlock(self.fridayDictionary);
    }
}

@end
