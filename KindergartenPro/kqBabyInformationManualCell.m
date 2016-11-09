//
//  kqBabyInformationManualCell.m
//  KindergartenPro
//
//  Created by 海峰 on 14-7-26.
//  Copyright (c) 2014年 海峰. All rights reserved.
//

#import "kqBabyInformationManualCell.h"

@interface kqBabyInformationManualCell ()
@property (strong, nonatomic) NSTimer *timer1,*timer2,*timer3;
@end

@implementation kqBabyInformationManualCell

- (void)awakeFromNib
{
    // Initialization code
}

-(void) animation1
{
    self.voiceFirstImageView.hidden = NO;
    self.voiceSecondImageView.hidden = YES;
    self.voiceThirdImageView.hidden = YES;
    
}

-(void) sAnimation2
{
    self.timer2 = [NSTimer scheduledTimerWithTimeInterval:0.9 target:self selector:@selector(animation2) userInfo:nil repeats:YES];
    [self.timer2 fire];
}

-(void) animation2
{
    self.voiceFirstImageView.hidden = NO;
    self.voiceSecondImageView.hidden = NO;
    self.voiceThirdImageView.hidden = YES;
}

-(void) sAnimation3
{
    self.timer3 = [NSTimer scheduledTimerWithTimeInterval:0.9 target:self selector:@selector(animation3) userInfo:nil repeats:YES];
    [self.timer3 fire];
}

-(void) animation3
{
    self.voiceFirstImageView.hidden = NO;
    self.voiceSecondImageView.hidden = NO;
    self.voiceThirdImageView.hidden = NO;
}

-(void) startAnimation
{
    self.timer1 = [NSTimer scheduledTimerWithTimeInterval:0.9 target:self selector:@selector(animation1) userInfo:nil repeats:YES];
    [self.timer1 fire];
    [self performSelector:@selector(sAnimation2) withObject:nil afterDelay:0.3];
    [self performSelector:@selector(sAnimation3) withObject:nil afterDelay:0.6];
}

- (IBAction)tapVoiceButton:(id)sender {
    self.voiceButton.enabled = NO;
    [self startAnimation];
    self.recoderTempFile = [self.recoderTempFile stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
//    NSURL *fileUrl = [NSURL URLWithString:self.recoderTempFile];
    NSString *pdfname = nil;
    pdfname = [[NSBundle mainBundle] pathForResource:@"Gentleman" ofType:@"mp3"];
//    pdfname = [pdfname stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL*url=[NSURL fileURLWithPath:pdfname];
    [self playMovieAtURL:url];
//    NSData *soundFile = [[NSData alloc] initWithContentsOfURL:url options:NSDataReadingMappedIfSafe error:nil];
//    AVAudioPlayer * avPlayer = [[AVAudioPlayer alloc] initWithData:soundFile error:&error];
//    avPlayer.delegate = self;
//    if ([avPlayer prepareToPlay]) {
//        avPlayer.volume = 1.0f;
//        [avPlayer play];
//    }else{
//        NSLog(@"---------------%@",[error localizedDescription]);
//    }
}

-(void)playMovieAtURL:(NSURL*)theURL
{
    self.moviePlayer = [[MPMoviePlayerController alloc] initWithContentURL:theURL];
    //    self.moviePlayeraa.view.frame = self.view.frame;//全屏播放（全屏播放不可缺）
    //    self.moviePlayeraa.moviePlayer.scalingMode = MPMovieScalingModeAspectFill;//全屏播放（全屏播放不可缺）
    [self.moviePlayer setControlStyle:MPMovieControlStyleFullscreen];
    [self.moviePlayer setFullscreen:YES animated:NO];
    self.isPlaying = YES;
    [[UIApplication sharedApplication] setStatusBarOrientation:UIInterfaceOrientationLandscapeRight animated:NO];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(myMovieFinishedCallback:)
                                                 name:MPMoviePlayerPlaybackDidFinishNotification
                                               object:self.moviePlayer];
    [self.moviePlayer play];
//    [self presentMoviePlayerViewControllerAnimated:self.moviePlayeraa];
}

// When the movie is done, release the controller.
-(void)myMovieFinishedCallback:(NSNotification*)aNotification
{
//    MPMoviePlayerController* theMovie = [aNotification object];
//    [[NSNotificationCenter defaultCenter] removeObserver:self
//                                                    name:MPMoviePlayerPlaybackDidFinishNotification
//                                                  object:theMovie];
    [self stopAnimation];
    self.isPlaying = NO;
}

-(void) stopAnimation
{
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:MPMoviePlayerPlaybackDidFinishNotification
                                                  object:self.moviePlayer];
    [self.timer1 invalidate];
    [self.timer2 invalidate];
    [self.timer3 invalidate];
    self.voiceFirstImageView.hidden = NO;
    self.voiceSecondImageView.hidden = NO;
    self.voiceThirdImageView.hidden = NO;
}

