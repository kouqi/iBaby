
//  kqWonderfulMomentViewController.m
//  KindergartenPro
//
//  Created by 海峰 on 14-8-6.
//  Copyright (c) 2014年 海峰. All rights reserved.
//

#import "kqWonderfulMomentViewController.h"
#import "kqWonderfulMomentCell.h"
#import "kqWonderfulMomentDetailViewController.h"
#import "kqPlayRtspViewController.h"
#import "VPImageCropperViewController.h"
#import <AssetsLibrary/AssetsLibrary.h>
#import <MobileCoreServices/MobileCoreServices.h>
#import "kqWonderfulMomentImageViewController.h"
@interface kqWonderfulMomentViewController ()<VPImageCropperDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UIActionSheetDelegate,kqWonderfulMomentCellDelegate>
@property(strong, nonatomic) UITableView *tableView;
@property(strong, nonatomic) NSString *photoUrlString;
@property(assign, nonatomic) BOOL isWonderfulMomentMode;
@property(strong, nonatomic) UIImageView *navBarImageView;
@property (strong, nonatomic) UIScrollView *scrollView;
@property (strong, nonatomic) NSString *albumId;
@property (strong, nonatomic) NSMutableArray *scrollViewDataArray;
@property (strong, nonatomic) UIButton *personalRightButton;
@property (assign, nonatomic) BOOL isRightButton,isDeleteMode,isTapCamera;
@end

@implementation kqWonderfulMomentViewController

- (id)initWithNibName:(NSString *)nibNameOrNil
               bundle:(NSBundle *)nibBundleOrNil {
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  if (self) {
    // Custom initialization
  }
  return self;
}

- (void)downLoadPWonderfulMomentDelegate:(NSDictionary *)dic {
    [HNAGeneral hidenHUD];
  NSDictionary *dataMap = [dic valueForKey:@"dataMap"];
  NSString *state = [dataMap valueForKey:@"state"];
  if ([state isEqualToString:SU]) {
    if ([[dic valueForKey:@"fileUrl"] isKindOfClass:[NSString class]]) {
      self.photoUrlString = [NSString stringWithFormat:@"%@", [dic valueForKey:@"fileUrl"]];
    }
    NSArray *arr = [dataMap valueForKey:@"data"];
//    if (arr.count != 0) {
      if (self.dataArray) {
          [self.dataArray removeAllObjects];
      }
      self.dataArray = [NSMutableArray arrayWithArray:[self sortArrayWithArray:arr]];
      [self.tableView reloadData];
//    }
  } else if ([state isEqualToString:ER]) {
    [HNAGeneral showAlertViewWithTitle:@"提示"
                            andMessage:[dataMap valueForKey:@"stateMsg"]];
  }
}

-(void)getSchoolPhotosDelegate:(NSDictionary *)dic
{
    [HNAGeneral hidenHUD];
    NSDictionary *dataMap = [dic valueForKey:@"dataMap"];
    NSString *state = [dataMap valueForKey:@"state"];
    if ([state isEqualToString:SU]) {
        if([[dic valueForKey:@"fileUrl"] isKindOfClass:[NSString class]]){
            self.photoUrlString = [NSString stringWithFormat:@"%@", [dic valueForKey:@"fileUrl"]];
        }
        NSArray *arr = [dataMap valueForKey:@"data"];
//        if(arr.count != 0){
        if (self.dataArray) {
            [self.dataArray removeAllObjects];
        }
        self.dataArray = [NSMutableArray arrayWithArray:[self sortArrayWithArray:arr]];
            [self.tableView reloadData];
//        }
    }else if([state isEqualToString:ER]) {
        [HNAGeneral showAlertViewWithTitle:@"提示" andMessage:[dataMap valueForKey:@"stateMsg"]];
    }
}

-(NSArray *) sortArrayWithArray:(NSArray *) arr
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSArray *array = [arr sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        NSDictionary *dic1 = (NSDictionary *) obj1;
        NSDictionary *dic2 = (NSDictionary *) obj2;
        NSString *editeDate1 = [dic1 valueForKey:@"editDate"];
        editeDate1 = [editeDate1 stringByReplacingOccurrencesOfString:@"T" withString:@" "];
        NSString *editeDate2 = [dic2 valueForKey:@"editDate"];
        editeDate2 = [editeDate2 stringByReplacingOccurrencesOfString:@"T" withString:@" "];
        NSDate *date1 = [formatter dateFromString:editeDate1];
        NSDate *date2 = [formatter dateFromString:editeDate2];
        NSComparisonResult result = [date2 compare:date1];
        return result;
    }];
    return array;
}

