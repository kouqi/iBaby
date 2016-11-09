//
//  kqWeekFoodCell.h
//  KindergartenPro
//
//  Created by 海峰 on 14-8-6.
//  Copyright (c) 2014年 海峰. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^tapMondayButton_Block) (NSDictionary *dic);
typedef void (^tapTuesdayButton_Block) (NSDictionary *dic);
typedef void (^tapWednesdayButton_Block) (NSDictionary *dic);
typedef void (^tapThursdayButton_Block) (NSDictionary *dic);
typedef void (^tapFridayButton_Block) (NSDictionary *dic);
@interface kqWeekFoodCell : UITableViewCell
{
    tapMondayButton_Block mondayBlock;
    tapTuesdayButton_Block tuesdayBlock;
    tapWednesdayButton_Block wednesdayBlock;
    tapThursdayButton_Block thursdayBlock;
    tapFridayButton_Block fridayBlock;
}
@property (weak, nonatomic) IBOutlet UILabel *dateIntervalLabel;
@property (weak, nonatomic) IBOutlet UILabel *stateLabel;

@property (strong, nonatomic) NSString *mondayDateString,*tuesdayDateString,*wednesdayDateString,*thursdayDateString,*fridayDateString;
@property (strong, nonatomic) NSDictionary *mondayDictionary,*tuesdayDictionary,*wednesdayDictionary,*thursdayDictionary,*fridayDictionary,*headerDictionary;
-(void) setTapMondayButton_Block:(tapMondayButton_Block) block;
-(void) setTapTuesdayButton_Block:(tapTuesdayButton_Block) block;
-(void) setTapWednesdayButton_Block:(tapWednesdayButton_Block) block;
-(void) setTapThursdayButton_Block:(tapThursdayButton_Block) block;
-(void) setTapFridayButton_Block:(tapFridayButton_Block) block;
@end
