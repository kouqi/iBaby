//
//  kqWonderfulMomentCell.h
//  KindergartenPro
//
//  Created by 海峰 on 14-8-7.
//  Copyright (c) 2014年 海峰. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol kqWonderfulMomentCellDelegate <NSObject>
-(void) didTapWonderfulMomentCellWithViewImage:(UIImageView *) imageView andNumberImage:(NSUInteger) allNumberIndex;
@end


@interface kqWonderfulMomentCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *wmImageView;
@property (weak, nonatomic) IBOutlet UIImageView *teacherImageView;
@property (weak, nonatomic) IBOutlet UILabel *dayLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *hourLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *describeLabelHeightCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *wmImageHeightConstraint;
@property (strong, nonatomic) NSDictionary *dic;
@property (assign, nonatomic) id<kqWonderfulMomentCellDelegate>delegate;
-(void) initCellWithDictionary:(NSDictionary *) dic andPhotoUrlString:(NSString *) photoUrlString;
@end
