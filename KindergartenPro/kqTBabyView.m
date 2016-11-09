//
//  kqTBabyView.m
//  KindergartenPro
//
//  Created by 海峰 on 14-9-3.
//  Copyright (c) 2014年 海峰. All rights reserved.
//

#import "kqTBabyView.h"

@implementation kqTBabyView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (IBAction)tapBabyView:(id)sender {
    self.dependOnViewController.hidesBottomBarWhenPushed = YES;
//    kqBabyOperationViewController *boVC = [[kqBabyOperationViewController alloc] initWithNibName:@"kqBabyOperationViewController" bundle:nil];
//    boVC.title = [self.dataDictionary valueForKey:@"babyName"];
//    boVC.babyStateString = self.BabyState.text;
//    boVC.delegate = self;
//    boVC.dataDictionary = [NSMutableDictionary dictionaryWithDictionary:self.dataDictionary];
//    [self.dependOnViewController.navigationController pushViewController:boVC animated:YES];
    
    kqBabySignInDetailViewController *boVC = [[kqBabySignInDetailViewController alloc] initWithNibName:@"kqBabySignInDetailViewController" bundle:nil];
    boVC.title = [self.dataDictionary valueForKey:@"babyName"];
    boVC.isBaby = NO;
    boVC.babyId = [self.dataDictionary valueForKey:@"id"];
    boVC.dataDictionary = [NSMutableDictionary dictionaryWithDictionary:self.dataDictionary];
    [self.dependOnViewController.navigationController pushViewController:boVC animated:YES];
}

#pragma mark - changeStatues
-(void)changeBabyStatuesWithState:(NSString *)state
{
    if ([state isEqualToString:@"未记录"]) {
        self.YichangImageView.hidden = NO;
    }else{
        self.YichangImageView.hidden = YES;
    }
    self.BabyState.text = state;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end