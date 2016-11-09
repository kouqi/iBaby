//
//  kqChatWindowAuxiliary.m
//  KindergartenPro
//
//  Created by 海峰 on 14/11/10.
//  Copyright (c) 2014年 海峰. All rights reserved.
//

#import "kqChatWindowAuxiliary.h"

@implementation kqChatWindowAuxiliary
static kqChatWindowAuxiliary *cwa;
+(kqChatWindowAuxiliary *)sharedChatWindowAuxiliary
{
    @synchronized(self)
    {
        if (cwa == nil) {
            cwa = [[self alloc] init];
        }
    }
    return cwa;
}

-(void)cancelDelegate
{
    self.isCancelDelegate = YES;
}

-(void)startReceiveUnReadMessage
{
    self.isCancelDelegate = NO;
    if (self.roleType == TeacherType) {
        [self babyReceiverMessage:@"0"];
    }
    if (self.roleType == YuanzhangTyoe) {
        [self babyReceiverMessage:@"1"];
    }
    if (self.roleType == JiazhangType || self.roleType == TeacherandTeacherType) {
        [self teacherReceiverMessage];
    }
    if (self.roleType == ClassQunLiaoType) {
        [self babyQunliao];
    }
    if (self.roleType == TeacherQunLiaoType) {
        [self teachersQunliao];
    }
}

-(void) babyQunliao
{
    HNADownLoadManager *dl = [HNADownLoadManager sharedDownLoadManager];
    dl.delegate = self;
    [dl babyGetQunLiaoMessage];
}

-(void) teachersQunliao
{
    HNADownLoadManager *dl = [HNADownLoadManager sharedDownLoadManager];
    dl.delegate = self;
    [dl teacherGetTeacherQunLiaoMessage];
}

-(void)teacherGetTeacherQunLiaoMessageDelegate:(NSDictionary *)dic
{
    NSDictionary *dataMap = [dic valueForKey:@"dataMap"];
    NSString *state = [dataMap valueForKey:@"state"];
    if ([state isEqualToString:SU]) {
        NSArray *arr = [dataMap valueForKey:@"data"];
        if (arr.count != 0) {
            if (self.roleType == TeacherQunLiaoType) {
                NSMutableArray *array = [self teacherOperArr:arr andFileUrl:[dic valueForKey:@"fileUrl"]];
                NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
                [ud setValue:[array lastObject] forKey:@"BabyQunLiaoChatLastDic"];
                [ud synchronize];
                if (!self.isCancelDelegate) {
                    if ([self.delegate respondsToSelector:@selector(didRecieveMessageWithArray:)]) {
                        [self.delegate didRecieveMessageWithArray:array];
                    }
                }
            }
        }
    }else if([state isEqualToString:ER]){
    }
    if (!self.isCancelDelegate) {
        [NSTimer scheduledTimerWithTimeInterval:25 target:self selector:@selector(babyQunliao) userInfo:nil repeats:NO];
    }

}

-(void)downLoadBabyGetQunliaoMessageDelegate:(NSDictionary *)dic
{
    NSDictionary *dataMap = [dic valueForKey:@"dataMap"];
    NSString *state = [dataMap valueForKey:@"state"];
    if ([state isEqualToString:SU]) {
            NSArray *arr = [dataMap valueForKey:@"data"];
            if (arr.count != 0) {
                if (self.roleType == ClassQunLiaoType) {
                    NSMutableArray *array = [self teacherOperArr:arr andFileUrl:[dic valueForKey:@"fileUrl"]];
                    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
                    [ud setValue:[array lastObject] forKey:@"BabyQunLiaoChatLastDic"];
                    [ud synchronize];
                    if (!self.isCancelDelegate) {
                        if ([self.delegate respondsToSelector:@selector(didRecieveMessageWithArray:)]) {
                            [self.delegate didRecieveMessageWithArray:array];
                        }
                    }
                }
            }
    }else if([state isEqualToString:ER]){
    }
    if (!self.isCancelDelegate) {
        [NSTimer scheduledTimerWithTimeInterval:25 target:self selector:@selector(babyQunliao) userInfo:nil repeats:NO];
    }
}

-(void) babyReceiverMessage:(NSString *) type
{
    HNADownLoadManager *dl = [HNADownLoadManager sharedDownLoadManager];
    dl.delegate = self;
    if (self.roleType == TeacherType) {
        [dl downLoadChatMessage:@"" andType:@"0"];
    }
    if (self.roleType == YuanzhangTyoe) {
        [dl downLoadChatMessage:@"" andType:@"1"];
    }
}

