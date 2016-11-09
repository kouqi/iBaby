//
//  kqChatMeCell.m
//  ChatViewDemo
//
//  Created by 海峰 on 14-8-12.
//  Copyright (c) 2014年 海峰. All rights reserved.
//

#import "kqChatMeCell.h"

@implementation kqChatMeCell

- (void)awakeFromNib
{
    self.headerImageBackground.frame = CGRectMake(262, 36, 38, 38);
    self.meHeaderImage.frame = CGRectMake(262, 36, 38, 38);
    // Initialization code
}

-(void) animation1
{
    self.sVoice1.hidden = NO;
    self.sVoice2.hidden = YES;
    self.sVoice3.hidden = YES;
    
}

-(void) sAnimation2
{
    self.timer2 = [NSTimer scheduledTimerWithTimeInterval:0.9 target:self selector:@selector(animation2) userInfo:nil repeats:YES];
    [self.timer2 fire];
}

-(void) animation2
{
    self.sVoice1.hidden = YES;
    self.sVoice2.hidden = NO;
    self.sVoice3.hidden = YES;
}

-(void) sAnimation3
{
    self.timer3 = [NSTimer scheduledTimerWithTimeInterval:0.9 target:self selector:@selector(animation3) userInfo:nil repeats:YES];
    [self.timer3 fire];
}

-(void) animation3
{
    self.sVoice1.hidden = YES;
    self.sVoice2.hidden = YES;
    self.sVoice3.hidden = NO;
}

-(void) startAnimation
{
    self.timer1 = [NSTimer scheduledTimerWithTimeInterval:0.9 target:self selector:@selector(animation1) userInfo:nil repeats:YES];
    [self.timer1 fire];
    [self performSelector:@selector(sAnimation2) withObject:nil afterDelay:0.3];
    [self performSelector:@selector(sAnimation3) withObject:nil afterDelay:0.6];
}

-(void) reuseTheCell
{
    recordAudio.delegate = nil;
}

