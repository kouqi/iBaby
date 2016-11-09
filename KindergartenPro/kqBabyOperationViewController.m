//
//  kqBabyOperationViewController.m
//  KindergartenPro
//
//  Created by 海峰 on 14-9-10.
//  Copyright (c) 2014年 海峰. All rights reserved.
//

#import "kqBabyOperationViewController.h"

#import "kqTBabyInfomationDetailViewController.h"
#import "VPImageCropperViewController.h"
#import <AssetsLibrary/AssetsLibrary.h>
#import <MobileCoreServices/MobileCoreServices.h>
#define ORIGINAL_MAX_WIDTH 640.0f
@interface kqBabyOperationViewController ()<VPImageCropperDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
//日期相关
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;
@property (weak, nonatomic) IBOutlet UIButton *previousDayButton;
@property (weak, nonatomic) IBOutlet UIButton *nextDayButton;
@property (weak, nonatomic) IBOutlet UILabel *dayLabel;
@property (weak, nonatomic) IBOutlet UILabel *yearWeekDayLabel;
@property (weak, nonatomic) IBOutlet UILabel *weekLabel;
@property (strong, nonatomic) NSString *dateString,*sendJPUSHContent;
//入园信息
@property (weak, nonatomic) IBOutlet UIImageView *babyImageView;
@property (weak, nonatomic) IBOutlet UIImageView *signInImageView;
@property (weak, nonatomic) IBOutlet UIImageView *sickLeaveImageView;
@property (weak, nonatomic) IBOutlet UIImageView *compassionateLeaveImageView;
@property (weak, nonatomic) IBOutlet UIImageView *leaveOutImageView;
@property (weak, nonatomic) IBOutlet UIView *personalPhotosView;

//信息手册
@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *infomationDataArray;
@property (assign, nonatomic) BOOL isChanged;

@property(strong, nonatomic) NSString *photoUrlString;
@end

@implementation kqBabyOperationViewController

#pragma mark - 日期变动处理
- (IBAction)tapPreviousDay:(id)sender {
    CHANGEDAY([HNAGeneral giveMeThePreviousDayWithDay:labelTime]);
    [self getBabyHandBook];
}

- (IBAction)tapNextDayButton:(id)sender {
    CHANGEDAY([HNAGeneral giveMeTheNextDayWithDay:labelTime]);
    [self getBabyHandBook];
}

-(void)didChoseDate:(NSDate *)date WithView:(UIView *)datePickerView
{
    FORMATTER;
    self.dateString = [formatter stringFromDate:date];
    [self initDateView];
    kqDatePickerView *datePickerViews = (kqDatePickerView *)datePickerView;
    [datePickerViews removeFromSuperview];
    [self getBabyHandBook];
}

-(void) didCacelChoseDateWithView:(UIView *)datePickerView
{
    kqDatePickerView *datePickerViews = (kqDatePickerView *)datePickerView;
    [datePickerViews removeFromSuperview];
}

- (IBAction)tapCurrentDayButton:(id)sender {
    NSLog(@"选择日期");
    FORMATTER;
    kqDatePickerView *datePickerView = [[[NSBundle mainBundle] loadNibNamed:@"kqDatePickerView" owner:self options:nil] objectAtIndex:0];
    datePickerView.datePicker.maximumDate = [NSDate date];
    datePickerView.datePicker.date = [formatter dateFromString:self.dateString];
    datePickerView.frame = CGRectMake(0, 10, 320, 568);
    datePickerView.delegate = self;
    [self.view addSubview:datePickerView];
}

- (IBAction)swipeToDay:(id)sender {
    UISwipeGestureRecognizer *swipe = (UISwipeGestureRecognizer *) sender;
    if (swipe.direction == UISwipeGestureRecognizerDirectionLeft) {
        NSString *labelTime = [self.yearWeekDayLabel.text substringWithRange:NSMakeRange(0, 10)];
        NOWTIME;
        if ([labelTime isEqualToString:nowTime]) {
            return;
        }
        self.dateString = [HNAGeneral giveMeTheNextDayWithDay:labelTime];
        [self initDateView];
    }else{
        CHANGEDAY([HNAGeneral giveMeThePreviousDayWithDay:labelTime]);
    }
    [self getBabyHandBook];
}

-(void) initDate
{
    NOWTIME;
    self.dateString = [NSString stringWithString:nowTime];
    [self initDateView];
}

-(void) initDateView
{
    NOWTIME;
    if ([self.dateString isEqualToString:nowTime]) {
        self.nextDayButton.hidden = YES;
    }else{
        self.nextDayButton.hidden = NO;
    }
    self.dayLabel.text = [NSString stringWithFormat:@"%d",[[self.dateString substringWithRange:NSMakeRange(8, 2)] intValue]];
    self.yearWeekDayLabel.text = self.dateString;
    self.weekLabel.text = [HNAGeneral giveMeTheWeekDayWithDay:self.dateString];
}

