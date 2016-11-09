//
//  kqCreatNewDayFoodViewController.m
//  KindergartenPro
//
//  Created by 海峰 on 14-10-9.
//  Copyright (c) 2014年 海峰. All rights reserved.
//

#import "kqCreatNewDayFoodViewController.h"
@interface kqCreatNewDayFoodViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *breakfastImageView;
@property (weak, nonatomic) IBOutlet UIImageView *lunchImageView;
@property (weak, nonatomic) IBOutlet UIImageView *dinnerImageView;
@property (weak, nonatomic) IBOutlet UITextView *menuTextView;
@property (weak, nonatomic) IBOutlet UIButton *addPhotoButton;
@property (weak, nonatomic) IBOutlet UIImageView *firstImageView;
@property (weak, nonatomic) IBOutlet UIImageView *secondImageView;
@property (weak, nonatomic) IBOutlet UIImageView *thirdImageView;
@property (assign, nonatomic) int photoNumber;
@property (weak, nonatomic) IBOutlet UIView *backView;
@property (strong, nonatomic) NSMutableArray *imageArray;
@property (assign, nonatomic) NSInteger imageViewTag;
@property (strong, nonatomic) NSString *mealType;
@end

@implementation kqCreatNewDayFoodViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
//    UIImageView *topView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"wave.png"]];
//    topView.frame = CGRectMake(0, 0, 320, 10);
//    [self.view addSubview:topView];
    self.menuTextView.layer.borderWidth = 0.5f;
    self.menuTextView.layer.borderColor = [UIColor blackColor].CGColor;
    self.addPhotoButton.layer.borderWidth = 0.5f;
    self.addPhotoButton.layer.borderColor = [UIColor blackColor].CGColor;
    self.photoNumber = 3;
    [self initTopBar];
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

-(BOOL)checkOut
{
    if (!(self.mealType == nil || [self.mealType isEqualToString:@""])) {
        if (!(self.menuTextView.text == nil || [self.menuTextView.text isEqualToString:@""] || [self.menuTextView.text isEqualToString:@"早餐..."])) {
            return YES;
        }else{
            [HNAGeneral showAlertViewWithTitle:@"提示" andMessage:@"请填写食谱！"];
            return NO;
        }
    }else{
        [HNAGeneral showAlertViewWithTitle:@"提示" andMessage:@"请选择食谱类型！"];
        return NO;
    }
}

-(void) tapCompletedButton
{
    if ([self checkOut]) {
        [HNAGeneral showOnWindow:@"保存中"];
        HNADownLoadManager *dl = [HNADownLoadManager sharedDownLoadManager];
        dl.delegate = self;
        [dl teacherSaveWeekFoodWithActivityTitle:self.mealType andActivityContent:self.menuTextView.text andMealType:self.mealType andActivityDate:self.activityDate andImageArray:self.imageArray];
    }
}

-(void)teacherSaveWeekFoodDelegate:(NSDictionary *)dic
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

#pragma mark - keyBoardNotification

