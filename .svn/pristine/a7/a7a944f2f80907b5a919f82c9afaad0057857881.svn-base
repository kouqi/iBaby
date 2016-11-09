//
//  kqPlaySoundSingleton.h
//  KindergartenPro
//
//  Created by 海峰 on 15/1/18.
//  Copyright (c) 2015年 海峰. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreAudio/CoreAudioTypes.h>
#import <AVFoundation/AVFoundation.h>
#import "RecordAudio.h"

@protocol PlaySoundSingletonDelegate <NSObject>

-(void) didPlaySoundError;
-(void) didPlaySoundEnd;

@end








@interface kqPlaySoundSingleton : NSObject<RecordAudioDelegate>{
    RecordAudio *recordAudio;
    NSData *curAudio;
    BOOL isPlaying;
}
@property (assign, nonatomic) id<PlaySoundSingletonDelegate>delegate;
@property (strong, nonatomic) NSString *soundPathUrl;
+(kqPlaySoundSingleton *)sharedkqPlaySoundSingleton;
-(void) setSoundPath:(NSString *) soundUrlString andDelegate:(id<PlaySoundSingletonDelegate>) cell;
-(void) stopPlaySoundAndCancelDelegate;
@end
