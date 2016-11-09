/**
 * @file MeetingApi.h
 * @brief Meeting Interface Functions
 */

#import <Foundation/Foundation.h>
#import "CallApi.h"

@class MeetingParams;
/** used to provide an entry for joining conferences. 
 The UI accesses specific conference joining-related interfaces by invoking interfaces of this class.
 */
@interface MeetingApi : CallApi
{

}

/**
 * used to quickly join an audio conference 
 * <p>
 * After the UI receives a conference invitation, it obtains the conference number, ID, and password and invokes this interface to quickly join the audio conference
 * </p>
 * @param number Indicates the number of the conference to be joined
 * @param confId Indicates the ID of the conference to be joined
 * @param confPwd Indicates the password of the conference to be joined.
 * @return A conference session object (call session object)
 */
+(CallSession*) quickJoinAudioConf:(NSString*) number confId:(NSString*)confId confPwd:(NSString*)confPwd;

/**
 * used to quickly join a video conference
 * <p>
 * After the UI receives a conference invitation, it obtains the conference number, ID, and password and invokes this interface to quickly join the video conference.
 * </p>
 * @param number Indicates the number of the conference to be joined
 * @param confId Indicates the ID of the conference to be joined
 * @param confPwd Indicates the password of the conference to be joined.
 * @param localView Indicates the video view on the local software client
 * @param remoteView ndicates the video view on the peer software client
 * @return A conference session object (call session object)
 */
+(CallSession*) quickJoinVideoConf:(NSString*) number confId:(NSString*)confId confPwd:(NSString*)confPwd localView:(EAGLExView*) localView remoteView:(EAGLExView*) remoteView;

/**
 * used to quickly join an audio conference 
 * <p>
 * After the UI receives a conference invitation, it obtains the conference number, ID, and enableData and invokes this interface to quickly join the audio conference
 * </p>
 * @param number Indicates the number of the conference to be joined
 * @param confId Indicates the ID of the conference to be joined
 * @param confPwd Indicates the enableData of the conference to be joined.
 * @return A conference session object (call session object)
 */
+(CallSession*) callAudioConf:(NSString*) number confId:(NSString*)confId enableData:(NSString*)enableData;

/**
 * used to quickly join a video conference
 * <p>
 * After the UI receives a conference invitation, it obtains the conference number, ID, and enableData and invokes this interface to quickly join the video conference.
 * </p>
 * @param number Indicates the number of the conference to be joined
 * @param confId Indicates the ID of the conference to be joined
 * @param confPwd Indicates the enableData of the conference to be joined.
 * @param localView Indicates the video view on the local software client
 * @param remoteView ndicates the video view on the peer software client
 * @return A conference session object (call session object)
 */
+(CallSession*) callVideoConf:(NSString*) number confId:(NSString*)confId enableData:(NSString*)enableData localView:(EAGLExView*) localView remoteView:(EAGLExView*) remoteView;


/**
 * used to set the ID and password of a conference to be joined
 * <p> The UI invokes this interface to set the ID and password of a conference to be joined. The UI can directly invoke quickJoinaudioConf or quickJoinVideoConf to join a conference. It can also invoke this interface to set the ID and password of a conference to be joined and then invokes initiateAudioCall or initiateVideoCall to join the conference
 </p>
 * @param confId Indicates the ID of the conference to be joined
 * @param confPwd Indicates the password of the conference to be joined.
 */
+(void)setConferenceInfo:(NSString*)confId confPwd:(NSString*)confPwd;


+(CallSession*) callAudioInstantConf:(NSString*)confFactoryId
                       meetingParams:(MeetingParams*)meetingParams;

+(CallSession*) callVideoInstantConf:(NSString*)confFactoryId
                       meetingParams:(MeetingParams*)meetingParams
                           localView:(EAGLExView*)localView
                          remoteView:(EAGLExView*)remoteView;

@end

/**
 * <b>Description:</b> Attendee is used to describe an attendee of meeting.
 * <br><b>Purpose:</b> The UI invokes interfaces of this class to obtain properties of an attendee.
 */
@interface MeetingAttendee : NSObject

/**
 * <b>Description:</b> This property is used to obtain the name of the attendee .
 */
@property (retain, nonatomic) NSString *name;