#pragma mark - 入园信息
- (IBAction)tapTheStateView:(id)sender {
    kqDistingKindergartenAndSchool *dkas = [kqDistingKindergartenAndSchool sharedDistingKindergartenAndSchool];
    self.isChanged = YES;
    UITapGestureRecognizer *tap = (UITapGestureRecognizer *) sender;
    UIView *view = tap.view;
    int tag = (int)view.tag;
    NSString *babyState = nil;
    switch (tag) {
        case 1000:
        {
            self.signInImageView.highlighted = !self.signInImageView.highlighted;
            self.sickLeaveImageView.highlighted = NO;
            self.compassionateLeaveImageView.highlighted = NO;
            self.leaveOutImageView.highlighted = NO;
            if (self.signInImageView.highlighted) {
                babyState = [NSString stringWithFormat:@"%@",dkas.signIn];
            }else{
                babyState = [NSString stringWithFormat:@"未纪录"];
            }
        }
            break;
        case 1001:
        {
            self.sickLeaveImageView.highlighted = !self.sickLeaveImageView.highlighted;
            self.signInImageView.highlighted = NO;
            self.compassionateLeaveImageView.highlighted = NO;
            self.leaveOutImageView.highlighted = NO;
            if (self.sickLeaveImageView.highlighted) {
                babyState = [NSString stringWithFormat:@"病假"];
            }else{
                babyState = [NSString stringWithFormat:@"未纪录"];
            }
        }
            break;
        case 1002:
        {
            self.compassionateLeaveImageView.highlighted = !self.compassionateLeaveImageView.highlighted;
            self.sickLeaveImageView.highlighted = NO;
            self.signInImageView.highlighted = NO;
            self.leaveOutImageView.highlighted = NO;
            if (self.compassionateLeaveImageView.highlighted) {
                babyState = [NSString stringWithFormat:@"事假"];
            }else{
                babyState = [NSString stringWithFormat:@"未纪录"];
            }
        }
            break;
        case 1003:
        {
            self.leaveOutImageView.highlighted = !self.leaveOutImageView.highlighted;
            self.sickLeaveImageView.highlighted = NO;
            self.compassionateLeaveImageView.highlighted = NO;
            self.signInImageView.highlighted = NO;
            if (self.leaveOutImageView.highlighted) {
                babyState = [NSString stringWithFormat:@"%@",dkas.signOut];
            }else{
                babyState = [NSString stringWithFormat:@"未纪录"];
            }
        }
            break;
            
        default:
            break;
    }
    FORMATTER;
    self.babyStateString = babyState;
    NSString *date = [formatter stringFromDate:[NSDate date]];
    if ([date isEqualToString:self.dateString]) {
        [self.delegate changeBabyStatuesWithState:babyState];
    }else{
        self.isChanged = NO;
    }
    NSLog(@"----------%@",self.dateString);
}

-(void) initBabyState:(NSArray *) arr
{
    kqDistingKindergartenAndSchool *dkas = [kqDistingKindergartenAndSchool sharedDistingKindergartenAndSchool];
    self.leaveOutImageView.highlighted = NO;
    self.sickLeaveImageView.highlighted = NO;
    self.compassionateLeaveImageView.highlighted = NO;
    self.signInImageView.highlighted = NO;
    if (arr.count != 0) {
        FORMATTER
        for (NSDictionary *dic in arr) {
            NSString *str = [dic valueForKey:@"inOutDate"];
            str = [str substringToIndex:10];
            NSDate *dd = [formatter dateFromString:str];
            NSDate *nd = [formatter dateFromString:[formatter stringFromDate:[NSDate date]]];
            if ([dd isEqualToDate:nd]) {
                int state = [[dic valueForKey:@"inOut"] intValue];
                switch (state) {
                    case 0:
                        self.babyStateString = dkas.signIn;
                        break;
                    case 1:
                        self.babyStateString = dkas.signOut;
                        break;
                    case 2:
                        self.babyStateString = @"病假";
                        break;
                    case 3:
                        self.babyStateString = @"事假";
                        break;
                    case 4:
                        self.babyStateString = @"未纪录";
                        break;
                    default:
                        break;
                }
            }else{
                self.babyStateString = @"未纪录";
            }
        }
    }else{
        self.babyStateString = @"未纪录";
    }
    self.statusLabel.text = self.babyStateString;
//    if ([self.babyStateString isEqualToString:@"未纪录"]) {
//    }else if ([self.babyStateString isEqualToString:@"入园"]){
//        self.signInImageView.highlighted = YES;
//    }else if ([self.babyStateString isEqualToString:@"病假"]){
//        self.sickLeaveImageView.highlighted = YES;
//    }else if ([self.babyStateString isEqualToString:@"事假"]){
//        self.compassionateLeaveImageView.highlighted = YES;
//    }else if ([self.babyStateString isEqualToString:@"离园"]){
//        self.leaveOutImageView.highlighted = YES;
//    }
}

#pragma mark - 信息手册
- (IBAction)tapEntryInfomationButton:(id)sender {
    self.hidesBottomBarWhenPushed = YES;
    kqTBabyInfomationEntryViewController *tbieVC = [[kqTBabyInfomationEntryViewController alloc] initWithNibName:@"kqTBabyInfomationEntryViewController" bundle:nil];
    tbieVC.title = @"新增信息手册";
    tbieVC.babyId = [NSString stringWithFormat:@"%d",[[self.dataDictionary valueForKey:@"id"] intValue]];
    tbieVC.delegate = self;
    [self.navigationController pushViewController:tbieVC animated:YES];
}

-(void)didFabuHandBookSucessWithTitle:(NSString *)title
{
    [self getBabyHandBook];
}

