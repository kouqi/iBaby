//
//  kqOneKeySignTbabyView.m
//  KindergartenPro
//
//  Created by 海峰 on 15/3/16.
//  Copyright (c) 2015年 海峰. All rights reserved.
//

#import "kqOneKeySignTbabyView.h"

@implementation kqOneKeySignTbabyView

-(void)initOneKeySign
{
    kqDistingKindergartenAndSchool *dkas = [kqDistingKindergartenAndSchool sharedDistingKindergartenAndSchool];
    self.isSelected = NO;
    self.nameLabel.text = [self.dataDictionary valueForKey:@"babyName"];
    int state = [[self.dataDictionary valueForKey:@"babyState"] intValue];
    NSString *stateText;
    switch (state) {
        case 0:
            stateText = dkas.signIn;
            break;
        case 1:
            stateText = dkas.signOut;
            break;
        case 2:
            stateText = @"病假";
            break;
        case 3:
            stateText = @"事假";
            break;
        case 4:
            stateText = @"未纪录";
            break;
        default:
            break;
    }
    self.headerImageView.layer.cornerRadius = 21.0f;
    self.headerImageView.layer.masksToBounds = YES;
    [self.headerImageView setImageWithURL:[NSURL URLWithString:[self.dataDictionary valueForKey:@"imgPath"]] placeholderImage:[UIImage imageNamed:@"tbabyDefaultHeadImage.png"]];
    self.stateLabel.text = stateText;
    self.selectedImageView.image = [UIImage imageNamed:@"stateUnSelected.png"];
}

- (IBAction)tapTheSelectedView:(UITapGestureRecognizer *)sender {
    self.isSelected = !self.isSelected;
    if (self.isSelected) {
        self.selectedImageView.image = [UIImage imageNamed:@"stateSelected.png"];
    }else{
        self.selectedImageView.image = [UIImage imageNamed:@"stateUnSelected.png"];
    }
    [self.delegate didTapSelectedImageViewWithViewTag:self.tag andFlag:self.isSelected];
}

-(void) setViewSelectedWith:(BOOL) isSelected
{
    self.isSelected = isSelected;
    if (self.isSelected) {
        self.selectedImageView.image = [UIImage imageNamed:@"stateSelected.png"];
    }else{
        self.selectedImageView.image = [UIImage imageNamed:@"stateUnSelected.png"];
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
