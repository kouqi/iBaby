//
//  kqChatMeCell.h
//  ChatViewDemo
//
//  Created by 海峰 on 14-8-12.
//  Copyright (c) 2014年 海峰. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreAudio/CoreAudioTypes.h>
#import <AVFoundation/AVFoundation.h>
#import "RecordAudio.h"
#import "kqPlaySoundSingleton.h"
@protocol kqPlaySoundDelegate <NSObject>

-(void) startPlayingSound;
-(void) endPlayingSound;

@end















@interface kqChatMeCell : UITableViewCell<AVAudioPlayerDelegate,RecordAudioDelegate,PlaySoundSingletonDelegate>{
    RecordAudio *recordAudio;
    NSData *curAudio;
    BOOL isPlaying;
}
@property (weak, nonatomic) IBOutlet UILabel *timeLengthLabel;
@property (strong, nonatomic) IBOutlet UIImageView *sVoice3;
@property (strong, nonatomic) IBOutlet UIImageView *sVoice2;
@property (strong, nonatomic) IBOutlet UIImageView *sVoice1;
@property (weak, nonatomic) IBOutlet UIImageView *headerImageBackground;
@property (strong, nonatomic) NSString *soundPathUrl;
@property (weak, nonatomic) IBOutlet UIImageView *meHeaderImage;
@property (weak, nonatomic) IBOutlet UIImageView *chatContentBackground;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *chatContentLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) AVAudioPlayer *player;
@property (strong, nonatomic) NSTimer *timer1,*timer2,*timer3;
@property (assign, nonatomic) id<kqPlaySoundDelegate>delegate;
-(void) setChatContentText:(NSDictionary *) contentDic;
-(void) reuseTheCell;
@end
