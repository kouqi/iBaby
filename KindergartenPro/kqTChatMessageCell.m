//
//  kqTChatMessageCell.m
//  KindergartenPro
//
//  Created by 海峰 on 14-9-25.
//  Copyright (c) 2014年 海峰. All rights reserved.
//

#import "kqTChatMessageCell.h"

@implementation kqTChatMessageCell

- (void)awakeFromNib
{
    // Initialization code
}

-(void) initCellWithDic:(NSDictionary *)tdic
{
    self.theChatHeadImageView.layer.cornerRadius = 21.0f;
    self.theChatHeadImageView.layer.masksToBounds = YES;
    
    NSString *hstring;
    NSString *rID = [[tdic valueForKey:@"receiveUserId"] stringValue];
    kqPersonalInfoMation *info = [kqPersonalInfoMation sharedPersonalInfoMation];
    if ([info.babyId isEqualToString:rID]) {
        hstring = [tdic valueForKey:@"sendUserImgPath"];
        self.chatNameLabel.text = [tdic valueForKey:@"sendUserName"];
    }else{
        hstring = [tdic valueForKey:@"receiveUserImgPath"];
        self.chatNameLabel.text = [tdic valueForKey:@"receiveUserName"];
    }
    NSURL *hurl = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",self.fileUrlString,hstring]];
    [self.theChatHeadImageView setImageWithURL:hurl placeholderImage:[UIImage imageNamed:@"tbabyDefaultHeadImage.png"]];
    NSString *msgSoundPath = [tdic valueForKey:@"msgSoundPath"];
    if (!([msgSoundPath isEqualToString:@""] || [msgSoundPath isKindOfClass:[NSNull class]])) {
        self.chatContentLabel.text = @"语音消息";
    }else{
        self.chatContentLabel.text = [tdic valueForKey:@"msgContent"];
    }
    self.chatTimeLabel.text = [[tdic valueForKey:@"sendDate"] stringByReplacingOccurrencesOfString:@"T" withString:@" "];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