-(void) teacherReceiverMessage
{
    HNADownLoadManager *dl = [HNADownLoadManager sharedDownLoadManager];
    dl.delegate = self;
    if (self.roleType == JiazhangType) {
        [dl teacherGetMessageByBabyID:self.roleID andMsgType:@"0"];
    }
    if (self.roleType == TeacherandTeacherType) {
        [dl teacherGetMessageByBabyID:self.roleID andMsgType:@"3"];
    }
}

-(void)teacherGetMessageByBabyIDDelegate:(NSDictionary *)dic
{
    NSDictionary *dataMap = [dic valueForKey:@"dataMap"];
    NSArray *arr = [dataMap valueForKey:@"data"];
    if (arr.count != 0) {
        NSMutableArray *array = [self teacherOperArr:arr andFileUrl:[dic valueForKey:@"fileUrl"]];
        if (!self.isCancelDelegate) {
            if ([self.delegate respondsToSelector:@selector(didRecieveMessageWithArray:)]) {
                [self.delegate didRecieveMessageWithArray:array];
            }
        }
    }
    if (!self.isCancelDelegate) {
        if (self.roleType == JiazhangType || self.roleType == TeacherandTeacherType) {
            [NSTimer scheduledTimerWithTimeInterval:25 target:self selector:@selector(teacherReceiverMessage) userInfo:nil repeats:NO];
        }
    }
}

//    self.messageArray = [NSMutableArray arrayWithObjects:@{@"content": @"多谢老师，多谢老师，多谢老师，多谢老师，多谢老师，多谢老师，多谢老师，多谢老师，多谢老师，多谢老师，多谢老师，多谢老师，多谢老师，多谢老师，多谢老师，多谢老师，多谢老师，多谢老师，多谢老师，多谢老师，多谢老师，多谢老师，多谢老师，多谢老师，多谢老师，多谢老师，多谢老师，多谢老师，多谢老师，多谢老师，多谢老师，多谢老师v",@"time":@"2014-07-14 22:22",@"flag":@"1",@"who":@"0",@"soundPath":@"",@"headerImagePath":@""}];

-(NSMutableArray *) teacherOperArr:(NSArray *) array andFileUrl:(NSString *) urlStr
{
    NSMutableArray *messageArray = [NSMutableArray array];
    for (NSDictionary *dic in array) {
        NSMutableDictionary *dics = [NSMutableDictionary dictionary];
        [dics setValue:[dic valueForKey:@"msgContent"] forKey:@"content"];
        NSString *sendDateStr = [dic valueForKey:@"sendDate"];
        sendDateStr = [sendDateStr stringByReplacingOccurrencesOfString:@"T" withString:@" "];
        [dics setValue:sendDateStr forKey:@"time"];
        [dics setValue:@"1" forKey:@"flag"];
        kqPersonalInfoMation *info = [kqPersonalInfoMation sharedPersonalInfoMation];
        if ([[dic valueForKey:@"sendUserId"] intValue] == [info.babyId intValue]) {
            [dics setValue:@"1" forKey:@"who"];
        }else{
            [dics setValue:@"0" forKey:@"who"];
        }
        NSString *st = [dic valueForKey:@"msgSoundPath"];
        if ([st isEqualToString:@""] || [st isKindOfClass:[NSNull class]]) {
            [dics setValue:@"" forKey:@"soundPath"];
        }else{
            NSString *sondPath = [NSString stringWithFormat:@"%@%@",urlStr,st];
            [dics setValue:sondPath forKey:@"soundPath"];
        }
        NSString *headerImagePath = [NSString stringWithFormat:@"%@%@",urlStr,[dic valueForKey:@"sendUserImgPath"]];
        [dics setValue:[dic valueForKey:@"sendUserName"] forKey:@"senderName"];
        [dics setValue:headerImagePath forKey:@"headerImagePath"];
        [messageArray addObject:dics];
    }
    messageArray = [self teacherSortDate:messageArray];
    return messageArray;
}

-(NSMutableArray *) teacherSortDate:(NSMutableArray *) array
{
    NSArray *arry = [array sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        NSDictionary *dic1 = (NSDictionary *) obj1;
        NSDictionary *dic2 = (NSDictionary *) obj2;
        NSString *ti1 = [dic1 valueForKey:@"time"];
        NSString *ti2 = [dic2 valueForKey:@"time"];
        NSComparisonResult result;
        if ([ti1 isKindOfClass:[NSNull class]] || [ti2 isKindOfClass:[NSNull class]]) {
            result = NSOrderedSame;
        }else{
            NSDate *d1 = [formatter dateFromString:ti1];
            NSDate *d2 = [formatter dateFromString:ti2];
            result = [d1 compare:d2];
        }
        return result;
    }];
    NSMutableArray *arr = [NSMutableArray arrayWithArray:arry];
    return arr;
}