//TODO:下载相关
-(void) getBabyHandBook
{
    [HNAGeneral showOnWindow:@"加载中"];
    HNADownLoadManager *dl = [HNADownLoadManager sharedDownLoadManager];
    dl.delegate = self;
    [dl getBabyHandBookFromBabyID:[self.dataDictionary valueForKey:@"id"] andEditDate:self.dateString];
}

-(void)didUploadPhotosWithArray:(NSArray *)array
{
    [self initDataArrayWithArray:array];
    [self initPersonalPhotoView];
}

-(void)getBabyHandBookDelegate:(NSDictionary *)dic
{
    
    NSDictionary *dataMap = [dic valueForKey:@"dataMap"];
    NSString *state = [dataMap valueForKey:@"state"];
    if ([state isEqualToString:SU]) {
        NSArray *arr = [dataMap valueForKey:@"data"];
        if (arr.count != 0) {
            self.infomationDataArray = [NSMutableArray arrayWithArray:arr];
        }else{
            if (self.infomationDataArray != nil) {
                [self.infomationDataArray removeAllObjects];
            }
        }
        NSArray *signArr = [dataMap valueForKey:@"dataSignPage"];
        [self initBabyState:signArr];
        [self.tableView reloadData];
        HNADownLoadManager *dl = [HNADownLoadManager sharedDownLoadManager];
        dl.delegate = self;
        [dl getSpecifyBabyPersonalPhotoWithBabyId:[self.dataDictionary valueForKey:@"id"]];
    }else if([state isEqualToString:ER]){
        [HNAGeneral hidenHUD];
        [HNAGeneral showAlertViewWithTitle:@"提示" andMessage:[dataMap valueForKey:@"stateMsg"]];
    }
}

-(void)getSpecifyBabyPersonalPhotoDelegate:(NSDictionary *)dic
{
    [HNAGeneral hidenHUD];
    NSDictionary *dataMap = [dic valueForKey:@"dataMap"];
    NSString *state = [dataMap valueForKey:@"state"];
    if ([state isEqualToString:SU]) {
        if([[dic valueForKey:@"fileUrl"] isKindOfClass:[NSString class]]){
            self.photoUrlString = [NSString stringWithFormat:@"%@", [dic valueForKey:@"fileUrl"]];
        }
        self.albumId = [NSString stringWithFormat:@"%@",[dataMap valueForKey:@"albumId"]];
        NSArray *arr = [dataMap valueForKey:@"data"];
        //        if(arr.count != 0){
        [self initDataArrayWithArray:arr];
        [self initPersonalPhotoView];
    }else if([state isEqualToString:ER]){
        [HNAGeneral showAlertViewWithTitle:@"提示" andMessage:[dataMap valueForKey:@"stateMsg"]];
    }
}

-(void) initDataArrayWithArray:(NSArray *) array
{
    self.imagesArray = [NSMutableArray array];
    for (NSDictionary *dic in array) {
        NSString *photoPath = [dic valueForKey:@"photoPath"];
        NSArray *parr = [photoPath componentsSeparatedByString:@"|"];
        for (NSString *ppath in parr) {
            if (![ppath isEqualToString:@""]) {
                [self.imagesArray addObject:ppath];
            }
        }
    }
}

-(void) sendHandBookByIDDelegate:(NSDictionary *)dic
{
    [HNAGeneral hidenHUD];
    NSDictionary *dataMap = [dic valueForKey:@"dataMap"];
    NSString *state = [dataMap valueForKey:@"state"];
    HNADownLoadManager *dl = [HNADownLoadManager sharedDownLoadManager];
    if ([state isEqualToString:SU]) {
        if (self.sendJPUSHContent.length > 20) {
            self.sendJPUSHContent = [self.sendJPUSHContent substringToIndex:20];
        }
        if ([[self.dataDictionary valueForKey:@"deviceid"] isKindOfClass:[NSString class]]) {
            NSArray *arr = [NSArray arrayWithObject:[self.dataDictionary valueForKey:@"deviceid"]];
            [dl sendJPushWithType:@"3" andContent:self.sendJPUSHContent andAlias:arr];
        }
        [HNAGeneral showAlertViewWithTitle:@"提示" andMessage:[dataMap valueForKey:@"stateMsg"]];
    }else if([state isEqualToString:ER]){
        [HNAGeneral showAlertViewWithTitle:@"提示" andMessage:[dataMap valueForKey:@"stateMsg"]];
    }
}

-(void)deleteHandBookDelegate:(NSDictionary *)dic
{
    [HNAGeneral hidenHUD];
    NSDictionary *dataMap = [dic valueForKey:@"dataMap"];
    NSString *state = [dataMap valueForKey:@"state"];
    if ([state isEqualToString:SU]) {
        [self getBabyHandBook];
        [HNAGeneral showAlertViewWithTitle:@"提示" andMessage:[dataMap valueForKey:@"stateMsg"]];
    }else if([state isEqualToString:ER]){
        [HNAGeneral showAlertViewWithTitle:@"提示" andMessage:[dataMap valueForKey:@"stateMsg"]];
    }
}


#pragma mark - viewcontroller
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
    self.isChanged = NO;
