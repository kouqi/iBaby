//
//  kqChatWindowViewController.h
//  ChatViewDemo
//
//  Created by 海峰 on 14-8-12.
//  Copyright (c) 2014年 海峰. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreAudio/CoreAudioTypes.h>
#import <AVFoundation/AVFoundation.h>
#import "kqChatWindowAuxiliary.h"
#import "kqChatMeCell.h"
#import "kqOtherCell.h"
@protocol ChatWindowBackDelegate <NSObject>

@optional
-(void)didBackView;

@end








@interface kqChatWindowViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UITextViewDelegate,AVAudioRecorderDelegate,ChatGetMessageDataDelegate,kqPlaySoundDelegate>
{
    ChatPeopleRole roleType;
}
@property (assign, nonatomic) id<ChatWindowBackDelegate>delete;
@property (assign, nonatomic) ChatPeopleRole roleType;
@property (weak, nonatomic) IBOutlet UIView *inputView;
@property (weak, nonatomic) IBOutlet UIButton *sendMessageButton;
@property (weak, nonatomic) IBOutlet UILabel *placeholderLabel;
@property (weak, nonatomic) IBOutlet UITextView *inputTextView;
@property (weak, nonatomic) IBOutlet UIButton *voiceOrkeyboardButton;
@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *messageArray;
@property (assign, nonatomic) int lastPostion;
@property (weak, nonatomic) IBOutlet UIButton *recoderVoiceButton;
@property (assign, nonatomic) CGFloat keyBordHeight;
@property (strong, nonatomic) AVAudioRecorder *recoder;
@property (strong, nonatomic) NSString *recordedTmpFile;
@property (strong, nonatomic) NSString *roleID,*roleName;
@property (assign, nonatomic) BOOL isPlayingSound;
@property (assign, nonatomic) int playSoundCount;
@end