-(void)downLoadChatMessageDelegate:(NSDictionary *)dic
{
    NSDictionary *dataMap = [dic valueForKey:@"dataMap"];
    NSString *state = [dataMap valueForKey:@"state"];
    if ([state isEqualToString:SU]) {
        if (self.roleType == TeacherType || self.roleType == YuanzhangTyoe) {
            NSArray *arr = [dataMap valueForKey:@"data"];
            if (arr.count != 0) {
                NSMutableArray *array = [self teacherOperArr:arr andFileUrl:[dic valueForKey:@"fileUrl"]];
                NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
                if (self.roleType == TeacherType) {
                    [ud setValue:[array lastObject] forKey:@"TeacherChatLastDic"];
                }
                if (self.roleType == YuanzhangTyoe) {
                    [ud setValue:[array lastObject] forKey:@"YuanZhangChatLastDic"];
                }
                [ud synchronize];
                if (!self.isCancelDelegate) {
                    if ([self.delegate respondsToSelector:@selector(didRecieveMessageWithArray:)]) {
                        [self.delegate didRecieveMessageWithArray:array];
                    }
                }
            }
        }
    }else if([state isEqualToString:ER]){
    }
    if (!self.isCancelDelegate) {
        if (self.roleType == TeacherType) {
            [NSTimer scheduledTimerWithTimeInterval:25 target:self selector:@selector(babyReceiverMessage:) userInfo:@"0" repeats:NO];
        }
        if (self.roleType == YuanzhangTyoe) {
            [NSTimer scheduledTimerWithTimeInterval:25 target:self selector:@selector(babyReceiverMessage:) userInfo:@"1" repeats:NO];
        }
    }
}

-(void)sendMessage:(NSString *)message andSoundFile:(NSData *)curData andLength:(double) curLength
{
    HNADownLoadManager *dl = [HNADownLoadManager sharedDownLoadManager];
    kqPersonalInfoMation *info = [kqPersonalInfoMation sharedPersonalInfoMation];
    NSData *soundData = nil;
    NSString *legth = nil;
    if (curData != nil) {
        soundData = curData;
        legth = [NSString stringWithFormat:@"%d",(int)curLength];
    }
    dl.delegate = self;
    if (self.roleType == TeacherandTeacherType) {
        if (soundData) {
            [dl baySendChatMesageWithContent:legth andSouundFile: soundData andReceiverID:self.roleID  andMsgType:@"3"];
        }else{
            [dl baySendChatMesageWithContent:message andSouundFile:soundData andReceiverID:self.roleID andMsgType:@"3"];
        }
    }
    if (self.roleType == TeacherType) {
        if (soundData) {
            [dl baySendChatMesageWithContent:legth andSouundFile:soundData andReceiverID:info.teacherID andMsgType:@"0"];
        }else{
            [dl baySendChatMesageWithContent:message andSouundFile:soundData andReceiverID:info.teacherID andMsgType:@"0"];
        }
    }
    if (self.roleType == YuanzhangTyoe) {
        if (soundData) {
            [dl baySendChatMesageWithContent:legth andSouundFile:soundData andReceiverID:info.principalID andMsgType:@"0"];
        }else{
            [dl baySendChatMesageWithContent:message andSouundFile:soundData andReceiverID:info.principalID andMsgType:@"0"];
        }
    }
    if (self.roleType == JiazhangType) {
        if (soundData) {
            [dl baySendChatMesageWithContent:legth andSouundFile:soundData andReceiverID:self.roleID andMsgType:@"0"];
        }else{
            [dl baySendChatMesageWithContent:message andSouundFile:soundData andReceiverID:self.roleID andMsgType:@"0"];
        }
    }
    if (self.roleType == ClassQunLiaoType) {
        kqPersonalInfoMation *info = [kqPersonalInfoMation sharedPersonalInfoMation];
        if (info.roleIds.count != 0) {
            int rolesId = [[info.roleIds objectAtIndex:0] intValue];
            switch (rolesId) {
                case 4:
                {
                    if (soundData) {
                        [dl babySendQunLiaoMessageWithmessage:legth andSoundFile:soundData];
                    }else{
                        [dl babySendQunLiaoMessageWithmessage:message andSoundFile:soundData];
                    }
                }
                    break;
                case 3:
                {
                    if (soundData) {
                        [dl teacherSendQunLiaoMessageWithmessage:legth andSoundFile:soundData];
                    }else{
                        [dl teacherSendQunLiaoMessageWithmessage:message andSoundFile:soundData];
                    }
                }
                    break;
                default:
                    break;
            }
        }
    }
    if (self.roleType == TeacherQunLiaoType) {
        if (soundData) {
            [dl teacherSendTeacherQunLiaoMessageWithmessage:legth andSoundFile:soundData];
        }else{
            [dl teacherSendTeacherQunLiaoMessageWithmessage:message andSoundFile:soundData];
        }
    }
}


