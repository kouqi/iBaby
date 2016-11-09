//
//  kqTBabyInfomationTableViewCell.h
//  KindergartenPro
//
//  Created by 海峰 on 14-9-25.
//  Copyright (c) 2014年 海峰. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TapCellButtonsDelegate <NSObject>

-(void) didTapCellSendButtonWithIndexPath:(NSIndexPath *) indexPath;
-(void) didTapCellDeleteButtonWithIndexPath:(NSIndexPath *) indexPath;

@end







@interface kqTBabyInfomationTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property(strong, nonatomic) NSIndexPath *indexPath;
@property(assign, nonatomic) id<TapCellButtonsDelegate>delegate;
@end
