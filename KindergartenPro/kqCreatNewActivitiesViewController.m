//
//  kqCreatNewActivitiesViewController.m
//  KindergartenPro
//
//  Created by 海峰 on 14-10-15.
//  Copyright (c) 2014年 海峰. All rights reserved.
//

#import "kqCreatNewActivitiesViewController.h"

@interface kqCreatNewActivitiesViewController ()
@property (weak, nonatomic) IBOutlet UIView *backView;
@property(strong, nonatomic) NSString *startDateString,*endDateString;
@property (weak, nonatomic) IBOutlet UIButton *startDateButton;
@property (weak, nonatomic) IBOutlet UIButton *endDateButton;
@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextView *contentTextView;
@property (assign, nonatomic) BOOL isStart;
@property (assign, nonatomic) NSInteger keyboardHeight;
@end

@implementation kqCreatNewActivitiesViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (IBAction)tapView:(id)sender {
    [self.titleTextField resignFirstResponder];
    [self.contentTextView resignFirstResponder];
}

#pragma mark - TextFieldDelegate & TextViewDelegate 
-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    self.backView.frame = CGRectMake(0, 0, self.backView.frame.size.width, SCREEN_H - 64);
    return YES;
}

-(BOOL)textViewShouldBeginEditing:(UITextView *)textView
{
    self.backView.frame = CGRectMake(0, 10 - 190 + (SCREEN_H - 64 - self.contentTextView.frame.size.height - self.keyboardHeight - 20), self.backView.frame.size.width, SCREEN_H - 64);
    return YES;
}

#pragma mark - keyBoardNotification

-(void) keyboardWillShow:(NSNotification *)note
{
	CGRect keyboardBounds;
    [[note.userInfo valueForKey:UIKeyboardFrameEndUserInfoKey] getValue: &keyboardBounds];
    keyboardBounds = [self.view convertRect:keyboardBounds toView:nil];
    self.keyboardHeight = keyboardBounds.size.height;
    NSNumber *duration = [note.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey];
    NSNumber *curve = [note.userInfo objectForKey:UIKeyboardAnimationCurveUserInfoKey];
    [UIView beginAnimations:nil context:NULL];
	[UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:[duration doubleValue]];
    [UIView setAnimationCurve:[curve intValue]];
    if([self.contentTextView isFirstResponder]){
        self.backView.frame = CGRectMake(0, 10 - 190 + (SCREEN_H - 64 - self.contentTextView.frame.size.height - keyboardBounds.size.height - 20), self.backView.frame.size.width, SCREEN_H - 64);
    }
	[UIView commitAnimations];
}

-(void) keyboardWillHide:(NSNotification *)note
{
    self.keyboardHeight = 0.0f;
    NSNumber *duration = [note.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey];
    NSNumber *curve = [note.userInfo objectForKey:UIKeyboardAnimationCurveUserInfoKey];
    [UIView beginAnimations:nil context:NULL];
	[UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:[duration doubleValue]];
    [UIView setAnimationCurve:[curve intValue]];
    self.backView.frame = CGRectMake(0, 10, self.backView.frame.size.width, SCREEN_H - 64);
	[UIView commitAnimations];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.startDateString = [NSString stringWithFormat:@"08:00:00"];
    self.endDateString = [NSString stringWithFormat:@"09:00:00"];
    [self.startDateButton setTitle:self.startDateString forState:UIControlStateNormal];
    [self.endDateButton setTitle:self.endDateString forState:UIControlStateNormal];
//    UIImageView *topView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"wave.png"]];
//    topView.frame = CGRectMake(0, 0, 320, 10);
//    [self.view addSubview:topView];
    [self initTopBar];
    self.contentTextView.layer.borderColor = [UIColor blackColor].CGColor;
    self.contentTextView.layer.borderWidth = 1.0f;
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

-(void) initTopBar
{
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftButton addTarget:self action:@selector(tapBackButton) forControlEvents:UIControlEventTouchUpInside];
    leftButton.frame =CGRectMake(0.0f, 6.0f, 23.0f, 23.0f);
    [leftButton setImage:[UIImage imageNamed:@"leftBack.png"] forState:UIControlStateNormal];
    UIBarButtonItem* left = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
    self.navigationItem.leftBarButtonItem = left;
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightButton addTarget:self action:@selector(tapCompletedButton) forControlEvents:UIControlEventTouchUpInside];
    rightButton.frame =CGRectMake(0.0f, 10.5f, 25.0f, 25.0f);
    [rightButton setImage:[UIImage imageNamed:@"completed.png"] forState:UIControlStateNormal];
    UIBarButtonItem* right = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
    self.navigationItem.rightBarButtonItem = right;
}

