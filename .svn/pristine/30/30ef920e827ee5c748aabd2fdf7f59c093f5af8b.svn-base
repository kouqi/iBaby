//
//  kqChatWindowAuxiliary.h
//  KindergartenPro
//
//  Created by 海峰 on 14/11/10.
//  Copyright (c) 2014年 海峰. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ChatGetMessageDataDelegate <NSObject>
@optional
-(void) didRecieveMessageWithArray:(NSMutableArray *) messageArray;
-(void) didSendMessageSucuess;
-(void) didSendMessageFailed;
@end







@interface kqChatWindowAuxiliary : NSObject <HNADownLoadDelegate>
@property(assign, nonatomic) id<ChatGetMessageDataDelegate>delegate;
@property (assign, nonatomic) ChatPeopleRole roleType;
@property (strong, nonatomic) NSString *roleID,*roleName;
@property (assign, nonatomic) BOOL isCancelDelegate;
+(kqChatWindowAuxiliary *)sharedChatWindowAuxiliary;
-(void) startReceiveUnReadMessage;
-(void)sendMessage:(NSString *)message andSoundFile:(NSData *)curData andLength:(double) curLength;
-(void) cancelDelegate;
@end
