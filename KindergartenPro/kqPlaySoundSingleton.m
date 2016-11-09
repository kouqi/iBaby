//
//  kqPlaySoundSingleton.m
//  KindergartenPro
//
//  Created by 海峰 on 15/1/18.
//  Copyright (c) 2015年 海峰. All rights reserved.
//

#import "kqPlaySoundSingleton.h"

@implementation kqPlaySoundSingleton
static kqPlaySoundSingleton *info;
+(kqPlaySoundSingleton *)sharedkqPlaySoundSingleton
{
    @synchronized(self)
    {
        if (info == nil) {
            info = [[self alloc] init];
        }
    }
    return info;
}

-(void)setSoundPath:(NSString *)soundUrlString andDelegate:(id<PlaySoundSingletonDelegate>)cell
{
    if (!recordAudio) {
        recordAudio = [[RecordAudio alloc]init];
        recordAudio.delegate = self;
    }
    if (isPlaying) {
        [self.delegate didPlaySoundEnd];
        [recordAudio stopPlay];
        if ([self.soundPathUrl isEqualToString:soundUrlString]) {
            return;
        }
    }
    if (soundUrlString != nil && !([soundUrlString isEqualToString:@""])) {
        self.soundPathUrl = soundUrlString;
        curAudio = [NSData dataWithContentsOfURL:[NSURL URLWithString:soundUrlString]];
        [recordAudio play:curAudio];
        isPlaying = YES;
        self.delegate = cell;
    }
}

-(void)RecordStatus:(int)status
{
    if (status==0){
        //播放中
    } else if(status==1){
        //完成
        isPlaying = NO;
        [self.delegate didPlaySoundEnd];
        NSLog(@"播放完成");
    }else if(status==2){
        //出错
        isPlaying = NO;
        [self.delegate didPlaySoundError];
        NSLog(@"播放出错");
    }
}

-(void)stopPlaySoundAndCancelDelegate
{
    if (isPlaying) {
        [recordAudio stopPlay];
        self.delegate = nil;
    }
}

@end
