//
//  kqPersoneralPhotosViewController.m
//  KindergartenPro
//
//  Created by 海峰 on 15/3/10.
//  Copyright (c) 2015年 海峰. All rights reserved.
//

#import "kqPersoneralPhotosViewController.h"
#import "VPImageCropperViewController.h"
#import <AssetsLibrary/AssetsLibrary.h>
#import <MobileCoreServices/MobileCoreServices.h>

@interface kqPersoneralPhotosViewController ()<VPImageCropperDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UIActionSheetDelegate>
@property (strong, nonatomic) UIScrollView *scrollView;
@property(strong, nonatomic) NSString *photoUrlString;
@property (weak, nonatomic) IBOutlet UIButton *deletePhotoButton;
@end

@implementation kqPersoneralPhotosViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    UIImageView *topView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"wave.png"]];
//    topView.frame = CGRectMake(0, 0, 320, 10);
//    [self.view addSubview:topView];
    [self initTopBar];
    self.isRightButton = NO;
    NSString *babyId;
    switch (self.currentRole) {
        case 0:
        {
            kqPersonalInfoMation *pi = [kqPersonalInfoMation sharedPersonalInfoMation];
            babyId = pi.babyId;
        }
            break;
            
        default:
        {
            babyId = self.babyId;
        }
            break;
    }
    [HNAGeneral showOnWindow:@"加载中..."];
    HNADownLoadManager *dl = [HNADownLoadManager sharedDownLoadManager];
    dl.delegate = self;
    [dl getSpecifyBabyPersonalPhotoWithBabyId:babyId];
    UIScreen *mainScreen = [UIScreen mainScreen];
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 10, self.view.frame.size.width, self.view.frame.size.height - 74.0)];
    self.scrollView.backgroundColor = [UIColor clearColor];
    CGFloat HY = 20.0f;
    CGFloat indexY = 20.0f;
    CGFloat indexH = 80.0f;
    self.scrollView.contentSize = CGSizeMake(mainScreen.bounds.size.width, indexY + indexH + HY);
    [self.view addSubview:self.scrollView];
    
    self.deletePhotoButton.hidden = YES;
    // Do any additional setup after loading the view from its nib.
}

-(void) getSpecifyBabyPersonalPhotoDelegate:(NSDictionary *)dic
{
    [HNAGeneral hidenHUD];
    for (UIView *view in self.scrollView.subviews) {
        if ([view isKindOfClass:[kqPersonalPhotosImageView class]]) {
            [view removeFromSuperview];
        }
    }
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
        [self initScrollView];
        if ([self.delegate respondsToSelector:@selector(didUploadPhotosWithArray:)]) {
            [self.delegate didUploadPhotosWithArray:arr];
        }
        //        }
    }else if([state isEqualToString:ER]) {
        [HNAGeneral showAlertViewWithTitle:@"提示" andMessage:[dataMap valueForKey:@"stateMsg"]];
    }
}

-(void) initDataArrayWithArray:(NSArray *) array
{
    self.dataArray = [NSMutableArray array];
    for (NSDictionary *dic in array) {
        NSMutableDictionary *mdic = [NSMutableDictionary dictionary];
        NSString *photoPath = [dic valueForKey:@"photoPath"];
        NSString *ids = [NSString stringWithFormat:@"%@",[dic valueForKey:@"id"]];
        [mdic setValue:photoPath forKey:@"photoPath"];
        [mdic setValue:ids forKey:@"ids"];
        [self.dataArray addObject:mdic];
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
    [rightButton addTarget:self action:@selector(tapMoreButton) forControlEvents:UIControlEventTouchUpInside];
    rightButton.frame = CGRectMake(0.0f, 6.0f, 22.0f, 5.0f);
    [rightButton setImage:[UIImage imageNamed:@"更多.png"] forState:UIControlStateNormal];
    UIBarButtonItem *right = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
    self.navigationItem.rightBarButtonItem = right;
}

-(void) tapBackButton
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void) tapMoreButton
{
    if (self.isDeleteMode) {
        NSMutableArray *idsArr = [NSMutableArray array];
        for (UIView *view in self.scrollView.subviews) {
            if ([view isKindOfClass:[kqPersonalPhotosImageView class]]) {
                kqPersonalPhotosImageView *phi = (kqPersonalPhotosImageView *) view;
                if (phi.isSelected) {
                    NSString *ids = [[self.dataArray objectAtIndex:(phi.tag - PERSONALPHOTOSIMAGEVIEWTAG)] valueForKey:@"ids"];
                    [idsArr addObject:ids];
                }
            }
        }
        if (idsArr.count == 0) {
            [HNAGeneral showAlertViewWithTitle:@"提示" andMessage:@"未选中照片"];
        }else{
            [HNAGeneral showOnWindow:@"删除中"];
            HNADownLoadManager *dl = [HNADownLoadManager sharedDownLoadManager];
            dl.delegate = self;
            [dl deleteServePersonalPhotosWithPhotoIdsArray:idsArr];
        }
//        self.scrollView.frame = CGRectMake(0, 10, self.view.frame.size.width, self.view.frame.size.height - 20.0);
    }else{
        self.isRightButton = YES;
        UIActionSheet *as = [[UIActionSheet alloc] initWithTitle:@"更多" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"上传",@"删除", nil];
        [as showInView:self.view];
    }
}

