//
//  kqTeacherPersonalBabyListCell.h
//  KindergartenPro
//
//  Created by 程海峰 on 16/7/14.
//  Copyright © 2016年 海峰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface kqTeacherPersonalBabyListCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *relationImageView;
@property (weak, nonatomic) IBOutlet UILabel *phoneLabel;
-(void) initCellWithDic:(NSDictionary *) dic;
@end
