//
//  kqTeacherPersonalViewController.m
//  KindergartenPro
//
//  Created by 海峰 on 14-9-3.
//  Copyright (c) 2014年 海峰. All rights reserved.
//
#import "kqTeacherPersonalViewController.h"
#import "kqTeacherPersonalInfomationViewController.h"
#import "kqCreatNewBabyContactViewController.h"
#import "kqTeacherPersonalSettingViewController.h"
#import "kqTBabyContactCell.h"
#import "VPImageCropperViewController.h"
#import "kqTeacherSetPushViewController.h"
#import "kqModifyPasswordViewController.h"
#import <AssetsLibrary/AssetsLibrary.h>
#import <MobileCoreServices/MobileCoreServices.h>
#import "kqBabyAboutViewController.h"
#import "HNAWriteTextViewController.h"
#define ORIGINAL_MAX_WIDTH 640.0f
@interface kqTeacherPersonalViewController ()<VPImageCropperDelegate,UIImagePickerControllerDelegate,UIActionSheetDelegate,UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIImageView *teacherHeaderImageView;
@property (weak, nonatomic) IBOutlet UILabel *teacherNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *teacherClassLabel;
@property (strong, nonatomic) NSMutableArray *sectionArray,*dataArray;
@property (strong, nonatomic) AIMTableViewIndexBar *indexBar;
@property (strong, nonatomic) UITableView *tableView;
@end

@implementation kqTeacherPersonalViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void) viewWillAppear:(BOOL)animated
{
    kqPersonalInfoMation *info = [kqPersonalInfoMation sharedPersonalInfoMation];
    [self.teacherHeaderImageView setImageWithURL:[NSURL URLWithString:info.imagPath] placeholderImage:[UIImage imageNamed:@"tbabyDefaultHeadImage.png"]];
    self.teacherNameLabel.text = info.realName;
    self.teacherClassLabel.text = [NSString stringWithFormat:@"%@",info.className];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"个人中心";
//    UIImageView *topView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"wave.png"]];
//    topView.frame = CGRectMake(0, 0, 320, 10);
//    [self.view addSubview:topView];
    [self initTopBar];
    self.scrollView.frame = CGRectMake(0, 0, SCREEN_W, SCREEN_H - 118);
    self.scrollView.alwaysBounceHorizontal = NO;
    self.scrollView.alwaysBounceVertical = NO;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.contentSize = CGSizeMake(SCREEN_W, 454);
    self.teacherHeaderImageView.layer.cornerRadius = 25.0f;
    self.teacherHeaderImageView.layer.masksToBounds = YES;
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 115, SCREEN_W, SCREEN_H - 115 - 115) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.tableView];
    self.tableView.hidden = YES;
//    [self initTopBar];
    //    self.sectionArray = [NSMutableArray arrayWithObjects:@"A",@"B",@"C",@"D",@"E", nil];
    //    self.dataArray = [NSMutableArray arrayWithObjects:@[@"as",@"as",@"as",@"as"],@[@"bs",@"bs",@"bs",@"bs"],@[@"cs",@"cs",@"cs",@"cs"],@[@"ds",@"ds",@"ds",@"ds"],@[@"es",@"es",@"es",@"es"], nil];
    self.indexBar = [[AIMTableViewIndexBar alloc] initWithFrame:CGRectMake(SCREEN_W - 20, 80, 20, SCREEN_H - 115 - 75)];
    self.indexBar.delegate = self;
    self.indexBar.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.indexBar];
    self.indexBar.hidden = YES;
//    [HNAGeneral showOnWindow:@"加载中"];
//    HNADownLoadManager *dl = [HNADownLoadManager sharedDownLoadManager];
//    dl.delegate = self;
//    [dl teacherGetAllBaby];
    // Do any additional setup after loading the view from its nib.
}

