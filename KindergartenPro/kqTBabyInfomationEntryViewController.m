//
//  kqTBabyInfomationEntryViewController.m
//  KindergartenPro
//
//  Created by 海峰 on 14-9-17.
//  Copyright (c) 2014年 海峰. All rights reserved.
//

#import "kqTBabyInfomationEntryViewController.h"

@interface kqTBabyInfomationEntryViewController ()
@property (strong, nonatomic) IBOutlet UITextView *messageTextView;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
//饮食
@property (strong, nonatomic) IBOutlet UIView *dietView;
@property (strong, nonatomic) NSString *dietString;
@property (weak, nonatomic) IBOutlet UIButton *dBto;
@property (weak, nonatomic) IBOutlet UIButton *dBtnt;
@property (weak, nonatomic) IBOutlet UIButton *dBtnr;
//饮水
@property (strong, nonatomic) NSString *drinkString;
@property (strong, nonatomic) IBOutlet UIView *drinkView;
@property (weak, nonatomic) IBOutlet UIButton *drinkNoButton;
@property (weak, nonatomic) IBOutlet UIButton *drinkTwoButton;
@property (weak, nonatomic) IBOutlet UIButton *drinkFiveButton;
@property (weak, nonatomic) IBOutlet UIButton *drinkThreeButton;
//睡眠
@property(strong, nonatomic) NSString *sleepString;
@property (strong, nonatomic) IBOutlet UIView *sleepView;
@property (weak, nonatomic) IBOutlet UIButton *sleepNoButton;
@property (weak, nonatomic) IBOutlet UIButton *sleepOneLessButton;
@property (weak, nonatomic) IBOutlet UIButton *sleepTwoMoreButton;
@property (weak, nonatomic) IBOutlet UIButton *sleepOneToTwoButton;
//大便
@property(strong, nonatomic) NSString *stoolString;
@property (strong, nonatomic) IBOutlet UIView *stoolView;
@property (weak, nonatomic) IBOutlet UIButton *stoolNoButton;
@property (weak, nonatomic) IBOutlet UIButton *stoolOneButton;
@property (weak, nonatomic) IBOutlet UIButton *stoolMoreButton;
//情绪
@property (strong, nonatomic) NSString *emotionString;
@property (strong, nonatomic) IBOutlet UIView *emotionView;
@property (weak, nonatomic) IBOutlet UIButton *emotionOneButton;
@property (weak, nonatomic) IBOutlet UIButton *emotionTwoButton;
@property (weak, nonatomic) IBOutlet UIButton *emotionThreeButton;
@property (weak, nonatomic) IBOutlet UIButton *emotionFourButton;
//异常
@property(strong, nonatomic) NSString *abnormalString;
@property(strong, nonatomic) NSMutableArray *abnormalArray;
@property (strong, nonatomic) IBOutlet UIView *abnormalView;
@property (weak, nonatomic) IBOutlet UIButton *abnormalKesouButton;
@property (weak, nonatomic) IBOutlet UIButton *abnormalGanmaoButton;
@property (weak, nonatomic) IBOutlet UIButton *abnormalFashaoButton;

@end

@implementation kqTBabyInfomationEntryViewController

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
    [self initTopBar];
    [self initButton];
    [self initScrollView];
//    UIImageView *topView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"wave.png"]];
//    topView.frame = CGRectMake(0, 0, 320, 10);
//    [self.view addSubview:topView];
    self.abnormalArray = [NSMutableArray array];
    [self initView];
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

