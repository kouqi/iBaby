//
//  kqOtherCell.h
//  ChatViewDemo
//
//  Created by 海峰 on 14-8-12.
//  Copyright (c) 2014年 海峰. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreAudio/CoreAudioTypes.h>
#import <AVFoundation/AVFoundation.h>
#import "RecordAudio.h"
#import "kqChatMeCell.h"
#import "kqPlaySoundSingleton.h"
@interface kqOtherCell : UITableViewCell<AVAudioPlayerDelegate,RecordAudioDelegate,PlaySoundSingletonDelegate>{
    RecordAudio *recordAudio;
    NSData *curAudio;
    BOOL isPlaying;
}
@property (weak, nonatomic) IBOutlet UILabel *timeLengthLabel;
@property (strong, nonatomic) IBOutlet UIImageView *oVoice3;
@property (strong, nonatomic) IBOutlet UIImageView *oVoice2;
@property (strong, nonatomic) IBOutlet UIImageView *oVoice1;
@property (weak, nonatomic) IBOutlet UIImageView *headerImageBackground;
@property (weak, nonatomic) IBOutlet UIImageView *otherHeaderImage;
@property (weak, nonatomic) IBOutlet UIImageView *chatContentBackground;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *chatContentLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) NSString *soundPathUrl;
@property (strong, nonatomic) AVAudioPlayer *player;
@property (strong, nonatomic) NSTimer *timer1,*timer2,*timer3;
@property (assign, nonatomic) id<kqPlaySoundDelegate>delegate;
-(void) setChatContentText:(NSDictionary *) contentDic;
-(void) reuseTheCell;
@end