- (void)viewWillDisappear:(BOOL)animated {
  [super viewWillDisappear:animated];
  self.hidesBottomBarWhenPushed = NO;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    if (self.isTapCamera) {
        HNADownLoadManager *dl = [HNADownLoadManager sharedDownLoadManager];
        dl.delegate = self;
        if (self.isWonderfulMomentMode) {
            [dl downLoadWondefulMomentWithType:1];
        }else{
            [dl getSchoolPhotos];
        }
    }
}


- (void)viewDidLoad {
    self.isWonderfulMomentMode = YES;
    self.isTapCamera = NO;
  [super viewDidLoad];
    HNADownLoadManager *dl = [HNADownLoadManager sharedDownLoadManager];
    dl.delegate = self;
    if (self.isWonderfulMomentMode) {
        [dl downLoadWondefulMomentWithType:1];
    }else{
        [dl getSchoolPhotos];
    }

//  UIImageView *topView =
//      [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"wave.png"]];
//  topView.frame = CGRectMake(0, 0, 320, 10);
//  [self.view addSubview:topView];
  self.tableView = [[UITableView alloc]
      initWithFrame:CGRectMake(0, 0, SCREEN_W, SCREEN_H - 74 - 49)];
  if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0) {
    self.edgesForExtendedLayout = UIRectEdgeNone;
  }
  self.tableView.dataSource = self;
  self.tableView.delegate = self;
  self.tableView.backgroundColor = [UIColor clearColor];
  self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
  [self.view addSubview:self.tableView];
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, SCREEN_H - 64 - 49)];
    self.scrollView.backgroundColor = [UIColor whiteColor];
    CGFloat HY = 10.0f;
    CGFloat indexY = 10.0f;
    CGFloat indexH = (SCREEN_W - 50) / 4.0f;
    self.scrollView.contentSize = CGSizeMake(SCREEN_W, indexY + indexH + HY);
    [self.view addSubview:self.scrollView];
    self.scrollView.hidden = YES;
    self.isRightButton = NO;
    
  [self initTopBar];
  // Do any additional setup after loading the view from its nib.
}

