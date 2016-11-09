//
//  kqHomePageBabyCell.m
//  KindergartenPro
//
//  Created by 海峰 on 14-7-25.
//  Copyright (c) 2014年 海峰. All rights reserved.
//

#import "kqHomePageBabyCell.h"
#import <QuartzCore/QuartzCore.h>
@implementation kqHomePageBabyCell

- (void)awakeFromNib
{
    // Initialization code
    CALayer *layer = self.headImageView.layer;
    layer.cornerRadius = 25.0f;
    layer.masksToBounds = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
