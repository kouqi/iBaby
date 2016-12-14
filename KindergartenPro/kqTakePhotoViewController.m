//
//  kqViewController.m
//  kqCameroDemo
//
//  Created by 海峰 on 14-8-18.
//  Copyright (c) 2014年 海峰. All rights reserved.
//

#import "kqTakePhotoViewController.h"
#import "ELCImagePickerController.h"
#import "ELCAlbumPickerController.h"
#import "ELCAssetTablePicker.h"
@interface kqTakePhotoViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@end

@implementation kqTakePhotoViewController

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
    self.view.backgroundColor = [UIColor clearColor];
    // Do any additional setup after loading the view from its nib.
}

-(void) addViewToCamera
{
    CGSize screenBounds = [UIScreen mainScreen].bounds.size;
    CGFloat cameraAspectRatio = 4.0f/3.0f;
    CGFloat camViewHeight = screenBounds.width * cameraAspectRatio;
    CGFloat scale = screenBounds.height / camViewHeight;
    self.imagePickerController.cameraViewTransform = CGAffineTransformMakeTranslation(0, (screenBounds.height - camViewHeight) / 2.0);
    self.imagePickerController.cameraViewTransform = CGAffineTransformScale(self.imagePickerController.cameraViewTransform, scale, scale);
    
    self.imagePickerController.cameraFlashMode = UIImagePickerControllerCameraFlashModeOff;
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, SCREEN_H - 49, SCREEN_W, 49)];
    view.backgroundColor = RGB(0, 0, 0, 0.5);
    UIButton *alBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    alBtn.frame = CGRectMake(25, 15, 20, 20);
    [alBtn addTarget:self action:@selector(tapAlbumButton) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:alBtn];
    [alBtn setImage:[UIImage imageNamed:@"相册"] forState:UIControlStateNormal];
    UIButton *tpBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    tpBtn.frame = CGRectMake((SCREEN_W - 35) / 2, 7, 35, 35);
    [tpBtn addTarget:self action:@selector(tapTakePictureButton) forControlEvents:UIControlEventTouchUpInside];
//    tpBtn.center = view.center;
    [view addSubview:tpBtn];
    [tpBtn setImage:[UIImage imageNamed:@"拍照"] forState:UIControlStateNormal];
    [tpBtn setImage:[UIImage imageNamed:@"按下"] forState:UIControlStateHighlighted];
    UIButton *baBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    baBtn.frame = CGRectMake(SCREEN_W - 25 - 20, 15, 20, 20);
    [baBtn addTarget:self action:@selector(tapBackButton) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:baBtn];
    [baBtn setImage:[UIImage imageNamed:@"不照相"] forState:UIControlStateNormal];
    [self.imagePickerController.view addSubview:view];
}

-(void) tapAlbumButton
{
    [self.imagePickerController dismissViewControllerAnimated:NO completion:^{
        ELCImagePickerController *elcPicker = [[ELCImagePickerController alloc]init];
        if (self.isFood) {
            elcPicker.maximumImagesCount = self.photoNumber;
        }else{
            elcPicker.maximumImagesCount = 9;
        }
        elcPicker.imagePickerDelegate = self;
        [self presentViewController:elcPicker animated:NO completion:^{}];
    }];
}

#pragma mark ELCImagePickerControllerDelegate Methods

-(void)elcImagePickerControllerDidCancel:(ELCImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:NO completion:^{
        [self presentViewController:self.imagePickerController animated:NO completion:^{}];
    }];
}

- (void)elcImagePickerController:(ELCImagePickerController *)picker didFinishPickingMediaWithInfo:(NSArray *)info
{
    [picker dismissViewControllerAnimated:NO completion:^{
        if (!self.isFood) {
            kqSendPictureTuServicesViewController *sptsVC = [[kqSendPictureTuServicesViewController alloc] initWithNibName:@"kqSendPictureTuServicesViewController" bundle:nil];
            NSMutableArray *imaArray = [NSMutableArray array];
            for (NSDictionary *dic in info) {
                UIImage *image = [dic objectForKey:UIImagePickerControllerOriginalImage];
                [imaArray addObject:image];
            }
            sptsVC.isWonderfulMomentMode = self.isWonderfulMomentMode;
            sptsVC.imagesArray = [NSMutableArray arrayWithArray:imaArray];
            sptsVC.delegate = self;
            UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:sptsVC];
            [self presentViewController:navi animated:YES completion:^{}];
        }else{
            NSMutableArray *imaArray = [NSMutableArray array];
            for (NSDictionary *dic in info) {
                UIImage *image = [dic objectForKey:UIImagePickerControllerOriginalImage];
                [imaArray addObject:image];
            }
            [self.delegate didSelectImageWithArray:imaArray];
            [self dismissViewControllerAnimated:NO completion:^{
                
            }];
        }
    }];
}

-(void) tapTakePictureButton
{
    [self.imagePickerController takePicture];
}

-(void) tapBackButton
{
    [self.imagePickerController dismissViewControllerAnimated:NO completion:^{
        [self dismissViewControllerAnimated:NO completion:^{}];
    }];
}

#pragma mark - UIImagePickerController回调
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:^{}];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    //保存相片到数组，这种方法不可取,会占用过多内存
    //如果是一张就无所谓了，到时候自己改
    __block UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    self.imageView.image = image;
    [picker dismissViewControllerAnimated:NO completion:^{
        kqUseTakePickerViewController *utpVC = [[kqUseTakePickerViewController alloc] initWithNibName:@"kqUseTakePickerViewController" bundle:nil];
        utpVC.delegate = self;
        utpVC.isWonderfulMomentMode = self.isWonderfulMomentMode;
        utpVC.image = [info objectForKey:UIImagePickerControllerOriginalImage];
        [self presentViewController:utpVC animated:NO completion:^{}];
    }];
}

#pragma UsePictureDelegate
-(void)cacelUsePicture
{
    [self presentViewController:self.imagePickerController animated:NO completion:^{}];
}

-(void)usePicture:(UIImage *)image
{
    if (!self.isFood) {
        kqSendPictureTuServicesViewController *sptsVC = [[kqSendPictureTuServicesViewController alloc] initWithNibName:@"kqSendPictureTuServicesViewController" bundle:nil];
        sptsVC.image = image;
        sptsVC.isWonderfulMomentMode = self.isWonderfulMomentMode;
        sptsVC.delegate = self;
        UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:sptsVC];
        [self presentViewController:navi animated:YES completion:^{}];
    }else{
        NSMutableArray *imaArray = [NSMutableArray arrayWithObject:image];
        [self.delegate didSelectImageWithArray:imaArray];
        [self dismissViewControllerAnimated:NO completion:^{
            
        }];
    }
}

#pragma SendPictureDelegate

-(void)cacleSendPicture
{
    [self dismissViewControllerAnimated:NO completion:^{}];
}

-(void)didFinishSendPicture
{
//    [self dismissViewControllerAnimated:NO completion:^{}];
    [self presentViewController:self.imagePickerController animated:NO completion:^{}];
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