/**
 * <b>Description:</b> This property is used to obtain the number of the attendee .
 */
@property (retain, nonatomic) NSString *number;

/**
 * <b>Description:</b> This property is used to obtain the left number of the attendee .
 */
@property (retain, nonatomic) NSString *leftNumber;

/**
 * <b>Description:</b> This property is used to obtain the right number of the attendee .
 */
@property (retain, nonatomic) NSString *rightNumber;

/**
 * <b>Description:</b> This property is used to obtain the email of the attendee .
 */
@property (retain, nonatomic) NSString *email;

/**
 * <b>Description:</b> This property is used to obtain the sms number of the attendee .
 */
@property (retain, nonatomic) NSString *smsNumber;

/**
 * <b>Description:</b> This property is used to obtain the accountId of the attendee .
 */
@property (retain, nonatomic) NSString *accountId;

/**
 * <b>Description:</b> This property is used to obtain the pinCode of the attendee .
 */
@property (retain, nonatomic) NSString *pinCode;

/**
 * <b>Description:</b> This property is used to obtain the role of the attendee .
 */
@property (assign, nonatomic) int role;

@end



/**
 * <b>Description:</b> MeetingParams indicates the class of a meeting.
 * <br><b>Purpose:</b> When the SDK sends the {@link MeetingBaseApi.EVENT_MEETING_SCHEDULE_MEETING_RSP} broadcast to the UI, the broadcast contains the instances of
 * this class as parameters. After obtaining parameters from the broadcast, the UI invokes the methods of this class to obtain information about meeting,
 * and updates the view based on the information.
 */

@interface MeetingParams : NSObject

/**
 * <b>Description:</b> This property is used to obtain the start time of a conference.
 */
@property (retain, nonatomic) NSString *startTime;

/**
 * <b>Description:</b> This property is used to obtain the subject of a conference.
 */
@property (retain, nonatomic) NSString *subject;

/**
 * <b>Description:</b> This property is used to obtain the meeting id of a conference.
 */
@property (retain, nonatomic) NSString *meetingId;

/**
 * <b>Description:</b> This property is used to obtain the language of a conference.
 */
@property (retain, nonatomic) NSString *language;

/**
 * <b>Description:</b> This property is used to obtain the scheduleName of a conference.
 */
@property (retain, nonatomic) NSString *schedulerName;

/**
 * <b>Description:</b> This property is used to get userType of the meeting.
 */
@property (retain, nonatomic) NSString *userType;

/**
 * <b>Description:</b> This property is used to obtain the time zone of a conference.
 */
@property (assign, nonatomic) int timeZone;

/**
 * <b>Description:</b> This property is used to obtain the size of a conference.
 */
@property (assign, nonatomic) int size;

/**
 * <b>Description:</b> This property is used to obtain the media type of a conference.
 */
@property (assign, nonatomic) int mediaType;

/**
 * <b>Description:</b> This property is used to obtain the encrypt mode of a conference.
 */
@property (assign, nonatomic) int encryptMode;

/**
 * <b>Description:</b> This property is used to obtain the state of a conference.
 */
@property (assign, nonatomic) int state;

/**
 * <b>Description:</b> This property is used to obtain the length of a conference.
 */
@property (assign, nonatomic) long length;

/**
 * <b>Description:</b> This property is used to check whether the conference is a cycle conference.
 */
@property (assign, nonatomic) BOOL isCycleType;

/**
 * <b>Description:</b> This property is used to check whether participants are automatically invited to party.
 */
@property (assign, nonatomic) BOOL isAutoInvite;

/**
 * <b>Description:</b> This property is used to check whether the conference allow recording.
 */
@property (assign, nonatomic) BOOL isAllowRecord;

/**
 * <b>Description:</b> This property is used to check whether the conference auto prolong.
 */
@property (assign, nonatomic) BOOL isAutoProlong;

/**
 * <b>Description:</b> This property is used to check whether the conference auto record.
 */
@property (assign, nonatomic) BOOL isAutorecord;

/**
 * <b>Description:</b> This property is used to check whether the conference wait chairman.
 */
@property (assign, nonatomic) BOOL isWaitChairman;

/**
 * <b>Description:</b> This property is used to obtain the attendee array of a conference.
 */
@property (retain, nonatomic) NSMutableArray *attendeeArray;

@end