-(void) initView
{
    if (self.dataDictionary) {
        NSString *jsonStr = [self.dataDictionary valueForKey:@"bookContent"];
        NSData *jsonData = [jsonStr dataUsingEncoding:NSUTF8StringEncoding];
        NSError *error = nil;
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
        NSDictionary *bookContent = [dic valueForKey:@"bookContent"];
        int fd = [[bookContent valueForKey:@"food"] intValue];
        switch (fd) {
            case 0:
            {
                self.dBto.selected = YES;
                self.dietString = @"胃口很好";
            }
                break;
            case 1:
            {
                self.dBtnt.selected = YES;
                self.dietString = @"正常饮食";
            }
                break;
            case 2:
            {
                self.dBtnr.selected = YES;
                self.dietString = @"饮食不佳";
            }
                break;
            default:
                break;
        }
        int dk = [[bookContent valueForKey:@"drink"] intValue];
        switch (dk) {
            case 0:
            {
                self.drinkNoButton.selected = YES;
                self.drinkString = @"没喝";
            }
                break;
            case 1:
            {
                self.drinkTwoButton.selected = YES;
                self.drinkString = @"1-2杯";
            }
                break;
            case 2:
            {
                self.drinkThreeButton.selected = YES;
                self.drinkString = @"3-4杯";
            }
                break;
            case 3:
            {
                self.drinkFiveButton.selected = YES;
                self.drinkString = @"5杯以上";
            }
                break;
            default:
                break;
        }
        int sp = [[bookContent valueForKey:@"sleep"] intValue];
        switch (sp) {
            case 0:
            {
                self.sleepNoButton.selected = YES;
                self.sleepString = @"没睡";
            }
                break;
            case 1:
            {
                self.sleepOneLessButton.selected = YES;
                self.sleepString = @"1小时以下";
            }
                break;
            case 2:
            {
                self.sleepOneToTwoButton.selected = YES;
                self.sleepString = @"1-2小时";
            }
                break;
            case 3:
            {
                self.sleepTwoMoreButton.selected = YES;
                self.sleepString = @"2小时以上";
            }
                break;
            default:
                break;
        }
        int sl = [[bookContent valueForKey:@"stool"] intValue];
        switch (sl) {
            case 0:
            {
                self.stoolNoButton.selected = YES;
                self.stoolString = @"0次";
            }
                break;
            case 1:
            {
                self.stoolOneButton.selected = YES;
                self.stoolString = @"1-2次";
            }
                break;
            case 2:
            {
                self.stoolMoreButton.selected = YES;
                self.stoolString = @"拉肚子";
            }
                break;
            default:
                break;
        }
        int em = [[bookContent valueForKey:@"emotion"] intValue];
        switch (em) {
            case 0:
            {
                self.emotionOneButton.selected = YES;
                self.emotionString = @"开心";
            }
                break;
            case 1:
            {
                self.emotionTwoButton.selected = YES;
                self.emotionString = @"低落";
            }
                break;
            case 2:
            {
                self.emotionThreeButton.selected = YES;
                self.emotionString = @"烦躁";
            }
                break;
            case 3:
            {
                self.emotionFourButton.selected = YES;
                self.emotionString = @"哭鼻子";
            }
                break;
            default:
                break;
        }
        NSString *str = [bookContent valueForKey:@"info"];
        if ([str isEqualToString:@""] || str == nil) {
            self.messageTextView.text = @"留言...";
        }else{
            self.messageTextView.text = str;
        }
        NSArray *arr = [bookContent valueForKey:@"Abnormal"];
        for (NSNumber *num in arr) {
            int ab = [num intValue];
            UIView *view = [self.abnormalView viewWithTag:1000 + ab];
            UIButton *la = (UIButton *) [view viewWithTag:1001];
            UIImageView *ima = (UIImageView *) [view viewWithTag:1000];
            ima.highlighted = YES;
//            [la titleForState:UIControlStateNormal]
            la.selected = YES;
            [self.abnormalArray addObject:la.titleLabel.text];
        }
    }
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

//TODO:接口
-(void) sendBabyHandDelegate:(NSDictionary *)dic
{
    [HNAGeneral hidenHUD];
    NSDictionary *dataMap = [dic valueForKey:@"dataMap"];
    NSString *state = [dataMap valueForKey:@"state"];
    if ([state isEqualToString:SU]) {
        [self.delegate didFabuHandBookSucessWithTitle:[dic valueForKey:@"bookContent"]];
        [self.navigationController popViewControllerAnimated:YES];
    }else if([state isEqualToString:ER]){
        [HNAGeneral showAlertViewWithTitle:@"提示" andMessage:[dataMap valueForKey:@"stateMsg"]];
    }
}

-(void) tapCompletedButton
{
    if (self.dietString == nil) {
        [HNAGeneral showAlertViewWithTitle:nil andMessage:@"请选择饮食！"];
    }else if (self.drinkString == nil) {
        [HNAGeneral showAlertViewWithTitle:nil andMessage:@"请选择饮水！"];
    }else if (self.sleepString == nil) {
        [HNAGeneral showAlertViewWithTitle:nil andMessage:@"请选择睡眠！"];
    }else if (self.stoolString == nil) {
        [HNAGeneral showAlertViewWithTitle:nil andMessage:@"请选择大便！"];
    }else if (self.emotionString == nil) {
        [HNAGeneral showAlertViewWithTitle:nil andMessage:@"请选择情绪！"];
    }else{
        [HNAGeneral showOnWindow:@"发布中"];
        NSString *bookContent = [self getJsonValue];
        HNADownLoadManager *dl = [HNADownLoadManager sharedDownLoadManager];
        dl.delegate = self;
        if (self.dataDictionary) {
            NSString *bookId = [self.dataDictionary valueForKey:@"sadasda"];
            [dl sendBabyHandWithBookID:bookId andBookTitle:@"" andBookContent:@"" andBabyId:@""];
        }else{
            [dl sendBabyHandWithBookID:nil andBookTitle:self.dietString andBookContent:bookContent andBabyId:self.babyId];
        }
    }
}

-(NSString *) getJsonValue
{
    NSMutableString *jsonStr = [NSMutableString string];
    [jsonStr appendString:@"{\"bookContent\":{\"food\":"];
    NSNumber *fdNu = [NSNumber numberWithInt:-1];
    if ([self.dietString isEqualToString:@"胃口很好"]) {
        fdNu = [NSNumber numberWithInt:0];
    }else if([self.dietString isEqualToString:@"正常饮食"]){
        fdNu = [NSNumber numberWithInt:1];
    }else if([self.dietString isEqualToString:@"饮食不佳"]){
        fdNu = [NSNumber numberWithInt:2];
    }
    [jsonStr appendFormat:@"%@,\"drink\":",fdNu];
    NSNumber *dkNu = [NSNumber numberWithInt:-1];
    if ([self.drinkString isEqualToString:@"没喝"]) {
        dkNu = [NSNumber numberWithInt:0];
    }else if([self.drinkString isEqualToString:@"1-2杯"]){
        dkNu = [NSNumber numberWithInt:1];
    }else if([self.drinkString isEqualToString:@"3-4杯"]){
        dkNu = [NSNumber numberWithInt:2];
    }else if([self.drinkString isEqualToString:@"5杯以上"]){
        dkNu = [NSNumber numberWithInt:3];
    }
    [jsonStr appendFormat:@"%@,\"sleep\":",dkNu];
    NSNumber *spNu = [NSNumber numberWithInt:-1];
    if ([self.sleepString isEqualToString:@"没睡"]) {
        spNu = [NSNumber numberWithInt:0];
    }else if([self.sleepString isEqualToString:@"1小时以下"]){
        spNu = [NSNumber numberWithInt:1];
    }else if([self.sleepString isEqualToString:@"1-2小时"]){
        spNu = [NSNumber numberWithInt:2];
    }else if([self.sleepString isEqualToString:@"2小时以上"]){
        spNu = [NSNumber numberWithInt:3];
    }
    [jsonStr appendFormat:@"%@,\"stool\":",spNu];
    NSNumber *slNu = [NSNumber numberWithInt:-1];
    if ([self.stoolString isEqualToString:@"0次"]) {
        slNu = [NSNumber numberWithInt:0];
    }else if([self.stoolString isEqualToString:@"1-2次"]){
        slNu = [NSNumber numberWithInt:1];
    }else if([self.stoolString isEqualToString:@"拉肚子"]){
        slNu = [NSNumber numberWithInt:2];
    }
    [jsonStr appendFormat:@"%@,\"emotion\":",slNu];
    NSNumber *emNu = [NSNumber numberWithInt:-1];
    if ([self.emotionString isEqualToString:@"开心"]) {
        emNu = [NSNumber numberWithInt:0];
    }else if([self.emotionString isEqualToString:@"低落"]){
        emNu = [NSNumber numberWithInt:1];
    }else if([self.emotionString isEqualToString:@"烦躁"]){
        emNu = [NSNumber numberWithInt:2];
    }else if([self.emotionString isEqualToString:@"哭鼻子"]){
        emNu = [NSNumber numberWithInt:3];
    }
    [jsonStr appendFormat:@"%@,\"Abnormal\":[",emNu];
    
//    if (self.abnormalArray.count != 0) {
//        NSMutableString *as = [NSMutableString string];
//        for (NSString *astr in self.abnormalArray) {
//            
//            if ([astr isEqualToString:@"咳嗽"]) {
//                asNu = [NSNumber numberWithInt:0];
//            }else if([astr isEqualToString:@"流鼻涕"]){
//                asNu = [NSNumber numberWithInt:1];
//            }else if([astr isEqualToString:@"呕吐"]){
//                asNu = [NSNumber numberWithInt:2];
//            }else if([astr isEqualToString:@"发烧"]){
//                asNu = [NSNumber numberWithInt:3];
//            }else if([astr isEqualToString:@"流鼻血"]){
//                asNu = [NSNumber numberWithInt:4];
//            }else if([astr isEqualToString:@"烫伤"]){
//                asNu = [NSNumber numberWithInt:5];
//            }else if([astr isEqualToString:@"摔伤"]){
//                asNu = [NSNumber numberWithInt:6];
//            }else if([astr isEqualToString:@"磕碰"]){
//                asNu = [NSNumber numberWithInt:7];
//            }else if([astr isEqualToString:@"抓伤"]){
//                asNu = [NSNumber numberWithInt:8];
//            }
//            [as appendFormat:@"%@,",asNu];
//        }
//        as = [NSMutableString stringWithString:[as substringToIndex:as.length - 1]];
//        
//        [jsonStr appendFormat:@"%@],\"info\":\"",as];
//    }else{
//        [jsonStr appendFormat:@"],\"info\":\""];
//    }
    if (self.abnormalString) {
        NSNumber *asNu = [NSNumber numberWithInt:-1];
        if ([self.abnormalString isEqualToString:@"咳嗽"]) {
            asNu = [NSNumber numberWithInt:0];
        }else if([self.abnormalString isEqualToString:@"感冒"]){
            asNu = [NSNumber numberWithInt:1];
        }else if([self.abnormalString isEqualToString:@"发烧"]){
            asNu = [NSNumber numberWithInt:3];
        }
        [jsonStr appendFormat:@"%@],\"info\":\"",asNu];
    }else{
        [jsonStr appendFormat:@"],\"info\":\""];
    }
    if (self.messageTextView.text == nil || [self.messageTextView.text isEqualToString:@""]|| [self.messageTextView.text isEqualToString:@"留言..."]) {
        [jsonStr appendFormat:@"\"}}"];
    }else{
        [jsonStr appendFormat:@"%@\"}}",self.messageTextView.text];
    }
    return jsonStr;
}

-(void) tapBackButton
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void) initScrollView
{
    self.scrollView.frame = CGRectMake(0, 0, SCREEN_W, SCREEN_H - 64);
    
    [self.view addSubview:self.scrollView];
    
    self.dietView.frame = CGRectMake(0, 0, SCREEN_W, 60.0f);
    [self.scrollView addSubview:self.dietView];
    self.drinkView.frame = CGRectMake(0, 80.0f, SCREEN_W, 90.0f);
    [self.scrollView addSubview:self.drinkView];
    self.sleepView.frame = CGRectMake(0, 190.0f, SCREEN_W, 90.0f);
    [self.scrollView addSubview:self.sleepView];
    self.stoolView.frame = CGRectMake(0, 300.0f, SCREEN_W, 60.0f);
    [self.scrollView addSubview:self.stoolView];
    self.emotionView.frame = CGRectMake(0, 380.0f, SCREEN_W, 90.0f);
    [self.scrollView addSubview:self.emotionView];
    self.abnormalView.frame = CGRectMake(0, 490.0f, SCREEN_W, 60.0f);
    [self.scrollView addSubview:self.abnormalView];
    self.messageTextView.frame = CGRectMake(10.0f, 570.0f, SCREEN_W - 20.0f, 40.0f);
    [self.scrollView addSubview:self.messageTextView];
    self.scrollView.contentSize = CGSizeMake(SCREEN_W, 630.0f);
    self.messageTextView.layer.borderWidth = 0.5f;
    self.messageTextView.layer.borderColor = [UIColor blackColor].CGColor;
}