- (IBAction)tapBackView:(UITapGestureRecognizer *)sender {
    [self.menuTextView resignFirstResponder];
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
    self.backView.frame = CGRectMake(0, 10 - 60 , self.backView.frame.size.width, SCREEN_H - 64);
    if ([self.menuTextView.text isEqualToString:@"早餐..."]) {
        self.menuTextView.text = @"";
    }
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
    self.backView.frame = CGRectMake(0, 10, self.backView.frame.size.width, SCREEN_H - 64);
	[UIView commitAnimations];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 选择食谱类型
- (IBAction)tapSelectFoodType:(UITapGestureRecognizer *)sender {
    UIView *view = sender.view;
    int tag = view.tag;
    switch (tag) {
        case 1000:
        {
            self.breakfastImageView.highlighted = !self.breakfastImageView.highlighted;
            self.lunchImageView.highlighted = NO;
            self.dinnerImageView.highlighted = NO;
            self.mealType = @"0";
        }
            break;
        case 1001:
        {
            self.lunchImageView.highlighted = !self.lunchImageView.highlighted;
            self.breakfastImageView.highlighted = NO;
            self.dinnerImageView.highlighted = NO;
            self.mealType = @"1";
        }
            break;
        case 1002:
        {
            self.dinnerImageView.highlighted = !self.dinnerImageView.highlighted;
            self.lunchImageView.highlighted = NO;
            self.breakfastImageView.highlighted = NO;
            self.mealType = @"2";
        }
            break;
            
        default:
            break;
    }
}

#pragma mark - 上传图片
- (IBAction)tapAddPhotoButton:(id)sender {
    if (self.photoNumber == 0) {
        [[[UIAlertView alloc] initWithTitle:nil message:@"最多上传3张照片" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil] show];
        return;
    }
    kqTakePhotoViewController *pVC = [[kqTakePhotoViewController alloc] initWithNibName:@"kqTakePhotoViewController" bundle:nil];
    pVC.isFood = YES;
    pVC.delegate = self;
    pVC.photoNumber = self.photoNumber;
    [self presentViewController:pVC animated:NO completion:^{
        pVC.imagePickerController = [[UIImagePickerController alloc] init];
        pVC.imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
        pVC.imagePickerController.showsCameraControls = NO;
        pVC.imagePickerController.delegate = pVC;
        pVC.imagePickerController.allowsEditing = NO;
        [pVC addViewToCamera];
        [pVC presentViewController:pVC.imagePickerController animated:NO completion:^{}];
    }];
}

-(void)didSelectImageWithArray:(NSMutableArray *)array
{
    self.photoNumber = self.photoNumber - array.count;
    if (self.imageArray == nil) {
        self.imageArray = [NSMutableArray array];
    }
    [self.imageArray addObjectsFromArray:array];
    [self initImageView];
}

-(void)initImageView
{
    switch (self.imageArray.count) {
        case 0:
        {
            self.firstImageView.hidden = YES;
            self.secondImageView.hidden = YES;
            self.thirdImageView.hidden = YES;
        }
            break;
        case 1:
        {
            self.firstImageView.image = [self.imageArray objectAtIndex:0];
            self.firstImageView.hidden = NO;
            self.secondImageView.hidden = YES;
            self.thirdImageView.hidden = YES;
        }
            break;
        case 2:
        {
            self.firstImageView.image = [self.imageArray objectAtIndex:0];
            self.firstImageView.hidden = NO;
            self.secondImageView.image = [self.imageArray objectAtIndex:1];
            self.secondImageView.hidden = NO;
            self.thirdImageView.hidden = YES;
        }
            break;
        case 3:
        {
            self.firstImageView.image = [self.imageArray objectAtIndex:0];
            self.firstImageView.hidden = NO;
            self.secondImageView.image = [self.imageArray objectAtIndex:1];
            self.secondImageView.hidden = NO;
            self.thirdImageView.image = [self.imageArray objectAtIndex:2];
            self.thirdImageView.hidden = NO;
        }
            break;
        default:
            break;
    }

}

- (IBAction)longPressImageView:(UILongPressGestureRecognizer *)sender {
    switch (sender.state)
    {
        case UIGestureRecognizerStateEnded:
        {
            UIView *view = sender.view;
            int tag = view.tag;
            self.imageViewTag = tag;
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"确定要删除图片？" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
            [alertView show];
        }
            break;
        case UIGestureRecognizerStateCancelled:
            
            break;
        case UIGestureRecognizerStateFailed:
            
            break;
        case UIGestureRecognizerStateBegan:
            
            break;
        case UIGestureRecognizerStateChanged:
            
            break;
        default:
            break;
    }
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSLog(@"------------%ld",(long)buttonIndex);
    if (buttonIndex == 1) {
        switch (self.imageViewTag) {
            case 1000:
            {
                [self.imageArray removeObjectAtIndex:0];
            }
                break;
            case 1001:
            {
                [self.imageArray removeObjectAtIndex:1];
            }
                break;
            case 1002:
            {
                [self.imageArray removeObjectAtIndex:2];
            }
                break;
            default:
                break;
        }
        [self initImageView];
        self.photoNumber++;
    }
}


@end
