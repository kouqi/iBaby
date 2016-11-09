//
//  kqPlayRtspViewController.m
//  KindergartenPro
//
//  Created by 海峰 on 14/11/9.
//  Copyright (c) 2014年 海峰. All rights reserved.
//

#import "kqPlayRtspViewController.h"
#define kBackviewDefaultRect		CGRectMake(20, 47, 280, 180)
@interface kqPlayRtspViewController ()
@property (weak, nonatomic) IBOutlet UIView *vitamoiView;
@property (weak, nonatomic) IBOutlet UIView *backview;
@property (weak, nonatomic) IBOutlet UIView *activityCarrierView;
@property (nonatomic, retain) UIActivityIndicatorView *activityView;
@end

@implementation kqPlayRtspViewController
-(void)startActivityWithMsg:(NSString *)msg
{
    [self.activityView startAnimating];
}

-(void)stopActivity
{
    [self.activityView stopAnimating];
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    UIImageView *topView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"wave.png"]];
//    topView.frame = CGRectMake(0, 0, 320, 10);
//    [self.view addSubview:topView];
    [HNAGeneral showOnWindow:@"打开中"];
    HNADownLoadManager *dl = [HNADownLoadManager sharedDownLoadManager];
    dl.delegate = self;
    [dl getFirstRtsp:nil andUserName:[self.cameraDictionary valueForKey:@"cameraUser"] andPassword:[self.cameraDictionary valueForKey:@"cameraPassword"] andCameraID:[self.cameraDictionary valueForKey:@"cameraId"]];
    self.title = @"看宝宝";
    self.activityCarrierView.center = self.view.center;
    self.activityView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:
                          UIActivityIndicatorViewStyleGray];
    [self.activityCarrierView addSubview:self.activityView];
    [self initTopBar];
    // Do any additional setup after loading the view from its nib.
}

-(void)getRtspDelegate:(NSString *)rtspURl
{
    if (rtspURl == nil || [rtspURl isEqualToString:@""]) {
        [HNAGeneral showAlertViewWithTitle:@"提示" andMessage:@"打开监控失败！"];
    }else{
//        [HNAGeneral showOnWindow:@"打开中"];
        self.urlString = [NSString stringWithFormat:@"%@",rtspURl];
        if (!self.mPlayer) {
            self.mPlayer = [[VMediaPlayer alloc] init];
            HNADownLoadManager *dl = [HNADownLoadManager sharedDownLoadManager];
            dl.delegate = self;
            [self.mPlayer setupPlayerWithCarrierView:self.vitamoiView withDelegate:dl];
            [self.mPlayer setDataSource:[NSURL URLWithString:self.urlString]];
            [self.mPlayer prepareAsync];
        }else{
            NSLog(@"sssssssssssssss");
        }
    }
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
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

-(void) tapBackButton
{
    if ([self.mPlayer isBuffering]) {
        [self.mPlayer setVideoShown:NO];
    }
    [self.mPlayer reset];
    [self.mPlayer unSetupPlayer];
    HNADownLoadManager *dl = [HNADownLoadManager sharedDownLoadManager];
    [dl cancelDelegate];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutorotate
{
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskAll;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)to duration:(NSTimeInterval)duration
{
    if (UIInterfaceOrientationIsLandscape(to)) {
        self.backview.frame = self.view.bounds;
    } else {
        self.backview.frame = kBackviewDefaultRect;
    }
    NSLog(@"NAL 1HUI &&&&&&&&& frame=%@", NSStringFromCGRect(self.vitamoiView.frame));
}

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
{
    NSLog(@"NAL 2HUI &&&&&&&&& frame=%@", NSStringFromCGRect(self.vitamoiView.frame));
}


- (void)mediaPlayer:(VMediaPlayer *)player didPrepared:(id)arg
{
    //	[player setVideoFillMode:VMVideoFillMode100];
//    [self stopActivity];
    [HNAGeneral hidenHUD];
    [player start];
}

- (void)mediaPlayer:(VMediaPlayer *)player playbackComplete:(id)arg
{
    [player reset];
}

- (void)mediaPlayer:(VMediaPlayer *)player error:(id)arg
{
    NSLog(@"NAL 1RRE &&&& VMediaPlayer Error: %@", arg);
//    [self stopActivity];
    [HNAGeneral hidenHUD];
    [HNAGeneral showAlertViewWithTitle:@"提示" andMessage:@"打开监控失败！"];
}

- (void)mediaPlayer:(VMediaPlayer *)player didPreparedDelegate:(id)arg
{
    //	[player setVideoFillMode:VMVideoFillMode100];
    //    [self stopActivity];
    [HNAGeneral hidenHUD];
    [player start];
}

- (void)mediaPlayer:(VMediaPlayer *)player playbackCompleteDelegate:(id)arg
{
    [player reset];
}

- (void)mediaPlayer:(VMediaPlayer *)player errorDelegate:(id)arg
{
    NSLog(@"NAL 1RRE &&&& VMediaPlayer Error: %@", arg);
    //    [self stopActivity];
    [HNAGeneral hidenHUD];
    [HNAGeneral showAlertViewWithTitle:@"提示" andMessage:@"打开监控失败！"];
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