//    UIImageView *topView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"wave.png"]];
//    topView.frame = CGRectMake(0, 0, 320, 10);
//    [self.view addSubview:topView];
    self.babyImageView.layer.cornerRadius = 21.0f;
    self.babyImageView.layer.masksToBounds = YES;
    [self.babyImageView setImageWithURL:[NSURL URLWithString:[self.dataDictionary valueForKey:@"imgPath"]] placeholderImage:[UIImage imageNamed:@"tbabyDefaultHeadImage.png"]];
    [self initTopBar];
    [self initDate];
    
    [self initTableView];
    [self getBabyHandBook];
    
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
}

- (IBAction)tapRecoderStatus:(UITapGestureRecognizer *)sender {
    HNACallPhoneView *callView = (HNACallPhoneView *)[[[NSBundle mainBundle] loadNibNamed:@"HNACallPhoneView" owner:self options:nil] objectAtIndex:0];
    [callView initView];
    callView.delegate = self;
    [self.view addSubview:callView];
}

-(void)didTapStatusWithString:(NSString *)statusText andView:(UIView *)view
{
    [view removeFromSuperview];
    self.statusLabel.text = statusText;
    self.babyStateString = statusText;
    self.isChanged = YES;
    [self.delegate changeBabyStatuesWithState:statusText];
}

-(void)didTapCancelView:(UIView *)view
{
    [view removeFromSuperview];
}

-(void) tapBackButton
{
    kqDistingKindergartenAndSchool *dkas = [kqDistingKindergartenAndSchool sharedDistingKindergartenAndSchool];
    if (self.isChanged) {
        if ([self.babyStateString isEqualToString:@"未纪录"]) {
//            [HNAGeneral showAlertViewWithTitle:nil andMessage:@"请选择宝宝状态"];
            [HNAGeneral showTipTextOnWindow:@"请选择宝宝状态"];
        }else{
            [HNAGeneral showOnWindow:@"记录中"];
            HNADownLoadManager *dl = [HNADownLoadManager sharedDownLoadManager];
            dl.delegate = self;
            NSString *state = nil;
            if ([self.babyStateString isEqualToString:@"未纪录"]) {
            }else if ([self.babyStateString isEqualToString:dkas.signIn]){
                state = @"0";
            }else if ([self.babyStateString isEqualToString:@"病假"]){
                state = @"2";
            }else if ([self.babyStateString isEqualToString:@"事假"]){
                state = @"3";
            }else if ([self.babyStateString isEqualToString:dkas.signOut]){
                state = @"1";
            }
            [dl sendBabyStateWithID:[self.dataDictionary valueForKey:@"id"] andState:state];
        }
    }else{
        [self.navigationController popViewControllerAnimated:YES];
    }
}

-(void)sendBabyStateDelegate:(NSDictionary *)dic
{
    kqDistingKindergartenAndSchool *dkas = [kqDistingKindergartenAndSchool sharedDistingKindergartenAndSchool];
    [HNAGeneral hidenHUD];
    NSDictionary *dataMap = [dic valueForKey:@"dataMap"];
    NSString *state = [dataMap valueForKey:@"state"];
    if ([state isEqualToString:SU]) {
        NSString *content;
        int io = [[dic valueForKey:@"inOut"] intValue];
        switch (io) {
            case 0:
                content = [NSString stringWithFormat:@"宝宝%@啦！",dkas.signIn];
                break;
            case 1:
                content = [NSString stringWithFormat:@"宝宝%@啦！",dkas.signOut];
                break;
            case 2:
                content = @"宝宝请病假啦！";
                break;
            case 3:
                content = @"宝宝请事假啦！";
                break;
            case 4:
                content = @"宝宝签到状态未知";
                break;
            default:
                break;
        }
        HNADownLoadManager *dl = [HNADownLoadManager sharedDownLoadManager];
        if ([[self.dataDictionary valueForKey:@"deviceid"] isKindOfClass:[NSString class]]) {
            NSArray *arr = [NSArray arrayWithObject:[self.dataDictionary valueForKey:@"deviceid"]];
            [dl sendJPushWithType:@"5" andContent:content andAlias:arr];
        }
        [self.navigationController popViewControllerAnimated:YES];
    }else if([state isEqualToString:ER]){
        if ([[dataMap valueForKey:@"stateMsg"] isEqualToString:@"当日此宝宝状态已存在"]) {
            [self.navigationController popViewControllerAnimated:YES];
        }else{
            [HNAGeneral showAlertViewWithTitle:@"提示" andMessage:[dataMap valueForKey:@"stateMsg"]];
        }
    }
}

#pragma mark - tableViewDelegate
-(void) initTableView
{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, SCREEN_W, SCREEN_W, SCREEN_H - SCREEN_W - 64)];
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.infomationDataArray.count;
//    return 5;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100.0f;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    kqTBabyInfomationTableViewCell *cell = (kqTBabyInfomationTableViewCell *)[[[NSBundle mainBundle] loadNibNamed:@"kqTBabyInfomationTableViewCell" owner:self options:nil] objectAtIndex:0];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.indexPath = indexPath;
    cell.delegate = self;
    cell.titleLabel.text = [[self.infomationDataArray objectAtIndexedSubscript:indexPath.row] valueForKey:@"bookTitle"];
    NSString *editDate = [[self.infomationDataArray objectAtIndexedSubscript:indexPath.row] valueForKey:@"editDate"];
    NSArray *arr = [editDate componentsSeparatedByString:@"T"];
    cell.timeLabel.text = [NSString stringWithFormat:@"%@ %@",[arr objectAtIndex:0],[arr objectAtIndex:1]];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    self.hidesBottomBarWhenPushed = YES;
    kqTBabyInfomationDetailViewController *tbieVC = [[kqTBabyInfomationDetailViewController alloc] initWithNibName:@"kqTBabyInfomationDetailViewController" bundle:nil];
    tbieVC.title = @"详情";
    tbieVC.dataDictionary = [self.infomationDataArray objectAtIndex:indexPath.row];
    tbieVC.delegate = self;
    [self.navigationController pushViewController:tbieVC animated:YES];
}

