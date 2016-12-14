//
//  VideoCallViewController.m
//  RcsClient
//
//  Created by Tony.f on 13-3-26.
//
//

#import "VideoCallViewController.h"
#import "kqVideoLandScapeModeViewController.h"
@interface VideoCallViewController ()

- (void)setViewController;

@end

@implementation VideoCallViewController

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
    [self setViewController];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(orientChange:) name:UIDeviceOrientationDidChangeNotification object:nil];
	// Do any additional setup after loading the view.
}

- (void)orientChange:(NSNotification *)noti {
    UIScreen *ms = [UIScreen mainScreen];
    _videoContainer.frame = CGRectMake(0, 0, ms.bounds.size.width, ms.bounds.size.height);
    _endButton.frame = CGRectMake(30, ms.bounds.size.height - 60 - 20, ms.bounds.size.width - 60, 60);
    ((EAGLExView *)_callSession.remoteView).frame = CGRectMake(0, 0, ms.bounds.size.width, ms.bounds.size.height);
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
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewDidUnload
{
    _callSession = nil;
    _videoContainer = nil;
    _dtmfLabel = nil;
    _nameLabel = nil;
    _numberLabel = nil;
    _qosLabel = nil;
    
    _endButton = nil;
    _videoButton = nil;
    _voiceButton = nil;
    _dtmfButton = nil;
    _cameraSwitchButton = nil;
    _switchToVoiceButton = nil;
    _videoContainer = nil;
    
    _videoGetSnapShot = nil;
    _videoRecStart = nil;
    _videoRecStop = nil;
    _audioRecStart = nil;
    _audioRecPause = nil;
    _audioRecResume = nil;
    _audioRecStop = nil;
    _audioSourceRecordPara = nil;
    _audioRecStatusParamHint = nil;
    _audioRecStatusParam = nil;
    _videoRecStatusParamHint = nil;
    _videoRecStatusParam = nil;
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [super viewDidUnload];
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
- (void)setViewController
{
    UIScreen *ms = [UIScreen mainScreen];
    unsigned int heightVideo = 0;
    heightVideo = ms.bounds.size.height - 64;
//    if (HW_SCREEN_HEIGHT == 480) {
//        heightVideo = 480;
//    }
//    else{
//        heightVideo = 427;
//    }
    
    _videoContainer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ms.bounds.size.width, ms.bounds.size.height)];
    [self.view addSubview:_videoContainer];
    
//    UILabel* name = [[UILabel alloc]initWithFrame:CGRectMake(20, 20, 70, 30)];
//    UILabel* number = [[UILabel alloc]initWithFrame:CGRectMake(20, 60, 70, 30)];
//    UILabel* qos = [[UILabel alloc]initWithFrame:CGRectMake(20, 100, 70, 30)];
//    [name setText:@"name:"];
//    [number setText:@"number:"];
//    [qos setText:@"qos:"];
//    [name setBackgroundColor:[UIColor clearColor]];
//    [number setBackgroundColor:[UIColor clearColor]];
//    [qos setBackgroundColor:[UIColor clearColor]];
//    [self.view addSubview:name];
//    [self.view addSubview:number];
//    [self.view addSubview:qos];
//    name = nil;
//    number = nil;
//    qos = nil;
//    
//    _nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(90, 20, 280, 30)];
//    _numberLabel = [[UILabel alloc]initWithFrame:CGRectMake(90, 60, 280, 30)];
//    _qosLabel = [[UILabel alloc]initWithFrame:CGRectMake(90, 100, 280, 30)];
//    [_nameLabel setBackgroundColor:[UIColor clearColor]];
//    [_numberLabel setBackgroundColor:[UIColor clearColor]];
//    [_qosLabel setBackgroundColor:[UIColor clearColor]];
//    [self.view addSubview:_nameLabel];
//    [self.view addSubview:_numberLabel];
//    [self.view addSubview:_qosLabel];
//    
    _endButton = [UIButton buttonWithType:UIButtonTypeCustom];
    UIButton *landScapeButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    _voiceButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    _videoButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    _dtmfButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    _cameraSwitchButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    _switchToVoiceButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    
//    _audioRecStart = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    _audioRecPause = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    _audioRecResume = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    _audioRecStop = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    _videoRecStart = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    _videoRecStop = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    _videoGetSnapShot = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    
//    [_videoGetSnapShot setFrame:CGRectMake(200, 125, 85, 40)];
//    [_videoRecStart setFrame:CGRectMake(100, 170, 95, 40)];
//    [_videoRecStop setFrame:CGRectMake(200, 170, 85, 40)];
//    [_audioRecStart setFrame:CGRectMake(10, 170, 85, 40)];
//    [_audioRecPause setFrame:CGRectMake(10, 215, 85, 40)];
//    [_audioRecResume setFrame:CGRectMake(100, 215, 95, 40)];
//    [_audioRecStop setFrame:CGRectMake(200, 215, 85, 40)];
    
    [_endButton setFrame:CGRectMake(30, ms.bounds.size.height - 60 - 20, ms.bounds.size.width - 60, 60)];
    [landScapeButton setFrame:CGRectMake(30, ms.bounds.size.height - 60 - 60, ms.bounds.size.width - 60, 60)];
//    [_voiceButton setFrame:CGRectMake(30, 330, 125, 60)];
//    [_videoButton setFrame:CGRectMake(165, 330, 125, 60)];
//    [_dtmfButton setFrame:CGRectMake(30, 330, 80, 60)];
//    [_cameraSwitchButton setFrame:CGRectMake(120, 330, 80, 60)];
//    [_switchToVoiceButton setFrame:CGRectMake(210, 330, 80, 60)];
//    
//    [_videoGetSnapShot setTitle:@"VdSnapShot" forState:UIControlStateNormal];
//    [_videoRecStart setTitle:@"VdRecStar" forState:UIControlStateNormal];
//    [_videoRecStop setTitle:@"VdRecStop" forState:UIControlStateNormal];
//    [_audioRecStart setTitle:@"VcRecStar" forState:UIControlStateNormal];
//    [_audioRecPause setTitle:@"VcRecPau" forState:UIControlStateNormal];
//    [_audioRecResume setTitle:@"VcRecRsum" forState:UIControlStateNormal];
//    [_audioRecStop setTitle:@"VcRecStop" forState:UIControlStateNormal];
    [_endButton setTitle:@"结束观看" forState:UIControlStateNormal];
    _endButton.titleLabel.font = [UIFont systemFontOfSize:16.0f];
    [_endButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    
    [landScapeButton setTitle:@"横屏观看" forState:UIControlStateNormal];
    landScapeButton.titleLabel.font = [UIFont systemFontOfSize:16.0f];
    [landScapeButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
//    [_voiceButton setTitle:@"Voice" forState:UIControlStateNormal];
//    [_videoButton setTitle:@"Video" forState:UIControlStateNormal];
//    [_dtmfButton setTitle:@"Dtmf" forState:UIControlStateNormal];
//    [_cameraSwitchButton setTitle:@"Camera" forState:UIControlStateNormal];
//    [_switchToVoiceButton setTitle:@"Voice" forState:UIControlStateNormal];
//    
//    [_videoGetSnapShot addTarget:self action:@selector(clickVideoGetSnapShot:) forControlEvents:UIControlEventTouchUpInside];
//    [_videoRecStart addTarget:self action:@selector(clickVideoRecordBtn:) forControlEvents:UIControlEventTouchUpInside];
//    [_videoRecStop addTarget:self action:@selector(clickVideoRecordBtn:) forControlEvents:UIControlEventTouchUpInside];
//    [_audioRecStart addTarget:self action:@selector(clickAudioRecordBtn:) forControlEvents:UIControlEventTouchUpInside];
//    [_audioRecPause addTarget:self action:@selector(clickAudioRecordBtn:) forControlEvents:UIControlEventTouchUpInside];
//    [_audioRecResume addTarget:self action:@selector(clickAudioRecordBtn:) forControlEvents:UIControlEventTouchUpInside];
//    [_audioRecStop addTarget:self action:@selector(clickAudioRecordBtn:) forControlEvents:UIControlEventTouchUpInside];
    [_endButton addTarget:self action:@selector(clickEndButton:) forControlEvents:UIControlEventTouchUpInside];
    [landScapeButton addTarget:self action:@selector(clickLandScapeButton) forControlEvents:UIControlEventTouchUpInside];
//    [_voiceButton addTarget:self action:@selector(clickVoiceButton:) forControlEvents:UIControlEventTouchUpInside];
//    [_dtmfButton addTarget:self action:@selector(clickDtmfButton:) forControlEvents:UIControlEventTouchUpInside];
//    [_videoButton addTarget:self action:@selector(clickVideoButton:) forControlEvents:UIControlEventTouchUpInside];
//    [_cameraSwitchButton addTarget:self action:@selector(clickCameraSwitchButton:) forControlEvents:UIControlEventTouchUpInside];
//    [_switchToVoiceButton addTarget:self action:@selector(clickSwitchToVoiceButton:) forControlEvents:UIControlEventTouchUpInside];
//    
//    [self.view addSubview:_videoGetSnapShot];
//    [self.view addSubview:_videoRecStart];
//    [self.view addSubview:_videoRecStop];
    [self.view addSubview:_endButton];
//    [self.view addSubview:landScapeButton];//横屏按键
//    [self.view addSubview:_voiceButton];
//    [self.view addSubview:_dtmfButton];
//    [self.view addSubview:_videoButton];
//    [self.view addSubview:_cameraSwitchButton];
//    [self.view addSubview:_switchToVoiceButton];
//    [self.view addSubview:_audioRecStart];
//    [self.view addSubview:_audioRecPause];
//    [self.view addSubview:_audioRecResume];
//    [self.view addSubview:_audioRecStop];
//    
//    [_voiceButton setHidden:YES];
//    [_dtmfButton setHidden:YES];
//    [_videoButton setHidden:YES];
//    [_cameraSwitchButton setHidden:YES];
//    [_switchToVoiceButton setHidden:YES];
//    [_audioRecStart setHidden:YES];
//    [_audioRecPause setHidden:YES];
//    [_audioRecResume setHidden:YES];
//    [_audioRecStop setHidden:YES];
//    [_audioRecStatusParamHint setHidden:YES];
//    [_audioRecStatusParam setHidden:YES];
//    [_audioRecSourceParam setHidden:YES];
//    [_videoRecStart setHidden:YES];
//    [_videoRecStop setHidden:YES];
//    [_videoRecStatusParamHint setHidden:YES];
//    [_videoRecStatusParam setHidden:YES];
//    [_videoGetSnapShot setHidden:YES];
//    
//    _dtmfLabel = [[UILabel alloc]initWithFrame:CGRectMake(13, 80, 294, 50)];
//    [_dtmfLabel setBackgroundColor:[UIColor grayColor]];
//    [_dtmfLabel setTextAlignment:UITextAlignmentCenter];
//    [_dtmfLabel setTextColor:[UIColor whiteColor]];
//    [_dtmfLabel setFont:[UIFont systemFontOfSize:24]];
//    [_dtmfLabel setLineBreakMode:UILineBreakModeHeadTruncation];
//    [_dtmfLabel setText:@""];
//    [self.view addSubview:_dtmfLabel];
//    [_dtmfLabel setHidden:YES];
//    
//    _audioRecStart.tag = 33;
//    _audioRecPause.tag = 34;
//    _audioRecResume.tag = 35;
//    _audioRecStop.tag = 36;
//    _videoRecStart.tag = 39;
//    _videoRecStop.tag = 40;
//    _videoGetSnapShot.tag = 41;
//    
//    _audioRecStatusParamHint = [[UILabel alloc] initWithFrame:CGRectMake(10, 256, 80, 40)];
//    _audioRecStatusParamHint.backgroundColor = [UIColor clearColor];
//    _audioRecStatusParamHint.text = @"¬º“Ù◊¥Ã¨:";
//    _audioRecStatusParamHint.tag = 30;
//    [self.view addSubview:_audioRecStatusParamHint];
//    
//    _audioRecStatusParam = [[UILabel alloc] initWithFrame:CGRectMake(95, 256, 140, 40)];
//    _audioRecStatusParam.backgroundColor = [UIColor clearColor];
//    _audioRecStatusParam.text = @"¬º“Ùø’œ–";
//    _audioRecStatusParam.tag = 31;
//    [self.view addSubview:_audioRecStatusParam];
//    
//    _audioRecSourceParam = [[UITextField alloc] initWithFrame:CGRectMake(245, 256, 50, 40)];
//	_audioRecSourceParam.backgroundColor = [UIColor clearColor];
//	_audioRecSourceParam.tag = 32;
//    _audioRecSourceParam.borderStyle =  UITextBorderStyleRoundedRect;
//    _audioRecSourceParam.placeholder = @"«Î ‰»Î¬º“Ù≤Œ ˝£®int£©ƒ¨»œ0";
//    [_audioRecSourceParam setDelegate:self];
//    [self.view addSubview:_audioRecSourceParam];
//    
//    _videoRecStatusParamHint = [[UILabel alloc] initWithFrame:CGRectMake(10, 290, 80, 40)];
//    _videoRecStatusParamHint.backgroundColor = [UIColor clearColor];
//    _videoRecStatusParamHint.text = @"¬ºœÒ◊¥Ã¨:";
//    _videoRecStatusParamHint.tag = 37;
//    [self.view addSubview:_videoRecStatusParamHint];
//    
//    _videoRecStatusParam = [[UILabel alloc] initWithFrame:CGRectMake(95, 290, 140, 40)];
//    _videoRecStatusParam.backgroundColor = [UIColor clearColor];
//    _videoRecStatusParam.text = @"¬ºœÒø’œ–";
//    _videoRecStatusParam.tag = 38;
//    [self.view addSubview:_videoRecStatusParam];
}

-(void) clickLandScapeButton
{
    UIScreen *ms = [UIScreen mainScreen];
    EAGLExView* localView = [[EAGLExView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    EAGLExView* remoteView = [[EAGLExView alloc] initWithFrame:CGRectMake(0, 0, ms.bounds.size.width, ms.bounds.size.height)];
//    NSLog(@"------------%@,%@,%@?=%@",confString,confIdString,passwordString,[infomationDictionary valueForKey:@"cameraPassword"]);
    [CallApi setConfigValue:CALL_CFG_VIDEO_DISPLAY_TYPE minortype:CALL_CFG_MINOR_BUTT configvalue:@"0"];
    CallSession *session1 = [MeetingApi quickJoinVideoConf:self.confString confId:self.confIdString confPwd:self.cameraPassword localView:localView remoteView:remoteView];
    kqVideoLandScapeModeViewController *vlsmvc = [[kqVideoLandScapeModeViewController alloc] init];
    [vlsmvc setCallSession:session1];
    [vlsmvc setUnderView:VIDEO_MAKECALL_UNDERVIEW];
    [vlsmvc showVideo:session1];
    
    [self presentViewController:vlsmvc animated:YES completion:^{}];
}

- (void)clickVideoGetSnapShot:(id)sender
{
    NSString *documentsDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSDate *date = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"YYYYMMDD_HHmmss"];
    NSString* time = [dateFormatter stringFromDate:date];
    //only *.jpg format support. 
    NSString *audioRecordFile = [documentsDirectory stringByAppendingFormat:@"/R_%@.jpg",time];
    /* get snapshot of remote view. */
    dateFormatter = nil;
}

- (void)clickVideoRecordBtn:(id)sender
{
    UIButton * mybutton = (UIButton*)sender;
    NSString *documentsDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    if(mybutton.tag == 39)//start record
    {
        NSDate *date = [NSDate date];
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
        [dateFormatter setDateFormat:@"YYYYMMDD_HHmmss"];
        NSString* time = [dateFormatter stringFromDate:date];
        //only *.264 format support. 
        NSString *audioRecordFile = [documentsDirectory stringByAppendingFormat:@"/R_%@.264",time];
        
        int result = -1;
        
        if(0 == result)
        {
            self->_videoRecStatusParam.text = @"ø™ º¬ºœÒ≥…π¶";
        } else
        {
            self->_videoRecStatusParam.text = @"ø™ º¬ºœÒ ß∞‹";
        }
        
        dateFormatter = nil;
    } else if (mybutton.tag == 40)//stop record
    {
        int result = -1;
        if(0 == result)
        {
            self->_videoRecStatusParam.text = @"Õ£÷π¬ºœÒ≥…π¶";
        }else
        {
            self->_videoRecStatusParam.text = @"Õ£÷π¬ºœÒ ß∞‹";
        }
    }
}

- (void)clickAudioRecordBtn:(id)sender
{
    UIButton * mybutton = (UIButton*)sender;
    NSString *documentsDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    if(mybutton.tag == 33)//start record
    {
        int audioSourceType = CALL_AUDIO_SOURCE_MIC;
        if([_audioSourceRecordPara isEqual:@"1"])
        {
            audioSourceType = CALL_AUDIO_SOURCE_HORN;
        } else if([_audioSourceRecordPara isEqual:@"2"])
        {
            audioSourceType = CALL_AUDIO_SOURCE_MIXED;
        } else if([_audioSourceRecordPara isEqual:@"3"])
        {
            audioSourceType = CALL_AUDIO_SOURCE_STEREO;
        } else if([_audioSourceRecordPara isEqual:@"0"])
        {
            audioSourceType = CALL_AUDIO_SOURCE_MIC;
        } else
        {
            _audioRecStatusParam.text = @"¬º“Ù‘¥≤Œ ˝∑«∑®£¨ ß∞‹";
            return;
        }
        NSDate *date = [NSDate date];
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
        [dateFormatter setDateFormat:@"YYYYMMDD_HHmmss"];
        NSString* time = [dateFormatter stringFromDate:date];
        //only wav format support
        NSString *audioRecordFile = [documentsDirectory stringByAppendingFormat:@"/R_%@.wav",time];
        
        int result = -1;
        //result = [CallRecordingApi startAudioRecording:audioRecordFile audioSource:audioSourceType sessionId:_callSession.sessionId];
        if (0 == result)
        {
            _audioRecStatusParam.text = [NSString stringWithFormat:@"ø™ º¬º“Ù≥…π¶%d", audioSourceType];
        } else
        {
            _audioRecStatusParam.text = [NSString stringWithFormat:@"ø™ º¬º“Ù ß∞‹%d", audioSourceType];
        }
        
        dateFormatter = nil;
        
    } else if (mybutton.tag == 34)//pause record
    {
        int result = -1;
        if (0 == result)
        {
            _audioRecStatusParam.text = @"‘›Õ£¬º“Ù≥…π¶";
        } else
        {
            _audioRecStatusParam.text = @"‘›Õ£¬º“Ù ß∞‹";
        }
    } else if (mybutton.tag == 35)//resume record
    {
        int result = -1;
        if(0 == result)
        {
            _audioRecStatusParam.text = @"ª÷∏¥¬º“Ù≥…π¶";
        }else
        {
            _audioRecStatusParam.text = @"ª÷∏¥¬º“Ù ß∞‹";
        }
    } else if (mybutton.tag == 36)//stop record
    {
        int result = -1;
        if (0 == result)
        {
            _audioRecStatusParam.text = @"Õ£÷π¬º“Ù≥…π¶";
        } else
        {
            _audioRecStatusParam.text = @"Õ£÷π¬º“Ù ß∞‹";
        }
    }
}

- (void)clickEndButton:(id)sender
{
    [_callSession terminate];
    [self dismissViewControllerAnimated:YES completion:^{}];
}

- (void)clickVoiceButton:(id)sender
{
    [_callSession accept:TYPE_AUDIO];
}

- (void)clickVideoButton:(id)sender
{
    UIScreen *ms = [UIScreen mainScreen];
    unsigned int heightVideo = 0;
    if (HW_SCREEN_HEIGHT == 480) {
        heightVideo = 480;
    }
    else{
        heightVideo = 427;
    }
    //creat local view and remote view
//    EAGLExView* localView = [[EAGLExView alloc] initWithFrame:CGRectMake(3, 3, 120, 160)];
//    EAGLExView* remoteView = [[EAGLExView alloc] initWithFrame:CGRectMake(0, 0, 320, heightVideo)];
    EAGLExView* localView = [[EAGLExView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    EAGLExView* remoteView = [[EAGLExView alloc] initWithFrame:CGRectMake(0, 0, ms.bounds.size.width, ms.bounds.size.height)];
    //store localView to _callSession
    [_callSession setLocalView:(id)localView];
    [_callSession setRemoteView:(id)remoteView];
    [_callSession accept:TYPE_VIDEO];
    localView = nil;
    remoteView = nil;
}

- (void)clickDtmfButton:(id)sender
{
    [_dtmfLabel setHidden:!_dtmfLabel.isHidden];
}

- (void)clickCameraSwitchButton:(id)sender
{
    [_callSession switchCamera];
}


- (void)clickSwitchToVoiceButton:(id)sender
{
    [_callSession removeVideo];
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
        [_voiceButton setHidden:NO];
        [_dtmfButton setHidden:YES];
        [_videoButton setHidden:NO];
        [_cameraSwitchButton setHidden:YES];
        [_switchToVoiceButton setHidden:YES];
        [_dtmfLabel setHidden:YES];
        
        [_audioRecStart setHidden:YES];
        [_audioRecPause setHidden:YES];
        [_audioRecResume setHidden:YES];
        [_audioRecStop setHidden:YES];
        [_audioRecStatusParamHint setHidden:YES];
        [_audioRecStatusParam setHidden:YES];
        [_audioRecSourceParam setHidden:YES];
        [_videoRecStart setHidden:YES];
        [_videoRecStop setHidden:YES];
        [_videoRecStatusParamHint setHidden:YES];
        [_videoRecStatusParam setHidden:YES];
        [_videoGetSnapShot setHidden:YES];
    }
    if (videoCallTime == VIDEO_TALKING_UNDERVIEW) {
        [_voiceButton setHidden:YES];
        [_dtmfButton setHidden:NO];
        [_videoButton setHidden:YES];
        [_cameraSwitchButton setHidden:NO];
        [_switchToVoiceButton setHidden:NO];
        [_dtmfLabel setHidden:YES];
        
        [_audioRecStart setHidden:NO];
        [_audioRecPause setHidden:NO];
        [_audioRecResume setHidden:NO];
        [_audioRecStop setHidden:NO];
        [_audioRecStatusParamHint setHidden:NO];
        [_audioRecStatusParam setHidden:NO];
        [_audioRecSourceParam setHidden:NO];
        [_videoRecStart setHidden:NO];
        [_videoRecStop setHidden:NO];
        [_videoRecStatusParamHint setHidden:NO];
        [_videoRecStatusParam setHidden:NO];
        [_videoGetSnapShot setHidden:NO];
    }
    if (videoCallTime == VIDEO_MAKECALL_UNDERVIEW) {
        [_voiceButton setHidden:YES];
        [_dtmfButton setHidden:YES];
        [_videoButton setHidden:YES];
        [_cameraSwitchButton setHidden:YES];
        [_switchToVoiceButton setHidden:YES];
        [_dtmfLabel setHidden:YES];
        
        [_audioRecStart setHidden:YES];
        [_audioRecPause setHidden:YES];
        [_audioRecResume setHidden:YES];
        [_audioRecStop setHidden:YES];
        [_audioRecStatusParamHint setHidden:YES];
        [_audioRecStatusParam setHidden:YES];
        [_audioRecSourceParam setHidden:YES];
        [_videoRecStart setHidden:YES];
        [_videoRecStop setHidden:YES];
        [_videoRecStatusParamHint setHidden:YES];
        [_videoRecStatusParam setHidden:YES];
        [_videoGetSnapShot setHidden:YES];
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

- (void)didClickDtmfKeyBoard:(UIButton *)sender
{
    if (sender.tag < 9 && sender.tag >= 0) {
        [_callSession sendDtmf:[NSString stringWithFormat:@"%d",sender.tag+1]];
        [_dtmfLabel setText:[_dtmfLabel.text stringByAppendingFormat:@"%d",sender.tag+1]];
    }
    else if(sender.tag == 9){
        [_callSession sendDtmf:@"*"];
        [_dtmfLabel setText:[_dtmfLabel.text stringByAppendingString:@"*"]];
    }
    else if(sender.tag == 10){
        [_callSession sendDtmf:@"0"];
        [_dtmfLabel setText:[_dtmfLabel.text stringByAppendingString:@"0"]];
    }
    else if(sender.tag == 11){
        [_callSession sendDtmf:@"#"];
        [_dtmfLabel setText:[_dtmfLabel.text stringByAppendingString:@"#"]];
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

#pragma mark - textField delegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    // When the user presses return, take focus away from the text field so that the keyboard is dismissed.
    if(textField.tag == 32)
    {
        _audioSourceRecordPara = textField.text;
    }
    
    NSLog(@"textFieldShouldReturn");
    
    [textField resignFirstResponder];
    return YES;
}
@end