-(void)setChatContentText:(NSDictionary *)contentDic
{
    recordAudio = [[RecordAudio alloc]init];
    recordAudio.delegate = self;
    self.soundPathUrl = [contentDic valueForKey:@"soundPath"];
    NSString *flag = [contentDic valueForKey:@"flag"];
    NSString *content = [contentDic valueForKey:@"content"];
    if ([flag isEqualToString:@"1"]) {
        self.headerImageBackground.frame = CGRectMake(262, 51, 38, 38);
        self.meHeaderImage.frame = CGRectMake(266, 55, 30, 30);
        self.timeLabel.text = [contentDic valueForKey:@"time"];
    }else{
        self.headerImageBackground.frame = CGRectMake(262, 16, 38, 38);
        self.meHeaderImage.frame = CGRectMake(266, 20, 30, 30);
        self.timeLabel.hidden = YES;
    }
    self.nameLabel.text = [contentDic valueForKey:@"senderName"];
    self.meHeaderImage.layer.cornerRadius = 15.0f;
    self.meHeaderImage.layer.masksToBounds = YES;
    [self.meHeaderImage setImageWithURL:[NSURL URLWithString:[contentDic valueForKey:@"headerImagePath"]] placeholderImage:[UIImage imageNamed:@"tbabyDefaultHeadImage.png"]];
    if (([contentDic valueForKey:@"soundPath"] == nil || [[contentDic valueForKey:@"soundPath"] isEqualToString:@""])) {
        CGFloat height,width;
        CGSize textsize = [content sizeWithFont:[UIFont systemFontOfSize:14.0f] constrainedToSize:CGSizeMake(220.0f, 2000.0f) lineBreakMode:NSLineBreakByWordWrapping];
        height = textsize.height + 6.0f;
        width = textsize.width + 6.0f;
        if (height < 30.0f) {
            if (width + 6.0f < 30.0f) {
                width = 30.0f;
            }
            if ([flag isEqualToString:@"1"]) {
                self.chatContentLabel.frame = CGRectMake(20.0f + (230.0f - width) + 3.0f, 40.0f + 15.0f, width, 30.0f);
                self.chatContentBackground.frame = CGRectMake(20.0f + (230.0f - width) - 3.0f, 37.0f + 15.0f, width + 11.0f, 36.0f);
            }else{
                self.chatContentLabel.frame = CGRectMake(20.0f + (230.0f - width) + 3.0f, 5.0f + 15.0f, width, 30.0f);
                self.chatContentBackground.frame = CGRectMake(20.0f + (230.0f - width) - 3.0f, 2.0f + 15.0f, width + 11.0f, 36.0f);
            }
            
        }else{
            if ([flag isEqualToString:@"1"]) {
                self.chatContentLabel.frame = CGRectMake(20.0f + (230.0f - width), 40.0f + 15.0f, width, height);
                self.chatContentBackground.frame = CGRectMake(20.0f + (230.0f - width) - 3.0f, 37.0f + 15.0f, width + 11.0f, height + 6.0f);
            }else{
                self.chatContentLabel.frame = CGRectMake(20.0f + (230.0f - width), 5.0f + 15.0f, width, height);
                self.chatContentBackground.frame = CGRectMake(20.0f + (230.0f - width) - 3.0f, 2.0f + 15.0f, width + 11.0f, height + 6.0f);
            }
            
        }
        UIEdgeInsets ed = {25.0f, 10.0f, 10.0f, 10.0f};
        [self.chatContentBackground setImage:[[UIImage imageNamed:@"me.png"] resizableImageWithCapInsets:ed]];
        [self.chatContentBackground setHighlightedImage:[[UIImage imageNamed:@"me_selected.png"] resizableImageWithCapInsets:ed]];
        self.chatContentLabel.text = content;
        self.sVoice1.hidden = YES;
        self.sVoice2.hidden = YES;
        self.sVoice3.hidden = YES;
        self.timeLengthLabel.hidden = YES;
    }else{
        self.soundPathUrl = [contentDic valueForKey:@"soundPath"];
        if ([flag isEqualToString:@"1"]) {
            self.chatContentBackground.frame = CGRectMake(150.0f, 38.0f + 15.0f, 107.0f, 34.0f);
        }else{
            self.chatContentBackground.frame = CGRectMake(150.0f, 3.0f + 15.0f, 107.0f, 34.0f);
            self.sVoice1.frame = CGRectMake(232.0f, 12.0f, 11.0f, 16.0f);
            self.sVoice2.frame = CGRectMake(232.0f, 12.0f, 11.0f, 16.0f);
            self.sVoice3.frame = CGRectMake(232.0f, 12.0f, 11.0f, 16.0f);
            self.timeLengthLabel.frame = CGRectMake(186.0f, 12.0f, 40.0f, 16.0f);
        }
        NSString *length = [contentDic valueForKey:@"content"];
        int s = [length intValue];
        if (s < 60) {
            self.timeLengthLabel.text = [NSString stringWithFormat:@"%d\"",s];
        }else{
            int m = s / 60;
            s = s % 60;
            self.timeLengthLabel.text = [NSString stringWithFormat:@"%d\'%d\"",m,s];
        }
        UIEdgeInsets ed = {10.0f, 10.0f, 10.0f, 10.0f};
        [self.chatContentBackground setImage:[[UIImage imageNamed:@"me.png"] resizableImageWithCapInsets:ed]];
        [self.chatContentBackground setHighlightedImage:[[UIImage imageNamed:@"me_selected.png"] resizableImageWithCapInsets:ed]];
        self.chatContentLabel.hidden = YES;
        self.sVoice1.hidden = YES;
        self.sVoice2.hidden = YES;
        self.sVoice3.hidden = NO;
        self.timeLengthLabel.hidden = NO;
    }
}

- (IBAction)tapChatContent:(id)sender {
//    if (!isPlaying) {
    if (self.soundPathUrl != nil && !([self.soundPathUrl isEqualToString:@""])) {
        [self startAnimation];
        kqPlaySoundSingleton *psl = [kqPlaySoundSingleton sharedkqPlaySoundSingleton];
        [psl setSoundPath:self.soundPathUrl andDelegate:self];
    }
//    }else{
//        [recordAudio stopPlay];
//    }
}

-(void)didPlaySoundEnd
{
    [self stopAnimation];
    [self.delegate endPlayingSound];
}

-(void)didPlaySoundError
{
    [self stopAnimation];
    [self.delegate endPlayingSound];
}

-(void)RecordStatus:(int)status
{
    if (status==0){
        //播放中
    } else if(status==1){
        //完成
        isPlaying = NO;
        [self stopAnimation];
        [self.delegate endPlayingSound];
        NSLog(@"播放完成");
    }else if(status==2){
        //出错
        [self stopAnimation];
        isPlaying = NO;
        [self.delegate endPlayingSound];
        NSLog(@"播放出错");
    }
}

-(void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag
{
    [self stopAnimation];
}

-(void)audioPlayerDecodeErrorDidOccur:(AVAudioPlayer *)player error:(NSError *)error
{
    [self stopAnimation];
}

-(void) stopAnimation
{
    [self.timer1 invalidate];
    [self.timer2 invalidate];
    [self.timer3 invalidate];
    if (self.sVoice1) {
        self.sVoice1.hidden = YES;
        self.sVoice2.hidden = YES;
        self.sVoice3.hidden = NO;
    }
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
