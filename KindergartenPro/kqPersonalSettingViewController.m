//
//  kqPersonalSettingViewController.m
//  KindergartenPro
//
//  Created by 海峰 on 14-8-6.
//  Copyright (c) 2014年 海峰. All rights reserved.
//
#define ORIGINAL_MAX_WIDTH 640.0f
#import "kqPersonalSettingViewController.h"
#import "VPImageCropperViewController.h"
#import <AssetsLibrary/AssetsLibrary.h>
#import <MobileCoreServices/MobileCoreServices.h>
#import "kqModifyPasswordViewController.h"
#import "kqSetPushViewController.h"
#import "kqAppDelegate.h"
#import "HNAWriteTextViewController.h"
#import "kqPersonalInfomationViewController.h"
#import "kqAppDelegate.h"
#import "kqBabyAboutViewController.h"
@interface kqPersonalSettingViewController ()<VPImageCropperDelegate,UIImagePickerControllerDelegate,UIActionSheetDelegate,UINavigationControllerDelegate,UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UIView *headView;
@property (weak, nonatomic) IBOutlet UIView *middleView;
@property (weak, nonatomic) IBOutlet UIView *bottomView;
@property (weak, nonatomic) IBOutlet UIImageView *headerImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollview;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UILabel *classLabel;
@property (weak, nonatomic) IBOutlet UILabel *topBabyNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *babyInfoLabel;
@property (weak, nonatomic) IBOutlet UIImageView *topHeadImageView;
@property (weak, nonatomic) IBOutlet UIButton *modifyTouxisngButton;
@end

@implementation kqPersonalSettingViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.hidesBottomBarWhenPushed = NO;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
//    UIImageView *topView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"wave.png"]];
//    topView.frame = CGRectMake(0, 0, 320, 10);
//    [self.view addSubview:topView];
//    [self initTopBar];
    self.scrollview.frame = CGRectMake(0, 0, SCREEN_W, SCREEN_H - 118);
    self.scrollview.alwaysBounceHorizontal = NO;
    self.scrollview.alwaysBounceVertical = NO;
    self.scrollview.showsHorizontalScrollIndicator = NO;
    self.scrollview.showsVerticalScrollIndicator = NO;
    self.scrollview.contentSize = CGSizeMake(320, 454);
    self.headerImageView.layer.cornerRadius = 25.0f;
    self.headerImageView.layer.masksToBounds = YES;
    kqPersonalInfoMation *info = [kqPersonalInfoMation sharedPersonalInfoMation];
    [self.headerImageView setImageWithURL:[NSURL URLWithString:info.imagPath] placeholderImage:[UIImage imageNamed:@"tbabyDefaultHeadImage.png"]];
    self.nameLabel.text = info.babyName;
    self.classLabel.text = [NSString stringWithFormat:@"%@%@",info.schoolName,info.className];
    
    
    self.topHeadImageView.layer.cornerRadius = 20.0f;
    self.topHeadImageView.layer.masksToBounds = YES;
    [self.topHeadImageView setImageWithURL:[NSURL URLWithString:info.imagPath] placeholderImage:[UIImage imageNamed:@"tbabyDefaultHeadImage.png"]];
    self.topBabyNameLabel.text = info.babyName;
    self.babyInfoLabel.text = [NSString stringWithFormat:@"%@ %@",info.schoolName,info.className];
    
    self.modifyTouxisngButton.layer.cornerRadius = 5.0f;
    self.modifyTouxisngButton.layer.borderWidth = 0.5f;
    self.modifyTouxisngButton.layer.borderColor = [UIColor whiteColor].CGColor;
    self.modifyTouxisngButton.layer.masksToBounds = YES;
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    // Do any additional setup after loading the view from its nib.
}

