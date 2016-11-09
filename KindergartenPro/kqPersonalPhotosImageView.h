//
//  kqPersonalPhotosImageView.h
//  KindergartenPro
//
//  Created by 海峰 on 15/3/10.
//  Copyright (c) 2015年 海峰. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol kqPersonalPhotosImageViewSelectedDelegate <NSObject>

-(void) didTapSelectedImageViewWithViewTag:(NSInteger ) viewTag andFlag:(BOOL) isSelected;
-(void) didTapSelectedImageViewWithViewImage:(UIImageView *) imageView;
@end








@interface kqPersonalPhotosImageView : UIView
@property (weak, nonatomic) IBOutlet UIImageView *mainImageView;
@property (weak, nonatomic) IBOutlet UIImageView *selectedImageView;
@property (assign, nonatomic) BOOL isDeleteMode,isSelected;
@property (assign, nonatomic) NSInteger viewTag;
@property (assign, nonatomic) id<kqPersonalPhotosImageViewSelectedDelegate>delegate;
-(void) initImageViewWithImageUrl:(NSString *) imageUrl;
-(void) setImageViewModeWithMode:(BOOL) isDeleteMode;
@end