-(void)teacherGetAllBabyDelegate:(NSDictionary *)dic
{
    [HNAGeneral hidenHUD];
    NSDictionary *dataMap = [dic valueForKey:@"dataMap"];
    NSString *state = [dataMap valueForKey:@"state"];
    if ([state isEqualToString:SU]) {
        NSArray *arr = [dataMap valueForKey:@"data"];
        if (arr.count != 0) {
            self.dataArray = [NSMutableArray arrayWithArray:[self classArray:arr]];
            [self.tableView reloadData];
        }
    }else if([state isEqualToString:ER]){
        [HNAGeneral showAlertViewWithTitle:@"提示" andMessage:[dataMap valueForKey:@"stateMsg"]];
    }
}

-(NSMutableArray *) classArray:(NSArray *) array
{
    NSMutableSet *set = [NSMutableSet set];
    for (NSDictionary *dic in array) {
        NSString *babyNameYuan = [dic valueForKey:@"name"];
        NSString *babyNamePinyin = [ChineseToPinyin pinyinFromChiniseString:babyNameYuan];
        if (babyNamePinyin.length > 0) {
            babyNamePinyin = [babyNamePinyin substringWithRange:NSMakeRange(0, 1)];
            [set addObject:babyNamePinyin];
        }
    }
    NSMutableArray *sectionArray = [NSMutableArray array];
    for (NSString *babyNamePinyiny in set) {
        [sectionArray addObject:babyNamePinyiny];
    }
    self.sectionArray = [NSMutableArray arrayWithArray:[sectionArray sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        NSString *ba1 = (NSString *) obj1;
        NSString *ba2 = (NSString *) obj2;
        NSComparisonResult result = [ba1 compare:ba2];
        return result;
    }]];
    NSMutableArray *data = [NSMutableArray array];
    for (NSString *babyNamePinyiny in self.sectionArray) {
        NSMutableArray *arr = [NSMutableArray array];
        for (NSDictionary *dic in array) {
            NSString *babyNameYuan = [dic valueForKey:@"babyName"];
            NSString *babyNamePinyin = [ChineseToPinyin pinyinFromChiniseString:babyNameYuan];
            if (babyNamePinyin.length > 0) {
                babyNamePinyin = [babyNamePinyin substringWithRange:NSMakeRange(0, 1)];
                if ([babyNamePinyiny isEqualToString:babyNamePinyin]) {
                    [arr addObject:dic];
                }
            }
        }
        [data addObject:[array sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
            NSDictionary *dic1 = (NSDictionary *) obj1;
            NSDictionary *dic2 = (NSDictionary *) obj2;
            NSString *ba1 = [dic1 valueForKey:@"babyName"];
            NSString *ba2 = [dic2 valueForKey:@"babyName"];
            NSString *bap1 = [ChineseToPinyin pinyinFromChiniseString:ba1];
            NSString *bap2 = [ChineseToPinyin pinyinFromChiniseString:ba2];
            NSComparisonResult result;
            if (bap1.length < bap2.length) {
                result = NSOrderedAscending;
            }else if (bap1.length == bap2.length){
                result = [bap1 compare:bap2];
            }else if (bap1.length > bap2.length){
                result = NSOrderedDescending;
            }
            return result;
        }]];
    }
    return data;
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.hidesBottomBarWhenPushed = NO;
}

//-(void) initTopBar
//{
//    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    [leftButton addTarget:self action:@selector(tapBackButton) forControlEvents:UIControlEventTouchUpInside];
//    leftButton.frame =CGRectMake(0.0f, 6.0f, 23.0f, 23.0f);
//    [leftButton setImage:[UIImage imageNamed:@"personalSetting.png"] forState:UIControlStateNormal];
//    UIBarButtonItem* left = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
//    self.navigationItem.leftBarButtonItem = left;
////    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
////    [rightButton addTarget:self action:@selector(tapCreatNewButon) forControlEvents:UIControlEventTouchUpInside];
////    rightButton.frame =CGRectMake(0.0f, 6.0f, 23.0f, 23.0f);
////    [rightButton setImage:[UIImage imageNamed:@"addNewItems.png"] forState:UIControlStateNormal];
////    UIBarButtonItem* right = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
////    self.navigationItem.rightBarButtonItem = right;
//}

