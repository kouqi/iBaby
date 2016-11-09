//
//  kqPersonalPhotosImageView.m
//  KindergartenPro
//
//  Created by 海峰 on 15/3/10.
//  Copyright (c) 2015年 海峰. All rights reserved.
//

#import "kqPersonalPhotosImageView.h"

@implementation kqPersonalPhotosImageView

-(void) initImageViewWithImageUrl:(NSString *) imageUrl
{
    self.isSelected = NO;
    self.mainImageView.contentMode = UIViewContentModeScaleAspectFill;
    self.mainImageView.clipsToBounds = YES;
    [self.mainImageView setImageWithURL:[NSURL URLWithString:imageUrl] placeholderImage:nil];
    if (self.isDeleteMode) {
        self.selectedImageView.hidden = NO;
    }else{
        self.selectedImageView.hidden = YES;
    }
    
}

-(void) setImageViewModeWithMode:(BOOL) isDeleteMode
{
    self.isDeleteMode = isDeleteMode;
    if (self.isDeleteMode) {
        self.selectedImageView.hidden = NO;
        [self bringSubviewToFront:self.selectedImageView];
    }else{
        self.selectedImageView.hidden = YES;
    }
}

- (IBAction)tapSelectedImageView:(UITapGestureRecognizer *)sender {
    if (self.isDeleteMode) {
        self.isSelected = !self.isSelected;
        if (self.isSelected) {
            self.selectedImageView.image = [UIImage imageNamed:@"dl_jzmm2"];
        }else{
            self.selectedImageView.image = [UIImage imageNamed:@"dl_jzmm1"];
        }
        [self.delegate didTapSelectedImageViewWithViewTag:self.viewTag andFlag:self.isSelected];
    }else{
        if (self.mainImageView.image) {
            [self.delegate didTapSelectedImageViewWithViewImage:self.mainImageView];
        }
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