-(void)downLoadBabySendMessageDelegate:(NSDictionary *)dic
{
    NSDictionary *dataMap = [dic valueForKey:@"dataMap"];
    NSString *state = [dataMap valueForKey:@"state"];
    if ([state isEqualToString:SU]) {
        NSString *fileUrl = [dic valueForKey:@"fileUrl"];
        kqPersonalInfoMation *info = [kqPersonalInfoMation sharedPersonalInfoMation];
        NSString *comtent;
        if (!([fileUrl isEqualToString:@""] || [fileUrl isKindOfClass:[NSNull class]])) {
            comtent = [NSString stringWithFormat:@"%@：%@",info.realName,[dic valueForKey:@"msgContent"]];
        }else{
            comtent = [NSString stringWithFormat:@"%@：语音消息",info.realName];
        }
        if (comtent.length > 25) {
            comtent = [comtent substringToIndex:25];
        }
        HNADownLoadManager *dl = [HNADownLoadManager sharedDownLoadManager];
        if (self.roleType == TeacherType) {
            kqPersonalInfoMation *info = [kqPersonalInfoMation sharedPersonalInfoMation];
//            NSArray *arr = [NSArray arrayWithObject:info.teacherLoginName];
            NSArray *arr = [NSArray arrayWithObject:info.teacherDeviceIDString];
            [dl sendJPushWithType:@"1" andContent:comtent andAlias:arr];
        }else if (self.roleType == JiazhangType || self.roleType == TeacherandTeacherType){
            if ([self.roleName isKindOfClass:[NSString class]]) {
                NSArray *arr = [NSArray arrayWithObject:self.roleName];
                [dl sendJPushWithType:@"1" andContent:comtent andAlias:arr];
            }
        }
    }else if([state isEqualToString:ER]){
    }
    if (!self.isCancelDelegate) {
        if (self.roleType == TeacherType) {
            [self babyReceiverMessage:@"0"];
        }
        if (self.roleType == YuanzhangTyoe) {
            [self babyReceiverMessage:@"1"];
        }
        if (self.roleType == JiazhangType || self.roleType == TeacherandTeacherType) {
            [self teacherReceiverMessage];
        }
    }
}

-(void)downLoadBabySendQunLiaoMessage:(NSDictionary *)dic
{
    NSDictionary *dataMap = [dic valueForKey:@"dataMap"];
    NSString *state = [dataMap valueForKey:@"state"];
    if ([state isEqualToString:SU]) {
    }else if([state isEqualToString:ER]){
    }
    if (!self.isCancelDelegate) {
        if (self.roleType == ClassQunLiaoType) {
            [self babyQunliao];
        }
    }
}

-(void)teacherSendQunLiaoMessageWithmessageDelegate:(NSDictionary *)dic
{
    NSDictionary *dataMap = [dic valueForKey:@"dataMap"];
    NSString *state = [dataMap valueForKey:@"state"];
    if ([state isEqualToString:SU]) {
    }else if([state isEqualToString:ER]){
    }
    if (!self.isCancelDelegate) {
        if (self.roleType == ClassQunLiaoType) {
            [self babyQunliao];
        }
    }
}

-(void)teacherSendTeacherQunLiaoMessageDelegate:(NSDictionary *)dic
{
    NSDictionary *dataMap = [dic valueForKey:@"dataMap"];
    NSString *state = [dataMap valueForKey:@"state"];
    if ([state isEqualToString:SU]) {
    }else if([state isEqualToString:ER]){
    }
    if (!self.isCancelDelegate) {
        if (self.roleType == TeacherQunLiaoType) {
            [self teachersQunliao];
        }
    }
}

@end