-(void)deleteServePersonalPhotosDelegate:(NSDictionary *)dic
{
    NSDictionary *dataMap = [dic valueForKey:@"dataMap"];
    NSString *state = [dataMap valueForKey:@"state"];
    if ([state isEqualToString:SU]) {
        self.isDeleteMode = NO;
        [self changePhotoModeWithMode:self.isDeleteMode];
        
        UIBarButtonItem *right = self.navigationItem.rightBarButtonItem;
        UIButton *rightButton = (UIButton *) right.customView;
        rightButton.frame = CGRectMake(0.0f, 6.0f, 22.0f, 5.0f);
        [rightButton setImage:[UIImage imageNamed:@"更多.png"] forState:UIControlStateNormal];
        [rightButton setTitle:@"" forState:UIControlStateNormal];
        
        NSString *babyId;
        switch (self.currentRole) {
            case 0:
            {
                kqPersonalInfoMation *pi = [kqPersonalInfoMation sharedPersonalInfoMation];
                babyId = pi.babyId;
            }
                break;
                
            default:
            {
                babyId = self.babyId;
            }
                break;
        }
        HNADownLoadManager *dl = [HNADownLoadManager sharedDownLoadManager];
        dl.delegate = self;
        [dl getSpecifyBabyPersonalPhotoWithBabyId:babyId];
    }else if([state isEqualToString:ER]) {
        [HNAGeneral showAlertViewWithTitle:@"提示" andMessage:[dataMap valueForKey:@"stateMsg"]];
    }
}

- (IBAction)tapDeleteButton:(UIButton *)sender {
}

/**
 *  初始化scrollview
 */
-(void) initScrollView
{
    UIScreen *mainScreen = [UIScreen mainScreen];
    CGFloat indexX = (mainScreen.bounds.size.width - 240.0f) / 4.0f;
    CGFloat WX = indexX,HY = 20.0f;
    CGFloat indexY = 20.0f;
    CGFloat indexH = 80.0f;
    CGFloat indexW = 80.0f;
    for (NSInteger i = 0; i < self.dataArray.count; i++) {
        kqPersonalPhotosImageView *phiv = (kqPersonalPhotosImageView *)[[[NSBundle mainBundle] loadNibNamed:@"kqPersonalPhotosImageView" owner:self options:nil] objectAtIndex:0];
        phiv.isDeleteMode = NO;
        phiv.delegate = self;
        phiv.frame = CGRectMake(indexX, indexY, indexW, indexH);
        phiv.tag = PERSONALPHOTOSIMAGEVIEWTAG + i;
        NSString *imageUrl = [NSString stringWithFormat:@"%@%@",self.photoUrlString,[[self.dataArray objectAtIndex:i] valueForKey:@"photoPath"]];
        [phiv initImageViewWithImageUrl:imageUrl];
        [self.scrollView addSubview:phiv];
        if (i + 1 < self.dataArray.count) {
            indexX += indexW + WX;
            if (indexX + indexW + WX > mainScreen.bounds.size.width) {
                indexX = (mainScreen.bounds.size.width - 240.0f) / 4.0f;
                indexY += indexH + HY;
            }
        }
    }
    self.scrollView.contentSize = CGSizeMake(mainScreen.bounds.size.width, indexY + indexH + HY);
}