- (void)initTopBar {
    UIView *topMiddleView =
    [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 44)];
    topMiddleView.backgroundColor = [UIColor clearColor];
    switch (self.currentRole) {
        case 1: {
          UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
          [rightButton addTarget:self
                          action:@selector(tapTakePhoto)
                forControlEvents:UIControlEventTouchUpInside];
          rightButton.frame = CGRectMake(0.0f, 6.0f, 23.0f, 23.0f);
          [rightButton setImage:[UIImage imageNamed:@"btn5.png"]
                       forState:UIControlStateNormal];
          UIBarButtonItem *right =
              [[UIBarButtonItem alloc] initWithCustomView:rightButton];
          self.navigationItem.rightBarButtonItem = right;
            
            UISegmentedControl *seg = [[UISegmentedControl alloc] initWithItems:@[@"每时每刻",@"校内相册"]];
            seg.selectedSegmentIndex = 0;
            seg.backgroundColor = RGB(61, 209, 188, 1);
            seg.tintColor = [UIColor whiteColor];
            seg.frame = CGRectMake(0, 7, 200, 30);
            [seg addTarget:self action:@selector(segValueChangeD:) forControlEvents:UIControlEventValueChanged];
            [topMiddleView addSubview:seg];
//            UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 160, 44)];
//            titleLabel.backgroundColor = [UIColor clearColor];
//            titleLabel.textAlignment = NSTextAlignmentCenter;
//            titleLabel.font = [UIFont systemFontOfSize:18];
//            titleLabel.textColor = [UIColor whiteColor];
//            titleLabel.text = @"每时每刻";
//            titleLabel.tag = WONDERFULMOMENTTITLELABELTAG;
//            titleLabel.userInteractionEnabled = YES;
//            [topMiddleView addSubview:titleLabel];
//            self.navBarImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"title_down"]];
//            self.navBarImageView.frame = CGRectMake(115, 12, 20, 20);
//            [topMiddleView addSubview:self.navBarImageView];
//            self.navBarImageView.userInteractionEnabled = YES;
//            UIButton *titleButton = [UIButton buttonWithType:UIButtonTypeCustom];
//            titleButton.frame = CGRectMake(0, 0, 180, 44);
//            [titleButton addTarget:self
//                            action:@selector(tapTitleButton)
//                  forControlEvents:UIControlEventTouchUpInside];
//            [topMiddleView addSubview:titleButton];
        }
            break;
        case 0:
        {
            UISegmentedControl *seg = [[UISegmentedControl alloc] initWithItems:@[@"每时每刻",@"个人相册"]];
            seg.selectedSegmentIndex = 0;
            seg.backgroundColor = RGB(61, 209, 188, 1);
            seg.tintColor = [UIColor whiteColor];
            seg.frame = CGRectMake(0, 7, 200, 30);
            [seg addTarget:self action:@selector(segValueChangeD:) forControlEvents:UIControlEventValueChanged];
            [topMiddleView addSubview:seg];
        }
        break;

        default:
          break;
    }
    self.navigationItem.titleView = topMiddleView;
}
#pragma mark 个人相册
-(void) segValueChangeD:(UISegmentedControl *)seg
{
    if (seg.selectedSegmentIndex == 1) {
        switch (self.currentRole) {
            case 0:
            {
                if (self.personalRightButton) {
                    self.personalRightButton.hidden = NO;
                }else{
                    self.personalRightButton = [UIButton buttonWithType:UIButtonTypeCustom];
                    [self.personalRightButton addTarget:self action:@selector(tapMoreButton) forControlEvents:UIControlEventTouchUpInside];
                    self.personalRightButton.frame = CGRectMake(0.0f, 6.0f, 40.0f, 5.0f);
                    [self.personalRightButton setImage:[UIImage imageNamed:@"更多.png"] forState:UIControlStateNormal];
                    UIBarButtonItem *right = [[UIBarButtonItem alloc] initWithCustomView:self.personalRightButton];
                    self.navigationItem.rightBarButtonItem = right;
                }
                if (self.scrollViewDataArray && self.scrollViewDataArray.count > 0) {
                    self.scrollView.hidden = NO;
                    self.tableView.hidden = YES;
                }else{
                    kqPersonalInfoMation *pi = [kqPersonalInfoMation sharedPersonalInfoMation];
                    [HNAGeneral showOnWindow:@"加载中..."];
                    HNADownLoadManager *dl = [HNADownLoadManager sharedDownLoadManager];
                    dl.delegate = self;
                    [dl getSpecifyBabyPersonalPhotoWithBabyId:pi.babyId];
                }
                
                
            }
                break;
                
            default:
            {
                [HNAGeneral showOnWindow:@"加载中..."];
                HNADownLoadManager *dl = [HNADownLoadManager sharedDownLoadManager];
                dl.delegate = self;
                [dl getSchoolPhotos];
                self.isWonderfulMomentMode = NO;
            }
                break;
        }
    }else{
        if (self.currentRole == 0) {
            self.scrollView.hidden = YES;
            self.tableView.hidden = NO;
            self.personalRightButton.hidden = YES;
        }else{
            [HNAGeneral showOnWindow:@"加载中..."];
            HNADownLoadManager *dl = [HNADownLoadManager sharedDownLoadManager];
            dl.delegate = self;
            [dl downLoadWondefulMomentWithType:1];
            self.isWonderfulMomentMode = YES;
        }
    }
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
        if(arr.count != 0){
            [self initDataArrayWithArray:arr];
            [self initScrollView];
//            if ([self.delegate respondsToSelector:@selector(didUploadPhotosWithArray:)]) {
//                [self.delegate didUploadPhotosWithArray:arr];
//            }
        }else{
            [HNAGeneral showAlertViewWithTitle:@"提示" andMessage:@"暂无个人相册，您可点击右上角上传"];
        }
        self.scrollView.hidden = NO;
        self.tableView.hidden = YES;
    }else if([state isEqualToString:ER]) {
        [HNAGeneral showAlertViewWithTitle:@"提示" andMessage:[dataMap valueForKey:@"stateMsg"]];
    }
}

