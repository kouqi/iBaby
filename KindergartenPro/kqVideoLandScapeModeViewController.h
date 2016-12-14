//
//  kqVideoLandScapeModeViewController.h
//  KindergartenPro
//
//  Created by 程海峰 on 2016/11/14.
//  Copyright © 2016年 海峰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface kqVideoLandScapeModeViewController : UIViewController
{
    CallSession* _callSession;
    UIView* _videoContainer;
    UILabel* _dtmfLabel;
    UILabel* _nameLabel;
    UILabel* _numberLabel;
    UILabel* _qosLabel;
    
    UILabel* _videoRecStatusParamHint;
    UILabel* _videoRecStatusParam;
    UILabel* _audioRecStatusParamHint;
    UILabel* _audioRecStatusParam;
    NSString* _audioSourceRecordPara;
}
- (void)setCallSession:(CallSession*)callSession;
- (void)setQos:(int)qos;
- (void)setUnderView:(int)videoCallTime;
- (void)showVideo:(CallSession*)callSession;
- (void)showLocalVideo:(CallSession *)callSession;
@end