-(void) changePhotoModeWithMode:(BOOL) isDeleteMode
{
    for (NSInteger i = 0; i < self.dataArray.count; i++) {
        kqPersonalPhotosImageView *phiv = (kqPersonalPhotosImageView *)[self.scrollView viewWithTag:(PERSONALPHOTOSIMAGEVIEWTAG + i)];
        [phiv setImageViewModeWithMode:isDeleteMode];
    }
}

/**
 *  点击照片回调代理
 *
 *  @param viewTag    视图的tag
 *  @param isSelected 选中的状态
 */
-(void)didTapSelectedImageViewWithViewTag:(NSInteger)viewTag andFlag:(BOOL)isSelected
{
    
}

/**
 *  添加新图片到个人相册
 */
-(void) addNewImageToPersonalPhotos
{
    NSLog(@"-------------------------");
    UIActionSheet *choiceSheet = [[UIActionSheet alloc] initWithTitle:@"添加图片"
                                                             delegate:self
                                                    cancelButtonTitle:@"取消"
                                               destructiveButtonTitle:nil
                                                    otherButtonTitles:@"拍照", @"从相册中选取", nil];
    kqAppDelegate *app = (kqAppDelegate *)([UIApplication sharedApplication].delegate);
    [choiceSheet showInView:app.window];
}

#pragma mark VPImageCropperDelegate
- (void)imageCropper:(VPImageCropperViewController *)cropperViewController didFinished:(UIImage *)editedImage {
    
    [cropperViewController dismissViewControllerAnimated:YES completion:^{
        NSMutableArray *imaArray = [NSMutableArray array];
        [imaArray addObject:editedImage];
        [HNAGeneral showOnWindow:@"上传中"];
        HNADownLoadManager *dl = [HNADownLoadManager sharedDownLoadManager];
        dl.delegate = self;
        [dl sendPersonalPhotosTuServerWith:nil andPhotoId:nil andImage:imaArray andAlbumId:self.babyId];
    }];
}
- (void)imageCropperDidCancel:(VPImageCropperViewController *)cropperViewController {
    [cropperViewController dismissViewControllerAnimated:YES completion:^{
    }];
}
    
#pragma mark UIActionSheetDelegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (self.isRightButton) {
        if (buttonIndex == 1) {
            self.isDeleteMode = YES;
            [self changePhotoModeWithMode:self.isDeleteMode];
            
            UIBarButtonItem *right = self.navigationItem.rightBarButtonItem;
            UIButton *rightButton = (UIButton *) right.customView;
            rightButton.frame = CGRectMake(0.0f, 6.0f, 42.0f, 5.0f);
            [rightButton setImage:nil forState:UIControlStateNormal];
            [rightButton setTitle:@"删除" forState:UIControlStateNormal];
            
//            self.deletePhotoButton.hidden = NO;
//            self.deletePhotoButton.frame = CGRectMake((self.view.frame.size.width - self.deletePhotoButton.frame.size.width) / 2, self.view.frame.size.height - 44.0, self.deletePhotoButton.frame.size.width, self.deletePhotoButton.frame.size.height);
//            self.scrollView.frame = CGRectMake(0, 10, self.view.frame.size.width, self.view.frame.size.height - 64.0);
        }
        if (buttonIndex == 0) {
            [self addNewImageToPersonalPhotos];
        }
    }else{
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
    self.isRightButton = NO;
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
        [dl sendPersonalPhotosTuServerWith:nil andPhotoId:nil andImage:imaArray andAlbumId:self.babyId];
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
    NSString *babyId;
    switch (self.currentRole) {
        case 0:
        {
            kqPersonalInfoMation *pi = [kqPersonalInfoMation sharedPersonalInfoMation];
            babyId = pi.babyId;
        }
            break;
            
        default:
        {
            babyId = self.babyId;
        }
            break;
    }
    [HNAGeneral showOnWindow:@"加载中..."];
    HNADownLoadManager *dl = [HNADownLoadManager sharedDownLoadManager];
    dl.delegate = self;
    [dl getSpecifyBabyPersonalPhotoWithBabyId:babyId];

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


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end