-(void) initTopBar
{
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftButton addTarget:self action:@selector(tapBackButton) forControlEvents:UIControlEventTouchUpInside];
    leftButton.frame =CGRectMake(0.0f, 6.0f, 23.0f, 23.0f);
    [leftButton setImage:[UIImage imageNamed:@"leftBack.png"] forState:UIControlStateNormal];
    UIBarButtonItem* left = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
    self.navigationItem.leftBarButtonItem = left;
}

-(void) tapBackButton
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void) tapCreatNewButon
{
    self.hidesBottomBarWhenPushed = YES;
    kqCreatNewBabyContactViewController *cnbcVC = [[kqCreatNewBabyContactViewController alloc] initWithNibName:@"kqCreatNewBabyContactViewController" bundle:nil];
    cnbcVC.isEditMode = YES;
    cnbcVC.title = @"创建联系人";
    [self.navigationController pushViewController:cnbcVC animated:YES];
}

//-(void) tapBackButton
//{
//    self.hidesBottomBarWhenPushed = YES;
//    kqTeacherPersonalSettingViewController *tpsVC = [[kqTeacherPersonalSettingViewController alloc] initWithNibName:@"kqTeacherPersonalSettingViewController" bundle:nil];
//    tpsVC.title = @"个人设置";
//    [self.navigationController pushViewController:tpsVC animated:YES];
//}

-(void)changeHeaderImageDelegate:(NSDictionary *)dic
{
    [HNAGeneral hidenHUD];
    NSDictionary *dataMap = [dic valueForKey:@"dataMap"];
    NSString *state = [dataMap valueForKey:@"state"];
    if ([state isEqualToString:SU]) {
        kqPersonalInfoMation *info = [kqPersonalInfoMation sharedPersonalInfoMation];
        info.imagPath = [NSString stringWithFormat:@"%@%@",[dic valueForKey:@"fileUrl"],[dataMap valueForKey:@"photoPath"]];
        [self.teacherHeaderImageView setImageWithURL:[NSURL URLWithString:info.imagPath] placeholderImage:[UIImage imageNamed:@"tbabyDefaultHeadImage.png"]];
    }else if([state isEqualToString:ER]){
        [HNAGeneral showAlertViewWithTitle:@"提示" andMessage:[dataMap valueForKey:@"stateMsg"]];
    }
}

