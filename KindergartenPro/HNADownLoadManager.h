//
//  HNADownLoadManager.h
//  HNAHRMPro
//
//  Created by 海峰 on 14-3-17.
//  Copyright (c) 2014年 海峰. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ASIFormDataRequest.h"
#import "AFNetworking/AFNetworking.h"
#import "ASIHTTPRequest.h"
#import "GTMBase64.h"
#import "Vitamio.h"
@protocol HNADownLoadDelegate <NSObject>
@optional
-(void) loginDelegate:(NSDictionary *) dic;
-(void) downLoadBabyInfomationDelegate:(NSDictionary *) dic;
-(void) downLoadKindergartenNoticeDelegate:(NSDictionary *) dic;
-(void) downLoadBabySignInDelegate:(NSDictionary *) dic;
-(void) downLoadWeeklyInfomationDelegate:(NSDictionary *) dic;
-(void) downLoadModifyPasswordDelegate:(NSDictionary *) dic;
-(void) downLoadPWonderfulMomentDelegate:(NSDictionary *) dic;
-(void) downLoadTeacherHomePageDelegate:(NSDictionary *) dic;
-(void) addPhotoDelegate:(NSDictionary *) dic;
-(void) downLoadFoundDelegate:(NSDictionary *) dic;
-(void) downLoadChatMessageDelegate:(NSDictionary *) dic;
-(void) downLoadUnReadMessageDelegate:(NSDictionary *) dic;
-(void) getRtspDelegate:(NSString *) rtspURl;
-(void) getCamearIDDelegate:(NSDictionary *) dic;
-(void) downLoadBabySendMessageDelegate:(NSDictionary *) dic;
-(void) downLoadBabyGetQunliaoMessageDelegate:(NSDictionary *) dic;
-(void) downLoadBabySendQunLiaoMessage:(NSDictionary *) dic;
-(void) getBabyHandBookDelegate:(NSDictionary *) dic;
-(void) sendBabyHandDelegate:(NSDictionary *) dic;
-(void) sendHandBookByIDDelegate:(NSDictionary *) dic;
-(void) deleteHandBookDelegate:(NSDictionary *) dic;
-(void) sendFeedbackToServeDelegate:(NSDictionary *) dic;
-(void) changeHeaderImageDelegate:(NSDictionary *) dic;
-(void) sendBabyStateDelegate:(NSDictionary *) dic;
-(void) teacherGetBabyMessageListDelegate:(NSDictionary *) dic;
-(void) teacherSendQunLiaoMessageWithmessageDelegate:(NSDictionary *) dic;
-(void) teacherGetMessageByBabyIDDelegate:(NSDictionary *) dic;
-(void) teacherGetAllBabyDelegate:(NSDictionary *) dic;
-(void) teacherGetKindergartenNoticeDelegate:(NSDictionary *) dic;
-(void) teacherSaveKindergartenNoticeDelegate:(NSDictionary *) dic;
-(void) teacherGetWeekInfomationListDelegate:(NSDictionary *) dic;
-(void) teacherSaveWeekFoodDelegate:(NSDictionary *) dic;
-(void) teacherSaveWeekActivityDelegate:(NSDictionary *) dic;
-(void) teacherModifyNameWithNameTextDelegate:(NSDictionary *) dic;
-(void) teacherGetAllTeacherDelegate:(NSDictionary *) dic;
-(void) teacherSendTeacherQunLiaoMessageDelegate:(NSDictionary *) dic;
-(void) teacherGetTeacherQunLiaoMessageDelegate:(NSDictionary *) dic;
-(void) deleteServePersonalPhotosDelegate:(NSDictionary *) dic;
-(void) getSpecifyBabyPersonalPhotoDelegate:(NSDictionary *) dic;
-(void) getSchoolPhotosDelegate:(NSDictionary *) dic;
-(void) sendPersonalPhotosTuServerDelegate:(NSDictionary *) dic;
-(void) addXiaoNeiTuServerDelegate:(NSDictionary *) dic;
-(void) piLiangQiandaoDelegate:(NSDictionary *) dic;
-(void) requestToGetCameraListDelegate:(NSDictionary *) dic;
-(void) reportCardDelegate:(NSDictionary *) dic;

- (void)mediaPlayer:(VMediaPlayer *)player didPreparedDelegate:(id)arg;
- (void)mediaPlayer:(VMediaPlayer *)player playbackCompleteDelegate:(id)arg;
- (void)mediaPlayer:(VMediaPlayer *)player errorDelegate:(id)arg;
@end



