//
//  kqTeacherPersonalBabyListCell.m
//  KindergartenPro
//
//  Created by 程海峰 on 16/7/14.
//  Copyright © 2016年 海峰. All rights reserved.
//

#import "kqTeacherPersonalBabyListCell.h"

@implementation kqTeacherPersonalBabyListCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void) initCellWithDic:(NSDictionary *) dic
{
    self.nameLabel.text = [dic valueForKey:@"babyName"];
    self.phoneLabel.text = [dic valueForKey:@"loginName"];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