#pragma mark VPImageCropperDelegate
- (void)imageCropper:(VPImageCropperViewController *)cropperViewController didFinished:(UIImage *)editedImage {
    [HNAGeneral showOnWindow:@"上传中"];
    HNADownLoadManager *dl = [HNADownLoadManager sharedDownLoadManager];
    dl.delegate = self;
    [dl changeHeaderImageWith:editedImage];
    [cropperViewController dismissViewControllerAnimated:YES completion:^{
        
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
            UIImagePickerController *controller = [[UIImagePickerController alloc] init];
            controller.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
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
    }
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


- (IBAction)tapModifyHeadImageButton:(id)sender {
//    self.hidesBottomBarWhenPushed = YES;
//    kqTeacherPersonalInfomationViewController *tpiVC = [[kqTeacherPersonalInfomationViewController alloc] initWithNibName:@"kqTeacherPersonalInfomationViewController" bundle:nil];
//    tpiVC.title = @"个人信息";
//    [self.navigationController pushViewController:tpiVC animated:YES];
    UIActionSheet *choiceSheet = [[UIActionSheet alloc] initWithTitle:@"修改头像"
                                                             delegate:self
                                                    cancelButtonTitle:@"取消"
                                               destructiveButtonTitle:nil
                                                    otherButtonTitles:@"拍照", @"从相册中选取", nil];
    kqAppDelegate *app = (kqAppDelegate *)([UIApplication sharedApplication].delegate);
    [choiceSheet showInView:app.window];
    NSLog(@"1");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    [self.indexBar setIndexes:self.sectionArray];
    return self.sectionArray.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return ((NSArray *)([self.dataArray objectAtIndex:section])).count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 20.0f;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString *title = [self.sectionArray objectAtIndex:section];
    return title;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    kqTBabyContactCell *cell = (kqTBabyContactCell *)[[[NSBundle mainBundle] loadNibNamed:@"kqTBabyContactCell" owner:self options:nil] objectAtIndex:0];
    NSDictionary *dic = [[self.dataArray objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    cell.nameLabel.text = [dic valueForKey:@"babyName"];
    cell.relationLabel.text = [NSString stringWithFormat:@"家长：%@",[dic valueForKey:@"name"]];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
//    self.hidesBottomBarWhenPushed = YES;
//    kqCreatNewBabyContactViewController *cnbcVC = [[kqCreatNewBabyContactViewController alloc] initWithNibName:@"kqCreatNewBabyContactViewController" bundle:nil];
//    cnbcVC.isEditMode = NO;
//    cnbcVC.dataDictionary = [[self.dataArray objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
//    cnbcVC.title = @"创建联系人";
//    [self.navigationController pushViewController:cnbcVC animated:YES];
    NSURL *phoneURL = [NSURL URLWithString:[NSString stringWithFormat:@"tel://%@",[[[self.dataArray objectAtIndex:indexPath.section] objectAtIndex:indexPath.row] valueForKey:@"loginName"]]];
    UIWebView *phoneCallWebView = [[UIWebView alloc] initWithFrame:CGRectZero];
    [phoneCallWebView loadRequest:[NSURLRequest requestWithURL:phoneURL]];
    [self.view addSubview:phoneCallWebView];
}

#pragma mark - AIMTableViewIndexBarDelegate

- (void)tableViewIndexBar:(AIMTableViewIndexBar *)indexBar didSelectSectionAtIndex:(NSInteger)index{
    if ([self.tableView numberOfSections] > index && index > -1){   // for safety, should always be YES
        [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:index]
                              atScrollPosition:UITableViewScrollPositionTop
                                      animated:YES];
    }
}

- (IBAction)tapModifyPasswordButton:(UIButton *)sender {
    self.hidesBottomBarWhenPushed = YES;
    kqModifyPasswordViewController *mpVC = [[kqModifyPasswordViewController alloc] initWithNibName:@"kqModifyPasswordViewController" bundle:nil];
    mpVC.title = @"密码修改";
    [self.navigationController pushViewController:mpVC animated:YES];
}

- (IBAction)tapSetPushButton:(id)sender {
    self.hidesBottomBarWhenPushed = YES;
    kqTeacherSetPushViewController *tspVC = [[kqTeacherSetPushViewController alloc] initWithNibName:@"kqTeacherSetPushViewController" bundle:nil];
    tspVC.title = @"推送设置";
    [self.navigationController pushViewController:tspVC animated:YES];
}

- (IBAction)tapNewMessageAlertButton:(UIButton *)sender {
    
}

- (IBAction)switchNewMessage:(id)sender {
    
}

#pragma mark 意见反馈
- (IBAction)tapFeedBackButton:(id)sender {
    self.hidesBottomBarWhenPushed = YES;
    HNAWriteTextViewController *feedBackVC = [[HNAWriteTextViewController alloc] initWithNibName:@"HNAWriteTextViewController" bundle:nil];
    feedBackVC.title = @"意见反馈";
    [self.navigationController pushViewController:feedBackVC animated:YES];
    NSLog(@"6");
}

- (IBAction)tapAboutButton:(id)sender {
    self.hidesBottomBarWhenPushed = YES;
    kqBabyAboutViewController *baVC = [[kqBabyAboutViewController alloc] initWithNibName:@"kqBabyAboutViewController" bundle:nil];
    baVC.title = @"关于";
    [self.navigationController pushViewController:baVC animated:YES];
    NSLog(@"7");
}

- (IBAction)tapLogOutButton:(id)sender {
    kqAppDelegate *appdelegate = (kqAppDelegate *)[UIApplication sharedApplication].delegate;
    kqLoginViewController *loginVC = [[kqLoginViewController alloc] initWithNibName:@"kqLoginViewController" bundle:nil];
    loginVC.delegate = appdelegate;
    appdelegate.window.rootViewController = loginVC;
    [loginVC setRemeber:NO andShow:NO];
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    NSDictionary *userInfo = [ud objectForKey:@"login"];
    if (userInfo != nil) {
        [APService setAlias:@"" callbackSelector:nil object:nil];
        [ud setObject:nil forKey:@"login"];
        [ud synchronize];
    }
}



@end
