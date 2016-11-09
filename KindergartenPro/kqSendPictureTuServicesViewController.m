//
//  kqSendPictureTuServicesViewController.m
//  kqCameroDemo
//
//  Created by 海峰 on 14-8-18.
//  Copyright (c) 2014年 海峰. All rights reserved.
//

#import "kqSendPictureTuServicesViewController.h"

@interface kqSendPictureTuServicesViewController ()
@property (assign, nonatomic) NSInteger index;
@end

@implementation kqSendPictureTuServicesViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void) resignFirstRespnser
{
    [self.pictureTextField resignFirstResponder];
}

-(void) initImageArray
{
    if (self.imagesArray != nil && self.imagesArray.count > 0) {
        CGFloat indexX = 10.0f;
        CGFloat indexY = 65.0f;
        CGFloat indexW = (SCREEN_W - 50.0f) / 4.0f;
        CGFloat indexH = (SCREEN_W - 50.0f) / 4.0f;
        for (int i = 0; i < (self.imagesArray.count + 1); i++) {
            if (i == self.imagesArray.count) {
                if (i == 9) {
                    break;
                }else{
                    UIButton *addImageButton = [UIButton buttonWithType:UIButtonTypeCustom];
                    addImageButton.frame = CGRectMake(indexX, indexY, indexW, indexH);
                    [addImageButton setBackgroundImage:[UIImage imageNamed:@"添加照片"] forState:UIControlStateNormal];
                    [addImageButton addTarget:self action:@selector(selectFromAlbum) forControlEvents:UIControlEventTouchUpInside];
                    [self.view addSubview:addImageButton];
                }
            }else{
                UIImage *image = [self.imagesArray objectAtIndex:i];
                UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(indexX, indexY, indexW, indexH)];
                imageView.image = image;
                imageView.contentMode = UIViewContentModeScaleAspectFill;
                imageView.clipsToBounds = YES;
                imageView.userInteractionEnabled = YES;
                [self.view addSubview:imageView];
                indexX += (indexW + 10.0f);
                if (indexX + indexW > SCREEN_W) {
                    indexY += (indexH + 10.0f);
                    indexX = 10.0f;
                }
            }
        }
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"上传照片";
    self.index = 0;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(resignFirstRespnser)];
    [self.view addGestureRecognizer:tap];
    [self initTopBar];
//    UIImageView *topView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"wave.png"]];
//    topView.frame = CGRectMake(0, 0, 320, 10);
//    [self.view addSubview:topView];
    self.picture.hidden = YES;
    if (self.image != nil) {
//        [self.picture setImage:self.image];
        self.imagesArray = [NSMutableArray arrayWithObject:self.image];
    }
    [self initImageArray];
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
    [rightButton addTarget:self action:@selector(tapSendButton) forControlEvents:UIControlEventTouchUpInside];
    rightButton.frame =CGRectMake(0.0f, 6.0f, 52.0f, 27.0f);
//    [rightButton setImage:[UIImage imageNamed:@"sendPictureButton.png"] forState:UIControlStateNormal];
    [rightButton setTitle:@"发送" forState:UIControlStateNormal];
    UIBarButtonItem* right = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
    self.navigationItem.rightBarButtonItem = right;
}

-(void)tapBackButton
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"放弃此次编辑？" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    [alert show];
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1) {
        [self dismissViewControllerAnimated:NO completion:^{
            [self.delegate cacleSendPicture];
        }];
    }
}

-(BOOL) checkOUT
{
    if (self.pictureTextField.text == nil || [self.pictureTextField.text isEqualToString:@""]) {
        [HNAGeneral showAlertViewWithTitle:nil andMessage:@"请输入描述文字"];
        return NO;
    }
    return YES;
}

-(void) tapSendButton
{
    if ([self checkOUT]) {
        [self.pictureTextField resignFirstResponder];
        self.index = 0;
        [self addPicturToServ];
    }
}