-(void) initButton{
    self.dBto.layer.borderWidth = 0.5f;
    self.dBto.layer.borderColor = [UIColor grayColor].CGColor;
    self.dBtnt.layer.borderWidth = 0.5f;
    self.dBtnt.layer.borderColor = [UIColor grayColor].CGColor;
    self.dBtnr.layer.borderWidth = 0.5f;
    self.dBtnr.layer.borderColor = [UIColor grayColor].CGColor;
    
    self.drinkNoButton.layer.borderWidth = 0.5f;
    self.drinkNoButton.layer.borderColor = [UIColor grayColor].CGColor;
    self.drinkTwoButton.layer.borderWidth = 0.5f;
    self.drinkTwoButton.layer.borderColor = [UIColor grayColor].CGColor;
    self.drinkFiveButton.layer.borderWidth = 0.5f;
    self.drinkFiveButton.layer.borderColor = [UIColor grayColor].CGColor;
    self.drinkThreeButton.layer.borderWidth = 0.5f;
    self.drinkThreeButton.layer.borderColor = [UIColor grayColor].CGColor;
    
    self.sleepNoButton.layer.borderWidth = 0.5f;
    self.sleepNoButton.layer.borderColor = [UIColor grayColor].CGColor;
    self.sleepOneLessButton.layer.borderWidth = 0.5f;
    self.sleepOneLessButton.layer.borderColor = [UIColor grayColor].CGColor;
    self.sleepTwoMoreButton.layer.borderWidth = 0.5f;
    self.sleepTwoMoreButton.layer.borderColor = [UIColor grayColor].CGColor;
    self.sleepOneToTwoButton.layer.borderWidth = 0.5f;
    self.sleepOneToTwoButton.layer.borderColor = [UIColor grayColor].CGColor;
    
    self.stoolNoButton.layer.borderWidth = 0.5f;
    self.stoolNoButton.layer.borderColor = [UIColor grayColor].CGColor;
    self.stoolOneButton.layer.borderWidth = 0.5f;
    self.stoolOneButton.layer.borderColor = [UIColor grayColor].CGColor;
    self.stoolMoreButton.layer.borderWidth = 0.5f;
    self.stoolMoreButton.layer.borderColor = [UIColor grayColor].CGColor;
    
    self.emotionOneButton.layer.borderWidth = 0.5f;
    self.emotionOneButton.layer.borderColor = [UIColor grayColor].CGColor;
    self.emotionTwoButton.layer.borderWidth = 0.5f;
    self.emotionTwoButton.layer.borderColor = [UIColor grayColor].CGColor;
    self.emotionFourButton.layer.borderWidth = 0.5f;
    self.emotionFourButton.layer.borderColor = [UIColor grayColor].CGColor;
    self.emotionThreeButton.layer.borderWidth = 0.5f;
    self.emotionThreeButton.layer.borderColor = [UIColor grayColor].CGColor;
    
    self.abnormalGanmaoButton.layer.borderWidth = 0.5f;
    self.abnormalGanmaoButton.layer.borderColor = [UIColor grayColor].CGColor;
    self.abnormalFashaoButton.layer.borderWidth = 0.5f;
    self.abnormalFashaoButton.layer.borderColor = [UIColor grayColor].CGColor;
    self.abnormalKesouButton.layer.borderWidth = 0.5f;
    self.abnormalKesouButton.layer.borderColor = [UIColor grayColor].CGColor;
}

