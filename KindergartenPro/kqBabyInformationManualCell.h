//
//  kqBabyInformationManualCell.h
//  KindergartenPro
//
//  Created by 海峰 on 14-7-26.
//  Copyright (c) 2014年 海峰. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreAudio/CoreAudioTypes.h>
#import <AVFoundation/AVFoundation.h>
#import <MediaPlayer/MediaPlayer.h>
@interface kqBabyInformationManualCell : UITableViewCell<AVAudioPlayerDelegate,MPMediaPickerControllerDelegate>
@property (strong, nonatomic) NSString *recoderTempFile;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (weak, nonatomic) IBOutlet UIButton *voiceButton;
@property (weak, nonatomic) IBOutlet UILabel *timeLengthLabel;
@property (weak, nonatomic) IBOutlet UIImageView *voiceFirstImageView;
@property (weak, nonatomic) IBOutlet UIImageView *voiceSecondImageView;
@property (weak, nonatomic) IBOutlet UIImageView *voiceThirdImageView;
@property (strong, nonatomic) MPMoviePlayerController *moviePlayer;
@property (assign, nonatomic) BOOL isPlaying;


//新样式
@property (weak, nonatomic) IBOutlet UIView *yanseView;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *monthLabel;
@property (weak, nonatomic) IBOutlet UIImageView *infoBackgroundImageView;
@property (weak, nonatomic) IBOutlet UILabel *weikouLabel;
@property (weak, nonatomic) IBOutlet UILabel *shuiLabel;
@property (weak, nonatomic) IBOutlet UILabel *sleepLabel;
@property (weak, nonatomic) IBOutlet UILabel *shitLabel;
@property (weak, nonatomic) IBOutlet UILabel *xinqingLabel;
@property (weak, nonatomic) IBOutlet UILabel *miaoshuLabel;
@property (weak, nonatomic) IBOutlet UILabel *hourLabel;
@property (strong, nonatomic) NSDictionary *dataDictionary;

-(void) initCell;
-(void) stopAnimation;
@end