-(void) initDataArrayWithArray:(NSArray *) array
{
    self.scrollViewDataArray = [NSMutableArray array];
    for (NSDictionary *dic in array) {
        NSMutableDictionary *mdic = [NSMutableDictionary dictionary];
        NSString *photoPath = [dic valueForKey:@"photoPath"];
        NSString *ids = [NSString stringWithFormat:@"%@",[dic valueForKey:@"id"]];
        [mdic setValue:photoPath forKey:@"photoPath"];
        [mdic setValue:ids forKey:@"ids"];
        [self.scrollViewDataArray addObject:mdic];
    }
}

/**
 *  初始化scrollview
 */
-(void) initScrollView
{
    CGFloat indexX = 10.0f;
    CGFloat WX = indexX,HY = 10.0f;
    CGFloat indexY = 10.0f;
    CGFloat indexH = (SCREEN_W - 50.0f) / 4.0f;
    CGFloat indexW = (SCREEN_W - 50.0f) / 4.0f;
    for (NSInteger i = 0; i < self.scrollViewDataArray.count; i++) {
        kqPersonalPhotosImageView *phiv = (kqPersonalPhotosImageView *)[[[NSBundle mainBundle] loadNibNamed:@"kqPersonalPhotosImageView" owner:self options:nil] objectAtIndex:0];
        phiv.isDeleteMode = NO;
        phiv.delegate = self;
        phiv.frame = CGRectMake(indexX, indexY, indexW, indexH);
        phiv.tag = PERSONALPHOTOSIMAGEVIEWTAG + i;
        NSString *imageUrl = [NSString stringWithFormat:@"%@%@",self.photoUrlString,[[self.scrollViewDataArray objectAtIndex:i] valueForKey:@"photoPath"]];
        [phiv initImageViewWithImageUrl:imageUrl];
        [self.scrollView addSubview:phiv];
        if (i + 1 < self.scrollViewDataArray.count) {
            indexX += indexW + WX;
            if (indexX + indexW + WX > SCREEN_W) {
                indexX = 10.0f;
                indexY += indexH + HY;
            }
        }
    }
    self.scrollView.contentSize = CGSizeMake(SCREEN_W, indexY + indexH + HY);
}

-(void) didTapSelectedImageViewWithViewTag:(NSInteger ) viewTag andFlag:(BOOL) isSelected
{
    
}

-(void)didTapSelectedImageViewWithViewImage:(UIImageView *)imageView
{
    [self showBigImageViewWithImageView:imageView andNumberOfIndex:self.scrollViewDataArray.count];
}

