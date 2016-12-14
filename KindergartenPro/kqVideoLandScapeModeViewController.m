//
//  kqVideoLandScapeModeViewController.m
//  KindergartenPro
//
//  Created by 程海峰 on 2016/11/14.
//  Copyright © 2016年 海峰. All rights reserved.
//

#import "kqVideoLandScapeModeViewController.h"

@interface kqVideoLandScapeModeViewController ()

@end

@implementation kqVideoLandScapeModeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setViewController];
    UIButton *label = [UIButton buttonWithType:UIButtonTypeCustom];
    [label setFrame:CGRectMake(0, 100, 100, 50)];
    label.backgroundColor = [UIColor redColor];
    [label addTarget:self action:@selector(endLandScape) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:label];
    // Do any additional setup after loading the view.
}

- (void)setViewController
{
    UIScreen *ms = [UIScreen mainScreen];
    unsigned int heightVideo = 0;
    heightVideo = ms.bounds.size.height - 64;
    
    _videoContainer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ms.bounds.size.width, ms.bounds.size.height)];
    [self.view addSubview:_videoContainer];
}

- (void)viewDidUnload
{
    _callSession = nil;
    _videoContainer = nil;
    _dtmfLabel = nil;
    _nameLabel = nil;
    _numberLabel = nil;
    _qosLabel = nil;
    _videoContainer = nil;
    _audioSourceRecordPara = nil;
    _audioRecStatusParamHint = nil;
    _audioRecStatusParam = nil;
    _videoRecStatusParamHint = nil;
    _videoRecStatusParam = nil;
    [super viewDidUnload];
}

-(void) endLandScape{
    [self dismissViewControllerAnimated:YES completion:^{}];
}

-(UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskLandscape;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setCallSession:(CallSession*)callSession
{
    _callSession = callSession;
    [_nameLabel setText:callSession.peer.name];
    [_numberLabel setText:callSession.peer.number];
}

- (void)setUnderView:(int)videoCallTime
{
    if (videoCallTime == VIDEO_INCOMING_UNDERVIEW) {
        
        [_dtmfLabel setHidden:YES];
        
        
        [_audioRecStatusParamHint setHidden:YES];
        [_audioRecStatusParam setHidden:YES];
        [_videoRecStatusParamHint setHidden:YES];
        [_videoRecStatusParam setHidden:YES];
    }
    if (videoCallTime == VIDEO_TALKING_UNDERVIEW) {
        
        [_dtmfLabel setHidden:YES];
        
        
        [_audioRecStatusParamHint setHidden:NO];
        [_audioRecStatusParam setHidden:NO];
       
        [_videoRecStatusParamHint setHidden:NO];
        [_videoRecStatusParam setHidden:NO];
    }
    if (videoCallTime == VIDEO_MAKECALL_UNDERVIEW) {
        
        [_dtmfLabel setHidden:YES];
        
       
        [_audioRecStatusParamHint setHidden:YES];
        [_audioRecStatusParam setHidden:YES];
       
        [_videoRecStatusParamHint setHidden:YES];
        [_videoRecStatusParam setHidden:YES];
        
    }
}

- (void)setQos:(int)qos
{
    if (qos == QOS_QUALITY_BAD) {
        [_qosLabel setText:@"Bad"];
    }else if (qos == QOS_QUALITY_GOOD){
        [_qosLabel setText:@"Good"];
    }else if (qos == QOS_QUALITY_NORMAL){
        [_qosLabel setText:@"Normal"];
    }
}


- (void)showVideo:(CallSession*)callSession
{
    for (id subView in _videoContainer.subviews) {
        UIView* view = (UIView*)subView;
        [view removeFromSuperview];
    }
    /* display remote video view and reduce local view. */
    if (callSession.remoteView !=nil && callSession.localView != nil) {
        //        [callSession.localView setFrame:CGRectMake(3, 3, 120, 160)];
        //        [callSession.localView setFrame:CGRectMake(3, 3, 120, 160)];
        NSLog(@"---------%f",((EAGLExView*)callSession.remoteView).frame.size.width);
        [_videoContainer addSubview:(EAGLExView*)callSession.remoteView];
        [_videoContainer addSubview:(EAGLExView*)callSession.localView];
        //        [_videoContainer bringSubviewToFront:(EAGLExView*)callSession.localView];
        //        [_videoContainer bringSubviewToFront:(EAGLExView*)callSession.remoteView];
        //        [self.view bringSubviewToFront:_videoContainer];
    }
}
//display local view before remote video stream arrive.
- (void)showLocalVideo:(CallSession *)callSession
{
    for (id subView in _videoContainer.subviews) {
        UIView* view = (UIView*)subView;
        [view removeFromSuperview];
    }
    if (callSession.localView != nil) {
        UIScreen *ms = [UIScreen mainScreen];
        unsigned int heightVideo = 0;
        if (HW_SCREEN_HEIGHT == 480) {
            heightVideo = 480;
        }
        else{
            heightVideo = 427;
        }
        //        [callSession.localView setFrame:CGRectMake(0, 0, 320, heightVideo)];
        [callSession.localView setFrame:CGRectMake(0, 0, ms.bounds.size.width, ms.bounds.size.height)];
        [_videoContainer addSubview:(EAGLExView*)callSession.localView];
    }
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
