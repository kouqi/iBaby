//
//  kqLoginViewController.m
//  KindergartenPro
//
//  Created by 海峰 on 14-8-7.
//  Copyright (c) 2014年 海峰. All rights reserved.
//

#import "kqLoginViewController.h"

@interface kqLoginViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;
@property (weak, nonatomic) IBOutlet UIImageView *inputBackground;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UIView *backgroundVView;
@property (assign, nonatomic) BOOL isRemeberPassword,isShowPassword;
@property (weak, nonatomic) IBOutlet UIImageView *remeberImageView;
@property (weak, nonatomic) IBOutlet UIImageView *showImageView;
@end

@implementation kqLoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (IBAction)tapRemeberPasswordView:(UITapGestureRecognizer *)sender {
    self.isRemeberPassword = !self.isRemeberPassword;
    if (self.isRemeberPassword) {
        [self.remeberImageView setImage:[UIImage imageNamed:@"dl_jzmm2.png"]];
    }else{
        [self.remeberImageView setImage:[UIImage imageNamed:@"dl_jzmm1.png"]];
    }
}

- (IBAction)tapShowPasswordView:(UITapGestureRecognizer *)sender {
    self.isShowPassword = !self.isShowPassword;
    if (self.isShowPassword) {
        [self.showImageView setImage:[UIImage imageNamed:@"dl_jzmm2.png"]];
        self.passwordTextField.secureTextEntry = NO;
    }else{
        [self.showImageView setImage:[UIImage imageNamed:@"dl_jzmm1.png"]];
        self.passwordTextField.secureTextEntry = YES;
    }
}

-(void)loginDelegate:(NSDictionary *)dic
{
    [self.delegate loginSuccessedWithDic:dic];
}

- (IBAction)tapLoginButton:(id)sender {
    if ([self checkUserNameTextField]) {
        NSDictionary *userInfo = nil;
        if ([self checkPassword]) {
            if (self.isRemeberPassword) {
                userInfo = [NSDictionary dictionaryWithObjectsAndKeys:self.userNameTextField.text,@"userName",self.passwordTextField.text,@"password",[NSNumber numberWithBool:self.isRemeberPassword],@"remeber",[NSNumber numberWithBool:self.isShowPassword],@"show", nil];
            }else{
                userInfo = [NSDictionary dictionaryWithObjectsAndKeys:self.userNameTextField.text,@"userName",[NSNumber numberWithBool:self.isRemeberPassword],@"remeber",[NSNumber numberWithBool:self.isShowPassword],@"show",nil];
            }
            NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
            [userDefault setObject:userInfo forKey:@"login"];
            [userDefault synchronize];
            [self.userNameTextField resignFirstResponder];
            [self.passwordTextField resignFirstResponder];
            HNADownLoadManager *dlm = [HNADownLoadManager sharedDownLoadManager];
            dlm.delegate = self;
            [dlm loginWithUserName:self.userNameTextField.text andPassword:self.passwordTextField.text andAutoLogin:NO];
            [HNAGeneral showOnWindow:@"登录中"];
        }
    }
}

-(BOOL) checkUserNameTextField
{
    if ([self.userNameTextField.text isEqualToString:@""]) {
        [HNAGeneral showAlertViewWithTitle:nil andMessage:@"用户名不能为空，请重新输入！"];
        return NO;
    }
    return YES;
}

-(BOOL) checkPassword
{
    if ([self.passwordTextField.text isEqualToString:@""]) {
        [HNAGeneral showAlertViewWithTitle:nil andMessage:@"密码不能为空，请重新输入！"];
        return NO;
    }else{
//        if (self.passwordTextField.text.length < 6) {
//            [HNAGeneral showAlertViewWithTitle:nil andMessage:@"密码要大于6位！"];
//            return NO;
//        }
    }
    return YES;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
    // Do any additional setup after loading the view from its nib.
}

-(void) setRemeber:(BOOL) isRemeber andShow:(BOOL) isShow
{
    self.isRemeberPassword = isRemeber;
    if (self.isRemeberPassword) {
        [self.remeberImageView setImage:[UIImage imageNamed:@"dl_jzmm2.png"]];
    }else{
        [self.remeberImageView setImage:[UIImage imageNamed:@"dl_jzmm1.png"]];
    }
    self.isShowPassword = isShow;
    if (self.isShowPassword) {
        [self.showImageView setImage:[UIImage imageNamed:@"dl_jzmm2.png"]];
        self.passwordTextField.secureTextEntry = NO;
    }else{
        [self.showImageView setImage:[UIImage imageNamed:@"dl_jzmm1.png"]];
        self.passwordTextField.secureTextEntry = YES;
    }
}

-(void) keyboardWillShow:(NSNotification *)note
{
	CGRect keyboardBounds;
    [[note.userInfo valueForKey:UIKeyboardFrameEndUserInfoKey] getValue: &keyboardBounds];
    keyboardBounds = [self.view convertRect:keyboardBounds toView:nil];
    NSNumber *duration = [note.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey];
    NSNumber *curve = [note.userInfo objectForKey:UIKeyboardAnimationCurveUserInfoKey];
    [UIView beginAnimations:nil context:NULL];
	[UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:[duration doubleValue]];
    [UIView setAnimationCurve:[curve intValue]];
	self.backgroundVView.frame = CGRectMake(0, 0 - keyboardBounds.size.height + [HNAGeneral fixIP5:5], 320, 568);
	[UIView commitAnimations];
}

-(void) keyboardWillHide:(NSNotification *)note
{
    NSNumber *duration = [note.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey];
    NSNumber *curve = [note.userInfo objectForKey:UIKeyboardAnimationCurveUserInfoKey];
    [UIView beginAnimations:nil context:NULL];
	[UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:[duration doubleValue]];
    [UIView setAnimationCurve:[curve intValue]];
	self.backgroundVView.frame = CGRectMake(0, 0, 320, 568);
	[UIView commitAnimations];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