#pragma mark - tapCellButtonsDelegate
-(void)didTapCellSendButtonWithIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"-------%ld",(long)indexPath.row);
    [HNAGeneral showOnWindow:@"发送中"];
    HNADownLoadManager *dl = [HNADownLoadManager sharedDownLoadManager];
    dl.delegate = self;
    self.sendJPUSHContent = [HNAGeneral getContent:[self.infomationDataArray objectAtIndex:indexPath.row]];
    [dl sendHandBookByID:[[self.infomationDataArray objectAtIndex:indexPath.row] valueForKey:@"id"]];
}

-(void)didTapCellDeleteButtonWithIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"-------%ld",(long)indexPath.row);
    [HNAGeneral showOnWindow:@"删除中"];
    HNADownLoadManager *dl = [HNADownLoadManager sharedDownLoadManager];
    dl.delegate = self;
    [dl deleteHandBookByID:[[self.infomationDataArray objectAtIndex:indexPath.row] valueForKey:@"id"]];
}

- (IBAction)tapSendMessageButton:(UIButton *)sender {
    self.hidesBottomBarWhenPushed = YES;
    kqChatWindowViewController *cwVC = [[kqChatWindowViewController alloc] initWithNibName:@"kqChatWindowViewController" bundle:nil];
    cwVC.roleID = [self.dataDictionary valueForKey:@"id"];
    cwVC.title = [self.dataDictionary valueForKey:@"babyName"];
    cwVC.roleName = [self.dataDictionary valueForKey:@"deviceid"];
    cwVC.roleType = JiazhangType;
    [self.navigationController pushViewController:cwVC animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 个人相册

-(void) initPersonalPhotoView
{
    for (UIView *view in self.personalPhotosView.subviews) {
        if ([view isKindOfClass:[UIButton class]]||[view isKindOfClass:[UIImageView class]]) {
            if ((view.tag == PERSONALPHOTOSIMAGEVIEWTAG) || (view.tag == PERSONALPHOTOSIMAGEVIEWTAG + 1) || (view.tag == PERSONALPHOTOSIMAGEVIEWTAG + 2)) {
                [view removeFromSuperview];
            }
        }
    }
    CGFloat indexX = (self.view.frame.size.width - 50.0f - 240.0f) / 4.0f;
    CGFloat indexY = 10.0f;
    CGFloat indexW = 80.0f,indexH = 80.0f;
    switch (self.imagesArray.count) {
        case 0:
        {
            UIButton *addImageButton1 = [UIButton buttonWithType:UIButtonTypeCustom];
            addImageButton1.frame = CGRectMake(indexX, indexY, indexW, indexH);
            addImageButton1.tag = PERSONALPHOTOSIMAGEVIEWTAG;
            [addImageButton1 setBackgroundImage:[UIImage imageNamed:@"addNewImage.png"] forState:UIControlStateNormal];
            [addImageButton1 addTarget:self action:@selector(tapAddImageButton:) forControlEvents:UIControlEventTouchUpInside];
            [self.personalPhotosView addSubview:addImageButton1];
            
            UIButton *addImageButton2 = [UIButton buttonWithType:UIButtonTypeCustom];
            addImageButton2.frame = CGRectMake(2 * indexX + indexW, indexY, indexW, indexH);
            addImageButton2.tag = PERSONALPHOTOSIMAGEVIEWTAG + 1;
            [addImageButton2 setBackgroundImage:[UIImage imageNamed:@"addNewImage.png"] forState:UIControlStateNormal];
            [addImageButton2 addTarget:self action:@selector(tapAddImageButton:) forControlEvents:UIControlEventTouchUpInside];
            [self.personalPhotosView addSubview:addImageButton2];
            
            UIButton *addImageButton3 = [UIButton buttonWithType:UIButtonTypeCustom];
            addImageButton3.frame = CGRectMake(3 * indexX + 2 * indexW, indexY, indexW, indexH);
            addImageButton3.tag = PERSONALPHOTOSIMAGEVIEWTAG + 2;
            [addImageButton3 setBackgroundImage:[UIImage imageNamed:@"addNewImage.png"] forState:UIControlStateNormal];
            [addImageButton3 addTarget:self action:@selector(tapAddImageButton:) forControlEvents:UIControlEventTouchUpInside];
            [self.personalPhotosView addSubview:addImageButton3];
        }
            break;
        case 1:
        {
            UIButton *addImageButton1 = [UIButton buttonWithType:UIButtonTypeCustom];
            addImageButton1.frame = CGRectMake(indexX, indexY, indexW, indexH);
            addImageButton1.tag = PERSONALPHOTOSIMAGEVIEWTAG;
            [addImageButton1 setBackgroundImage:[UIImage imageNamed:@"addNewImage.png"] forState:UIControlStateNormal];
            [addImageButton1 addTarget:self action:@selector(tapAddImageButton:) forControlEvents:UIControlEventTouchUpInside];
            [self.personalPhotosView addSubview:addImageButton1];
            
            UIButton *addImageButton2 = [UIButton buttonWithType:UIButtonTypeCustom];
            addImageButton2.frame = CGRectMake(2 * indexX + indexW, indexY, indexW, indexH);
            addImageButton2.tag = PERSONALPHOTOSIMAGEVIEWTAG + 1;
            [addImageButton2 setBackgroundImage:[UIImage imageNamed:@"addNewImage.png"] forState:UIControlStateNormal];
            [addImageButton2 addTarget:self action:@selector(tapAddImageButton:) forControlEvents:UIControlEventTouchUpInside];
            [self.personalPhotosView addSubview:addImageButton2];
            
            UIImageView *imageView3 = [[UIImageView alloc] initWithFrame:CGRectMake(3 * indexX + 2 * indexW, indexY, indexW, indexH)];
            NSString *imageUrl = [NSString stringWithFormat:@"%@%@",self.photoUrlString,[self.imagesArray objectAtIndex:0]];
            [imageView3 setImageWithURL:[NSURL URLWithString:imageUrl] placeholderImage:nil];
//            imageView3.image = [UIImage imageNamed:[self.imagesArray objectAtIndex:0]];
            imageView3.tag = PERSONALPHOTOSIMAGEVIEWTAG + 2;
            [self.personalPhotosView addSubview:imageView3];
        }
            break;
        case 2:
        {
            UIButton *addImageButton1 = [UIButton buttonWithType:UIButtonTypeCustom];
            addImageButton1.frame = CGRectMake(indexX, indexY, indexW, indexH);
            addImageButton1.tag = PERSONALPHOTOSIMAGEVIEWTAG;
            [addImageButton1 setBackgroundImage:[UIImage imageNamed:@"addNewImage.png"] forState:UIControlStateNormal];
            [addImageButton1 addTarget:self action:@selector(tapAddImageButton:) forControlEvents:UIControlEventTouchUpInside];
            [self.personalPhotosView addSubview:addImageButton1];
            
            UIImageView *imageView2 = [[UIImageView alloc] initWithFrame:CGRectMake(2 * indexX + indexW, indexY, indexW, indexH)];
            NSString *imageUrl2 = [NSString stringWithFormat:@"%@%@",self.photoUrlString,[self.imagesArray objectAtIndex:0]];
            [imageView2 setImageWithURL:[NSURL URLWithString:imageUrl2] placeholderImage:nil];
            imageView2.tag = PERSONALPHOTOSIMAGEVIEWTAG + 1;
            [self.personalPhotosView addSubview:imageView2];
            
            UIImageView *imageView3 = [[UIImageView alloc] initWithFrame:CGRectMake(3 * indexX + 2 * indexW, indexY, indexW, indexH)];
            NSString *imageUrl3 = [NSString stringWithFormat:@"%@%@",self.photoUrlString,[self.imagesArray objectAtIndex:1]];
            [imageView3 setImageWithURL:[NSURL URLWithString:imageUrl3] placeholderImage:nil];
            imageView3.tag = PERSONALPHOTOSIMAGEVIEWTAG + 2;
            [self.personalPhotosView addSubview:imageView3];
        }
            break;
        default:
        {
            UIImageView *imageView1 = [[UIImageView alloc] initWithFrame:CGRectMake(indexX, indexY, indexW, indexH)];
            NSString *imageUrl1 = [NSString stringWithFormat:@"%@%@",self.photoUrlString,[self.imagesArray objectAtIndex:0]];
            [imageView1 setImageWithURL:[NSURL URLWithString:imageUrl1] placeholderImage:nil];
            imageView1.tag = PERSONALPHOTOSIMAGEVIEWTAG ;
            [self.personalPhotosView addSubview:imageView1];
            
            UIImageView *imageView2 = [[UIImageView alloc] initWithFrame:CGRectMake(2 * indexX + indexW, indexY, indexW, indexH)];
            NSString *imageUrl2 = [NSString stringWithFormat:@"%@%@",self.photoUrlString,[self.imagesArray objectAtIndex:1]];
            [imageView2 setImageWithURL:[NSURL URLWithString:imageUrl2] placeholderImage:nil];
            imageView2.tag = PERSONALPHOTOSIMAGEVIEWTAG + 1;
            [self.personalPhotosView addSubview:imageView2];
            
            UIImageView *imageView3 = [[UIImageView alloc] initWithFrame:CGRectMake(3 * indexX + 2 * indexW, indexY, indexW, indexH)];
            NSString *imageUrl3 = [NSString stringWithFormat:@"%@%@",self.photoUrlString,[self.imagesArray objectAtIndex:2]];
            [imageView3 setImageWithURL:[NSURL URLWithString:imageUrl3] placeholderImage:nil];
            imageView3.tag = PERSONALPHOTOSIMAGEVIEWTAG + 2;
            [self.personalPhotosView addSubview:imageView3];
        }
            break;
    }
}

-(void) tapAddImageButton:(UIButton *) button
{
    UIActionSheet *choiceSheet = [[UIActionSheet alloc] initWithTitle:@"添加图片"
                                                             delegate:self
                                                    cancelButtonTitle:@"取消"
                                               destructiveButtonTitle:nil
                                                    otherButtonTitles:@"拍照", @"从相册中选取", nil];
    kqAppDelegate *app = (kqAppDelegate *)([UIApplication sharedApplication].delegate);
    [choiceSheet showInView:app.window];
}

- (IBAction)tapToPersonalPhotosViewController:(UIButton *)sender {
    self.hidesBottomBarWhenPushed = YES;
    kqPersoneralPhotosViewController *ppvc = [[kqPersoneralPhotosViewController alloc] initWithNibName:@"kqPersoneralPhotosViewController" bundle:nil];
    ppvc.babyId = [self.dataDictionary valueForKey:@"id"];
    ppvc.delegate = self;
    ppvc.title = @"个人相册";
    ppvc.currentRole = 1;
    [self.navigationController pushViewController:ppvc animated:YES];
}

#pragma mark VPImageCropperDelegate
- (void)imageCropper:(VPImageCropperViewController *)cropperViewController didFinished:(UIImage *)editedImage {
    
    [cropperViewController dismissViewControllerAnimated:YES completion:^{
        NSMutableArray *imaArray = [NSMutableArray array];
        [imaArray addObject:editedImage];
        [HNAGeneral showOnWindow:@"上传中"];
        HNADownLoadManager *dl = [HNADownLoadManager sharedDownLoadManager];
        dl.delegate = self;
        [dl sendPersonalPhotosTuServerWith:nil andPhotoId:nil andImage:imaArray andAlbumId:[self.dataDictionary valueForKey:@"id"]];
    }];
}
- (void)imageCropperDidCancel:(VPImageCropperViewController *)cropperViewController {
    [cropperViewController dismissViewControllerAnimated:YES completion:^{
    }];
}
#pragma mark UIActionSheetDelegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 0) {
        // 拍照
        if ([self isCameraAvailable] && [self doesCameraSupportTakingPhotos]) {
            UIImagePickerController *controller = [[UIImagePickerController alloc] init];
            controller.sourceType = UIImagePickerControllerSourceTypeCamera;
            if ([self isFrontCameraAvailable]) {
                controller.cameraDevice = UIImagePickerControllerCameraDeviceFront;
            }
            NSMutableArray *mediaTypes = [[NSMutableArray alloc] init];
            [mediaTypes addObject:(__bridge NSString *)kUTTypeImage];
            controller.mediaTypes = mediaTypes;
            controller.delegate = self;
            [self presentViewController:controller
                               animated:YES
                             completion:^(void){
                                 NSLog(@"Picker View Controller is presented");
                             }];
        }
        
    } else if (buttonIndex == 1) {
        // 从相册中选取
        if ([self isPhotoLibraryAvailable]) {
            ELCImagePickerController *elcPicker = [[ELCImagePickerController alloc]init];
            elcPicker.maximumImagesCount = 9;
            elcPicker.imagePickerDelegate = self;
            [self presentViewController:elcPicker animated:NO completion:^{}];
        }
    }
}