#pragma mark - 饮食
- (IBAction)tapDietButton:(UIButton *)sender {
    if ([sender isEqual:self.dBto]) {
        if (sender.selected != YES) {
            sender.selected = YES;
            self.dBtnt.selected = NO;
            self.dBtnr.selected = NO;
            self.dietString = @"胃口很好";
        }
    }else if ([sender isEqual:self.dBtnt]) {
        if (sender.selected != YES) {
            sender.selected = YES;
            self.dBto.selected = NO;
            self.dBtnr.selected = NO;
            self.dietString = @"正常饮食";
        }
    }else if ([sender isEqual:self.dBtnr]) {
        if (sender.selected != YES) {
            sender.selected = YES;
            self.dBtnt.selected = NO;
            self.dBto.selected = NO;
            self.dietString = @"饮食不佳";
        }
    }
}

#pragma mark - 饮水
- (IBAction)tapDrinkButton:(UIButton *)sender {
    if ([sender isEqual:self.drinkNoButton]) {
        if (sender.selected != YES) {
            sender.selected = YES;
            self.drinkFiveButton.selected = NO;
            self.drinkThreeButton.selected = NO;
            self.drinkTwoButton.selected = NO;
            self.drinkString = @"没喝";
        }
    }else if ([sender isEqual:self.drinkTwoButton]) {
        if (sender.selected != YES) {
            sender.selected = YES;
            self.drinkThreeButton.selected = NO;
            self.drinkNoButton.selected = NO;
            self.drinkFiveButton.selected = NO;
            self.drinkString = @"1-2杯";
        }
    }else if ([sender isEqual:self.drinkThreeButton]) {
        if (sender.selected != YES) {
            sender.selected = YES;
            self.drinkNoButton.selected = NO;
            self.drinkTwoButton.selected = NO;
            self.drinkFiveButton.selected = NO;
            self.drinkString = @"3-4杯";
        }
    }else if ([sender isEqual:self.drinkFiveButton]) {
        if (sender.selected != YES) {
            sender.selected = YES;
            self.drinkNoButton.selected = NO;
            self.drinkThreeButton.selected = NO;
            self.drinkTwoButton.selected = NO;
            self.drinkString = @"5杯以上";
        }
    }
}

