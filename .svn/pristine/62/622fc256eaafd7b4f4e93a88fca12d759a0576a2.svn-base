//
//  kqLoginViewController.h
//  KindergartenPro
//
//  Created by 海峰 on 14-8-7.
//  Copyright (c) 2014年 海峰. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LoginSucessedDelegate <NSObject>

-(void) loginSuccessedWithDic:(NSDictionary *) dic;

@end




@interface kqLoginViewController : UIViewController<HNADownLoadDelegate>
@property (weak, nonatomic) IBOutlet UITextField *userNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (assign, nonatomic) id<LoginSucessedDelegate>delegate;
-(void) setRemeber:(BOOL) isRemeber andShow:(BOOL) isShow;
@end