-(BOOL) checkOut
{
    if (!(self.titleTextField.text == nil || [self.titleTextField.text isEqualToString:@""])) {
        if (self.titleTextField.text.length <= 16) {
            if (!(self.contentTextView.text == nil || [self.contentTextView.text isEqualToString:@""] || [self.contentTextView.text isEqualToString:@""])) {
                if (!([self.startDateString isEqualToString:@""] || self.startDateString == nil)) {
                    if (!([self.endDateString isEqualToString:@""] || self.endDateString == nil)) {
                        return YES;
                    }else{
                        [HNAGeneral showAlertViewWithTitle:@"提示" andMessage:@"请选择活动结束时间！"];
                        return NO;
                    }
                }else{
                    [HNAGeneral showAlertViewWithTitle:@"提示" andMessage:@"请选择活动开始时间！"];
                    return NO;
                }
            }else{
                [HNAGeneral showAlertViewWithTitle:@"提示" andMessage:@"请输入内容！"];
                return NO;
            }
        }else{
            [HNAGeneral showAlertViewWithTitle:@"提示" andMessage:@"标题不能超过16个字！"];
            return NO;
        }
    }else{
        [HNAGeneral showAlertViewWithTitle:@"提示" andMessage:@"请输入标题！"];
        return NO;
    }
}

-(void) tapCompletedButton
{
    if ([self checkOut]) {
        [HNAGeneral showOnWindow:@"保存中"];
        HNADownLoadManager *dl = [HNADownLoadManager sharedDownLoadManager];
        dl.delegate = self;
        [dl teacherSaveWeekActivityWithActivityTitle:self.titleTextField.text andActivityContent:self.contentTextView.text andActivityDate:self.activityDate andActivityTime:self.startDateString];
    }
}

-(void)teacherSaveWeekActivityDelegate:(NSDictionary *)dic
{
    [HNAGeneral hidenHUD];
    NSDictionary *dataMap = [dic valueForKey:@"dataMap"];
    if ([[dataMap valueForKey:@"state"] isEqualToString:SU]) {
        [HNAGeneral showAlertViewWithTitle:nil andMessage:[dataMap valueForKey:@"stateMsg"]];
        [self.navigationController popViewControllerAnimated:YES];
    }else if ([[dataMap valueForKey:@"state"] isEqualToString:ER]){
        [HNAGeneral showAlertViewWithTitle:nil andMessage:[dataMap valueForKey:@"stateMsg"]];
    }
}

-(void) tapBackButton
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - 选择日期
- (IBAction)tapSelectStartDateButton:(id)sender {
    self.isStart = YES;
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"HH:mm:ss"];
    kqDatePickerView *datePickerView = [[[NSBundle mainBundle] loadNibNamed:@"kqDatePickerView" owner:self options:nil] objectAtIndex:0];
    datePickerView.datePicker.date = [formatter dateFromString:self.startDateString];
    datePickerView.frame = CGRectMake(0, 10, 320, 568);
    datePickerView.delegate = self;
    datePickerView.datePicker.datePickerMode = UIDatePickerModeTime;
    [self.view addSubview:datePickerView];
}

- (IBAction)tapSelectEndDateButton:(id)sender {
    self.isStart = NO;
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"HH:mm:ss"];
    kqDatePickerView *datePickerView = [[[NSBundle mainBundle] loadNibNamed:@"kqDatePickerView" owner:self options:nil] objectAtIndex:0];
    datePickerView.datePicker.date = [formatter dateFromString:self.endDateString];
    datePickerView.frame = CGRectMake(0, 10, 320, 568);
    datePickerView.delegate = self;
    datePickerView.datePicker.datePickerMode = UIDatePickerModeTime;
    [self.view addSubview:datePickerView];
}

#pragma mark - datePickerViewDelegate
-(void)didChoseDate:(NSDate *)date WithView:(UIView *)datePickerView
{
    FORMATTER;
    [formatter setDateFormat:@"HH:mm:ss"];
    NSString *dateString = [formatter stringFromDate:date];
    if (self.isStart) {
        self.startDateString = dateString;
        [self.startDateButton setTitle:self.startDateString forState:UIControlStateNormal];
        [self.endDateButton setTitle:self.endDateString forState:UIControlStateNormal];
    }else{
        self.endDateString = dateString;
        [self.endDateButton setTitle:self.endDateString forState:UIControlStateNormal];
    }
    [datePickerView removeFromSuperview];
}

-(void)didCacelChoseDateWithView:(UIView *)datePickerView
{
    [datePickerView removeFromSuperview];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}

@end