#pragma mark - 睡眠
- (IBAction)tapSleepButton:(UIButton *)sender {
    if ([sender isEqual:self.sleepNoButton]) {
        if (sender.selected != YES) {
            sender.selected = YES;
            self.sleepOneLessButton.selected = NO;
            self.sleepOneToTwoButton.selected = NO;
            self.sleepTwoMoreButton.selected = NO;
            self.sleepString = @"没睡";
        }
    }else if ([sender isEqual:self.sleepOneLessButton]) {
        if (sender.selected != YES) {
            sender.selected = YES;
            self.sleepNoButton.selected = NO;
            self.sleepOneToTwoButton.selected = NO;
            self.sleepTwoMoreButton.selected = NO;
            self.sleepString = @"1小时以下";
        }
    }else if ([sender isEqual:self.sleepOneToTwoButton]) {
        if (sender.selected != YES) {
            sender.selected = YES;
            self.sleepNoButton.selected = NO;
            self.sleepOneLessButton.selected = NO;
            self.sleepTwoMoreButton.selected = NO;
            self.sleepString = @"1-2小时";
        }
    }else if ([sender isEqual:self.sleepTwoMoreButton]) {
        if (sender.selected != YES) {
            sender.selected = YES;
            self.sleepNoButton.selected = NO;
            self.sleepOneLessButton.selected = NO;
            self.sleepOneToTwoButton.selected = NO;
            self.sleepString = @"2小时以上";
        }
    }
}