#pragma mark tableViewDelegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return 3;
            break;
            
        default:
            return 2;
            break;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return 20.0f;
            break;
            
        default:
            return 20.0f;
            break;
    };
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.0f;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44.0f;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    switch (indexPath.section) {
        case 0:
        {
            switch (indexPath.row) {
                case 0:
                {
                    cell.imageView.image = [UIImage imageNamed:@"setModifyPassword"];
                    cell.textLabel.text = @"修改密码";
                }
                    break;
                case 1:
                {
                    cell.imageView.image = [UIImage imageNamed:@"setPush"];
                    cell.textLabel.text = @"推送设置";
                }
                    break;
                case 2:
                {
                    cell.imageView.image = [UIImage imageNamed:@"setMemberInfo"];
                    cell.textLabel.text = @"会员详情";
                }
                    break;
                    
                default:
                    break;
            }
        }
            break;
            
        default:
        {
            switch (indexPath.row) {
                case 0:
                {
                    cell.imageView.image = [UIImage imageNamed:@"setFeedback"];
                    cell.textLabel.text = @"意见反馈";
                }
                    break;
                case 1:
                {
                    cell.imageView.image = [UIImage imageNamed:@"setAbout"];
                    cell.textLabel.text = @"关于";
                }
                    break;
                default:
                    break;
            }
        }
            break;
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    self.hidesBottomBarWhenPushed = YES;
    switch (indexPath.section) {
        case 0:
        {
            switch (indexPath.row) {
                case 0:
                {
                    [self tapModifyPasswordButton:nil];
                }
                    break;
                case 1:
                {
                    [self tapSetPushButton:nil];
                }
                    break;
                case 2:
                {
                    [self tapPersonalDetailButton:nil];
                }
                    break;
                    
                default:
                    break;
            }
        }
            break;
            
        default:
        {
            switch (indexPath.row) {
                case 0:
                {
                    [self tapFeedBackButton:nil];
                }
                    break;
                case 1:
                {
                    [self tapAboutButton:nil];
                }
                    break;
                default:
                    break;
            }
        }
            break;
    }
}

//-(void) initTopBar
//{
//    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    [rightButton addTarget:self action:@selector(tapBackButton) forControlEvents:UIControlEventTouchUpInside];
//    rightButton.frame =CGRectMake(0.0f, 6.0f, 52.0f, 27.0f);
//    [rightButton setTitle:@"退出" forState:UIControlStateNormal];
//    rightButton.titleLabel.font = [UIFont systemFontOfSize:16.0f];
//    [rightButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    UIBarButtonItem* right = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
//    self.navigationItem.rightBarButtonItem = right;
//}
//
//-(void)tapBackButton
//{
//    [self tapLogOutButton:nil];
//}

#pragma mark 修改头像

-(void)changeHeaderImageDelegate:(NSDictionary *)dic
{
    [HNAGeneral hidenHUD];
    NSDictionary *dataMap = [dic valueForKey:@"dataMap"];
    NSString *state = [dataMap valueForKey:@"state"];
    if ([state isEqualToString:SU]) {
        kqPersonalInfoMation *info = [kqPersonalInfoMation sharedPersonalInfoMation];
        info.imagPath = [NSString stringWithFormat:@"%@%@",[dic valueForKey:@"fileUrl"],[dataMap valueForKey:@"photoPath"]];
        [self.headerImageView setImageWithURL:[NSURL URLWithString:info.imagPath] placeholderImage:[UIImage imageNamed:@"tbabyDefaultHeadImage.png"]];
        [self.topHeadImageView setImageWithURL:[NSURL URLWithString:info.imagPath] placeholderImage:[UIImage imageNamed:@"tbabyDefaultHeadImage.png"]];
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
    UIActionSheet *choiceSheet = [[UIActionSheet alloc] initWithTitle:@"修改头像"
                                                             delegate:self
                                                    cancelButtonTitle:@"取消"
                                               destructiveButtonTitle:nil
                                                    otherButtonTitles:@"拍照", @"从相册中选取", nil];
    kqAppDelegate *app = (kqAppDelegate *)([UIApplication sharedApplication].delegate);
    [choiceSheet showInView:app.window];
    NSLog(@"1");
}

#pragma mark 修改密码
- (IBAction)tapModifyPasswordButton:(id)sender {
    self.hidesBottomBarWhenPushed = YES;
    kqModifyPasswordViewController *mpVC = [[kqModifyPasswordViewController alloc] initWithNibName:@"kqModifyPasswordViewController" bundle:nil];
    mpVC.title = @"修改密码";
    [self.navigationController pushViewController:mpVC animated:YES];
    NSLog(@"2");
}

#pragma mark 推送设置
- (IBAction)tapSetPushButton:(id)sender {
    self.hidesBottomBarWhenPushed = YES;
    kqSetPushViewController *spVC = [[kqSetPushViewController alloc] initWithNibName:@"kqSetPushViewController" bundle:nil];
    spVC.title = @"推送设置";
    [self.navigationController pushViewController:spVC animated:YES];
    NSLog(@"3");
}


#pragma mark 会员详情
- (IBAction)tapPersonalDetailButton:(id)sender {
    self.hidesBottomBarWhenPushed = YES;
    kqPersonalInfomationViewController *piVC = [[kqPersonalInfomationViewController alloc] initWithNibName:@"kqPersonalInfomationViewController" bundle:nil];
    piVC.title = @"会员信息";
    [self.navigationController pushViewController:piVC animated:YES];
    NSLog(@"4");
}

- (IBAction)tapCheckVersionButton:(id)sender {
    NSLog(@"5");
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
