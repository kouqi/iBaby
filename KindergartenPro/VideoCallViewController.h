/*--------------------------------------------------------------------------------------------------------------------------*/
/*!!Warning: This is a key information asset of Huawei Tech Co.,Ltd                                                         */
/*CODEMARK:kOyQZYzjDpyGdBAEC2GaWmZfTxYQ/Kw8rZS6n+Xl5a8Y99A4wNRboDw+Q2eDbcchF3Tru5p3
onyliNhfFWhvrNrqXkM+8ImNYzrnfN7/GtSG48CTb16iubDGnXYd30jm0XCybMYfc81PNnvs
CA8vPaDmWau+azKKhUpj4Ly941rXKVOMnxotRgcIczQVQpNZmF7NhKBScdK4qDhsdrxLknbY
CihDK8Md65oQ2M0++bA5UE4kQmBEd0N1lRnS2zyuTd78psy5SynUqD3493ay8w==*/
/*--------------------------------------------------------------------------------------------------------------------------*/
//
//  VideoCallViewController.h
//  RcsClient
//
//  Created by Tony.f on 13-3-26.
//
//

#import <UIKit/UIKit.h>
#import "CallApi.h"

#define VIDEO_INCOMING_UNDERVIEW 0
#define VIDEO_TALKING_UNDERVIEW 1
#define VIDEO_MAKECALL_UNDERVIEW 2

#ifndef HW_SCREEN_HEIGHT
#define HW_SCREEN_HEIGHT [[UIScreen mainScreen]bounds].size.height
#endif

@interface VideoCallViewController : UIViewController<UITextFieldDelegate>
{
    CallSession* _callSession;
    UIView* _videoContainer;
    UILabel* _dtmfLabel;
    UILabel* _nameLabel;
    UILabel* _numberLabel;
    UILabel* _qosLabel;
    
    UIButton* _endButton;
    UIButton* _videoButton;
    UIButton* _voiceButton;
    UIButton* _dtmfButton;
    UIButton* _cameraSwitchButton;
    UIButton* _switchToVoiceButton;
    
    UIButton* _videoRecStart;
    UIButton* _videoRecStop;
    UIButton* _videoGetSnapShot;
    UILabel* _videoRecStatusParamHint;
    UILabel* _videoRecStatusParam;
    
    UIButton* _audioRecStart;
    UIButton* _audioRecPause;
    UIButton* _audioRecResume;
    UIButton* _audioRecStop;
    UILabel* _audioRecStatusParamHint;
    UILabel* _audioRecStatusParam;
    UITextField* _audioRecSourceParam;
    NSString* _audioSourceRecordPara;
}

- (void)setCallSession:(CallSession*)callSession;
- (void)setQos:(int)qos;
- (void)setUnderView:(int)videoCallTime;
- (void)showVideo:(CallSession*)callSession;
- (void)showLocalVideo:(CallSession *)callSession;

@end