@interface HNADownLoadManager : NSObject<ASIHTTPRequestDelegate,VMediaPlayerDelegate>
@property (weak, nonatomic) id<HNADownLoadDelegate>delegate;
@property (assign, nonatomic) BOOL isCancelDelegate;
@property (strong, nonatomic) NSString *userName,*password,*cameraID;
+(HNADownLoadManager *)sharedDownLoadManager;
-(void)sendJPushWithType:(NSString *) type andContent:(NSString *) msgContent andAlias:(NSArray *)aliasArray;
-(void) cancelDelegate;
-(void) getFirstRtsp:(NSString *) nonce andUserName:(NSString *) userName andPassword:(NSString *) password andCameraID:(NSString *) cameraId;
-(void) getCamearIDWithClassID:(NSNumber *) classId;
#pragma mark - 宝宝
-(void) loginWithUserName:(NSString *) userName andPassword:(NSString *) password andAutoLogin:(BOOL) autoLogin;
-(void) downLoadBabyInfomationWith:(NSString *) pageNo;
-(void) downLoadKindergartenNoticeWith:(NSString *)pageNo andbabyNoticeTypeId:(long) babyNoticeTypeId;
-(void) downLoadBabySignInWith:(NSString *) pageNo andBabyID:(NSString *) babyID;
-(void) downLoadWeeklyInfomationWith:(NSString *)everyweekTypeId andPageNo:(NSString *) pageNo;
-(void) downLoadModifyPasswordWithOldPassword:(NSString *)oldPassword andNewPassword:(NSString *) theNewPassword;
-(void) downLoadWondefulMomentWithType:(NSInteger) type;
-(void) addPhotoTuServerWith:(NSString *) photoTitle andPhotoId:(NSString *) photoId andImage:(NSArray *) imageArray andAlbumId:(NSString *) albumId;
-(void) downLoadFoundWithType:(NSInteger) type;
-(void) downLoadChatMessage:(NSString *) receiveUser andType:(NSString *) msgState;
-(void) downLoadUnReadMessage;
-(void) baySendChatMesageWithContent:(NSString *) messageContent andSouundFile:(NSData *) soundData andReceiverID:(NSString *) receiverID andMsgType:(NSString *) msgType;
-(void) babyGetQunLiaoMessage;
-(void)babySendQunLiaoMessageWithmessage:(NSString *) message andSoundFile:(NSData *) soundData;
-(void) sendFeedbackToServeWithContent:(NSString *) feedBackContent;
-(void) changeHeaderImageWith:(UIImage *) headerImage;
-(void) requestToGetCameraListWithClassId:(NSNumber *) classId;
-(void) reportCard;
#pragma mark - 教师
-(void) downLoadTeacherHomePage;
-(void) getBabyHandBookFromBabyID:(NSString *) babyId andEditDate:(NSString *) editDate;
-(void) sendBabyHandWithBookID:(NSString *) bookId andBookTitle:(NSString *)bookTitle andBookContent:(NSString *) bookContent andBabyId:(NSString *) babyId;
-(void) sendHandBookByID:(NSString *) bookId;
-(void) deleteHandBookByID:(NSString *) bookId;
-(void) sendBabyStateWithID:(NSString *) babyId andState:(NSString *) state;
-(void) teacherGetMessageListWithMsgType:(NSString *) msgType;
-(void)teacherSendQunLiaoMessageWithmessage:(NSString *) message andSoundFile:(NSData *) soundData;
-(void)teacherGetMessageByBabyID:(NSString *) roleID andMsgType:(NSString *) msgType;
-(void)teacherGetAllBaby;
-(void) teacherGetKindergartenNoticeWithBabyNoticeTypeID:(long) babyNoticeTypeId;
-(void) teacherSaveKindergartenNoticeWithID:(long) ids andNoticeTitle:(NSString *) noticeTitle andNoticeContent:(NSString *) noticeContent andBabyNoticeTypeId:(long) babyNoticeTypeId;
-(void) teacherGetWeekInfomationListWithEveryweekTypeId:(long) everyweekTypeId;
-(void) teacherSaveWeekFoodWithActivityTitle:(NSString *) activityTitle andActivityContent:(NSString *) activityContent andMealType:(NSString *) mealType andActivityDate:(NSString *) activityDate andImageArray:(NSArray *) imageArray;
-(void) teacherSaveWeekActivityWithActivityTitle:(NSString *) activityTitle andActivityContent:(NSString *) activityContent andActivityDate:(NSString *) activityDate andActivityTime:(NSString *) activityTime;
-(void) teacherModifyNameWithNameText:(NSString *) textName;
-(void) teacherGetTeacherQunLiaoMessage;
-(void)teacherSendTeacherQunLiaoMessageWithmessage:(NSString *) message andSoundFile:(NSData *) soundData;
-(void)teacherGetAllTeacher;
-(void) deleteServePersonalPhotosWithPhotoIdsArray:(NSArray *) idsArray;
-(void) getSpecifyBabyPersonalPhotoWithBabyId:(NSString *) babyId;
-(void) getSchoolPhotos;
-(void) sendPersonalPhotosTuServerWith:(NSString *) photoTitle andPhotoId:(NSString *) photoId andImage:(NSArray *) imageArray andAlbumId:(NSString *) albumId;
-(void) addXiaoNeiTuServerWith:(NSString *) photoTitle andPhotoId:(NSString *) photoId andImage:(NSArray *) imageArray andAlbumId:(NSString *) albumId;
-(void) piLiangQiandaoWithState:(NSString *) inOut andBabyIdArray:(NSArray *) babyIdarray;
@end