#pragma mark ELCImagePickerControllerDelegate Methods

-(void)elcImagePickerControllerDidCancel:(ELCImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:NO completion:^{
    }];
}

- (void)elcImagePickerController:(ELCImagePickerController *)picker didFinishPickingMediaWithInfo:(NSArray *)info
{
    [picker dismissViewControllerAnimated:NO completion:^{
        NSMutableArray *imaArray = [NSMutableArray array];
        for (NSDictionary *dic in info) {
            UIImage *image = [dic objectForKey:UIImagePickerControllerOriginalImage];
            [imaArray addObject:image];
        }
        [HNAGeneral showOnWindow:@"上传中"];
        HNADownLoadManager *dl = [HNADownLoadManager sharedDownLoadManager];
        dl.delegate = self;
        [dl sendPersonalPhotosTuServerWith:nil andPhotoId:nil andImage:imaArray andAlbumId:[self.dataDictionary valueForKey:@"id"]];
    }];
}

-(void)sendPersonalPhotosTuServerDelegate:(NSDictionary *)dic
{
    NSDictionary *dataMap = [dic valueForKey:@"dataMap"];
    NSString *state = [dataMap valueForKey:@"state"];
    if ([state isEqualToString:SU]) {
        [self didFinishSendPicture];
    }else if([state isEqualToString:ER]){
        [HNAGeneral showAlertViewWithTitle:@"提示" andMessage:[dataMap valueForKey:@"stateMsg"]];
    }
}