-(void) addPicturToServ
{
    [HNAGeneral showOnWindow:@"上传中"];
    HNADownLoadManager *dl = [HNADownLoadManager sharedDownLoadManager];
    dl.delegate = self;
    if (self.isWonderfulMomentMode) {
        if (self.imagesArray) {
            [dl addPhotoTuServerWith:self.pictureTextField.text andPhotoId:nil andImage:self.imagesArray andAlbumId:self.albumId];
        }else{
            NSArray *imArr = [NSArray arrayWithObject:self.image];
            [dl addPhotoTuServerWith:self.pictureTextField.text andPhotoId:nil andImage:imArr andAlbumId:self.albumId];
        }
    }else{
        if (self.imagesArray) {
            [dl addXiaoNeiTuServerWith:self.pictureTextField.text andPhotoId:nil andImage:self.imagesArray andAlbumId:nil];
        }else{
            NSArray *imArr = [NSArray arrayWithObject:self.image];
            [dl addXiaoNeiTuServerWith:self.pictureTextField.text andPhotoId:nil andImage:imArr andAlbumId:nil];
        }
    }
}

-(void)addPhotoDelegate:(NSDictionary *)dic
{
    [HNAGeneral hidenHUD];
    NSDictionary *dataMap = [dic valueForKey:@"dataMap"];
    NSString *state = [dataMap valueForKey:@"state"];
    if ([state isEqualToString:SU]) {
        [self dismissViewControllerAnimated:NO completion:^{
            [self.delegate didFinishSendPicture];
        }];
    }else if([state isEqualToString:ER]){
        [HNAGeneral showAlertViewWithTitle:@"提示" andMessage:[dataMap valueForKey:@"stateMsg"]];
    }
}

-(void)addXiaoNeiTuServerDelegate:(NSDictionary *)dic
{
    [HNAGeneral hidenHUD];
    NSDictionary *dataMap = [dic valueForKey:@"dataMap"];
    NSString *state = [dataMap valueForKey:@"state"];
    if ([state isEqualToString:SU]) {
        [self dismissViewControllerAnimated:NO completion:^{
            [self.delegate didFinishSendPicture];
        }];
    }else if([state isEqualToString:ER]){
        [HNAGeneral showAlertViewWithTitle:@"提示" andMessage:[dataMap valueForKey:@"stateMsg"]];
    }
}

-(void)sendPersonalPhotosTuServerDelegate:(NSDictionary *)dic
{
    [HNAGeneral hidenHUD];
    NSDictionary *dataMap = [dic valueForKey:@"dataMap"];
    NSString *state = [dataMap valueForKey:@"state"];
    if ([state isEqualToString:SU]) {
        [self dismissViewControllerAnimated:NO completion:^{
            [self.delegate didFinishSendPicture];
        }];
    }else if([state isEqualToString:ER]){
        [HNAGeneral showAlertViewWithTitle:@"提示" andMessage:[dataMap valueForKey:@"stateMsg"]];
    }
}

#pragma mark 从相册选择照片
-(void) selectFromAlbum{
    ELCImagePickerController *elcPicker = [[ELCImagePickerController alloc]init];
    elcPicker.maximumImagesCount = 9 - self.imagesArray.count;
    elcPicker.imagePickerDelegate = self;
    [self presentViewController:elcPicker animated:NO completion:^{}];
}

-(void)elcImagePickerControllerDidCancel:(ELCImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:NO completion:^{
        
    }];
}

- (void)elcImagePickerController:(ELCImagePickerController *)picker didFinishPickingMediaWithInfo:(NSArray *)info
{
    [picker dismissViewControllerAnimated:NO completion:^{
        for (NSDictionary *dic in info) {
            UIImage *image = [dic objectForKey:UIImagePickerControllerOriginalImage];
            [self.imagesArray addObject:image];
        }
        [self initImageArray];
    }];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