-(void) tapMoreButton
{
    if (self.isDeleteMode) {
        NSMutableArray *idsArr = [NSMutableArray array];
        for (UIView *view in self.scrollView.subviews) {
            if ([view isKindOfClass:[kqPersonalPhotosImageView class]]) {
                kqPersonalPhotosImageView *phi = (kqPersonalPhotosImageView *) view;
                if (phi.isSelected) {
                    NSString *ids = [[self.scrollViewDataArray objectAtIndex:(phi.tag - PERSONALPHOTOSIMAGEVIEWTAG)] valueForKey:@"ids"];
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
        kqPersonalInfoMation *pi = [kqPersonalInfoMation sharedPersonalInfoMation];
        HNADownLoadManager *dl = [HNADownLoadManager sharedDownLoadManager];
        dl.delegate = self;
        [dl getSpecifyBabyPersonalPhotoWithBabyId:pi.babyId];
    }else if([state isEqualToString:ER]) {
        [HNAGeneral showAlertViewWithTitle:@"提示" andMessage:[dataMap valueForKey:@"stateMsg"]];
    }
    self.isDeleteMode = NO;
    [self changePhotoModeWithMode:self.isDeleteMode];
    [self.personalRightButton setTitle:nil forState:UIControlStateNormal];
    [self.personalRightButton setImage:[UIImage imageNamed:@"更多.png"] forState:UIControlStateNormal];
}

-(void) changePhotoModeWithMode:(BOOL) isDeleteMode
{
    for (NSInteger i = 0; i < self.scrollViewDataArray.count; i++) {
        kqPersonalPhotosImageView *phiv = (kqPersonalPhotosImageView *)[self.scrollView viewWithTag:(PERSONALPHOTOSIMAGEVIEWTAG + i)];
        [phiv setImageViewModeWithMode:isDeleteMode];
    }
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
        kqPersonalInfoMation *pi = [kqPersonalInfoMation sharedPersonalInfoMation];
        [dl sendPersonalPhotosTuServerWith:nil andPhotoId:nil andImage:imaArray andAlbumId:pi.babyId];
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
            [self.personalRightButton setTitle:@"删除" forState:UIControlStateNormal];
            [self.personalRightButton setImage:nil forState:UIControlStateNormal];
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
                if ([self isRearCameraAvailable]) {
                    controller.cameraDevice = UIImagePickerControllerCameraDeviceRear;
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
        kqPersonalInfoMation *pi = [kqPersonalInfoMation sharedPersonalInfoMation];
        [dl sendPersonalPhotosTuServerWith:nil andPhotoId:nil andImage:imaArray andAlbumId:pi.babyId];
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
    kqPersonalInfoMation *pi = [kqPersonalInfoMation sharedPersonalInfoMation];
    [HNAGeneral showOnWindow:@"加载中..."];
    HNADownLoadManager *dl = [HNADownLoadManager sharedDownLoadManager];
    dl.delegate = self;
    [dl getSpecifyBabyPersonalPhotoWithBabyId:pi.babyId];
    
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

#pragma mark 老方法
- (void)tapTitleButton {
    [self.navBarImageView setImage:[UIImage imageNamed:@"title_up"]];
  NSString *uuid = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
  NSLog(@"------------%@", uuid);
  kqAppDelegate *appDelegate = (kqAppDelegate *)[UIApplication sharedApplication].delegate;
  WonderfulMomentChangeView *emcv = [[[NSBundle mainBundle] loadNibNamed:@"WonderfulMomentChangeView" owner:self options:nil] objectAtIndex:0];
    switch (self.currentRole) {
        case 0:
        {
            emcv.dataArray = [NSMutableArray arrayWithObjects:@"每时每刻",@"个人相册", nil];
        }
            break;
            
        default:
        {
            emcv.dataArray = [NSMutableArray arrayWithObjects:@"每时每刻",@"校内相册", nil];
        }
            break;
    }
    
  emcv.delegate = self;
  [emcv initView];
  [appDelegate.window addSubview:emcv];
}

-(void)didTapModeViewWithSelectMode:(NSInteger)viewMode andView:(UIView *)view
{
    switch (self.currentRole) {
        case 0:
        {
            self.hidesBottomBarWhenPushed = YES;
            kqPersonalInfoMation *pi = [kqPersonalInfoMation sharedPersonalInfoMation];
            kqPersoneralPhotosViewController *ppvc = [[kqPersoneralPhotosViewController alloc] initWithNibName:@"kqPersoneralPhotosViewController" bundle:nil];
            ppvc.title = @"个人相册";
            ppvc.babyId = pi.babyId;
            ppvc.currentRole = self.currentRole;
            [self.navigationController pushViewController:ppvc animated:YES];
        }
            break;
            
        default:
        {
            HNADownLoadManager *dl = [HNADownLoadManager sharedDownLoadManager];
            dl.delegate = self;
            UILabel *titleLabel = (UILabel *)[self.navigationItem.titleView viewWithTag:WONDERFULMOMENTTITLELABELTAG];
            switch (viewMode) {
                case 1:
                {
                    titleLabel.text = @"每时每刻";
                    [dl downLoadWondefulMomentWithType:1];
                    self.isWonderfulMomentMode = YES;
                }
                    break;
                case 2:
                {
                    titleLabel.text = @"校内相册";
                    [dl getSchoolPhotos];
                    self.isWonderfulMomentMode = NO;
                }
                    break;
                    
                default:
                    break;
            }
        }
            break;
    }
    [self.navBarImageView setImage:[UIImage imageNamed:@"title_down"]];
    [view removeFromSuperview];
}

-(void)didtapCancelViewWithView:(UIView *)view
{
    [self.navBarImageView setImage:[UIImage imageNamed:@"title_down"]];
    [view removeFromSuperview];
}
#pragma mark 放大照片
-(void) showBigImageViewWithImageView:(UIImageView *) imageView andNumberOfIndex:(NSUInteger) allNumberIndex
{
    kqWonderfulMomentImageViewController *wmivc = [[kqWonderfulMomentImageViewController alloc] initWithNibName:@"kqWonderfulMomentImageViewController" bundle:nil];
    wmivc.currentImageView = imageView;
    wmivc.allIndexNumber = allNumberIndex;
    if ([imageView.superview isKindOfClass:[kqPersonalPhotosImageView class]]) {
        wmivc.index = imageView.superview.tag - PERSONALPHOTOSIMAGEVIEWTAG;
    }else{
        wmivc.index = imageView.tag - PERSONALPHOTOSIMAGEVIEWTAG;
    }
    [self presentViewController:wmivc animated:NO completion:^{
        
    }];
}

#pragma mark  每时每刻
- (void)tapTakePhoto {
  //    [self.navigationController popViewControllerAnimated:YES];
    if (self.currentRole == 1) {
        self.isTapCamera = YES;
        kqTakePhotoViewController *pVC = [[kqTakePhotoViewController alloc] initWithNibName:@"kqTakePhotoViewController" bundle:nil];
        pVC.isWonderfulMomentMode = self.isWonderfulMomentMode;
        pVC.isFood = NO;
        [self presentViewController:pVC animated:YES completion:^{
           pVC.imagePickerController = [[UIImagePickerController alloc] init];
           pVC.imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
           pVC.imagePickerController.showsCameraControls = NO;
           pVC.imagePickerController.delegate = pVC;
           pVC.imagePickerController.allowsEditing = NO;
           [pVC addViewToCamera];
           [pVC presentViewController:pVC.imagePickerController animated:NO completion:^{}];
        }];
        return;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat height = 95.0f;
    NSDictionary *dic = [self.dataArray objectAtIndex:indexPath.row];
    if ([[dic valueForKey:@"photoTitle"] isKindOfClass:[NSString class]]) {
        NSString *desString = [dic valueForKey:@"photoTitle"];
        NSMutableDictionary *attriDic = [NSMutableDictionary dictionary];
        [attriDic setValue:NSHTMLTextDocumentType forKey:NSDocumentTypeDocumentAttribute];
        [attriDic setValue:[UIFont systemFontOfSize:14] forKey:NSFontAttributeName];
        NSMutableAttributedString * attrStr = [[NSMutableAttributedString alloc] initWithData:[desString dataUsingEncoding:NSUnicodeStringEncoding] options: attriDic documentAttributes:nil error:nil];
        NSRange range= NSMakeRange(0, [attrStr length]);
        [attrStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:14] range:range];
        
        CGSize textSize = [attrStr boundingRectWithSize:CGSizeMake(SCREEN_W - 75 - 20, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading context:nil].size;
        
        height += textSize.height;
    }
    NSString *photoPathStr = [dic valueForKey:@"photoPath"];
    NSArray *arrs = [photoPathStr componentsSeparatedByString:@"|"];
    NSMutableArray *arr = [NSMutableArray arrayWithArray:arrs];
    if ([arr.lastObject isEqualToString:@""]) {
        [arr removeLastObject];
    }
    if (arr.count != 0) {
        CGFloat gudingHeight = (SCREEN_W - 75 - 20 - 30) / 3.0f;
        if (arr.count == 1) {
            height += 150;
        }else if (arr.count <= 3) {
            height += gudingHeight;
        }else if (arr.count <= 6){
            height += (2 * gudingHeight + 10.0f);
        }else{
            height += (3 * gudingHeight + 20.0f);
        }
    }
    return height;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    kqWonderfulMomentCell *cell = (kqWonderfulMomentCell *)[[[NSBundle mainBundle]loadNibNamed:@"kqWonderfulMomentCell" owner:self options:nil] objectAtIndex:0];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    NSDictionary *dic = [self.dataArray objectAtIndex:indexPath.row];
    cell.delegate = self;
    [cell initCellWithDictionary:dic andPhotoUrlString:self.photoUrlString];
    return cell;
}

-(void)didTapWonderfulMomentCellWithViewImage:(UIImageView *)imageView andNumberImage:(NSUInteger)allNumberIndex
{
    [self showBigImageViewWithImageView:imageView andNumberOfIndex:allNumberIndex];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    return;
    self.hidesBottomBarWhenPushed = YES;
    kqWonderfulMomentDetailViewController *wmdVC =
      [[kqWonderfulMomentDetailViewController alloc]
          initWithNibName:@"kqWonderfulMomentDetailViewController"
                   bundle:nil];
    wmdVC.title = @"每时每刻详情";
    wmdVC.photoUrlString = self.photoUrlString;
    wmdVC.dataDictionary = [self.dataArray objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:wmdVC animated:YES];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}
-(UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}
@end