-(void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag
{
    self.voiceButton.enabled = YES;
    [self stopAnimation];
}

-(void)audioPlayerDecodeErrorDidOccur:(AVAudioPlayer *)player error:(NSError *)error
{
    self.voiceButton.enabled = YES;
    [self stopAnimation];
    NSLog(@"-------------%@",[error description]);
}

-(void) initCell{
    self.yanseView.backgroundColor = RGB((arc4random() % 255), (arc4random() % 255), (arc4random() % 255), 1);
//    self.contentLabel.text = [HNAGeneral getContent:self.dataDictionary];
    if (!([[self.dataDictionary valueForKey:@"editDate"] isKindOfClass:[NSNull class]] || [[self.dataDictionary valueForKey:@"editDate"] isEqualToString:@""])) {
        NSString *ss = [self.dataDictionary valueForKey:@"editDate"];
        ss = [ss stringByReplacingOccurrencesOfString:@"T" withString:@" "];
        [HNAGeneral setLabelTextWithDayLabel:self.dateLabel andMonthLabel:self.monthLabel andHourLabel:self.hourLabel andTimeString:ss];
    }
//    if ([[self.dataDictionary valueForKey:@"infoBookSoundPath"] isKindOfClass:[NSNull class]] || [[self.dataDictionary valueForKey:@"infoBookSoundPath"] isEqualToString:@""]) {
//        self.voiceButton.hidden = YES;
//        self.voiceFirstImageView.hidden = YES;
//        self.voiceSecondImageView.hidden = YES;
//        self.voiceThirdImageView.hidden = YES;
//        self.timeLengthLabel.hidden = YES;
//    }
    NSString *jsonStr = [self.dataDictionary valueForKey:@"bookContent"];
    NSData *jsonData = [jsonStr dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error = nil;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
    if (dic) {
        NSDictionary *bookContent = [dic valueForKey:@"bookContent"];
        int fd = [[bookContent valueForKey:@"food"] intValue];
        switch (fd) {
            case 0:
            {
                 self.weikouLabel.text = @"胃口很好";
            }
                break;
            case 1:
            {
                self.weikouLabel.text = @"正常饮食";
            }
                break;
            case 2:
            {
                self.weikouLabel.text = @"饮食不佳";
            }
                break;
            default:
                break;
        }
        int dk = [[bookContent valueForKey:@"drink"] intValue];
        switch (dk) {
            case 0:
            {
                self.shuiLabel.text = @"没喝";
            }
                break;
            case 1:
            {
                self.shuiLabel.text = @"1-2杯";
            }
                break;
            case 2:
            {
                self.shuiLabel.text = @"3-4杯";
            }
                break;
            case 3:
            {
                self.shuiLabel.text = @"5杯以上";
            }
                break;
            default:
                break;
        }
        int sp = [[bookContent valueForKey:@"sleep"] intValue];
        switch (sp) {
            case 0:
            {
                self.sleepLabel.text = @"没睡";
            }
                break;
            case 1:
            {
                self.sleepLabel.text = @"1小时以下";
            }
                break;
            case 2:
            {
                self.sleepLabel.text = @"1-2小时";
            }
                break;
            case 3:
            {
                self.sleepLabel.text = @"2小时以上";
            }
                break;
            default:
                break;
        }
        int sl = [[bookContent valueForKey:@"stool"] intValue];
        switch (sl) {
            case 0:
            {
                self.shitLabel.text = @"0次";
            }
                break;
            case 1:
            {
                self.shitLabel.text = @"1-2次";
            }
                break;
            case 2:
            {
                self.shitLabel.text = @"拉肚子";
            }
                break;
            default:
                break;
        }
        int em = [[bookContent valueForKey:@"emotion"] intValue];
        switch (em) {
            case 0:
            {
                self.xinqingLabel.text = @"开心";
            }
                break;
            case 1:
            {
                self.xinqingLabel.text = @"低落";
            }
                break;
            case 2:
            {
                self.xinqingLabel.text = @"烦躁";
            }
                break;
            case 3:
            {
                self.xinqingLabel.text = @"哭鼻子";
            }
                break;
            default:
                break;
        }
        
        NSString *str = [bookContent valueForKey:@"info"];
        NSMutableString *contentStr = [NSMutableString string];
        if ([str isEqualToString:@""] || str == nil) {
        }else{
            [contentStr appendFormat:@"备注：%@；",str];
        }
        NSArray *arr = [bookContent valueForKey:@"Abnormal"];
        if (arr.count != 0) {
            [contentStr appendString:@"异常："];
            for (NSNumber *num in arr) {
                int ab = [num intValue];
                switch (ab) {
                    case 0:
                    {
                        [contentStr appendString:@"咳嗽、"];
                    }
                        break;
                    case 1:
                    {
                        [contentStr appendString:@"流鼻涕、"];
                    }
                        break;
                    case 2:
                    {
                        [contentStr appendString:@"呕吐、"];
                    }
                        break;
                    case 3:
                    {
                        [contentStr appendString:@"发烧、"];
                    }
                        break;
                    case 4:
                    {
                        [contentStr appendString:@"流鼻血、"];
                    }
                        break;
                    case 5:
                    {
                        [contentStr appendString:@"烫伤、"];
                    }
                        break;
                    case 6:
                    {
                        [contentStr appendString:@"摔伤、"];
                    }
                        break;
                    case 7:
                    {
                        [contentStr appendString:@"磕碰、"];
                    }
                        break;
                    case 8:
                    {
                        [contentStr appendString:@"抓伤、"];
                    }
                        break;
                    default:
                        break;
                }
            }
            contentStr = [NSMutableString stringWithString:[contentStr substringToIndex:contentStr.length - 1]];
            self.miaoshuLabel.text = contentStr;
        }
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