#pragma mark - 大便
- (IBAction)tapStoolButton:(UIButton *)sender {
    if ([sender isEqual:self.stoolNoButton]) {
        if (sender.selected != YES) {
            sender.selected = YES;
            self.stoolOneButton.selected = NO;
            self.stoolMoreButton.selected = NO;
            self.stoolString = @"0次";
        }
    }else if ([sender isEqual:self.stoolOneButton]) {
        if (sender.selected != YES) {
            sender.selected = YES;
            self.stoolNoButton.selected = NO;
            self.stoolMoreButton.selected = NO;
            self.stoolString = @"1-2次";
        }
    }else if ([sender isEqual:self.stoolMoreButton]) {
        if (sender.selected != YES) {
            sender.selected = YES;
            self.stoolNoButton.selected = NO;
            self.stoolOneButton.selected = NO;
            self.stoolString = @"拉肚子";
        }
    }
}

#pragma mark - 情绪
- (IBAction)tapEmotionButton:(UIButton *)sender {
    if ([sender isEqual:self.emotionOneButton]) {
        if (sender.selected != YES) {
            sender.selected = YES;
            self.emotionTwoButton.selected = NO;
            self.emotionThreeButton.selected = NO;
            self.emotionFourButton.selected = NO;
            self.emotionString = @"开心";
        }
    }else if ([sender isEqual:self.emotionTwoButton]) {
        if (sender.selected != YES) {
            sender.selected = YES;
            self.emotionOneButton.selected = NO;
            self.emotionThreeButton.selected = NO;
            self.emotionFourButton.selected = NO;
            self.emotionString = @"低落";
        }
    }else if ([sender isEqual:self.emotionThreeButton]) {
        if (sender.selected != YES) {
            sender.selected = YES;
            self.emotionOneButton.selected = NO;
            self.emotionTwoButton.selected = NO;
            self.emotionFourButton.selected = NO;
            self.emotionString = @"烦躁";
        }
    }else if ([sender isEqual:self.emotionFourButton]) {
        if (sender.selected != YES) {
            sender.selected = YES;
            self.emotionOneButton.selected = NO;
            self.emotionTwoButton.selected = NO;
            self.emotionThreeButton.selected = NO;
            self.emotionString = @"哭鼻子";
        }
    }
}