-(void)cacleSendPicture
{
    
}

-(void)didFinishSendPicture
{
    HNADownLoadManager *dl = [HNADownLoadManager sharedDownLoadManager];
    dl.delegate = self;
    [dl getSpecifyBabyPersonalPhotoWithBabyId:[self.dataDictionary valueForKey:@"id"]];
}


#pragma mark - UIImagePickerControllerDelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    [picker dismissViewControllerAnimated:YES completion:^() {
        UIImage *portraitImg = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
        portraitImg = [HNAGeneral fixOrientation:portraitImg];
        portraitImg = [self imageByScalingToMaxSize:portraitImg];
        // 裁剪
        VPImageCropperViewController *imgEditorVC = [[VPImageCropperViewController alloc] initWithImage:portraitImg cropFrame:CGRectMake(0, 100.0f, self.view.frame.size.width, self.view.frame.size.width) limitScaleRatio:3.0];
        imgEditorVC.delegate = self;
        [self presentViewController:imgEditorVC animated:YES completion:^{
            // TO DO
        }];
    }];
}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:^(){
    }];
}
#pragma mark camera utility
- (BOOL) isCameraAvailable{
    return [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera];
}
- (BOOL) isRearCameraAvailable{
    return [UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceRear];
}
- (BOOL) isFrontCameraAvailable {
    return [UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceFront];
}
- (BOOL) doesCameraSupportTakingPhotos {
    return [self cameraSupportsMedia:(__bridge NSString *)kUTTypeImage sourceType:UIImagePickerControllerSourceTypeCamera];
}
- (BOOL) isPhotoLibraryAvailable{
    return [UIImagePickerController isSourceTypeAvailable:
            UIImagePickerControllerSourceTypePhotoLibrary];
}
- (BOOL) canUserPickVideosFromPhotoLibrary{
    return [self
            cameraSupportsMedia:(__bridge NSString *)kUTTypeMovie sourceType:UIImagePickerControllerSourceTypePhotoLibrary];
}
- (BOOL) canUserPickPhotosFromPhotoLibrary{
    return [self
            cameraSupportsMedia:(__bridge NSString *)kUTTypeImage sourceType:UIImagePickerControllerSourceTypePhotoLibrary];
}
- (BOOL) cameraSupportsMedia:(NSString *)paramMediaType sourceType:(UIImagePickerControllerSourceType)paramSourceType{
    __block BOOL result = NO;
    if ([paramMediaType length] == 0) {
        return NO;
    }
    NSArray *availableMediaTypes = [UIImagePickerController availableMediaTypesForSourceType:paramSourceType];
    [availableMediaTypes enumerateObjectsUsingBlock: ^(id obj, NSUInteger idx, BOOL *stop) {
        NSString *mediaType = (NSString *)obj;
        if ([mediaType isEqualToString:paramMediaType]){
            result = YES;
            *stop= YES;
        }
    }];
    return result;
}
#pragma mark image scale utility
- (UIImage *)imageByScalingToMaxSize:(UIImage *)sourceImage {
    if (sourceImage.size.width < ORIGINAL_MAX_WIDTH) return sourceImage;
    CGFloat btWidth = 0.0f;
    CGFloat btHeight = 0.0f;
    if (sourceImage.size.width > sourceImage.size.height) {
        btHeight = ORIGINAL_MAX_WIDTH;
        btWidth = sourceImage.size.width * (ORIGINAL_MAX_WIDTH / sourceImage.size.height);
    } else {
        btWidth = ORIGINAL_MAX_WIDTH;
        btHeight = sourceImage.size.height * (ORIGINAL_MAX_WIDTH / sourceImage.size.width);
    }
    CGSize targetSize = CGSizeMake(btWidth, btHeight);
    return [self imageByScalingAndCroppingForSourceImage:sourceImage targetSize:targetSize];
}
- (UIImage *)imageByScalingAndCroppingForSourceImage:(UIImage *)sourceImage targetSize:(CGSize)targetSize {
    UIImage *newImage = nil;
    CGSize imageSize = sourceImage.size;
    CGFloat width = imageSize.width;
    CGFloat height = imageSize.height;
    CGFloat targetWidth = targetSize.width;
    CGFloat targetHeight = targetSize.height;
    CGFloat scaleFactor = 0.0;
    CGFloat scaledWidth = targetWidth;
    CGFloat scaledHeight = targetHeight;
    CGPoint thumbnailPoint = CGPointMake(0.0,0.0);
    if (CGSizeEqualToSize(imageSize, targetSize) == NO)
    {
        CGFloat widthFactor = targetWidth / width;
        CGFloat heightFactor = targetHeight / height;
        
        if (widthFactor > heightFactor)
            scaleFactor = widthFactor; // scale to fit height
        else
            scaleFactor = heightFactor; // scale to fit width
        scaledWidth  = width * scaleFactor;
        scaledHeight = height * scaleFactor;
        
        // center the image
        if (widthFactor > heightFactor)
        {
            thumbnailPoint.y = (targetHeight - scaledHeight) * 0.5;
        }
        else
            if (widthFactor < heightFactor)
            {
                thumbnailPoint.x = (targetWidth - scaledWidth) * 0.5;
            }
    }
    UIGraphicsBeginImageContext(targetSize); // this will crop
    CGRect thumbnailRect = CGRectZero;
    thumbnailRect.origin = thumbnailPoint;
    thumbnailRect.size.width  = scaledWidth;
    thumbnailRect.size.height = scaledHeight;
    
    [sourceImage drawInRect:thumbnailRect];
    
    newImage = UIGraphicsGetImageFromCurrentImageContext();
    if(newImage == nil) NSLog(@"could not scale image");
    
    //pop the context to get back to the default
    UIGraphicsEndImageContext();
    return newImage;
}
#pragma mark - UINavigationControllerDelegate
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
}
- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
}


@end