#pragma mark - 异常
- (IBAction)tapAbnormalGesture:(UITapGestureRecognizer *)sender {
    UIView *view = (UIView *)sender.delegate;
    UILabel *la = (UILabel *) [view viewWithTag:1001];
    UIImageView *ima = (UIImageView *) [view viewWithTag:1000];
    ima.highlighted = !ima.highlighted;
    if (ima.highlighted) {
        [self.abnormalArray addObject:la.text];
    }else{
        [self.abnormalArray removeObject:la.text];
    }
}

- (IBAction)tapAbnormalButton:(UIButton *)sender {
    if (self.abnormalString == nil) {
        self.abnormalString = [NSString string];
    }
    if ([sender isEqual:self.abnormalKesouButton]) {
        if (sender.selected != YES) {
            sender.selected = YES;
            self.abnormalGanmaoButton.selected = NO;
            self.abnormalFashaoButton.selected = NO;
            self.abnormalString = @"咳嗽";
        }
    }else if ([sender isEqual:self.abnormalGanmaoButton]) {
        if (sender.selected != YES) {
            sender.selected = YES;
            self.abnormalKesouButton.selected = NO;
            self.abnormalFashaoButton.selected = NO;
            self.abnormalString = @"感冒";
        }
    }else if ([sender isEqual:self.abnormalFashaoButton]) {
        if (sender.selected != YES) {
            sender.selected = YES;
            self.abnormalGanmaoButton.selected = NO;
            self.abnormalKesouButton.selected = NO;
            self.abnormalString = @"发烧";
        }
    }
}


#pragma mark - keyBoardNotification
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
    self.scrollView.frame = CGRectMake(0, 0 , self.scrollView.frame.size.width, SCREEN_H - 64 - keyboardBounds.size.height);
    if ([self.messageTextView.text isEqualToString:@"留言..."]) {
        self.messageTextView.text = @"";
    }
	[UIView commitAnimations];
    [self.scrollView scrollRectToVisible:CGRectMake(0, self.messageTextView.frame.origin.y, SCREEN_W, self.messageTextView.frame.size.height + 10) animated:NO];
}

-(void) keyboardWillHide:(NSNotification *)note
{
    NSNumber *duration = [note.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey];
    NSNumber *curve = [note.userInfo objectForKey:UIKeyboardAnimationCurveUserInfoKey];
    [UIView beginAnimations:nil context:NULL];
	[UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:[duration doubleValue]];
    [UIView setAnimationCurve:[curve intValue]];
    self.scrollView.frame = CGRectMake(0, 0, self.scrollView.frame.size.width, SCREEN_H - 64);
	[UIView commitAnimations];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
