/**
 * @file MeetingBaseApi.h
 * @brief Meeting Base Interface Functions
 */

#import <Foundation/Foundation.h>

/** Indicates the type of conference information. */
typedef enum tagMEETING_INFO_TYPE
{
    MEETING_INFO_TITLE,                   /**< Indicates the conference title, type string */
    MEETING_INFO_LANGUAGE,                /**< Indicates the language selected by a subscriber, type string */
    MEETING_INFO_ADAPTMODE,               /**< Indicates the adaptation mode, type int @see MEETING_ADAPT_MODE */
    MEETING_INFO_MEDIATYPE,               /**< Indicates the conference type, type int @see MEETING_MEDIA_TYPE */
    MEETING_INFO_CREATER_NAME,         /**< Indicates the name of a subscriber who creates the conference, type string*/
    MEETING_INFO_USER_NAME,               /**< Indicates the user name of a participant, type string */
    MEETING_INFO_USER_ROLE,               /**< Indicates the role of a participant, type int @see MEETING_PART_ROLE */
    MEETING_INFO_USER_CONFRIGHT,          /**< Indicates the rights of a subscriber to control a conference, type int @see from MEETING_CONFOPT_RIGHT_DATA_CHAIR to  MEETING_CONFOPT_RIGHT_CLOS_SUBCONF*/
    MEETING_INFO_USER_PARTRIGHT,          /**< Indicates the rights of a subscriber to control participants, type int @see from MEETING_PARTOPT_INVITE_PART to CAAS_MEETING_PARTOPT_SELFMUTE_INSUB */
    MEETING_INFO_USER_USE_AV_RESOURCE,    /**< Indicates whether the UI uses audio or not, type bool */
    MEETING_INFO_ACCESS_NUMBER,           /**< Indicates the access number of a conference, type string */
    MEETING_INFO_AUTH_CODE,               /**< Indicates the authentication code of a conference, type string */
    MEETING_INFO_SERVER_URL,              /**< Indicates the URL of a conference, type string */
    MEETING_INFO_VIDEO_UPRES,             /**< Indicates the uplink resolution, which is the major type, type string. The minor type is the level of video media parameters @see MEETING_VIDEO_LEVEL */
    MEETING_INFO_VIDEO_DOWNRES,           /**< Indicates the downlink resolution, which is the major type, , type string. The minor type is the level of video media parameters @see MEETING_VIDEO_LEVEL */
    MEETING_INFO_VIDEO_UPBANDWIDTH,       /**< Indicates the uplink bandwidth, which is the major type, type ulong. The minor type is the level of video media parameters @see MEETING_VIDEO_LEVEL */
    MEETING_INFO_VIDEO_DOWNBANDWIDTH,     /**< Indicates the downlink bandwidth, which is the major type, type ulong. The minor type is the level of video media parameters @see MEETING_VIDEO_LEVEL */
    MEETING_INFO_VIDEO_UPFRAME,           /**< Indicates the uplink frame rate, which is the major type, type ulong. The minor type is the level of video media parameters @see MEETING_VIDEO_LEVEL */
    MEETING_INFO_VIDEO_DOWNFRAME,         /**< Indicates the downlink frame rate, which is the major type, type ulong. The minor type is the level of video media parameters @see MEETING_VIDEO_LEVEL */
    MEETING_INFO_ACCOUNT_NAME,            /**< Indicates an audio/video account used to join a conference, type string */
    MEETING_INFO_ACCOUNT_PASSWORD,        /**< Indicates the password of an audio/video account, type string */
    MEETING_INFO_ACCOUNT_AUTHORNAME,      /**< Indicates the authentication name of an audio/video account, type string */
    MEETING_INFO_ACCOUNT_PROXYADDR,       /**< Indicates the IP address of a server to which an audio/video account is registered, type string */
    MEETING_INFO_ACCOUNT_DOMAIN,          /**< Indicates the name of a domain used to construct an SIP number, type string */
    MEETING_INFO_LOG_RECVEMAIL_ADDR,      /**< Indicates the email box used to receive log files, type string */
    MEETING_INFO_LOG_SENDEMAIL_SERVER,    /**< Indicates the address of a server that sends log files, type string */
    MEETING_INFO_LOG_SENDEMAIL_ADDR,      /**< Indicates the email box used to send log files, type string */
    MEETING_INFO_LOG_SENDEMAIL_PWD,       /**< Indicates the password of a email box used to send log files, type string */
    MEETING_INFO_ENABLE_ASY,              /**< Indicates whether uplink and downlink asymmetry is enabled, type bool */
    MEETING_INFO_ENCRYPT_MODE,            /**< Indicates the conference encryption mode, type int @see MEETING_ENCRYPT_MODE */
    MEETING_INFO_BUSINESS_TYPE,           /**< Indicates the type of conference services, type int @see MEETING_BUSINESS_TYPE */
    MEETING_INFO_MULTIPICTURE_NUMBER,     /**< Indicates the number of multipicture, type int */
    MEETING_INFO_DATA_CONF_SERVER_ADDR,   /**< Indicates the IP address of a data conference server, type string */
    MEETING_INFO_HAS_DATA_RESOURCE,       /**< Indicates whether the conference has data conference resources, type bool */
    MEETING_INFO_DATA_CONF_ID,            /**< Indicates the identifier for a data conference, type string */
    MEETING_INFO_DATA_CONF_TOKEN,         /**< Indicates the token of a data conference, type string */
    MEETING_INFO_DATA_CONF_PARTID,        /**< Indicates the identifier for a participant who is on a data conference, type string */
    MEETING_INFO_DATA_CONF_MODE,          /**< Indicates the conference mode of a data conference, type int @see MEETING_DATA_CONF_MODE */
    MEETING_INFO_DATA_CONF_URL,           /**< Indicates URL of a data conference, type string */
    MEETING_INFO_DATA_CONF_TMP_TOKEN,      /**< Indicates the temporary token of a data conference, type string */
    MEETING_INFO_DATA_MEDIA_SECRET_KEY      /**< Indicates the key for data media encryption, type string */
}MEETING_INFO_TYPE;

/** Indicates the level of video media parameters. */
typedef enum tagMEETING_VIDEO_LEVEL
{
    MEETING_VIDEO_LEVEL_LOW,              /**< Indicates low-level video media parameters, such as frame rate, bit rate, and resolution. */	
    MEETING_VIDEO_LEVEL_MIDDLE,           /**< Indicates middle-level video media parameters, such as frame rate, bit rate, and resolution. */
    MEETING_VIDEO_LEVEL_HIGH              /**< Indicates high-level video media parameters, such as frame rate, bit rate, and resolution. */
}MEETING_VIDEO_LEVEL;

/** Indicates the adaptation type of a conference. */
typedef enum tagMEETING_ADAPT_MODE
{
    MEETING_ADAPT_MODE_NOADAPT,           /**< Indicates non-full adaptation. */
    MEETING_ADAPT_MODE_FULLADAPT          /**< Indicates full adaptation. */
}MEETING_ADAPT_MODE;

/** Indicates the type of a conference. */
typedef enum tagMEETING_MEDIA_TYPE
{
    MEETING_MEDIA_VOICE,                  /**< Indicates a voice conference. */
    MEETING_MEDIA_VIDEO,                  /**< Indicates a standard definition (SD) video conference. */
    MEETING_MEDIA_HDVIDEO,                /**< Indicates a high definition (HD) video conference. */
    MEETING_MEDIA_TELEVIDEO,              /**< Indicates a Telepresence conference. */
    MEETING_MEDIA_VOICE_WITHDATA,         /**< Indicates a voice+data conference. */
    MEETING_MEDIA_VIDEO_WITHDATA,         /**< Indicates an SD video+data conference. */
    MEETING_MEDIA_HDVIDEO_WITHDATA,       /**< Indicates an HD video+data conference */
    MEETING_MEDIA_TELEVIDEO_WITHDATA      /**< Indicates a Telepresence+data conference */
}MEETING_MEDIA_TYPE;

/** Indicates the conference encryption mode. */
typedef enum tagMEETING_ENCRYPT_MODE
{
    MEETING_ENCRYPT_MODE_NO,              /**< Indicates a conference is not encrypted. */
    MEETING_ENCRYPT_MODE_AUTO,            /**< Indicates a conference is adaptively encrypted. */
    MEETING_ENCRYPT_MODE_FORCE            /**< Indicates a conference is forcibly encrypted. */
}MEETING_ENCRYPT_MODE;

/** Indicates the type of a video picture. */
typedef enum tagMEETING_VIDEOMODE_SUBSCREEN_TYPE
{
    MEETING_VIDEOMODE_SUBSCREEN_MAIN,     /**< Indicates a primary video picture. */
    MEETING_VIDEOMODE_SUBSCREEN_SUB       /**< Indicates a secondary video picture. */
}MEETING_VIDEOMODE_SUBSCREEN_TYPE;

/** Indicates the video display mode of a video conference. */
typedef enum tagMEETING_VIDEOMODE_IMAGETYPE
{
    MEETING_VIDEOMODE_IMAGETYPE_SINGLE,   /**< Indicates a single video picture. */
    MEETING_VIDEOMODE_IMAGETYPE_TWO,      /**< Indicates two video pictures. */
    MEETING_VIDEOMODE_IMAGETYPE_THREE,    /**< Indicates three video pictures. */
    MEETING_VIDEOMODE_IMAGETYPE_FOUR,     /**< Indicates four video pictures. */
    MEETING_VIDEOMODE_IMAGETYPE_FOURSIX,  /**< Indicates four video pictures in 4-6 mode. */
    MEETING_VIDEOMODE_IMAGETYPE_SIX,      /**< Indicates six video pictures. */
    MEETING_VIDEOMODE_IMAGETYPE_SEVEN,    /**< Indicates seven video pictures in 7-5 mode. */
    MEETING_VIDEOMODE_IMAGETYPE_EIGHT,    /**< Indicates eight video pictures. */
    MEETING_VIDEOMODE_IMAGETYPE_NINE,     /**< Indicates nine video pictures. */
    MEETING_VIDEOMODE_IMAGETYPE_THIRTEENR,/**< Indicates 13 video pictures with the main picture on the right. */
    MEETING_VIDEOMODE_IMAGETYPE_THIRTEENM,/**< Indicates 13 video pictures with the main picture in the middle. */
    MEETING_VIDEOMODE_IMAGETYPE_SIXTEEN   /**< Indicates 16 video pictures. */
}MEETING_VIDEOMODE_IMAGETYPE;

/** Indicates the type of conference services. */
typedef enum tagMEETING_BUSINESS_TYPE
{
    MEETING_BUSINESS_TYPE_SCHEDULE,       /**< Indicates a scheduled conference.*/
    MEETING_BUSINESS_TYPE_MASS,           /**< Indicates a reservationless conference.*/
    MEETING_BUSINESS_TYPE_SELF,           /**< Indicates a self-help conference.*/
    MEETING_BUSINESS_TYPE_ADHOC,          /**< Indicates an Ad hoc conference.*/
    MEETING_BUSINESS_TYPE_MCU,            /**< Indicates a scheduled conference. The parameter is the same as {@link MEETING_BUSINESS_TYPE_SCHEDULE}.*/
    MEETING_BUSINESS_TYPE_PRIVATE,        /**< Indicates a private conference.*/
    MEETING_BUSINESS_TYPE_TELEPRESENCE,   /**< Indicates a Telepresence video conference.*/
    MEETING_BUSINESS_TYPE_GROUPCALL,      /**< Indicates a group call conference.*/
    MEETING_BUSINESS_TYPE_SMSGROUP,       /**< Indicates the SMS group service.*/
    MEETING_BUSINESS_TYPE_GROUPBROADCAST, /**< Indicates group announcement broadcast.*/
    MEETING_BUSINESS_TYPE_GROUPPLAYBACK,  /**< Indicates group announcement playback.*/
    MEETING_BUSINESS_TYPE_GROUPALARM,     /**< Indicates an alarm conference.*/
    MEETING_BUSINESS_TYPE_CONFPLAYBACK,   /**< Indicates conference recording playback.*/
    MEETING_BUSINESS_TYPE_CONFASSISTANT   /**< Indicates the conference assistant.*/
}MEETING_BUSINESS_TYPE;

/**< @brief this enumeration is used to indicates the data conference mode. */
typedef enum tagMEETING_DATA_CONF_MODE
{
    MEETING_DATA_CONF_MODE_CONTROL,     /**< @brief The control mode  */
    MEETING_DATA_CONF_MODE_FREE,        /**< @brief The free mode  */
} MEETING_DATA_CONF_MODE;

#define MEET_CONFINFO_MAX_LEN 256 /**< Indicates the max len of conference-info in sip message.*/

#define MEETING_ERROR_COMMON_INVALID_REQUEST    10001    /**< Indicates the request is invalid.*/
#define MEETING_ERROR_COMMON_FORBIDDEN          10002    /**< Indicates the request is rejected.*/
#define MEETING_ERROR_COMMON_NO_RIGHT           10003    /**< Indicates the subscriber has no rights.*/
#define MEETING_ERROR_COMMON_SERVER_BUSY        10004    /**< Indicates the server is busy.*/
#define MEETING_ERROR_COMMON_SERVER_ERROR       10005    /**< Indicates an error occurs on the server.*/
#define MEETING_ERROR_COMMON_SERVER_UNAVAILABLE 10006    /**< Indicates the services are unavailable.*/
#define MEETING_ERROR_COMMON_UNAUTHORIZED       10007    /**< Indicates the subscriber has not been authorized.*/
#define MEETING_ERROR_COMMON_TOKENERROR         10009    /**< Indicates the authorization token in a request is invalid or incorrect.*/
#define MEETING_ERROR_COMMON_NOTOKEN            10010    /**< Indicates no token is contained in a request.*/
#define MEETING_ERROR_LOGIN_NOT_EXIST           11017    /**< Indicates the conference to be logged in does not exist, has not started, or has ended.*/
#define MEETING_ERROR_LOGIN_AUTHEN_FAIL         11021    /**< Indicates authentication fails for a conference login.*/
#define MEETING_ERROR_LOGIN_PIN_USED            11024    /**< Indicates multiple subscribers in a conference use the same pin code.*/
#define MEETING_ERROR_CONF_LOCKED               11029    /**< Indicates multiple subscribers in a conference use the same pin code.*/
#define MEETING_ERROR_CONF_NOT_EXIST            11115    /**< Indicates the conference to be joined does not exist or has not started.*/
#define MEETING_ERROR_CONF_ALREADY_END          11116    /**< Indicates the conference to be joined has ended.*/
#define MEETING_ERROR_CONF_NO_RESOURCE          11117    /**< Indicates no resources are available for a conference to be joined.*/
#define MEETING_ERROR_CONF_REACH_MAXNUM         11118    /**< Indicates the number of subscribers who have joined a conference reaches the maximum value.*/
#define MEETING_ERROR_CONF_NOT_SUPPORT_DATACONF 11119    /**< Indicates the conference to be joined does not support data conference.*/
#define MEETING_ERROR_CONF_NOT_START            11120    /**< Indicates the conference to be joined has not started.*/

#define MEETING_ERROR_CONF_LENGTH_TOO_LONG 11038 /**< Indicates the length of the conference exceed the limit.*/
#define MEETING_ERROR_LOCK_TIMEOUT 11003 /**< Indicates lock or unlock time out.*/
#define MEETING_ERROR_LOCK_NOT_EXIST 11017  /**< Indicates the conference not exist.*/

#define MEETING_ERROR_PROLONG_NOT_EXIST 11017  /**< Indicates the conference not exist.*/
#define MEETING_ERROR_PROLONG_NOT_ENOUGH 11030  /**< Indicates the conference resource not enough.*/
#define MEETING_ERROR_PROLONG_PRIVATECONFID_TIME_CLASH 11042  /**< Indicates the time clash.*/
#define MEETING_ERROR_PROLONG_SUBCONF_RESOURCE_NOT_ENOUGH 11069  /**< Indicates the sub conference resource not enough.*/
#define MEETING_ERROR_PROLONG_SUBCONF_SERVER_ERROR 11070  /**< Indicates the sub conference server error.*/

#define MEETING_ERROR_TRANSFER_CHAIRRIGHT_NOT_EXIST 11017  /**< Indicates the conference chair not exist.*/
#define MEETING_ERROR_TRANSFER_CHAIRRIGHT_CHAIRMAN_IN_ANOTHER_CONFERENCE 11071  /**< Indicates the participant not found.*/
#define MEETING_ERROR_TRANSFER_CHAIRRIGHT_NOT_FOUND 11013  /**< Indicates the participant not found.*/

#define MEETING_ERROR_SELECTVIDEO_NOT_EXIST 11017  /**< Indicates the conference not found.*/
#define MEETING_ERROR_SELECTVIDEO_NO_CHANNEL 11063  /**< Indicates there is no enough channel.*/

#define MEETING_ERROR_SET_AUTOBROWSEMODE_NOT_EXIST 11017  /**< Indicates the conference not found.*/
#define MEETING_ERROR_SET_VASMODE_NOT_EXIST 11017  /**< Indicates the conference not found.*/
#define MEETING_ERROR_SET_FREEMODE_NOT_EXIST 11017  /**< Indicates the conference not found.*/
#define MEETING_ERROR_SET_FIXEDMODE_NOT_EXIST 11017  /**< Indicates the conference not found.*/
#define MEETING_ERROR_SET_MIXEDPICTURE_NOT_EXIST 11017  /**< Indicates the conference not found.*/

#define MEETING_ERROR_LIST_MEETING_PARAM_FORMAT_ERROR  11014 /**< Indicates the param format error.*/

#define MEETING_ERROR_SCHEDULE_MEETING_PARAM_FORMAT_ERROR  11014 /**< Indicates the conference param format error.*/
#define MEETING_ERROR_SCHEDULE_MEETING_PARAM_ERROR  11002 /**< Indicates the conference param error.*/
#define MEETING_ERROR_SCHEDULE_MEETING_REQUEST_TIMEOUT  11003 /**< Indicates the request time out.*/
#define MEETING_ERROR_SCHEDULE_MEETING_NO_ENOUGH_RIGHT  11004 /**< Indicates no enough right.*/
#define MEETING_ERROR_SCHEDULE_MEETING_ACCOUNT_BALANCE_NOT_ENOUGH  11012 /**< Indicates account balance not enough.*/
#define MEETING_ERROR_SCHEDULE_MEETING_ACCOUNT_NOT_FOUND  11013 /**< Indicates account not found.*/
#define MEETING_ERROR_SCHEDULE_MEETING_RESOURCE_NOT_ENOUGH  11030 /**< Indicates resource not enough.*/
#define MEETING_ERROR_SCHEDULE_MEETING_SIZE_EXCEED_LIMIT  11032 /**< Indicates the size exceed limit.*/
#define MEETING_ERROR_SCHEDULE_MEETING_NOT_SUPPORT_MEDIA_TYPE  11037 /**< Indicates the media type not supported.*/
#define MEETING_ERROR_SCHEDULE_MEETING_LENGTH_TOO_LONG  11038 /**< Indicates the length is too long.*/
#define MEETING_ERROR_SCHEDULE_MEETING_STARTTIME_LESS_CURTIME  11040 /**< Indicates the start time less than current time.*/
#define MEETING_ERROR_SCHEDULE_MEETING_STARTDATE_TOO_FUTUREE  11041 /**< Indicates the start time exceed one year limit.*/
#define MEETING_ERROR_SCHEDULE_MEETING_PRIVATE_CONFERENCE_TIME_CLASH  11042 /**< Indicates the time is clashed with private conference.*/
#define MEETING_ERROR_SCHEDULE_MEETING_ATTENDEES_SIZE_ERROR  11043 /**< Indicates the attendee size is more than the conference size.*/
#define MEETING_ERROR_SCHEDULE_MEETING_AUTHORIZATION_TYPE_INVALID  11052 /**< Indicates the conference authorization type invalid.*/
#define MEETING_ERROR_SCHEDULE_MEETING_CANNOT_MODIFY_AUTHORIZATION_TYPE  11072 /**< Indicates the conference authorization type can not be modified.*/

#define MEETING_ERROR_MODIFY_MEETING_NO_ENOUGH_RIGHT  11004 /**< Indicates no enough right.*/
#define MEETING_ERROR_MODIFY_MEETING_PARAM_FORMAT_ERROR  11014 /**< Indicates the conference param format error.*/
#define MEETING_ERROR_MODIFY_MEETING_CONFERENCE_HAS_ENDED  11026 /**< Indicates the conference has been ended.*/
#define MEETING_ERROR_MODIFY_MEETING_CONFERENCE_IS_ONLINE  11027 /**< Indicates the conference is online.*/
#define MEETING_ERROR_MODIFY_MEETING_RESOURCE_NOT_ENOUGH  11030 /**< Indicates resource not enough.*/
#define MEETING_ERROR_MODIFY_MEETING_SIZE_EXCEED_LIMIT  11032 /**< Indicates the size exceed limit.*/
#define MEETING_ERROR_MODIFY_MEETING_NOT_SUPPORT_MEDIA_TYPE  11037 /**< Indicates the media type not supported.*/
#define MEETING_ERROR_MODIFY_MEETING_LENGTH_TOO_LONG  11038 /**< Indicates the length is too long.*/
#define MEETING_ERROR_MODIFY_MEETING_STARTTIME_LESS_CURTIME  11040 /**< Indicates the start time less than current time.*/
#define MEETING_ERROR_MODIFY_MEETING_STARTDATE_TOO_FUTUREE  11041 /**< Indicates the start time exceed one year limit.*/
#define MEETING_ERROR_MODIFY_MEETING_PRIVATE_CONFERENCE_TIME_CLASH  11042 /**< Indicates the time is clashed with private conference.*/
#define MEETING_ERROR_MODIFY_MEETING_ATTENDEES_SIZE_ERROR  11043 /**< Indicates the attendee size is more than the conference size.*/
#define MEETING_ERROR_MODIFY_MEETING_AUTHORIZATION_TYPE_INVALID  11052 /**< Indicates the conference authorization type invalid.*/
#define MEETING_ERROR_MODIFY_MEETING_CANNOT_MODIFY_AUTHORIZATION_TYPE  11072 /**< Indicates the conference authorization type can not be modified.*/

#define MEETING_ERROR_REMOVE_MEETING_NO_ENOUGH_RIGHT  11004 /**< Indicates no enough right.*/
#define MEETING_ERROR_REMOVE_MEETING_CONFERENCE_HAS_ENDED  11026 /**< Indicates the conference has been ended.*/
#define MEETING_ERROR_REMOVE_MEETING_CONFERENCE_IS_ONLINE  11027 /**< Indicates the conference is online.*/

#define MEETING_ERROR_CREATE_TEMPLATE_ACCOUNT_NOT_FOUND  11013 /**< Indicates account not found.*/
#define MEETING_ERROR_CREATE_TEMPLATE_SIZE_EXCEED_LIMIT  11032 /**< Indicates the size exceed limit.*/
#define MEETING_ERROR_CREATE_TEMPLATE_NOT_SUPPORT_MEDIA_TYPE  11037 /**< Indicates the media type not supported.*/
#define MEETING_ERROR_CREATE_TEMPLATE_LENGTH_TOO_LONG  11038 /**< Indicates the length is too long.*/
#define MEETING_ERROR_CREATE_TEMPLATE_AUTHORIZATION_TYPE_INVALID  11052 /**< Indicates the conference authorization type invalid.*/
#define MEETING_ERROR_CREATE_TEMPLATE_EXCEED_MAX_NUMBER_LIMIT  11054 /**< Indicates the template number exceed the limit.*/
#define MEETING_ERROR_CREATE_TEMPLATE_VIDEO_TEMPLATE_EXCEED_MAX_NUMBER_LIMIT  11065 /**< Indicates the video template number exceed the limit.*/
#define MEETING_ERROR_CREATE_TEMPLATE_ALREADY_EXIST  11066  /**< Indicates the conference template name already existed.*/

#define MEETING_ERROR_MODIFY_TEMPLATE_ACCOUNT_NOT_FOUND  11013 /**< Indicates account not found.*/
#define MEETING_ERROR_MODIFY_TEMPLATE_PARAM_FORMAT_ERROR  11014 /**< Indicates the conference param format error.*/
#define MEETING_ERROR_MODIFY_TEMPLATE_SIZE_EXCEED_LIMIT  11032 /**< Indicates the size exceed limit.*/
#define MEETING_ERROR_MODIFY_TEMPLATE_NOT_SUPPORT_MEDIA_TYPE  11037 /**< Indicates the media type not supported.*/
#define MEETING_ERROR_MODIFY_TEMPLATE_LENGTH_TOO_LONG  11038 /**< Indicates the length is too long.*/
#define MEETING_ERROR_MODIFY_TEMPLATE_AUTHORIZATION_TYPE_INVALID  11052 /**< Indicates the conference authorization type invalid.*/
#define MEETING_ERROR_MODIFY_TEMPLATE_VIDEO_TEMPLATE_EXCEED_MAX_NUMBER_LIMIT  11064 /**< Indicates the video template number exceed the limit.*/
#define MEETING_ERROR_MODIFY_TEMPLATE_ALREADY_EXIST  11066  /**< Indicates the conference template name already existed.*/

#define MEETING_ERROR_REMOVE_TEMPLATE_ACCOUNT_NOT_FOUND  11013 /**< Indicates account not found.*/
#define MEETING_ERROR_REMOVE_TEMPLATE_CANNOT_DELETE_TEMPNAME  11053 /**< Indicates can not delete default template.*/

/**
 * <b>Description:</b> MeetingEventBaseInfo indicates the class of basic information about conference broadcasts.
 * <br><b>Purpose:</b> When the SDK receives a response to a certain operation from the server, the SDK encapsulates the operation result in an instance of this class and sends the
 * instance to the UI in different broadcasts. The UI obtains parameters from the broadcast and uses this class to obtain the result of an operation.
 */
@interface MeetingEventBaseInfo : NSObject
{
@private

    NSString * _meetingId;
    unsigned long _cookie;
    int _cmdResult;
    int _cmdRstCode;
//    NSString * _serverVersion;
}

/**
 * <b>Description:</b> It is used to obtain a conference ID.
 * <br><b>Purpose:</b> After obtaining the {@link MeetingEventBaseInfo} object from a broadcast sent by the SDK, the UI can obtain a conference ID through this property.
 * <br> The property indicates a conference.
 */
@property (nonatomic, retain) NSString *meetingId;

/**
 * <b>Description:</b> It is used to obtain a message ID.
 * <br><b>Purpose:</b> After obtaining the {@link MeetingEventBaseInfo} object from a broadcast sent by the SDK, the UI can obtain a message ID Zthrough this property.
 * <br> The property indicates a message.
 */
@property (nonatomic, assign) unsigned long cookie;

/**
 * <b>Description:</b> It is used to obtain an operation result.
 * <br><b>Purpose:</b> After obtaining the {@link MeetingEventBaseInfo} object from a broadcast sent by the SDK, the UI can obtain an operation result through this property.
 * <br> The property indicates the operation result. The value 0 indicates operation success, and the other value indicates operation failure.
 */
@property (nonatomic, assign) int cmdResult;

/**
 * <b>Description:</b> It is used to obtain the operation result code.
 * <br><b>Purpose:</b> After obtaining the {@link MeetingEventBaseInfo} object from a broadcast sent by the SDK, the UI can obtain the operation result code through this property.
 * @return The property indicates the operation result code.
 */
@property (nonatomic, assign) int cmdRstCode;

@end

/** Indicates the procedure for logging in to a conference. */
typedef enum tagMEETING_LOGIN_STAGE
{
    MEETING_LOGIN_STAGE_LOGIN,              /**< Indicates logging in to a server. */
    MEETING_LOGIN_STAGE_JOIN,               /**< Indicates applying for conference resources. */
    MEETING_LOGIN_STAGE_GETCONFIG,          /**< Indicates querying the client configurations. */
    MEETING_LOGIN_STAGE_DISPLAY,            /**< Indicates querying conference details. */
    MEETING_LOGIN_STAGE_GUESTWAITING        /**< Indicates the guest is waiting to join a private conference. */
}MEETING_LOGIN_STAGE;

/** Indicates the status of a conference. */
typedef enum tagMEETING_STATE
{
    MEETING_STATE_SCHEDULE,                 /**< Indicates a conference has been scheduled. */
    MEETING_STATE_CREATING,                 /**< Indicates a conference is being created. */
    MEETING_STATE_CREATED,                  /**< Indicates a conference is in progress. */
    MEETING_STATE_DESTROYED                 /**< Indicates a conference is closed. */
}MEETING_STATE;

/** Indicates video selection mode. */
typedef enum tagMEETING_VIDEO_MODE
{
    MEETING_VIDEO_MODE_FREE,                /**< Indicates the free selection mode. */
    MEETING_VIDEO_MODE_FIXED,               /**< Indicates the fixed picture mode. */
    MEETING_VIDEO_MODE_AUTOBROWSER,         /**< Indicates the auto-browse mode. */
    MEETING_VIDEO_MODE_VAS,                 /**< Indicates the VAS mode. */
    MEETING_VIDEO_MODE_ROLLCALL             /**< Indicates the roll call mode. */
}MEETING_VIDEO_MODE;


#define MEETING_CONFOPT_RIGHT_DATA_CHAIR      1        /**< Indicates the chairperson of a data conference.*/
#define MEETING_CONFOPT_RIGHT_DATA_GUEST      2    	   /**< Indicates a common participant of a data conference.*/    
#define MEETING_CONFOPT_RIGHT_CLOSE_CONF      4        /**< Indicates closing a conference.*/
#define MEETING_CONFOPT_RIGHT_LOCK_CONF       8        /**< Indicates locking a conference.*/
#define MEETING_CONFOPT_RIGHT_PROLONG_CONF    16       /**< Indicates extending a conference.*/
#define MEETING_CONFOPT_RIGHT_CHANGE_MODE     32       /**< Indicates changing the conference mode.*/
#define MEETING_CONFOPT_RIGHT_RECORD          64       /**< Indicates recording the conference audio.*/
#define MEETING_CONFOPT_RIGHT_MUTE            128      /**< All participants except the chairperson are muted.*/
#define MEETING_CONFOPT_RIGHT_ROLL_CALL       256      /**< Indicates the roll call mode.*/
#define MEETING_CONFOPT_RIGHT_RUN_AGENDA      512      /**< Indicates running the conference agenda.*/
#define MEETING_CONFOPT_RIGHT_VIDEO_CONTROL   1024     /**< Indicates controlling the conference video.*/
#define MEETING_CONFOPT_RIGHT_SPEAKER_CONTROL 2048     /**< Indicates enabling the speaker report function.*/
#define MEETING_CONFOPT_RIGHT_NET_CONTROL     4096     /**< Indicates the network status report function.*/
#define MEETING_CONFOPT_RIGHT_SET_CHAIRMAN    8192     /**< Indicates transferring chairperson rights.*/
#define MEETING_CONFOPT_RIGHT_QRY_ENADDRBOOK  16384    /**< Indicates querying an enterprise address book.*/
#define MEETING_CONFOPT_RIGHT_CREATE_SUBCONF  32768    /**< Indicates creating a sub conference.*/
#define MEETING_CONFOPT_RIGHT_CLOS_SUBCONF    65536    /**< Indicates closing a sub conference.*/

/**
 * <b>Description:</b> MeetingSubscriberInPicInfo indicates basic parameters for setting video pictures.
 * <br><b>Purpose:</b> During multipicture setting or video selection, the UI instantiates this 
 * class to construct basic parameters for setting video pictures.
 */
@interface MeetingSubscriberInPicInfo : NSObject
{
@private

    int _index;
    int _type;
    NSMutableArray * _subCallIdArray;
    NSString * _currentDispSubCallId;
}

/**
 * The property indicates the serial number of each video picture. 
 * <br>The value of this property starts from 1.
 */
@property (nonatomic, assign) int index;

/**
 * The property indicates the type of the video picture. 
 * <br>The default value is {@link tagMEETING_VIDEOMODE_SUBSCREEN_TYPE}.
 */
@property (nonatomic, assign) int type;

/**
 * The property indicates the session of each video picture. 
 * <br>This property is in an NSString array and displayed in polling mode during multipicture control.
 */
@property (nonatomic, retain) NSMutableArray * subCallIdArray;

/**
 * The property indicates a subscriber who is being displayed. 
 * <br>The default value is NULL.
 */
@property (nonatomic, retain) NSString * currentDispSubCallId;

@end

/**
 * <b>Description:</b> MeetingMixedPictureParam indicates basic parameters for multipicture setting.
 * <br><b>Purpose:</b> Before invoking {@link Meeting.setMixedPicture}, the UI instantiates this 
 * class to construct parameters for multipicture setting.
 */
@interface MeetingMixedPictureParam : NSObject
{
@private
    
    unsigned long _cookie;
    int _imageType;
    int _switchMode;
    int  _switchTime;
    NSMutableArray * _subInPicInfoArray;
}

/**
 * The property indicates a message.
 */
@property (nonatomic, assign) unsigned long cookie;

/**
 * The property indicates the mode of video picture display.See {@link tagMEETING_VIDEOMODE_IMAGETYPE}
 */
@property (nonatomic, assign) int imageType;

/**
 * The property indicates the policy of video picture display.See {@link tagMEETING_VIDEO_MODE}
 */
@property (nonatomic, assign) int switchMode;

/**
 * The property indicates the polling interval in units of seconds.
 */
@property (nonatomic, assign) int switchTime;

/**
 * The property indicates the video picture list, which is in a MeetingSubscriberInPicInfo array.
 */
@property (nonatomic, retain) NSMutableArray * subInPicInfoArray;

@end

/**
 * <b>Description:</b> MeetingVideoSelectInfo indicates basic parameters for video selection.
 * <br><b>Purpose:</b> Before invoking {@link Meeting.selectVideo:meetingVideoSelectParam:}, the UI instantiates this 
 * class to set basic parameters for video selection method.
 */
@interface MeetingVideoSelectInfo : NSObject
{
@private

    int _switchTime;
    BOOL _selectByScreen;
    NSString * _dstScreenCallId;
    NSMutableArray * _subInPicInfoArray;
}

/**
 * The property indicates the polling interval in units of seconds.
 */
@property (nonatomic, assign) int switchTime;

/**
 * The property indicates whether the screen selection is enabled. The value YES indicates that screen selection is enabled. The value NO indicates that screen selection is disabled.
 */
@property (nonatomic, assign) BOOL selectByScreen;

/**
 * The property indicates the screen session ID of a viewer. The value contains a maximum of 255 characters.
 */
@property (nonatomic, retain) NSString * dstScreenCallId;

/**
 * The property indicates the video picture list, which is in a {@link MeetingSubscriberInPicInfo} array.
 */
@property (nonatomic, retain) NSMutableArray * subInPicInfoArray;

@end

/**
 * <b>Description:</b> MeetingVideoSelectInfo indicates information about video selection.
 * <br><b>Purpose:</b> Before invoking {@link Meeting.selectVideo:meetingVideoSelectParam:}, the UI instantiates this 
 * class to set parameters for video selection method.
 */
@interface MeetingVideoSelectParam : NSObject
{
@private

    unsigned long _cookie;
    NSMutableArray * _videoSelectInfoArray;
}

/**
 * The property indicates a message.
 */
@property (nonatomic, assign) unsigned long cookie;

/**
 * The property specifies the video selection content, which is a {@link MeetingVideoSelectInfo} array.
 */
@property (nonatomic, retain) NSMutableArray * videoSelectInfoArray;

@end


/**
 * <b>Description:</b> Meeting indicates the class of a conference.
 * <br><b>Purpose:</b> The UI instantiates this class and invokes methods of this class to perform operations on a conference, 
 * such as muting, unmuting, or closing a conference. When a conference status changes, the SDK encapsulates the latest conference
 * status in an instance of this class and sends the instance to the UI in the {@link EVENT_MEETING_STATUS_CHANGED} broadcast.
 * The UI updates the view based on the latest conference status.
 */
@interface Meeting : NSObject
{
@private

    NSString * _meetingId;
    NSString * _title;
    NSString * _startTime;
    int _timeLength;
    int  _size;
    int  _state;
    int  _videoMode;
    BOOL _isMute;
    BOOL _isLock;
    BOOL _isRecording;
    BOOL _isPermitGuest;
    unsigned long _cookie;
    NSString * _remainningTime;
}

/**
 * <b>Description:</b> It is used to obtain a conference ID.
 * <br><b>Purpose:</b> After constructing the {@link Meeting} object to implement an operation on a conference, such as muting, unmuting, 
 * or closing the conference, the UI obtain the conference ID from the {@link Meeting} object through this property.
 * <br> The property indicates a conference.
 */
@property (retain, nonatomic) NSString * meetingId;

/**
 * <b>Description:</b> It is used to obtain a conference title.
 * <br><b>Purpose:</b> After obtaining the {@link Meeting} object that contains the latest conference status from the {@link EVENT_MEETING_STATUS_CHANGED} broadcast, 
 * the UI can obtain the conference title from the {@link Meeting} object through this property and display it on the view.
 * <br> The property indicates a conference title.
 */
@property (retain, nonatomic) NSString * title;

/**
 * <b>Description:</b> It is used to obtain a start time of a conference.
 * <br><b>Purpose:</b> After obtaining the {@link Meeting} object that contains the latest conference status from the {@link EVENT_MEETING_STATUS_CHANGED} broadcast, 
 * the UI can obtain the start time of a conference from the {@link Meeting} object through this property and display it on the view.
 * <br> The property indicates the start time of a conference.
 */
@property (retain, nonatomic) NSString * startTime;

/**
 * <b>Description:</b> It is used to obtain a conference duration.
 * <br><b>Purpose:</b> After obtaining the {@link Meeting} object that contains the latest conference status from the {@link EVENT_MEETING_STATUS_CHANGED} broadcast, 
 * the UI can obtain the conference duration from the {@link Meeting} object and display it on the view.
 * <br> The property indicates the conference duration.
 */
@property (nonatomic, assign) int timeLength;

/**
 * <b>Description:</b> It is used to obtain the number of parties in a conference.
 * <br><b>Purpose:</b> After obtaining the {@link Meeting} object that contains the latest conference status from the {@link EVENT_MEETING_STATUS_CHANGED} broadcast, 
 * the UI can obtain the number of parties in the conference from the {@link Meeting} object through this property and display it on the view.
 * <br> The property indicates the number of parties in a conference.
 */
@property (nonatomic, assign) int size;

/**
 * <b>Description:</b> It is used to obtain the current state of a conference.
 * <br><b>Purpose:</b> After obtaining the {@link Meeting} object that contains the latest conference status from the {@link EVENT_MEETING_STATUS_CHANGED} broadcast, 
 * the UI can obtain the current state of the conference from the {@link Meeting} object through this property. The UI performs operations based on the status.
 * <br> The property indicates the current status of a conference.See {@link tagMEETING_STATE}.
 */
@property (nonatomic, assign) int state;

/**
 * <b>Description:</b> It is used to obtain the video mode of a conference.
 * <br><b>Purpose:</b> After obtaining the {@link Meeting} object that contains the latest conference status from the {@link EVENT_MEETING_STATUS_CHANGED} broadcast, 
 * the UI can obtain the video mode of the conference from the {@link Meeting} object through this property.
 * <br> The property indicates the video mode.See {@link tagMEETING_VIDEO_MODE}.
 */
@property (nonatomic, assign) int videoMode;

/**
 * <b>Description:</b> It is used to check whether a conference is muted.
 * <br><b>Purpose:</b> After obtaining the {@link Meeting} object that contains the latest conference status from the {@link EVENT_MEETING_STATUS_CHANGED} broadcast, 
 * the UI can check whether the conference is muted through this property.
 * <br>YES Indicates the conference is muted
 * <br>NO the conference is not muted
 */
@property (nonatomic, assign) BOOL isMute;

/**
 * <b>Description:</b> It is used to check whether a conference is locked.
 * <br><b>Purpose:</b> After obtaining the {@link Meeting} object that contains the latest conference status from the {@link EVENT_MEETING_STATUS_CHANGED} broadcast, 
 * the UI can check whether the conference is locked through this property.
 * <br>YES Indicates the conference is locked
 * <br>NO the conference is not locked
 */
@property (nonatomic, assign) BOOL isLock;

/**
 * <b>Description:</b> It is used to check whether a conference is being recorded.
 * <br><b>Purpose:</b> After obtaining the {@link Meeting} object that contains the latest conference status from the {@link EVENT_MEETING_STATUS_CHANGED} broadcast, 
 * the UI can check whether the conference is being recorded through this property.
 * <br>YES Indicates the conference is being recorded
 * <br>NO the conference is not being recorded
 */
@property (nonatomic, assign) BOOL isRecording;

/**
 * <b>Description:</b> It is used to check whether the guests are allowed to join a conference.
 * <br><b>Purpose:</b> After obtaining the {@link Meeting} object that contains the latest conference status from the {@link EVENT_MEETING_STATUS_CHANGED} broadcast, 
 * the UI can check whether the guests are allowed to join the conference through this property.
 * <br>YES Indicates the guests are allowed to join the conference
 * <br>NO Indicates the guests are not allowed to join the conference
 */
@property (nonatomic, assign) BOOL isPermitGuest;

/**
 * <b>Description:</b> It is used to obtain the message ID.
 * <br><b>Purpose:</b> After constructing the {@link Meeting} object to implement an operation on the conference, such as muting, unmuting, or closing the conference, 
 * the UI obtain the message ID from the Meeting object through this property.
 * <br> The property indicates the message ID.
 */
@property (nonatomic, assign) unsigned long cookie;


/**
 * <b>Description:</b> It is used to obtain the remainning time.
 * <br><b>Purpose:</b> After obtaining the {@link Meeting} object that contains the latest conference status from the {@link EVENT_MEETING_STATUS_CHANGED} broadcast,
 * the UI can obtain the conference title from the {@link Meeting} object through this property and display it on the view.
 * <br> The property indicates the remainning time.
 */
@property (retain, nonatomic) NSString * remainningTime;

/**
 * <b>Description:</b> This method is used to initialize the meeting object.
 * <br><b>Purpose:</b> This method is used to initialize the meeting object after ui creat it. 
 * @return The meeting object.
 */
- (id)init;

/**
 * <b>Description:</b> This method is used to leave a conference.
 * <br><b>Purpose:</b> This method is used to leave a conference and can be invoked only after the {@link MeetingBaseApi.login} is successfully invoked. 
 * During an audio/video conference, this method is invoked after the hangup method of the call module to leave a conference.
 * @return The value 0 indicates operation success, and the value 1 indicates operation failure.
 */
- (int)logout;

/**
 * <b>Description:</b> This method is used to mute a conference.
 * <br><b>Purpose:</b> This method can be invoked only after {@link MeetingBaseApi.login} is successfully invoked. This method is used for the chairperson to disable all 
 * participants to be heard in a conference. After this method is invoked, the chairperson receives the {@link EVENT_MEETING_MUTE_MEETING_RSP} broadcast. If the 
 * conference is muted, all participants receive the {@link EVENT_MEETING_STATUS_CHANGED} broadcast. The UI updates the view based on parameters in the broadcast. 
 * After the conference is muted, the chairperson can invoke the {@link Meeting.unMute} method to unmute the conference.
 * @return The value 0 indicates operation success, and the value 1 indicates operation failure.
 */
- (int)mute;

/**
 * <b>Description:</b> This method is used to unmute a conference.
 * <br><b>Purpose:</b> This method can be invoked only after the {@link MeetingBaseApi.login} is successfully invoked. The chairperson invokes this method to unmute a conference, 
 * and all participants can be heard. After this method is invoked, the chairperson receives the {@link EVENT_MEETING_UNMUTE_MEETING_RSP} broadcast. If the 
 * conference is unmuted, all participants receive the {@link EVENT_MEETING_STATUS_CHANGED} broadcast. The UI updates the view based on parameters in the broadcast.
 * @return The value 0 indicates operation success, and the value 1 indicates operation failure.
 */
- (int)unMute;

/**
 * <b>Description:</b> This method is used to close a conference.
 * <br><b>Purpose:</b> This method can be invoked to close a conference only after the {@link MeetingBaseApi.login} is successfully invoked. After this method is invoked, the 
 * chairperson receives the {@link EVENT_MEETING_CLOSE_MEETING_RSP} broadcast. If the conference is closed, all participants receive the 
 * {@link EVENT_MEETING_STATUS_CHANGED} broadcast. The UI updates the view based on parameters in the broadcast.
 * @return The value 0 indicates operation success, and the value 1 indicates operation failure.
 */
- (int)close;

/**
 * <b>Description:</b> This method is used to lock a conference.
 * <br><b>Purpose:</b> The chairperson invokes this method to lock a conference. After the conference is locked, guests are not allowed to join the conference. The UI receives 
 * the {@link EVENT_MEETING_LOCK_MEETING_RSP} broadcast. This method can be invoked only after the {@link MeetingBaseApi.login} is successfully invoked. 
 * To unlock the conference, the chairperson can invoke the {@link Meeting.unLock} method.
 * @return The value 0 indicates operation success, and the value 1 indicates operation failure.
 */
- (int)lock;

/**
 * <b>Description:</b> This method is used to unlock a conference.
 * <br><b>Purpose:</b> The chairperson invokes this method to unlock a conference. After the conference is unlocked, the UI receives the {@link EVENT_MEETING_UNLOCK_MEETING_RSP} 
 * broadcast. This method can be invoked only after the {@link MeetingBaseApi.login} is successfully invoked.
 * @return The value 0 indicates operation success, and the value 1 indicates operation failure.
 */
- (int)unLock;

/**
 * <b>Description:</b> This method is used to extend a conference.
 * <br><b>Purpose:</b> The chairperson invokes this method to extend a conference. After the conference is extended, the UI receives the {@link EVENT_MEETING_PROLONG_MEETING_RSP} 
 * broadcast. This method can be invoked only after the {@link MeetingBaseApi.login} is successfully invoked.
 * @return The value 0 indicates operation success, and the value 1 indicates operation failure.
 */
- (int)prolong:(unsigned long)length;

/**
 * <b>Description:</b> This method is used to set the video display mode to VAS mode.
 * <br><b>Purpose:</b> During a video conference, the chairperson invokes this method to set the video display mode to VAS mode. After the method is successfully invoked, the UI 
 * receives the {@link EVENT_MEETING_SET_VASMODE_RSP} broadcast. This method can be invoked only after the {@link MeetingBaseApi.login} is successfully invoked.
 * @return The value 0 indicates operation success, and the value 1 indicates operation failure.
 */
- (int)setVASMode;

/**
 * <b>Description:</b> This method is used to set the video display mode to free mode.
 * <br><b>Purpose:</b> During a video conference, the chairperson invokes this method to set the video display mode to free mode. After the method is successfully invoked, the UI 
 * receives the {@link EVENT_MEETING_SET_FREEMODE_RSP} broadcast. This method can be invoked only after the {@link MeetingBaseApi.login} is successfully invoked.
 * @return The value 0 indicates operation success, and the value 1 indicates operation failure.
 */
- (int)setFreeMode;

/**
 * <b>Description:</b> This method is used to set the video display mode to fixed mode.
 * <br><b>Purpose:</b> During a video conference, the chairperson invokes this method to set the video display mode to fixed mode. After the method is successfully invoked, the UI 
 * receives the {@link EVENT_MEETING_SET_FIXEDMODE_RSP} broadcast. This method can be invoked only after the {@link MeetingBaseApi.login} is successfully invoked.
 * @param callId Specifies the identifier for the session of a participant.
 * @return The value 0 indicates operation success, and the value 1 indicates operation failure.
 */
- (int)setFixedMode:(NSString *)callId;

/**
 * <b>Description:</b> This method is used to set the video display mode to auto browse mode.
 * <br><b>Purpose:</b> During a video conference, the chairperson invokes this method to set the video display mode to auto browse mode. After the method is successfully invoked, the UI 
 * receives the {@link EVENT_MEETING_SET_AUTOBROWSEMODE_RSP} broadcast. This method can be invoked only after the {@link MeetingBaseApi.login} is successfully invoked.
 * @param meetingMixedPictureParam For details, see {@link MeetingMixedPictureParam}.
 * @return The value 0 indicates operation success, and the value 1 indicates operation failure.
 */
- (int)setAutoBrowseMode:(MeetingMixedPictureParam *)meetingMixedPictureParam;

/**
 * <b>Description:</b> This method is used to set the video display mode to multipicture mode.
 * <br><b>Purpose:</b> During a video conference, the chairperson invokes this method to set the video display mode to multipicture mode. After the method is successfully invoked, 
 * the UI receives the {@link EVENT_MEETING_SET_MIXEDPICTURE_RSP} broadcast. This method can be invoked only after the {@link MeetingBaseApi.login} is successfully invoked.
 * @param meetingMixedPictureParam For details, see {@link MeetingMixedPictureParam}.
 * @return The value 0 indicates operation success, and the value 1 indicates operation failure.
 */
- (int)setMixedPicture:(MeetingMixedPictureParam *)meetingMixedPictureParam;

/**
 * <b>Description:</b> This method is used to select the video picture of a specified participant.
 * <br><b>Purpose:</b> During a video conference where the video display mode is set to free mode, the chairperson or a guest invokes this method to select the video picture of 
 * a specified participant. After the method is successfully invoked, the UI receives the {@link EVENT_MEETING_SELECT_VIDEO_RSP} broadcast. This method can be 
 * invoked only after the {@link MeetingBaseApi.login} is successfully invoked.                      
 * @param participantId Specifies the identifier for the participant whose video picture is selected.
 * @param meetingMixedPictureParam For details, see {@link MeetingVideoSelectParam}.
 * @return The value 0 indicates operation success, and the value 1 indicates operation failure.
 */
- (int)selectVideo:(unsigned long)participantId meetingVideoSelectParam:(MeetingVideoSelectParam *)meetingVideoSelectParam;

/**
 * <b>Description:</b> This method is used to release auxiliary stream tokens.
 * <br><b>Purpose:</b> This method is used for the chairperson to release data auxiliary stream tokens. This method can be invoked only after audio or video is 
 * enabled for a conference. After the method is successfully invoked, the UI receives the {@link EVENT_MEETING_FREE_SHARETOKEN_RSP} broadcast.                      
 * @return The value 0 indicates operation success, and the value 1 indicates operation failure.
 */
- (int)freeShareToken;

/**
 * <b>Description:</b> This method is used to start data conference.
 * <br><b>Purpose:</b> During the voice/video meeting, when the user wishes to start data conference, UI invokes this interface 
 * to complete the application . 
 * @return The value 0 indicates operation success, and the value 1 indicates operation failure.
 * @see EVENT_MEETING_START_DATA_CONFERENCE_RSP
 */
- (int)startDataConference;

/**
 * <b>Description:</b> This method is used to start conference recording.
 * <br><b>Purpose:</b> During the meeting, when the user wishes to start conference recording, UI invokes this interface to 
 * complete the application, Recorded files are saved on the server . 
 * @return The value 0 indicates operation success, and the value 1 indicates operation failure.
 * @see PARAM_MEETING_RECORDING_OPT
 */
- (int)startRecording;

/**
 * <b>Description:</b> This method is used to stop conference recording.
 * <br><b>Purpose:</b> During the meeting, when the user wishes to stop conference recording, UI invokes this interface to 
 * complete the application . 
 * @return The value 0 indicates operation success, and the value 1 indicates operation failure.
 * @see PARAM_MEETING_RECORDING_OPT
 */ 
- (int)stopRecording;

@end

/**
 * <b>Description:</b> MeetingLoginParam indicates parameters required for logging in to a conference.
 * <br><b>Purpose:</b> Before invoking {@link MeetingBaseApi.login} to log in to a conference, the UI instantiates this class to construct parameters for the login.
 */
@interface MeetingLoginParam : NSObject
{
@private

    NSString* _meetingId;
    NSString* _password;
    NSString* _pinCode;
    NSString* _serverIP;
    NSString* _userName;
    NSString* _language;
    BOOL _isAttendAudio;
    BOOL _isAttendData;
    unsigned long _cookie;
}

/**
 * The property indicates a conference.
 */
@property (retain, nonatomic) NSString * meetingId;

/**
 * The property indicates the password of a conference.
 */
@property (retain, nonatomic) NSString * password;

/**
 * The property indicates the pin code of a conference. 
 * <br>This property must be specified only for security conferences.
 */
@property (retain, nonatomic) NSString * pinCode;

/**
 * The property indicates the server address, which can be an IP address or domain name.
 */
@property (retain, nonatomic) NSString * serverIP;

/**
 * The property indicates a user name.
 */
@property (retain, nonatomic) NSString * userName;

/**
 * The property indicates the language selected by a subscriber.
 */
@property (retain, nonatomic) NSString * language;

/**
 * The property indicates whether to attend an audio/video conference.
 */
@property (nonatomic, assign) BOOL isAttendAudio;

/**
 * The property indicates whether to attend a data conference.
 */
@property (nonatomic, assign) BOOL isAttendData;

/**
 * The property indicates a message.
 */
@property (nonatomic, assign) unsigned long cookie;

@end

/**
 * <b>Description:</b> MeetingSpeakerReportInfo indicates the class of information about speakers.
 * <br><b>Purpose:</b> When the SDK sends the {@link EVENT_MEETING_SPEAKER_REPORT} broadcast to the UI, the broadcast contains the instances of this 
 * class as parameters. After obtaining parameters from the broadcast, the UI invokes the methods of this class to obtain the latest information about speakers 
 * and updates the view based on the information.
 */
@interface MeetingSpeakerReportInfo : NSObject
{
@private

    int _count;
    NSString* _meetingId;
    NSMutableArray* _partIdArray;
    NSMutableArray* _isSpeakingArray;
}

/**
 * <b>Description:</b> It is used to obtain the number of participants whose speaking status has changed.
 * <br><b>Purpose:</b> After obtaining the {@link MeetingSpeakerReportInfo} object from the {@link EVENT_MEETING_SPEAKER_REPORT} broadcast sent by
 * the SDK, the UI can obtain the number of participants whose speaking status has changed from the object through this property.
 * <br> The property indicates the number of participants whose speaking status has changed.
 */
@property (nonatomic, assign) int count;

/**
 * <b>Description:</b> It is used to obtain a conference ID.
 * <br><b>Purpose:</b> After obtaining the {@link MeetingSpeakerReportInfo} object from the {@link EVENT_MEETING_SPEAKER_REPORT} broadcast sent by
 * the SDK, the UI can obtain a conference ID corresponding to the broadcast from the object through this property.
 * <br> The property indicates a conference.
 */
@property (retain, nonatomic) NSString * meetingId;

/**
 * <b>Description:</b> This method is used to obtain the array of participant IDs whose speaking status has changed.
 * <br><b>Purpose:</b> After obtaining the {@link MeetingSpeakerReportInfo} object from the {@link EVENT_MEETING_SPEAKER_REPORT} broadcast sent by
 * the SDK, the UI can obtain the array of participant IDs whose speaking status has changed from the object through this property. The UI maps a participant ID 
 * in the participant ID array and speaking status in the speaking status array based on array indexes to obtain the speaking status of the participant.
 * <br> The property indicates the array of participant IDs whose speaking status has changed.
 */
@property (retain, nonatomic) NSMutableArray* partIdArray;

/**
 * <b>Description:</b> This method is used to obtain the array of participants speaking status.
 * <br><b>Purpose:</b> After obtaining the {@link MeetingSpeakerReportInfo} object from the {@link EVENT_MEETING_SPEAKER_REPORT} broadcast sent by
 * the SDK, the UI can obtain the array of participants speaking status from the object through this property.The UI maps a participant ID 
 * in the participant ID array and speaking status in the speaking status array based on array indexes to obtain the speaking status of the participant.
 * <br> The property indicates the array of participant speaking status.
 */
@property (retain, nonatomic) NSMutableArray* isSpeakingArray;

@end

/**
 * <b>Description:</b> MeetingPartRightInfo indicates the class of the right param.
 * <br><b>Purpose:</b> When the SDK sends the {@link EVENT_MEETING_GET_PARTICIPANT_RIGHT_RSP} broadcast to the UI, the broadcast contains the instances of this 
 * class as parameters. After obtaining parameters from the broadcast, the UI invokes the methods of this class to obtain The right of the participant
 * to control the conference operate result.
 */
@interface MeetingPartRightInfo : NSObject
{
@private

    int _role;
    int _confRight;
    int _partRight;
}


/**
 * The property indicates the role param.
 */
@property (nonatomic, assign) int role;

/**
 * The property indicates the conference right param.
 */
@property (nonatomic, assign) int confRight;

/**
 * The property indicates the participant param.
 */
@property (nonatomic, assign) int partRight;

@end


/** Indicates the screen type of a participant. */
typedef enum tagMEETING_PART_SCREENTYPE
{
    MEETING_PART_SCREENTYPE_NO,      /**< Indicates a common terminal. */
    MEETING_PART_SCREENTYPE_LEFT,    /**< Indicates the Telepresence left screen terminal. */
    MEETING_PART_SCREENTYPE_MAIN,    /**< Indicates the Telepresence main screen terminal. */
    MEETING_PART_SCREENTYPE_RIGHT    /**< Indicates the Telepresence right screen terminal. */
}MEETING_PART_SCREENTYPE;

/** Indicates the status of a participant. */
typedef enum tagMEETING_PART_STATE   
{
    MEETING_PART_STATE_OFFLINE,     /**< Indicates a participant has gone offline. */
    MEETING_PART_STATE_ONLINE,      /**< Indicates a participant is on a conference. */
    MEETING_PART_STATE_JOINING      /**< Indicates a participant is joining a conference. */
}MEETING_PART_STATE;

/** Indicates the role of a participant. */
typedef enum tagMEETING_PART_ROLE
{
    MEETING_PART_ROLE_GUEST,       /**< Indicates a guest. */
    MEETING_PART_ROLE_CHAIRMAN,    /**< Indicates the chairperson. */
}MEETING_PART_ROLE;

/** Indicates the capabilities of a participant. */
typedef enum tagMEETING_PART_MEDIA_TYPE
{
    MEETING_PART_MEDIA_VOICE,              /**< Indicates the media capabilities of a participant is voice. */
    MEETING_PART_MEDIA_VIDEO,              /**< Indicates the media capabilities of a participant is SD video. */
    MEETING_PART_MEDIA_HDVIDEO,            /**< Indicates the media capabilities of a participant is HD video. */
    MEETING_PART_MEDIA_TELEVIDEO,          /**< Indicates the media capabilities of a participant is Telepresence. */
    MEETING_PART_MEDIA_DATA,               /**< Indicates the media capabilities of a participant is data. */
    MEETING_PART_MEDIA_VOICE_WITHDATA,     /**< Indicates the media capabilities of a participant is voice+data. */
    MEETING_PART_MEDIA_VIDEO_WITHDATA,     /**< Indicates the media capabilities of a participant is SD video+data. */
    MEETING_PART_MEDIA_HDVIDEO_WITHDATA,   /**< Indicates the media capabilities of a participant is HD video+data. */
    MEETING_PART_MEDIA_TELEVIDEO_WITHDATA  /**< Indicates the media capabilities of a participant is Telepresence+data. */
}MEETING_PART_MEDIA_TYPE;

/** Indicates the cause of failing to invite a participant. */
typedef enum tagMEETING_INVITE_FAILED_CODE
{
    MEETING_PART_INVITE_FAILED_CODE_NORMAL,        /**< Indicates inviting a participant successfully.*/
    MEETING_INVITE_FAILED_CODE_NO_RIGHT,           /**< Indicates a subscriber has no permission to invite participants.*/
    MEETING_INVITE_FAILED_CODE_NUMBER_NOTEXIST,    /**< Indicates the number does not exist.*/
    MEETING_INVITE_FAILED_CODE_CHAIRMAN_NOTEXIST,  /**< Indicates the chairperson has not joined the conference.*/
    MEETING_INVITE_FAILED_CODE_NO_ANSWER,          /**< Indicates the participant you invite does not answer.*/
    MEETING_INVITE_FAILED_CODE_NO_RESOURCE,        /**< Indicates the conference resources are insufficient.*/
    MEETING_INVITE_FAILED_CODE_CANNOT_REACH,       /**< Indicates the number you invite cannot be reached.*/
    MEETING_INVITE_FAILED_CODE_BUSY,               /**< Indicates the participant you invite is busy.*/
    MEETING_INVITE_FAILED_CODE_REJECT,             /**< Indicates the participant you invite rejects the call.*/
    MEETING_INVITE_FAILED_CODE_UNSUPPORT_ENCRYPT,  /**< Indicates the terminal does not support media encryption.*/
    MEETING_INVITE_FAILED_CODE_NO_ENCRYPTRES,      /**< Indicates the media encryption resources are insufficient.*/
    MEETING_PART_INVITE_FAILED_CODE_INVITING,      /**< Indicates the participant is being invited to a conference.*/
    MEETING_PART_INVITE_FAILED_CODE_JOINED,        /**< Indicates the participant has joined the conference.*/
    MEETING_PART_INVITE_FAILED_CODE_UNKOWN         /**< Indicates the participant fails to be invited to a conference due to unknown causes.*/
}MEETING_INVITE_FAILED_CODE;

#define MEETING_PARTOPT_INVITE_PART          1     /**< Indicates inviting a participant.*/
#define MEETING_PARTOPT_HANGUP_PART          2     /**< Indicates hanging up a participant.*/
#define MEETING_PARTOPT_MUTE_PART            4     /**< Indicates muting a participant.*/
#define MEETING_PARTOPT_HOLD_PART            8     /**< Indicates holding a participant.*/
#define MEETING_PARTOPT_CONTROL_PART         16    /**< Indicates controlling a participant.*/
#define MEETING_PARTOPT_DEPRIVE_TOKEN        32    /**< Indicates depriving the token.*/
#define MEETING_PARTOPT_INVITE_PART_INSUB    64    /**< Indicates inviting a participant to a sub conference.*/
#define MEETING_PARTOPT_HANGUP_PART_INSUB    128   /**< Indicates hanging up a participant on a sub conference.*/
#define MEETING_PARTOPT_MUTE_PART_INSUB      256   /**< Indicates muting participants in a sub conference.*/
#define MEETING_PARTOPT_MOVE_PART            512   /**< Indicates removing a subscriber.*/
#define MEETING_PARTOPT_HANGUP_SELF          1024  /**< Indicates hanging up a subscriber itself.*/
#define MEETING_PARTOPT_MUTE_SELF            2048  /**< Indicates muting a subscriber itself.*/
#define MEETING_PARTOPT_HOLD_SELF            4096  /**< Indicates holding a subscriber itself.*/
#define MEETING_PARTOPT_CONTROLVIDEO_SELF    8192  /**< Indicates controlling video for a subscriber itself.*/
#define MEETING_PARTOPT_DEPRIVETOKEN_SELF    16384 /**< Indicates depriving the token for a subscriber itself.*/
#define MEETING_PARTOPT_SELECTVIDEO_SELF     32768 /**< Indicates selecting the video of a subscriber itself.*/
#define MEETING_PARTOPT_SELFMUTE_INSUB       65536 /**< Indicates muting a subscriber itself in a sub conference.*/

/**
 * <b>Description:</b> Participant indicates the class of a participant.
 * <br><b>Purpose:</b> The UI instantiates this class and invokes methods of this class to control a participant, such as muting, unmuting, or hanging up a participant. 
 * When a participant status changes or a new participant joins the conference, the SDK encapsulates the latest information about the participant in an instance of this class
 * and sends the instance to the UI in the {@link EVENT_MEETING_PARTICIPANT_STATUS_CHANGED} or {@link EVENT_MEETING_PARTICIPANT_JOIN} broadcast. The UI updates the view based on the latest participant status.
 */
@interface Participant : NSObject
{
@private

    NSString * _meetingId;
    NSString * _name;
    NSString * _number;
    NSString * _callId;
    NSString * _viewCallId;

    int _role;
    int _state;
    int _screenType;
    int _mediaType;
    int _inviteFailedCode;

    BOOL _isMute;
    BOOL _isHold;
    BOOL _isHand;
    BOOL _isRoleCall;
    BOOL _hasShareToken;
    BOOL _isSharing;
    BOOL _isBroadcast;
    BOOL _isAtteendee;

    unsigned long _partId;
    unsigned long _cookie;
    unsigned long _mainId;
    NSString * _serverPartId;
}

/**
 * <b>Description:</b> It is used to obtain a conference ID.
 * <br><b>Purpose:</b> After constructing the {@link Participant} object to implement an operation on a participant, such as muting, unmuting, or hanging up a participant, the UI 
 * can obtain the conference ID from the {@link Participant} object through this property.
 * <br> The property indicates a conference.
 */
@property (retain, nonatomic) NSString * meetingId;

/**
 * <b>Description:</b> It is used to obtain the name of a participant. 	
 * <br><b>Purpose:</b> After obtaining the {@link Participant} object from the {@link EVENT_MEETING_PARTICIPANT_STATUS_CHANGED} or {@link EVENT_MEETING_PARTICIPANT_JOIN} broadcast, 
 * the UI can obtain the name of a participant from the {@link Participant} object through this property and display it on the view.
 * <br> The property indicates the name of a participant.
 */
@property (retain, nonatomic) NSString * name;

/**
 * <b>Description:</b> It is used to obtain the number of a participant. 	
 * <br><b>Purpose:</b> After obtaining the {@link Participant} object from the {@link EVENT_MEETING_PARTICIPANT_STATUS_CHANGED} or {@link EVENT_MEETING_PARTICIPANT_JOIN} 
 * broadcast, the UI can obtain the number of a participant from the {@link Participant} object through this property and display it on the view.
 * <br> The property indicates the number of a participant.
 */
@property (retain, nonatomic) NSString * number;

/**
 * <b>Description:</b> It is used to obtain a call ID.
 * <br><b>Purpose:</b> After obtaining the {@link Participant} object from the {@link EVENT_MEETING_PARTICIPANT_STATUS_CHANGED} or {@link EVENT_MEETING_PARTICIPANT_JOIN} 
 * broadcast, the UI can obtain a call ID of the participant from the {@link Participant} object through this property. 
 * <br> The property indicates a call.
 */
@property (retain, nonatomic) NSString * callId;

/**
 * <b>Description:</b> It is used to obtain the ID of a participant who is being viewed.
 * <br><b>Purpose:</b> After obtaining the {@link Participant} object from the {@link EVENT_MEETING_PARTICIPANT_STATUS_CHANGED} or {@link EVENT_MEETING_PARTICIPANT_JOIN} 
 * broadcast, the UI can obtain the ID of a participant who is being viewed from the {@link Participant} object through this property.
 * <br> The property indicates a participant who is being viewed.
 */
@property (retain, nonatomic) NSString * viewCallId;

/**
 * <b>Description:</b> It is used to obtain the role of a participant.	
 * <br><b>Purpose:</b> After obtaining the {@link Participant} object from the {@link EVENT_MEETING_PARTICIPANT_STATUS_CHANGED} or {@link EVENT_MEETING_PARTICIPANT_JOIN} 
 * broadcast, the UI can obtain the role of a participant from the {@link Participant} object through this property.
 * <br> The property indicates the role of a participant.See {@link tagMEETING_PART_ROLE}.
 */
@property (assign, nonatomic) int role;

/**
 * <b>Description:</b> It is used to obtain the status of a participant.	
 * <br><b>Purpose:</b> After obtaining the {@link Participant} object from the {@link EVENT_MEETING_PARTICIPANT_STATUS_CHANGED} or {@link EVENT_MEETING_PARTICIPANT_JOIN} 
 * broadcast, the UI can obtain the status of a participant from the {@link Participant} object through this property.
 * <br> The property indicates the status of a participant.See {@link tagMEETING_PART_STATE}.
 */
@property (assign, nonatomic) int state;

/**
 * <b>Description:</b> It is used to obtain the screen type of a participant.	
 * <br><b>Purpose:</b> After obtaining the {@link Participant} object from the {@link EVENT_MEETING_PARTICIPANT_STATUS_CHANGED} or {@link EVENT_MEETING_PARTICIPANT_JOIN} 
 * broadcast, the UI can obtain the screen type of a participant from the {@link Participant} object through this property.The UI determines the participant display mode based on the screen type.
 * <br> The property indicates the screen type of a participant.See {@link tagMEETING_PART_SCREENTYPE}.
 */
@property (assign, nonatomic) int screenType;

/**
 * <b>Description:</b> It is used to obtain the media capabilities of a participant.	
 * <br><b>Purpose:</b> After obtaining the {@link Participant} object from the {@link EVENT_MEETING_PARTICIPANT_STATUS_CHANGED} or {@link EVENT_MEETING_PARTICIPANT_JOIN} 
 * broadcast, the UI can obtain the media capabilities of a participant from the {@link Participant} object through this property.The UI performs operations based on the media capabilities.
 * <br> The property indicates the media capabilities of a participant.See {@link tagMEETING_PART_MEDIA_TYPE}.
 */
@property (assign, nonatomic) int mediaType;

/**
 * <b>Description:</b> It is used to obtain the cause of failing to invite participants.	
 * <br><b>Purpose:</b> After obtaining the {@link Participant} object from the {@link EVENT_MEETING_PARTICIPANT_STATUS_CHANGED} or {@link EVENT_MEETING_PARTICIPANT_JOIN} 
 * broadcast, the UI can obtain the cause of failing to invite participants from the {@link Participant} object in the broadcst through this property. The UI performs operations based on the failure cause.
 * <br> The property indicates the cause of failing to invite a participant.See {@link tagMEETING_INVITE_FAILED_CODE}.
 */
@property (assign, nonatomic) int inviteFailedCode;

/**
 * <b>Description:</b> It is used to check whether a participant is muted.	
 * <br><b>Purpose:</b> After obtaining the {@link Participant} object from the {@link EVENT_MEETING_PARTICIPANT_STATUS_CHANGED} or {@link EVENT_MEETING_PARTICIPANT_JOIN} 
 * broadcast, the UI can check whether the participant is muted through this property.
 * <br>YES Indicates the participant is muted.
 * <br>NO Indicates the participant is not muted.
 */
@property (assign, nonatomic) BOOL isMute;

/**
 * <b>Description:</b> It is used to check whether a participant is held.	
 * <br><b>Purpose:</b> After obtaining the {@link Participant} object from the {@link EVENT_MEETING_PARTICIPANT_STATUS_CHANGED} or {@link EVENT_MEETING_PARTICIPANT_JOIN} 
 * broadcast, the UI can check whether the participant is held through this property.
 * <br>YES Indicates the participant is held.
 * <br>NO Indicates the participant is not held.
 */
@property (assign, nonatomic) BOOL isHold;

/**
 * <b>Description:</b> It is used to check whether a participant is raising hands.	
 * <br><b>Purpose:</b> After obtaining the {@link Participant} object from the {@link EVENT_MEETING_PARTICIPANT_STATUS_CHANGED} or {@link EVENT_MEETING_PARTICIPANT_JOIN} 
 * broadcast, the UI can check whether the participant is raising hands through this property.
 * <br>YES Indicates the participant is raising hands.
 * <br>NO Indicates the participant is not raising hands.
 */
@property (assign, nonatomic) BOOL isHand;

/**
 * <b>Description:</b> It is used to check whether a participant is on the roll call.	
 * <br><b>Purpose:</b> After obtaining the {@link Participant} object from the {@link EVENT_MEETING_PARTICIPANT_STATUS_CHANGED} or {@link EVENT_MEETING_PARTICIPANT_JOIN} 
 * broadcast, the UI can check whether the participant is on the roll call through this property.
 * <br>YES Indicates the participant is on the roll call.
 * <br>NO Indicates the participant is not on the roll call.
 */
@property (assign, nonatomic) BOOL isRoleCall;

/**
 * <b>Description:</b> It is used to check whether a participant has shared token.	
 * <br><b>Purpose:</b> After obtaining the {@link Participant} object from the {@link EVENT_MEETING_PARTICIPANT_STATUS_CHANGED} or {@link EVENT_MEETING_PARTICIPANT_JOIN} 
 * broadcast, the UI can check whether the participant has shared token through this property.
 * <br>YES Indicates the participant has shared token.
 * <br>NO Indicates the participant does not have shared token.
 */
@property (assign, nonatomic) BOOL hasShareToken;

/**
 * <b>Description:</b> It is used to check whether a participant is sharing something.	
 * <br><b>Purpose:</b> After obtaining the {@link Participant} object from the {@link EVENT_MEETING_PARTICIPANT_STATUS_CHANGED} or {@link EVENT_MEETING_PARTICIPANT_JOIN} 
 * broadcast, the UI can check whether the participant is sharing something through this property.
 * <br>YES Indicates the participant is sharing something.
 * <br>NO Indicates the participant is not sharing something.
 */
@property (assign, nonatomic) BOOL isSharing;

/**
 * <b>Description:</b> It is used to check whether a participant is on a broadcast.	
 * <br><b>Purpose:</b> After obtaining the {@link Participant} object from the {@link EVENT_MEETING_PARTICIPANT_STATUS_CHANGED} or {@link EVENT_MEETING_PARTICIPANT_JOIN} 
 * broadcast, the UI can check whether the participant is on a broadcast through this property.
 * <br>YES Indicates the participant is on a broadcast.
 * <br>NO Indicates the participant is not on a broadcast.
 */
@property (assign, nonatomic) BOOL isBroadCast;

/**
 * <b>Description:</b> It is used to check whether a participant is designated during conference scheduling.	
 * <br><b>Purpose:</b> After obtaining the {@link Participant} object from the {@link EVENT_MEETING_PARTICIPANT_STATUS_CHANGED} or {@link EVENT_MEETING_PARTICIPANT_JOIN} 
 * broadcast, the UI can check whether the participant is designated during conference scheduling through this property.
 * <br>YES Indicates the participant is designated during conference scheduling.
 * <br>NO Indicates the participant is not designated during conference scheduling.
 */
@property (assign, nonatomic) BOOL isAttendee;

/**
 * <b>Description:</b> It is used to obtain a participant ID.
 * <br><b>Purpose:</b> After obtaining the {@link Participant} object from the {@link EVENT_MEETING_PARTICIPANT_STATUS_CHANGED} or {@link EVENT_MEETING_PARTICIPANT_JOIN}
 * broadcast, the UI can obtain the participant ID from the {@link Participant} object through this property.
 * <br> The property indicates a participant.
 */
@property (assign, nonatomic) unsigned long partId;

/**
 * <b>Description:</b> It is used to obtain a message ID.
 * <br><b>Purpose:</b> After constructing the {@link Participant} object to implement an operation on a participant, such as muting, unmuting, or hanging up a participant, the UI 
 * can obtain the message ID from the {@link Participant} object through this property.
 * <br> The property indicates a message.
 */
@property (assign, nonatomic) unsigned long cookie;

/**
 * <b>Description:</b> It is used to obtain the primary screen ID of a participant.	
 * <br><b>Purpose:</b> After obtaining the {@link Participant} object from the {@link EVENT_MEETING_PARTICIPANT_STATUS_CHANGED} or {@link EVENT_MEETING_PARTICIPANT_JOIN}
 * broadcast, the UI can obtain the primary screen ID of the participant from the {@link Participant} object through this property. The UI maps the left or right screen to 
 * the primary screen based on the primary screen ID.
 * <br> The property indicates the primary screen of a participant.
 */
@property (assign, nonatomic) unsigned long mainId;

/**
 * <b>Description:</b> It is used to obtain a participant ID which assigned by conference server.
 * <br><b>Purpose:</b> After obtaining the {@link Participant} object from the {@link EVENT_MEETING_PARTICIPANT_STATUS_CHANGED} or {@link EVENT_MEETING_PARTICIPANT_JOIN}
 * broadcast, the UI can obtain the participant ID from the {@link Participant} object through this property.
 * <br> The property indicates a participant.
 */
@property (retain, nonatomic) NSString * serverPartId;

/**
 * <b>Description:</b> This method is used to expel a participant.
 * <br><b>Purpose:</b> This method can be invoked only after the {@link MeetingBaseApi.login} is successfully invoked. During an audio/video conference, the chairperson can invoke
 * this method to expel a participant. After this method is invoked, the chairperson receives the {@link EVENT_MEETING_HANGUP_PARTICIPANT_RSP} broadcast. If the 
 * participant is expelled, all participants receive the {@link EVENT_MEETING_PARTICIPANT_STATUS_CHANGED} broadcast. The UI updates the view based on parameters in the broadcast. 
 * @return The value 0 indicates operation success, and the value 1 indicates operation failure.
 */
- (int)hangup;

/**
 * <b>Description:</b> This method is used to mute a participant.
 * <br><b>Purpose:</b> This method can be invoked only after the {@link MeetingBaseApi.login} is successfully invoked. During an audio/video conference, the chairperson can invoke
 * this method to mute a participant. After this method is invoked, the chairperson receives the {@link EVENT_MEETING_MUTE_PARTICIPANT_RSP} broadcast. If the 
 * participant is muted, all participants receive the {@link EVENT_MEETING_PARTICIPANT_STATUS_CHANGED} broadcast. The UI updates the view based on parameters in 
 * the broadcast. After the participant is muted, the chairperson can invoke the {@link Participant.unMute} method to unmute the participant.
 * @return The value 0 indicates operation success, and the value 1 indicates operation failure.
 */
- (int)mute;

/**
 * <b>Description:</b> This method is used to unmute a participant.
 * <br><b>Purpose:</b> This method can be invoked only after the {@link MeetingBaseApi.login} is successfully invoked. During an audio/video conference, the chairperson can invoke
 * this method to unmute a participant. After this method is invoked, the chairperson receives the {@link EVENT_MEETING_UNMUTE_PARTICIPANT_RSP } broadcast. If the 
 * participant is unmuted, all participants receive the {@link EVENT_MEETING_PARTICIPANT_STATUS_CHANGED} broadcast. The UI updates the view based on parameters in 
 * the broadcast. 
 * @return The value 0 indicates operation success, and the value 1 indicates operation failure.
 */
- (int)unMute;

/**
 * <b>Description:</b> This method is used to delete an offline participant.
 * <br><b>Purpose:</b> The chairperson can invoke this method to delete an offline participant. The offline participant must be a participant added during conference scheduling. 
 * After the method is successfully invoked, the UI receives the {@link EVENT_MEETING_DELETE_OFFLINEPART_RSP} broadcast. This method can be invoked only 
 * after the {@link MeetingBaseApi.login} is successfully invoked.  Before invoking this method, it is recommanded that the UI should prompt the user with friendly information, 
 * such as a choice box for choosing to continue or cancel. The UI can present different information based on different situations.
 * @return The value 0 indicates operation success, and the value 1 indicates operation failure.
 */
- (int)deleteOfflinePart;

/**
 * <b>Description:</b> This method is used to transfer chairperson rights to a specified participant.
 * <br><b>Purpose:</b> The chairperson can invoke this method to transfer chairperson rights to a specified participant. After the method is successfully invoked, the UI receives 
 * the {@link EVENT_MEETING_TRANSFER_CHAIRRIGHT_RSP} broadcast. After chairperson rights are transferred, the original chairperson becomes a guest, and the guest 
 * to whom chairperson rights are transferred can control the conference. This method can be invoked only after the {@link MeetingBaseApi.login} is invoked.
 * @return The value 0 indicates operation success, and the value 1 indicates operation failure.
 */
- (int)transferChairRight;

@end

/**
 * <b>Description:</b> MeetingPartInviteInfo indicates information about an invited participant.
 * <br><b>Purpose:</b> Before instantiating the {@link MeetingPartInviteParam} class to construct parameters 
 * for inviting a participant to a conference, the UI instantiates this class to construct information about an invited participant.
 */
@interface MeetingPartInviteInfo : NSObject
{
@private

    NSString *_name;
    NSString *_number;
    NSString *_email;
    NSString *_smsNumber;
    NSString *_account;
    NSString *_position;

    int _role;
    BOOL _isMute;
}

/**
 * The property indicates the name of a participant.
 */
@property (retain, nonatomic) NSString * name;

/**
 * The property indicates the number of a participant.
 */
@property (retain, nonatomic) NSString * number;

/**
 * The property indicates the email box of a participant.
 */
@property (retain, nonatomic) NSString * email;

/**
 * The property indicates the short message number of a participant.
 */
@property (retain, nonatomic) NSString * smsNumber;

/**
 * The property indicates the account of a participant.
 */
@property (retain, nonatomic) NSString * account;

/**
 * The property indicates the position of a participant.
 */
@property (retain, nonatomic) NSString * position;

/**
 * The property indicates the role of a participant.
 */
@property (assign, nonatomic) int role;

/**
 * The property indicates whether a participant is automatically muted.
 */
@property (assign, nonatomic) BOOL isMute;

@end

/**
 * <b>Description:</b> MeetingPartInviteParam indicates information about inviting participants.
 * <br><b>Purpose:</b> Before invoking {@link MeetingBaseApi.inviteParticipants}, the UI instantiates this 
 * class to construct parameters for inviting participants to a conference.
 */
@interface MeetingPartInviteParam : NSObject
{
@private

    unsigned long _cookie;
    NSString * _meetingId;
    NSMutableArray * _partInviteArray;
}

/**
 * The property indicates a message.
 */
@property (assign, nonatomic) unsigned long cookie;

/**
 * The property indicates a conference.
 */
@property (retain, nonatomic) NSString * meetingId;

/**
 * The property indicates a {@link MeetingPartInviteInfo} array.
 */
@property (retain, nonatomic) NSMutableArray * partInviteArray;

@end

/** Indicates the sorting order of contact query results. */
typedef enum tagMEETING_CONTACT_SORTORDER
{
    MEETING_CONTACT_SORTORDER_ASC,    /**< Indicates that the contact query results are displayed in ascending order. */
    MEETING_CONTACT_SORTORDER_DESC    /**< Indicates that the contact query results are displayed in descending order. */
}MEETING_CONTACT_SORTORDER;

/**
 * <b>Description:</b> MeetingContact indicates the class of a contact.
 * <br><b>Purpose:</b> When the SDK sends the {@link EVENT_MEETING_ENTERPRISE_ADDRESSBOOK} broadcast to the UI, the broadcast contains the instances of
 * this class as parameters. After obtaining parameters from the broadcast, the UI invokes the methods of this class to obtain information about queried contacts, 
 * and updates the view based on the information.
 */
@interface MeetingContact : NSObject
{
@private

    NSString * _name;
    NSString * _phoneNumber;
    NSString * _smsNumber;
    NSString * _emailAddr;
    NSString * _account;
    NSString * _position;
    NSString * _description;
}

/**
 * <b>Description:</b> It is used to obtain the name of a contact.
 * <br><b>Purpose:</b> After obtaining the {@link MeetingContact} object from the {@link EVENT_MEETING_ENTERPRISE_ADDRESSBOOK} broadcast, the UI can 
 * obtain the name of a contact from the object through this property and display it on the view.
 * <br> The property indicates the name of a contact.
 */
@property (retain, nonatomic) NSString * name;

/**
 * <b>Description:</b> It is used to obtain the number of a contact.
 * <br><b>Purpose:</b> After obtaining the {@link MeetingContact} object from the {@link EVENT_MEETING_ENTERPRISE_ADDRESSBOOK} broadcast, the UI can 
 * obtain the number of a contact from the object through this property and display it on the view.
 * <br> The property indicates the number of a contact.
 */
@property (retain, nonatomic) NSString * phoneNumber;

/**
 * <b>Description:</b> It is used to obtain the short message number of a contact.
 * <br><b>Purpose:</b> After obtaining the {@link MeetingContact} object from the {@link EVENT_MEETING_ENTERPRISE_ADDRESSBOOK} broadcast, the UI can 
 * obtain the short message number of a contact from the object through this property and display it on the view.
 * <br> The property indicates short message number of a contact.
 */
@property (retain, nonatomic) NSString * smsNumber;

/**
 * <b>Description:</b> It is used to obtain the email box for receiving conference notifications
 * <br><b>Purpose:</b> After obtaining the {@link MeetingContact} object from the {@link EVENT_MEETING_ENTERPRISE_ADDRESSBOOK} broadcast, the UI can 
 * obtain the email box for receiving conference notifications of a contact from the object through this property and display it on the view.
 * <br> The property indicates the email box for receiving conference notifications of a contact.
 */
@property (retain, nonatomic) NSString * emailAddr;

/**
 * <b>Description:</b> It is used to obtain the account of a contact.
 * <br><b>Purpose:</b> After obtaining the {@link MeetingContact} object from the {@link EVENT_MEETING_ENTERPRISE_ADDRESSBOOK} broadcast, the UI can 
 * obtain the account of a contact from the object through this property and display it on the view.
 * <br> The property indicates the account of a contact.
 */
@property (retain, nonatomic) NSString * account;

/**
 * <b>Description:</b> It is used to obtain the position of a contact.
 * <br><b>Purpose:</b> After obtaining the {@link MeetingContact} object from the {@link EVENT_MEETING_ENTERPRISE_ADDRESSBOOK} broadcast, the UI can 
 * obtain the account of a contact from the object through this property and display it on the view.
 * <br> The property indicates the position of a contact.
 */
@property (retain, nonatomic) NSString * position;

/**
 * <b>Description:</b> It is used to obtain the description of a contact.
 * <br><b>Purpose:</b> After obtaining the {@link MeetingContact} object from the {@link EVENT_MEETING_ENTERPRISE_ADDRESSBOOK} broadcast, the UI can 
 * obtain the account of a contact from the object through this property and display it on the view.
 * <br> The property indicates the description of a contact.
 */
@property (retain, nonatomic) NSString * description;

@end

/**
 * <b>Description:</b> MeetingContactQueryParam indicates information about querying enterprise contacts.
 * <br><b>Purpose:</b> Before invoking {@link MeetingBaseApi.queryEnterpriseAddressbook}, the UI instantiates this 
 * class to construct parameters for querying enterprise contacts.
 */
@interface MeetingContactQueryParam : NSObject
{
@private

    NSString * _meetingId;
    NSString * _keyword;
    NSString * _queryField;
    NSString * _sortField;
    int _sortOrder;
    int _startIndex;
    int _returnCount;
    unsigned long _cookie;
}

/**
 * The property indicates a conference.
 */
@property (retain, nonatomic) NSString * meetingId;

/**
 * The property indicates the keyword for querying enterprise contacts.
 */
@property (retain, nonatomic) NSString * keyword;

/**
 * The property indicates the field for querying enterprise contacts. The parameter value can 
 * be one or multiple of name, telephone, mobile, and email, which are separated by plus signs (+).
 */
@property (retain, nonatomic) NSString * queryField;

/**
 * The property indicates a sorting field, which can be any one of ID, name, telephone, mobile, or email.
 */
@property (retain, nonatomic) NSString * sortField;

/**
 * The property indicates the sorting mode of return results. At present just the {@link MEETING_CONTACT_SORTORDER_ASC} is supported.See{@link tagMEETING_CONTACT_SORTORDER}.
 */
@property (nonatomic, assign) int sortOrder;

/**
 * The property indicates the start item of query results to be returned.
 */
@property (nonatomic, assign) int startIndex;

/**
 * The property indicates the total number of query results to be returned.
 */
@property (nonatomic, assign) int returnCount;

/**
 * The property indicates a message.
 */
@property (nonatomic, assign) unsigned long cookie;

@end


/** Indicates the {@link MeetingEventBaseInfo} object. */
#define PARAM_MEETING_EVENT_BASE_INFO     @"PARAM_MEETING_EVENT_BASE_INFO"

/** Indicates the completed operations for logging in to a conference. See {@link tagMEETING_LOGIN_STAGE}. */
#define PARAM_LOGIN_STAGE                 @"PARAM_LOGIN_STAGE"

/** Indicates the {@link MeetingSpeakerReportInfo} object. */
#define PARAM_MEETING_SPEAKER_REPORT_INFO @"PARAM_MEETING_SPEAKER_REPORT_INFO"

/** Indicates the {@link Meeting } object. */
#define PARAM_MEETING_INFO                @"PARAM_MEETING_INFO"

/** Indicates the {@link PartRightInfo } object. */
#define PARAM_MEETING_RIGHT_INFO          @"PARAM_MEETING_RIGHT_INFO"

/** Indicates the temporary password for a conference. */
#define PARAM_MEETING_TEMP_PASSWORD       @"PARAM_MEETING_TEMP_PASSWORD"

/** Indicates the option of recording, it means starting or stopping record. */
#define PARAM_MEETING_RECORDING_OPT       @"PARAM_MEETING_RECORDING_OPT"

/** Indicates the ID of recording operation. */
#define PARAM_MEETING_RECORD_ID           @"PARAM_MEETING_RECORD_ID"

/**
 * <b>Description:</b> It is used to notify current operation changes during login to a conference.
 * <br><b>Purpose:</b> When the SDK receives a response to a login operation from the server and starts the next operation,
 *  the SDK sends this notification to the UI. Parameters contained in this broadcast identify a completed operation and the 
 *  result of the operation. If the completed operation is {@link MEETING_LOGIN_STAGE_DISPLAY} and has been 
 *  successfully performed, the UI has successfully logged in to the conference. The UI must register the broadcast 
 *  before invoking the {@link MeetingBaseApi.login} method. 
 *  <p>The notification will have the following object key:
 *  <ul>
 *   <li><em>{@link PARAM_MEETING_EVENT_BASE_INFO}</em></li>
 *   <li><em>{@link PARAM_LOGIN_STAGE}</em></li>
 * </ul>
 * </p>
 */
#define EVENT_MEETING_LOGIN_STAGE_CHANGED @"EVENT_MEETING_LOGIN_STAGE_CHANGED"

/**
 * <b>Description:</b> It is used to notify the result of muting a conference.
 * <br><b>Purpose:</b> When the chairperson mutes an audio/video conference, the SDK sends 
 * this notification to the UI after receiving a response from the server.
 * <p>The notification will have the following object key:
 *  <ul>
 *   <li><em>{@link PARAM_MEETING_EVENT_BASE_INFO}</em></li>
 * </ul>
 * </p>
 */
#define EVENT_MEETING_MUTE_MEETING_RSP    @"EVENT_MEETING_MUTE_MEETING_RSP"

/**
 * <b>Description:</b> It is used to notify the result of unmuting a conference.
 * <br><b>Purpose:</b> When the chairperson unmutes an audio/video conference, the SDK sends this notification 
 * to the UI after receiving a response from the server.
 * <p>The notification will have the following object key:
 *  <ul>
 *   <li><em>{@link PARAM_MEETING_EVENT_BASE_INFO}</em></li>
 * </ul>
 * </p>
 */
#define EVENT_MEETING_UNMUTE_MEETING_RSP  @"EVENT_MEETING_UNMUTE_MEETING_RSP"

/**
 * <b>Description:</b> It is used to notify the result of closing a conference.
 * <br><b>Purpose:</b> When the chairperson closes an audio/video conference, the SDK sends this notification 
 * to the UI after receiving a response from the server.
 * <p>The notification will have the following object key:
 *  <ul>
 *   <li><em>{@link PARAM_MEETING_EVENT_BASE_INFO}</em></li>
 * </ul>
 * </p>
 */
#define EVENT_MEETING_CLOSE_MEETING_RSP   @"EVENT_MEETING_CLOSE_MEETING_RSP"

/**
 * <b>Description:</b> It is used to notify the speaking status of participants.
 * <br><b>Purpose:</b> During an audio/video conference, the SDK sends this notification to the UI when the speaking 
 * status of participants changes. The UI receives the notification and updates the view based on parameters in the broadcast.
 * <p>The notification will have the following object key:
 *  <ul>
 *   <li><em>{@link PARAM_MEETING_SPEAKER_REPORT_INFO}</em></li>
 * </ul>
 * </p>
 */
#define EVENT_MEETING_SPEAKER_REPORT      @"EVENT_MEETING_SPEAKER_REPORT"

/**
 * <b>Description:</b> It is used to notify the status change of a conference.
 * <br><b>Purpose:</b> The SDK sends this notification to the UI when the status of a conference changes. 
 * The UI receives the notification and updates the view based on parameters in the broadcast.
 * <p>The notification will have the following object key:
 *  <ul>
 *   <li><em>{@link PARAM_MEETING_INFO}</em></li>
 * </ul>
 * </p>
 */
#define EVENT_MEETING_STATUS_CHANGED      @"EVENT_MEETING_STATUS_CHANGED"

/**	
 * <b>Description:</b> It is used to notify the result of locking a conference by the chairperson.
 * <br><b>Purpose:</b> When the UI performs a conference locking operation, the SDK sends this
 *  notification to the UI after receiving a response from the server.
 * <p>The notification will have the following object key:
 *  <ul>
 *   <li><em>{@link PARAM_MEETING_EVENT_BASE_INFO}</em></li>
 * </ul>
 * </p>
 */
#define EVENT_MEETING_LOCK_MEETING_RSP    @"EVENT_MEETING_LOCK_MEETING_RSP"

/**	
 * <b>Description:</b> It is used to notify the result of unlocking a conference by the chairperson.
 * <br><b>Purpose:</b> When the UI performs a conference unlocking operation, the SDK sends this
 *  notification to the UI after receiving a response from the server.
 * <p>The notification will have the following object key:
 *  <ul>
 *   <li><em>{@link PARAM_MEETING_EVENT_BASE_INFO}</em></li>
 * </ul>
 * </p>
 */
#define EVENT_MEETING_UNLOCK_MEETING_RSP  @"EVENT_MEETING_UNLOCK_MEETING_RSP"

/**	
 * <b>Description:</b> It is used to notify the result of extending a conference by the chairperson.
 * <br><b>Purpose:</b> When the UI performs a conference extending operation, the SDK sends this
 *  notification to the UI after receiving a response from the server.
 * <p>The notification will have the following object key:
 *  <ul>
 *   <li><em>{@link PARAM_MEETING_EVENT_BASE_INFO}</em></li>
 * </ul>
 * </p>
 */
#define EVENT_MEETING_PROLONG_MEETING_RSP @"EVENT_MEETING_PROLONG_MEETING_RSP"

/**
 * <b>Description:</b> It is used to notify the result of setting the video display mode to VAS mode by the chairperson.
 * <br><b>Purpose:</b> When the UI sets the video display mode to VAS mode, the SDK sends this 
 * notification to the UI after receiving a response from the server.
 * <p>The notification will have the following object key:
 *  <ul>
 *   <li><em>{@link PARAM_MEETING_EVENT_BASE_INFO}</em></li>
 * </ul>
 * </p>
 */
#define EVENT_MEETING_SET_VASMODE_RSP     @"EVENT_MEETING_SET_VASMODE_RSP"

/**
 * <b>Description:</b> It is used to notify the result of setting the video display mode to fixed mode by the chairperson.
 * <br><b>Purpose:</b> When the UI sets the video display mode to fixed mode, the SDK sends this 
 * notification to the UI after receiving a response from the server.
 * <p>The notification will have the following object key:
 *  <ul>
 *   <li><em>{@link PARAM_MEETING_EVENT_BASE_INFO}</em></li>
 * </ul>
 * </p>
 */
#define EVENT_MEETING_SET_FIXMODE_RSP     @"EVENT_MEETING_SET_FIXMODE_RSP"

/**
 * <b>Description:</b> It is used to notify the result of setting the video display mode to free mode by the chairperson.
 * <br><b>Purpose:</b> When the UI sets the video display mode to free mode, the SDK sends this 
 * notification to the UI after receiving a response from the server.
 * <p>The notification will have the following object key:
 *  <ul>
 *   <li><em>{@link PARAM_MEETING_EVENT_BASE_INFO}</em></li>
 * </ul>
 * </p>
 */
#define EVENT_MEETING_SET_FREEMODE_RSP    @"EVENT_MEETING_SET_FREEMODE_RSP"

/**
 * <b>Description:</b> It is used to notify the result of setting the video display mode to auto browse mode by the chairperson.
 * <br><b>Purpose:</b> When the UI sets the video display mode to auto browse mode, the SDK sends this 
 * notification to the UI after receiving a response from the server.
 * <p>The notification will have the following object key:
 *  <ul>
 *   <li><em>{@link PARAM_MEETING_EVENT_BASE_INFO}</em></li>
 * </ul>
 * </p>
 */
#define EVENT_MEETING_SET_AUTOBROWSEMODE_RSP @"EVENT_MEETING_SET_AUTOBROWSEMODE_RSP"

/**
 * <b>Description:</b> It is used to notify the result of setting the video display mode to multipicture mode by the chairperson.
 * <br><b>Purpose:</b> When the UI sets the video display mode to multipicture mode, the SDK sends this 
 * notification to the UI after receiving a response from the server.
 * <p>The notification will have the following object key:
 *  <ul>
 *   <li><em>{@link PARAM_MEETING_EVENT_BASE_INFO}</em></li>
 * </ul>
 * </p>
 */
#define EVENT_MEETING_SET_MIXEDPICTURE_RSP   @"EVENT_MEETING_SET_MIXEDPICTURE_RSP"

/**
 * <b>Description:</b> It is used to notify the result of selecting videos by the chairperson or a guest.
 * <br><b>Purpose:</b> When the UI performs a video selection operation, the SDK sends this 
 * notification to the UI after receiving a response from the server.
 * <p>The notification will have the following object key:
 *  <ul>
 *   <li><em>{@link PARAM_MEETING_EVENT_BASE_INFO}</em></li>
 * </ul>
 * </p>
 */
#define EVENT_MEETING_SELECT_VIDEO_RSP       @"EVENT_MEETING_SELECT_VIDEO_RSP"

/**
 * <b>Description:</b> It is used to notify the result of depriving auxiliary stream tokens by the chairperson.
 * <br><b>Purpose:</b> When the UI performs a auxiliary stream token release operation, the SDK sends this 
 * notification to the UI after receiving a response from the server.
 * <p>The notification will have the following object key:
 *  <ul>
 *   <li><em>{@link PARAM_MEETING_EVENT_BASE_INFO}</em></li>
 * </ul>
 * </p>
 */
#define EVENT_MEETING_FREE_SHARETOKEN_RSP    @"EVENT_MEETING_FREE_SHARETOKEN_RSP"

/**
 * <b>Description:</b> It is used to notify the result of the chairperson changes the password when guests are waiting to join a private conference.
 * <br><b>Purpose:</b> When the chairperson changes the password of a private conference while guests are waiting to join the conference, the SDK sends this 
 * notification to the UI. The UI receives the notification and uses the conference ID contained in the broadcast to exit the conference.
 * <p>The notification will have the following object key:
 *  <ul>
 *   <li><em>{@link PARAM_MEETING_EVENT_BASE_INFO}</em></li>
 * </ul>
 * </p>
 */
#define EVENT_MEETING_PRIVATECONF_GUESTPSW_CHANGE @"EVENT_MEETING_PRIVATECONF_GUESTPSW_CHANGE"

/**
 * <b>Description:</b> It is used to broadcast the temp password of conference.
 * <br><b>Purpose:</b> After the authentication of the conference, the SDK sends this broadcast to the UI 
 * after receiving a response from the server, The UI must register the broadcast 
 *  before invoking the {@link MeetingBaseApi.getTempPwd} method.
 * <p>The intent will have the following extra value:
 *  <ul>
 *   <li><em>{@link PARAM_MEETING_RESULT_CODE}</em></li>
 *   <li><em>{@link PARAM_MEETING_TEMP_PASSWORD}</em></li>
 * </ul>
 * </p>
 */
#define EVENT_MEETING_GET_TEMP_PASSWORD_RSP @"EVENT_MEETING_GET_TEMP_PASSWORD_RSP"

/**
 * <b>Description:</b> It is used to broadcast login result of conference.
 * <br><b>Purpose:</b> After the login of the conference with temp password, the SDK sends this broadcast to the UI 
 * after receiving a response from the server, The UI must register the broadcast 
 *  before invoking the {@link MeetingBaseApi.loginWithTmpPwd} method.
 * <p>The intent will have the following extra value:
 *  <ul>
 *   <li><em>{@link PARAM_MEETING_EVENT_BASE_INFO}</em></li>
 * </ul>
 * </p>
 */
#define EVENT_MEETING_CONF_LOGIN_WITH_TMPPWD_RSP @"EVENT_MEETING_CONF_LOGIN_WITH_TMPPWD_RSP"

/**
 * <b>Description:</b> It is used to broadcast login result of conference.
 * <br><b>Purpose:</b> After the login of the conference which without statue report, the SDK sends this broadcast to the UI 
 * after receiving a response from the server, The UI must register the broadcast 
 *  before invoking the {@link MeetingBaseApi.loginWithoutStatusReport} method.
 * <p>The intent will have the following extra value:
 *  <ul>
 *   <li><em>{@link PARAM_MEETING_EVENT_BASE_INFO}</em></li>
 * </ul>
 * </p>
 */
#define EVENT_MEETING_CONF_LOGIN_WITHOUT_STATUS_REPORT_RSP @"EVENT_MEETING_CONF_LOGIN_WITHOUT_STATUS_REPORT_RSP"

/**
 * <b>Description:</b> It is used to broadcast data conference start result of conference.
 * <br><b>Purpose:</b> After the data conference start, the SDK sends this broadcast to the UI 
 * after receiving a response from the server.
 * <p>The intent will have the following extra value:
 *  <ul>
 *   <li><em>{@link PARAM_MEETING_EVENT_BASE_INFO}</em></li>
 * </ul>
 * </p>
 */
#define EVENT_MEETING_DISPLAY_STATE_CHANGED @"EVENT_MEETING_DISPLAY_STATE_CHANGED"


/** Indicates the {@link Participant  } object.*/
#define PARAM_PARTICIPANT @"PARAM_PARTICIPANT"

/**
 * <b>Description:</b> It is used to notify the status change of a participant.
 * <br><b>Purpose:</b> During an audio/video conference, the SDK sends this notification to the UI when the 
 * status of a participant changes. The UI receives the notification and updates the view based on parameters in the notification.
 * <p>The notification will have the following object key:
 *  <ul>
 *   <li><em>{@link PARAM_PARTICIPANT}</em></li>
 * </ul>
 * </p>
 */
#define EVENT_MEETING_PARTICIPANT_STATUS_CHANGED @"EVENT_MEETING_ PARTICIPANT_STATUS_CHANGED"

/**
 * <b>Description:</b> It is used to notify that a new participant joins a conference.
 * <br><b>Purpose:</b> During an audio/video conference, the SDK sends this notification to the UI when a new participant joins 
 * a conference. The UI receives the notification and updates the view based on parameters in the notification.
 * <p>The notification will have the following object key:
 *  <ul>
 *   <li><em>{@link PARAM_PARTICIPANT}</em></li>
 * </ul>
 * </p>
 */
#define EVENT_MEETING_PARTICIPANT_JOIN           @"EVENT_MEETING_PARTICIPANT_JOIN"

/**
 * <b>Description:</b> It is used to notify the result of inviting participants to a conference.
 * <br><b>Purpose:</b> When the chairperson invites participants to an audio/video conference, the SDK sends
 *  this notification to the UI after receiving a response from the server.
 * <p>The notification will have the following object key:
 *  <ul>
 *   <li><em>{@link PARAM_MEETING_EVENT_BASE_INFO}</em></li>
 * </ul>
 * </p>
 */
#define EVENT_MEETING_INVITE_PARTICIPANT_RSP     @"EVENT_MEETING_INVITE_PARTICIPANT_RSP"

/**
 * <b>Description:</b> It is used to notify the result of hanging up a participant.
 * <br><b>Purpose:</b> When the chairperson expels a participant from an audio/video conference, 
 * the SDK sends this notification to the UI after receiving a response from the server.
 * <p>The notification will have the following object key:
 *  <ul>
 *   <li><em>{@link PARAM_MEETING_EVENT_BASE_INFO}</em></li>
 * </ul>
 * </p>
 */
#define EVENT_MEETING_HANGUP_PARTICIPANT_RSP     @"EVENT_MEETING_HANGUP_PARTICIPANT_RSP"

/**
 * <b>Description:</b> It is used to notify the result of muting a participant.
 * <br><b>Purpose:</b> When the chairperson mutes a participant from an audio/video conference, 
 * the SDK sends this notification to the UI after receiving a response from the server.
 * <p>The notification will have the following object key:
 *  <ul>
 *   <li><em>{@link PARAM_MEETING_EVENT_BASE_INFO}</em></li>
 * </ul>
 * </p>
 */
#define EVENT_MEETING_MUTE_PARTICIPANT_RSP       @"EVENT_MEETING_MUTE_PARTICIPANT_RSP"

/**
 * <b>Description:</b> It is used to notify the result of unmuting a participant.
 * <br><b>Purpose:</b> When the chairperson unmutes a participant from an audio/video conference, 
 * the SDK sends this notification to the UI after receiving a response from the server.
 * <p>The notification will have the following object key:
 *  <ul>
 *   <li><em>{@link PARAM_MEETING_EVENT_BASE_INFO}</em></li>
 * </ul>
 * </p>
 */
#define EVENT_MEETING_UNMUTE_PARTICIPANT_RSP     @"EVENT_MEETING_UNMUTE_PARTICIPANT_RSP"

/**
 * <b>Description:</b> It is used to notify the UI that a participant has be deleted.
 * <br><b>Purpose:</b> When a participant has be deleted, 
 * the SDK sends this notification to the UI.
 * <p>The notification will have the following object key:
 *  <ul>
 *   <li><em>{@link PARAM_PARTICIPANT}</em></li>
 * </ul>
 * </p>
 */
#define EVENT_MEETING_PARTICIPANT_DELETE         @"EVENT_MEETING_PARTICIPANT_DELETE"

/**
 * <b>Description:</b> It is used to notify the result of deleting an offline participant by the chairperson.
 * <br><b>Purpose:</b> When the UI performs a participant deletion operation, the SDK sends this
 *  notification to the UI after receiving a response from the server.
 * <p>The notification will have the following object key:
 *  <ul>
 *   <li><em>{@link PARAM_MEETING_EVENT_BASE_INFO}</em></li>
 * </ul>
 * </p>
 */
#define EVENT_MEETING_DELETE_OFFLINE_PARTICIPANT_RSP @"EVENT_MEETING_DELETE_OFFLINE_PARTICIPANT_RSP"

/**
 * <b>Description:</b> It is used to notify the result of transferring chairperson rights by the chairperson.
 * <br><b>Purpose:</b> When the UI performs a chairperson rights transfer operation, the SDK sends 
 * this notification to the UI after receiving a response from the server.
 * <p>The notification will have the following object key:
 *  <ul>
 *   <li><em>{@link PARAM_MEETING_EVENT_BASE_INFO}</em></li>
 * </ul>
 * </p>
 */
#define EVENT_MEETING_TRANSFER_CHAIRRIGHT_RSP        @"EVENT_MEETING_TRANSFER_CHAIRRIGHT_RSP"

/**
 * <b>Description:</b> It is used to notify the UI when the UI get the paticipant riaht.
 * <br><b>Purpose:</b> When the UI get the paticipant riaht, 
 * the SDK sends this notification to the UI.
 * <p>The notification will have the following object key:
 *  <ul>
 *   <li><em>{@link PARAM_MEETING_RIGHT_INFO}</em></li>
 * </ul>
 * </p>
 */
#define EVENT_MEETING_GET_PARTICIPANT_RIGHT_RSP      @"EVENT_MEETING_GET_PARTICIPANT_RIGHT_RSP"


/** Indicates the number of contacts that meet query conditions.*/
#define PARAM_MEETING_CONTACT_TOTLE_COUNT  @"PARAM_MEETING_CONTACT_TOTLE_COUNT"

/** Indicates the number of contacts returned in the query result.*/
#define PARAM_MEETING_CONTACT_RETURN_COUNT @"PARAM_MEETING_CONTACT_RETURN_COUNT"

/** Indicates the queried contact array. @see {@link MeetingContact}*/
#define PARAM_CONTACT_ARRAY                @"PARAM_CONTACT_ARRAY"

/**
 * <b>Description:</b> It is used to notify the result of querying an enterprise address book.
 * <br><b>Purpose:</b> During an audio/video conference, when the chairperson queries an enterprise address book, the SDK sends this notification to the UI 
 * after receiving a response from the server.
 * <p>The notification will have the following object key:
 *  <ul>
 *   <li><em>{@link PARAM_MEETING_EVENT_BASE_INFO}</em></li>
 *   <li><em>{@link PARAM_MEETING_CONTACT_TOTLE_COUNT}</em></li>
 *   <li><em>{@link PARAM_MEETING_CONTACT_RETURN_COUNT}</em></li>
 *   <li><em>{@link PARAM_CONTACT_ARRAY}</em></li>
 * </ul>
 * </p>
 */
#define EVENT_MEETING_ENTERPRISE_ADDRESSBOOK @"EVENT_MEETING_ENTERPRISE_ADDRESSBOOK"

/**
 * <b>Description:</b> It is used to notify the result of logining the server by web account.
 * <br><b>Purpose:</b> After the UI logins the server by web account, the SDK sends this notification to the UI 
 * after receiving a response from the server.
 * <p>The notification will have the following object key:
 *  <ul>
 *   <li><em>{@link PARAM_MEETING_RESULT_CODE}</em></li>
 *   <li><em>{@link PARAM_MEETING_ACCOUND_ID}</em></li>
 * </ul>
 * </p>
 */
#define EVENT_MEETING_WEBLOGIN_RSP            @"EVENT_MEETING_WEBLOGIN_RSP"

/**
 * <b>Description:</b> It is used to notify the result of listing conferences.
 * <br><b>Purpose:</b> After the UI lists conferences, the SDK sends this notification to the UI 
 * after receiving a response from the server.
 * <p>The notification will have the following object key:
 *  <ul>
 *   <li><em>{@link PARAM_MEETING_LIST_MEETING_RESULT}</em></li>
 *   <li><em>{@link PARAM_MEETING_RESULT_CODE}</em></li>
 * </ul>
 * </p>
 */
#define EVENT_MEETING_LIST_MEETING_RSP        @"EVENT_MEETING_LIST_MEETING_RSP"

/**
 * <b>Description:</b> It is used to notify the result of scheduling a conference.
 * <br><b>Purpose:</b> After the UI scheduling a conference, the SDK sends this notification to the UI 
 * after receiving a response from the server.
 * <p>The notification will have the following object key:
 *  <ul>
 *   <li><em>{@link PARAM_MEETING_INFO}</em></li>
 *   <li><em>{@link PARAM_MEETING_RESULT_CODE}</em></li>
 * </ul>
 * </p>
 */
#define EVENT_MEETING_SCHEDULE_MEETING_RSP    @"EVENT_MEETING_SCHEDULE_MEETING_RSP"

/**
 * <b>Description:</b> It is used to notify the result of modifying a conferences
 * <br><b>Purpose:</b> After the UI modifies a conference, the SDK sends this notification to the UI 
 * after receiving a response from the server.
 * <p>The notification will have the following object key:
 *  <ul>
 *   <li><em>{@link PARAM_MEETING_RESULT_CODE}</em></li>
 * </ul>
 * </p>
 */
#define EVENT_MEETING_MODIFY_MEETING_RSP      @"EVENT_MEETING_MODIFY_MEETING_RSP"

/**
 * <b>Description:</b> It is used to notify the result of removing a conference.
 * <br><b>Purpose:</b> After the UI removes a conference, the SDK sends this notification to the UI 
 * after receiving a response from the server.
 * <p>The notification will have the following object key:
 *  <ul>
 *   <li><em>{@link PARAM_MEETING_RESULT_CODE}</em></li>
 * </ul>
 * </p>
 */
#define EVENT_MEETING_REMOVE_MEETING_RSP      @"EVENT_MEETING_REMOVE_MEETING_RSP"

/**
 * <b>Description:</b> It is used to notify the result of displaying a conference.
 * <br><b>Purpose:</b> After the UI displayes a conference, the SDK sends this notification to the UI 
 * after receiving a response from the server.
 * <p>The notification will have the following object key:
 *  <ul>
 *   <li><em>{@link PARAM_MEETING_RESULT_CODE}</em></li>
 *   <li><em>{@link PARAM_MEETING_INFO}</em></li>
 * </ul>
 * </p>
 */
#define EVENT_MEETING_DISPLAY_MEETING_RSP     @"EVENT_MEETING_DISPLAY_MEETING_RSP"

/**
 * <b>Description:</b> It is used to notify the result of list templates.
 * <br><b>Purpose:</b> After the UI lists templates, the SDK sends this notification to the UI 
 * after receiving a response from the server.
 * <p>The notification will have the following object key:
 *  <ul>
 *   <li><em>{@link PARAM_MEETING_RESULT_CODE}</em></li>
 *   <li><em>{@link PARAM_MEETING_LIST_TEMPLATE_RESULT_ARRAY}</em></li>
 * </ul>
 * </p>
 */
#define EVENT_MEETING_LIST_TEMPLATE_RSP       @"EVENT_MEETING_LIST_TEMPLATE_RSP"

/**
 * <b>Description:</b> It is used to notify the result of creating templates.
 * <br><b>Purpose:</b> After the UI creates templates, the SDK sends this notification to the UI 
 * after receiving a response from the server.
 * <p>The notification will have the following object key:
 *  <ul>
 *   <li><em>{@link PARAM_MEETING_RESULT_CODE}</em></li>
 * </ul>
 * </p>
 */
#define EVENT_MEETING_CREATE_TEMPLATE_RSP     @"EVENT_MEETING_CREATE_TEMPLATE_RSP"

/**
 * <b>Description:</b> It is used to notify the result of modifying a template.
 * <br><b>Purpose:</b> After the UI modifies templates, the SDK sends this notification to the UI 
 * after receiving a response from the server.
 * <p>The notification will have the following object key:
 *  <ul>
 *   <li><em>{@link PARAM_MEETING_RESULT_CODE}</em></li>
 * </ul>
 * </p>
 */
#define EVENT_MEETING_MODIFY_TEMPLATE_RSP     @"EVENT_MEETING_MODIFY_TEMPLATE_RSP"

/**
 * <b>Description:</b> It is used to notify the result of removing a template.
 * <br><b>Purpose:</b> After the UI removes a template, the SDK sends this notification to the UI 
 * after receiving a response from the server.
 * <p>The notification will have the following object key:
 *  <ul>
 *   <li><em>{@link PARAM_MEETING_RESULT_CODE}</em></li>
 * </ul>
 * </p>
 */
#define EVENT_MEETING_REMOVE_TEMPLATE_RSP     @"EVENT_MEETING_REMOVE_TEMPLATE_RSP"

/**
 * <b>Description:</b> It is used to notify the result of dispalaying a template.
 * <br><b>Purpose:</b> After the UI dispalays a template, the SDK sends this notification to the UI 
 * after receiving a response from the server.
 * <p>The notification will have the following object key:
 *  <ul>
 *   <li><em>{@link PARAM_MEETING_RESULT_CODE}</em></li>
 *   <li><em>{@link PARAM_TEMPLATE_INFO}</em></li>
 * </ul>
 * </p>
 */
#define EVENT_MEETING_DISPLAY_TEMPLATE_RSP    @"EVENT_MEETING_DISPLAY_TEMPLATE_RSP"

/**
 * <b>Description:</b> It is used to notify the result of listing auth-terminals.
 * <br><b>Purpose:</b> After the UI lists auth-terminals, the SDK sends this notification to the UI 
 * after receiving a response from the server.
 * <p>The notification will have the following object key:
 *  <ul>
 *   <li><em>{@link PARAM_MEETING_LIST_AUTH_TERMINAL_RESULT}</em></li>
 * </ul>
 * </p>
 */
#define EVENT_MEETING_LIST_AUTH_TERMINAL_RSP  @"EVENT_MEETING_LIST_AUTH_TERMINAL_RSP"

/**
 * <b>Description:</b> It is used to notify the result of starting a data conference.
 * <br><b>Purpose:</b> After the UI starts a data conference, the SDK sends this notification to the UI 
 * after receiving a response from the server.
 * <p>The notification will have the following object key:
 *  <ul>
 *   <li><em>{@link PARAM_MEETING_EVENT_BASE_INFO}</em></li>
 * </ul>
 * </p>
 */
#define EVENT_MEETING_START_DATA_CONFERENCE_RSP @"EVENT_MEETING_START_DATA_CONFERENCE_RSP"

/**
 * <b>Description:</b> It is used to notify the result of starting or stopping recording.
 * <br><b>Purpose:</b> After the UI starts or stops recording, the SDK sends this notification to the UI 
 * after receiving a response from the server.
 * <p>The notification will have the following object key:
 *  <ul>
 *   <li><em>{@link PARAM_MEETING_EVENT_BASE_INFO}</em></li>
 *   <li><em>{@link PARAM_MEETING_RECORDING_OPT}</em></li>
 *   <li><em>{@link PARAM_MEETING_RECORD_ID}</em></li>
 * </ul>
 * </p>
 */
#define EVENT_MEETING_RECORDING_OPT_RSP       @"EVENT_MEETING_RECORDING_OPT_RSP"

/** Indicates the result code of a operation. */
#define PARAM_MEETING_RESULT_CODE             @"PARAM_MEETING_RESULT_CODE"

/** Indicates the server version of MediaX. */
#define PARAM_MEETING_SERVER_VERSION             @"PARAM_MEETING_RESULT_CODE"

/** Indicates the result code of a operation. */
#define PARAM_MEETING_ACCOUND_ID              @"PARAM_MEETING_ACCOUND_ID"

/** Indicates the {@link MeetingInfo} object. */
#define PARAM_MEETING_INFO                    @"PARAM_MEETING_INFO"

/** Indicates the {@link MeetingTemplate} object. */
#define PARAM_TEMPLATE_INFO                   @"PARAM_TEMPLATE_INFO"

/** Indicates the {@link ListMeetingResult} object. */
#define PARAM_MEETING_LIST_MEETING_RESULT     @"PARAM_MEETING_LIST_MEETING_RESULT"

/** Indicates a array of {@link ListTemplateInfo} object. */
#define PARAM_MEETING_LIST_TEMPLATE_RESULT_ARRAY @"PARAM_MEETING_LIST_TEMPLATE_RESULT_ARRAY"

/** Indicates a array of {@link ListAuthTerminalResult} object. */
#define PARAM_MEETING_LIST_AUTH_TERMINAL_RESULT @"PARAM_MEETING_LIST_AUTH_TERMINAL_RESULT"

/** Indicates the major configuration type.*/
typedef enum tag_MEETING_CFG_MAJOR_TYPE
{   
    /** Indicates the IP address of the meeting server.*/
    MEETING_CFG_SERVER_IP,

	/** Indicates the port of the meeting server.*/
    MEETING_CFG_SERVER_PORT,

	/** Indicates the transfer mode between client and the meeting server.*/
    MEETING_CFG_USE_HTTPS,

	/** Indicates the conference uri.*/
    MEETING_CFG_URI,

	/** Indicates the void major types of conference config.*/
    MEETING_CFG_MAJOR_BUTT
} MEETING_CFG_MAJOR_TYPE;

/** Indicates the minor configuration type.*/
typedef enum tag_MEETING_CFG_MINOR_TYPE
{
    /** Indicates the void minor types of conference config.*/
    MEETING_CFG_MINOR_BUTT

} MEETING_CFG_MINOR_TYPE;


@interface MeetingBaseApi : NSObject

/**
 * <b>Description:</b> This method is used to initialize conference components.
 * <br><b>Purpose:</b> Before using other methods of conference components, the UI must invoke this method to 
 * initialize conference components during system initialization.
 * @return The value 0 indicates operation success, and the value 1 indicates operation failure.
 */
+(int) init;

/**
 * <b>Description:</b> This method is used to release all resources of conference components.
 * <br><b>Purpose:</b> The UI invokes this method to release all resources of conference components. 
 * This method can be invoked only after the {@link MeetingBaseApi.init} is invoked to initialize conference components. 
 * This method is invoked during program deregistration.
 * @return The value 0 indicates operation success, and the value 1 indicates operation failure.
 */
+(int) destroy;

/**
 * <b>Description:</b> This method is used to configure parameters required for registering an audio/video account.
 * <br><b>Purpose:</b> After logging in to a conference, the UI must invoke this method to configure parameters required for registering an audio/video account. 
 * @param meetingId Specifies a conference.
 * @return The value 0 indicates operation success, and the value 1 indicates operation failure.
 */
+(int) setSysCfg:(NSString*)meetingId;

/**
 * <b>Description:</b> This method is used to configure parameters required for joining an audio/video conference.
 * <br><b>Purpose:</b> After logging in to a conference, the UI must invoke this method to configure parameters required for joining an audio/video conference. 
 * @param meetingId Specifies a conference.
 * @param videoLevel Specifies the level of video media parameters.See {@link tagMEETING_VIDEO_LEVEL}.
 * @param isEnableBandWidthDiff Specifies whether uplink/downlink asymmetry is enabled. 
 * @return The value 0 indicates operation success, and the value 1 indicates operation failure.
 */
+(int) setCallCfg:(NSString*)meetingId videoLevel:(int)videoLevel isEnableBandWidthDiff:(BOOL)isEnableBandWidthDiff;

/**
 * <b>Description:</b> This method is used to obtain int information of a conference.
 * <br><b>Purpose:</b> The UI invokes this method to obtain int information of a conference from the SDK. 
 * The SDK returns values corresponding to the mainInfoType and minorInfoType. This method can be invoked
 * only after the UI successfully logs in to a conference.
 * @param meetingId Specifies a conference.
 * @param mainInfoType Specifies the major type of conference information.See
 *      <ul>
 *         <li><em>{@link MEETING_INFO_ADAPTMODE}</em></li>
 *         <li><em>{@link MEETING_INFO_MEDIATYPE}</em></li>
 *         <li><em>{@link MEETING_INFO_USER_ROLE}</em></li>
 *         <li><em>{@link MEETING_INFO_USER_CONFRIGHT}</em></li>
 *         <li><em>{@link MEETING_INFO_USER_PARTRIGHT}</em></li>
 *         <li><em>{@link MEETING_INFO_ENCRYPTMODE}</em></li>
 *         <li><em>{@link MEETING_INFO_BUSINESS_TYPE}</em></li>
 *         <li><em>{@link MEETING_INFO_MULTIPICTURE_NUMBER}</em></li>
 *         <li><em>{@link MEETING_INFO_DATA_CONF_MODE}</em></li>
 *      </ul>
 * @param minorInfoType Specifies the minor type of conference information. If no minor type of conference information is available, this parameter is set to 0.
 * @intValue This is an output parameter. This parameter is set to the values of mainInfoType and minorInfoType.
 * @return The value 0 indicates operation success, and the value 1 indicates operation failure.
 */
+(int) getInfoInt:(NSString*)meetingId mainInfoType:(int)mainInfoType minorInfoType:(int)minorInfoType intValue:(int*)intValue;

/**
 * <b>Description:</b> This method is used to obtain unsinged long information of a conference.
 * <br><b>Purpose:</b> The UI invokes this method to obtain unsinged long information of a conference from the SDK. 
 * The SDK returns values corresponding to the mainInfoType and minorInfoType. This method can be invoked
 * only after the UI successfully logs in to a conference.
 * @param meetingId Specifies a conference.
 * @param mainInfoType Specifies the major type of conference information.See
 *      <ul>
 *         <li><em>{@link MEETING_INFO_VIDEO_UPBANDWIDTH}</em></li>
 *         <li><em>{@link MEETING_INFO_VIDEO_DOWNBANDWIDTH}</em></li>
 *         <li><em>{@link MEETING_INFO_VIDEO_UPFRAME}</em></li>
 *         <li><em>{@link MEETING_INFO_VIDEO_DOWNFRAME}</em></li>
 *      </ul>
 * @param minorInfoType Specifies the minor type of conference information. If no minor type of conference information is available, this parameter is set to 0.
 * @param ulongValue: This is an output parameter. This parameter is set to the values of mainInfoType and minorInfoType.
 * @return The value 0 indicates operation success, and the value 1 indicates operation failure.
 */
+(int) getInfoUlong:(NSString*)meetingId mainInfoType:(int)mainInfoType minorInfoType:(int)minorInfoType ulongValue:(unsigned long*)ulongValue;

/**
 * <b>Description:</b> This method is used to obtain NSString information of a conference.
 * <br><b>Purpose:</b> The UI invokes this method to obtain NSString information of a conference from the SDK. 
 * The SDK returns values corresponding to the mainInfoType and minorInfoType. This method can be invoked
 * only after the UI successfully logs in to a conference.
 * @param meetingId Specifies a conference.
 * @param mainInfoType Specifies the major type of conference information.See
 *      <ul>
 *         <li><em>{@link MEETING_INFO_TITLE}</em></li>
 *         <li><em>{@link MEETING_INFO_LANGUAGE}</em></li>
 *         <li><em>{@link MEETING_INFO_CREATER_NAME}</em></li>
 *         <li><em>{@link MEETING_INFO_USER_NAME}</em></li>
 *         <li><em>{@link MEETING_INFO_ACCESS_NUMBER}</em></li>
 *         <li><em>{@link MEETING_INFO_AUTH_CODE}</em></li>
 *         <li><em>{@link MEETING_INFO_SERVER_URL}</em></li>
 *         <li><em>{@link MEETING_INFO_VIDEO_UPRES}</em></li>
 *         <li><em>{@link MEETING_INFO_VIDEO_DOWNRES}</em></li>
 *         <li><em>{@link MEETING_INFO_ACCOUNT_NAME}</em></li>
 *         <li><em>{@link MEETING_INFO_ACCOUNT_PASSWORD}</em></li>
 *         <li><em>{@link MEETING_INFO_ACCOUNT_AUTHORNAME}</em></li>
 *         <li><em>{@link MEETING_INFO_ACCOUNT_PROXYADDR}</em></li>
 *         <li><em>{@link MEETING_INFO_ACCOUNT_DOMAIN}</em></li>
 *         <li><em>{@link MEETING_INFO_LOG_RECVEMAIL_ADDR}</em></li>
 *         <li><em>{@link MEETING_INFO_LOG_SENDEMAIL_SERVER}</em></li>
 *         <li><em>{@link MEETING_INFO_LOG_SENDEMAIL_ADDR}</em></li>
 *         <li><em>{@link MEETING_INFO_LOG_SENDEMAIL_PWD}</em></li>
 *         <li><em>{@link MEETING_INFO_DATA_CONF_SERVER_ADDR}</em></li>
 *         <li><em>{@link MEETING_INFO_DATA_CONF_ID}</em></li>
 *         <li><em>{@link MEETING_INFO_DATA_CONF_TOKEN}</em></li>
 *         <li><em>{@link MEETING_INFO_DATA_CONF_PARTID}</em></li>
 *         <li><em>{@link MEETING_INFO_DATA_CONF_URL}</em></li>
 *         <li><em>{@link MEETING_INFO_DATA_CONF_TMP_TOKEN}</em></li>
 *         <li><em>{@link MEETING_INFO_DATA_MEDIA_SECRET_KEY}</em></li>
 *      </ul>
 * @param minorInfoType Specifies the minor type of conference information. If no minor type of conference information is available, this parameter is set to 0.
 * @return The value indicates the String value corresponding to the mainInfoType and minorInfoType.
 */
+(NSString*) getInfoStr:(NSString*)meetingId mainInfoType:(int)mainInfoType minorInfoType:(int)minorInfoType;

/**
 * <b>Description:</b> This method is used to obtain BOOL information of a conference.
 * <br><b>Purpose:</b> The UI invokes this method to obtain BOOL information of a conference from the SDK. 
 * The SDK returns values corresponding to the mainInfoType and minorInfoType. This method can be invoked
 * only after the UI successfully logs in to a conference.
 * @param meetingId Specifies a conference.
 * @param mainInfoType Specifies the major type of conference information.See
 *      <ul>
 *         <li><em>{@link MEETING_INFO_USER_USE_AV_RESOURCE}</em></li>
 *         <li><em>{@link MEETING_INFO_ENABLE_ASY}</em></li>
 *         <li><em>{@link MEETING_INFO_HAS_DATA_RESOURCE}</em></li>
 *      </ul>
 * @param minorInfoType Specifies the minor type of conference information. If no minor type of conference information is available, this parameter is set to 0.
 * @param boolValue: Specifies the obtained BOOL parameters. This is an output parameter.
 * @return The value 0 indicates operation success, and the value 1 indicates operation failure.
 */
+(int) getInfoBool:(NSString*)meetingId mainInfoType:(int)mainInfoType minorInfoType:(int)minorInfoType boolValue:(BOOL*)boolValue;

/**
 * <b>Description:</b> This method is used to obtain latest conference status and basic information about a conference.
 * <br><b>Purpose:</b> After logging in to a conference, the UI invokes this method obtain latest conference status
 * and basic information about a conference. Then the UI updates the view based on the information. This method can be
 * invoked only after the UI successfully logs in to a conference.
 * @param meetingId Identifies a conference
 * @return The value indicates the Meeting object. For details, see Meeting. If no information about a conference
 * corresponding to meetingId is available, nil is returned.
 */
+ (Meeting*)getCurMeetingInfo:(NSString*)meetingId;

/**
 * <b>Description:</b> This method is used to is used to obtain latest status of all participants.
 * <br><b>Purpose:</b> After logging in to a conference, the UI invokes this method obtain latest status of all participants.
 * Then the UI updates the view based on the status information. This method can be invoked only after the UI successfully
 * logs in to a conference.
 * @param meetingId Identifies a conference
 * @return The value indicates an array of the Participant object. For details, see Participant. If no information about
 * a participant corresponding to meetingId is available, nil is returned.
 */
+ (NSMutableArray*)getCurPartsInfo:(NSString*)meetingId;

/**
 * <b>Description:</b> This method is used to log in to a conference.
 * <br><b>Purpose:</b> This method is used to log in to the conference server and query the conference server for the client configuration. 
 * The configuration data includes audio/video account, data conference server, and video quality. After login, you can join an audio/video or a data conference.
 * @param meetingLoginParam For details, see {@link MeetingLoginParam}.
 * @return The value indicates an instance of {@link Meeting}.Only the meetingId is valid.
 */
+ (Meeting*)login:(MeetingLoginParam*)meetingLoginParam;

/**
 * <b>Description:</b> This method is used to apply for participant IDs from the SDK.
 * <br><b>Purpose:</b> Before the chairperson invites a new participant to a conference, the UI invokes this method to apply for 
 * a participant ID from the SDK. The participant ID must be used when the chairperson mutes or unmutes the participant. 
 * If the participant goes offline and needs to be invited again, the participant ID can be used directly.
 * @param meetingId Specifies a conference. 
 * @param name Specifies the name of a participant. 
 * @param number Specifies the number of a participant.
 * @return The value indicates the identifier for a participant.
 */
+ (int)addPart:(NSString*)meetingId name:(NSString*)name number:(NSString*)number partId:(unsigned long*)partId;

/**
 * <b>Description:</b> This method is used to invite participants to a conference.
 * <br><b>Purpose:</b>  This method is used for the chairperson to invite participants to a conference. A maximum of 10 participants
 *  can be invited each time. This method can be invoked only after the UI successfully logs in to a conference. After invoking this method, 
 *  the UI receives the {@link EVENT_MEETING_INVITE_PARTICIPANT_RSP} and {@link EVENT_MEETING_PARTICIPANT_STATUS_CHANGED} broadcasts. Then the UI updates the
 *  view based on parameters in the broadcasts.
 * @param meetingPartInviteParam For details, see {@link MeetingPartInviteParam}.
 * @return The value 0 indicates operation success, and the value 1 indicates operation failure.
 */
+ (int)inviteParticipants:(MeetingPartInviteParam*)meetingPartInviteParam;

/**
 * <b>Description:</b> This method is used to query an enterprise address book.
 * <br><b>Purpose:</b> This method is used when the chairperson queries the enterprise address book for contacts. 
 * After invoking this method, the UI receives the {@link EVENT_MEETING_ENTERPRISE_ADDRESSBOOK} broadcast. Then the UI 
 * displays the query result based on parameters in the broadcast. This method can be invoked only after the UI successfully logs in to a conference.
 * @param meetingContactQueryParam For details, see {@link MeetingContactQueryParam}.
 * @return The value 0 indicates operation success, and the value 1 indicates operation failure.
 */
+ (int)queryEnterpriseAddressbook:(MeetingContactQueryParam*)meetingContactQueryParam;

/**
 * <b>Description:</b> This method is used to get temp password of conference.
 * <br><b>Purpose:</b> The UI invokes this method to get the temp password of conference. 
 * @param meetingId Specifies meeting id
 * @param meetingPwd Specifies meeting password
 * @param pinCode Specifies security code
 * @return 0 Indicates that operation succeeds
 *     <br>1 Indicates that operation fails
 */
+ (int)getTempPwd:(NSString*)meetingId meetingPwd:(NSString*)meetingPwd pinCode:(NSString*)pinCode;

/**
 * <b>Description:</b> This method is used to login conference with temp password.
 * <br><b>Purpose:</b> The UI invokes this method to login conference. 
 * @param meetingId Specifies meeting id
 * @param meetingPwd Specifies meeting temp password
 * @param pinCode Specifies nick name
 * @return 0 Indicates that operation succeeds
 *     <br>1 Indicates that operation fails
 */
+ (Meeting*)loginConf:(NSString*)meetingId withTmpPwd:(NSString*)tmpPwd nickName:(NSString*)nickName;

/**
 * <b>Description:</b> This method is used to login conference with temp password.
 * <br><b>Purpose:</b> The UI invokes this method to login conference without report of status change. 
 * @param meetingId Specifies meeting id
 * @param meetingPwd Specifies meeting temp password
 * @param pinCode Specifies security code
 * @return An object of Meeting class
 */
+ (Meeting*)loginConfWithoutStatusReport: (NSString*)meetingId meetingPwd:(NSString*)meetingPwd pinCode:(NSString*)pinCode;

/**
 * <b>Description:</b> This method is used to set configuration information.
 * <br><b>Purpose:</b> The UI invokes this method to set configuration information based on different parameters. The configuration
 * takes effect on subsequent calls. 
 * @param majorType Specifies the major type of the configuration. @see MEETING_CFG_MAJOR_TYPE
 * @param minorType Specifies the minor type of the configuration. @see MEETING_CFG_MINOR_TYPE
 * @return 0 Indicates that operation succeeds
 *     <br>1 Indicates that operation fails
 */
+ (NSString*) cfgGetValue:(int)majorType minortype:(int)minorType;

/**
 * <b>Description:</b> This method is used to set configuration information.
 * <br><b>Purpose:</b> The UI invokes this method to set configuration information based on different parameters. The configuration
 * takes effect on subsequent calls. 
 * @param majorType Specifies the major type of the configuration. @see MEETING_CFG_MAJOR_TYPE
 * @param minorType Specifies the minor type of the configuration. @see MEETING_CFG_MINOR_TYPE
 * @param value Specifies the value of the configuration
 * @return 0 Indicates that operation succeeds
 *     <br>1 Indicates that operation fails
 */
+ (int) setConfigValue:(int)majorType minortype:(int)minorType configvalue:(NSString*)configValue;

@end

/** Indicates the match type for list conferences or templates.*/
typedef enum tagMEETING_MATCH_TYPE
{
    /** Indicates the result must equal the value that used to list conferences or templates.*/
    MEETING_MATCH_TYPE_EQUAL,   

    /** Indicates the result must unequal the value that used to list conferences or templates.*/	
    MEETING_MATCH_TYPE_UNEQUAL,
	
    /** Indicates the result must more than the value that used to list conferences or templates.*/
    MEETING_MATCH_TYPE_MORE,
	
    /** Indicates the result must less than the value that used to list conferences or templates.*/
    MEETING_MATCH_TYPE_LESS,
	
    /** Indicates the result must like the value that used to list conferences or templates.*/
    MEETING_MATCH_TYPE_LIKE
}MEETING_MATCH_TYPE;

/** Indicates the result fields that the UI needed the SDK return when list conferences or templates.*/
typedef enum tagMEETING_LIST_RESULT_FIELD
{
    /** Indicates the start time.*/
    MEETING_LIST_RESULT_FIELD_START_TIME = 1,
	
    /** Indicates the subject.*/
    MEETING_LIST_RESULT_FIELD_SUBJECT = 2,
	
    /** Indicates the subject.*/
    MEETING_LIST_RESULT_FIELD_MEETINGID = 4,
	
    /** Indicates the sub-meetingID.*/
    MEETING_LIST_RESULT_FIELD_SUB_MEETINGID = 8,
	
    /** Indicates the state.*/
    MEETING_LIST_RESULT_FIELD_STATE = 16,
	
    /** Indicates the length.*/
    MEETING_LIST_RESULT_FIELD_LENGTH = 32,
	
    /** Indicates the time zone.*/
    MEETING_LIST_RESULT_FIELD_TIMEZONE = 64,
	
    /** Indicates the name of the scheduler.*/
    MEETING_LIST_RESULT_FIELD_SCHEDULER_NAME = 128,
	
    /** Indicates the media type.*/
    MEETING_LIST_RESULT_FIELD_MEDIA_TYPE = 256,
	
    /** Indicates the totle size.*/
    MEETING_LIST_RESULT_FIELD_TOTAL_SIZE = 512,

    /** Indicates the scheduler's account id. */
    MEETING_LIST_RESULT_FIELD_ACCOUNT_ID = 1024,

    /** Indicates the access number. */
    MEETING_LIST_RESULT_FIELD_ACCESS_NUMBER = 2048
}MEETING_LIST_RESULT_FIELD;

/** Indicates match key types of conditons for listing meeting.*/
typedef enum tagMEETING_LIST_CONDITION_KEY_TYPE
{
	/** Indicates meetingID of match key type */
    MEETING_LIST_CONDITION_KEY_TYPE_MEETINGID,
	
	/** Indicates subject of match key type */
    MEETING_LIST_CONDITION_KEY_TYPE_SUBJECT,
    
	/** Indicates state of match key type */
	MEETING_LIST_CONDITION_KEY_TYPE_STATE,
	
	/** Indicates start time of match key type */
    MEETING_LIST_CONDITION_KEY_TYPE_START_TIME,
	
	/** Indicates scheduler name of match key type */
    MEETING_LIST_CONDITION_KEY_TYPE_SCHEDULER_NAME
}MEETING_LIST_CONDITION_KEY_TYPE;

/** Indicates the result fields that the UI needed the SDK return when list auth-terminals.*/
typedef enum tagMEETING_AUTH_TERMINAL_LIST_RESULT_FIELD
{
    /** Indicates the directory ID.*/
    MEETING_LIST_RESULT_FIELD_DIRENTORY_ID = 1,     

    /** Indicates the directory name.*/	
    MEETING_LIST_RESULT_FIELD_DIRECTORY_NAME = 2,      

    /** Indicates the terminal ID.*/    
    MEETING_LIST_RESULT_FIELD_TERMINAL_ID = 4,       
	
    /** Indicates the terminal name.*/  
    MEETING_LIST_RESULT_FIELD_TERMINAL_NAME = 8,           
	
    /** Indicates the terminal type.*/  
    MEETING_LIST_RESULT_FIELD_TERMINAL_TYPE = 16,        
	
    /** Indicates the terminal phone numbe.*/
    MEETING_LIST_RESULT_FIELD_TERMINAL_PHONE = 32,         
	
    /** Indicates the terminal left phone numbe.*/
    MEETING_LIST_RESULT_FIELD_TERMINAL_LEFTPHONE = 64,    
	
    /** Indicates the terminal right phone numbe.*/
    MEETING_LIST_RESULT_FIELD_TERMINAL_RIGHTPHONE = 128,   
	
    /** Indicates the terminal description.*/
    MEETING_LIST_RESULT_FIELD_TERMINAL_DESCRIPTION = 256,
}MEETING_AUTH_TERMINAL_LIST_RESULT_FIELD;

/** Indicates the terminal type.*/ 
typedef enum tagMEETING_TERMINAL_TYPE
{
    /** Indicates single screen telepresence.*/ 
    MEETING_TERMINAL_TYPE_SINGLE_TP,          
	
    /** Indicates three screen telepresence.*/ 
    MEETING_TERMINAL_TYPE_THREE_TP,        
	
    /** Indicates screen telepresence of cisco.*/
    MEETING_TERMINAL_TYPE_SINGLE_CISCO_TP,    
	
    /** Indicates three screen telepresence of cisco.*/
    MEETING_TERMINAL_TYPE_THREE_CISCO_TP,   
	
    /** Indicates the high video.*/
    MEETING_TERMINAL_TYPE_HIGH_VIDEO,         
	
    /** Indicates the H323 video.*/
    MEETING_TERMINAL_TYPE_H323,               
	
    /** Indicates the default constant parameter.*/
    MEETING_TERMINAL_TYPE_BUTT
} MEETING_TERMINAL_TYPE;

/**
 * <b>Description:</b> Attendee is used to describe an attendee of meeting.
 * <br><b>Purpose:</b> The UI invokes interfaces of this class to obtain properties of an attendee.
 */
@interface Attendee : NSObject
{
@private

    NSString *_name;
    NSString *_number;
    NSString *_leftNumber;
    NSString *_rightNumber;
    NSString *_email;
    NSString *_smsNumber;
    NSString *_accountId;
    NSString *_pinCode;
    int _role;
}

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
 * <b>Description:</b> MeetingInfo indicates the class of a meeting.
 * <br><b>Purpose:</b> When the SDK sends the {@link MeetingBaseApi.EVENT_MEETING_SCHEDULE_MEETING_RSP} broadcast to the UI, the broadcast contains the instances of
 * this class as parameters. After obtaining parameters from the broadcast, the UI invokes the methods of this class to obtain information about meeting, 
 * and updates the view based on the information.
 */
@interface MeetingInfo : NSObject
{
@private

    int _templateId;
    NSString *_startTime;
    NSString *_subject;
    NSString *_meetingId;
    NSString *_chairPassword;
    NSString *_guestPassword;
    NSString *_language;
    NSString *_remaintime;
    NSString *_schedulerName;
    NSString *_accessNumber;
    NSString *_accountId;
    NSString *_serverVersion;
    int _subMeetingId;
    int _timeZone;
    int _size;
    int _mediaType;
    int _encryptMode;
    int _state;
    long _length;
    BOOL _isCycleType;
    BOOL _isAutoInvite;
    BOOL _isAllowRecord;
    NSMutableArray *_attendeeArray;
}

/**
 * <b>Description:</b> This property is used to set the ID of the template which is used to create a conference .
 */
@property (assign, nonatomic) int templateId;

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
 * <b>Description:</b> This property is used to obtain the chair password of a conference.
 */
@property (retain, nonatomic) NSString *chairPassword;

/**
 * <b>Description:</b> This property is used to obtain the guest password of a conference.
 */
@property (retain, nonatomic) NSString *guestPassword;

/**
 * <b>Description:</b> This property is used to obtain the language of a conference.
 */
@property (retain, nonatomic) NSString *language;

/**
 * <b>Description:</b> This property is used to obtain the remain time of a conference.
 */
@property (retain, nonatomic) NSString *remaintime;

/**
 * <b>Description:</b> This property is used to obtain the scheduleName of a conference.
 */
@property (retain, nonatomic) NSString *schedulerName;

/**
 * <b>Description:</b> This property is used to obtain the access number of a conference
 */
@property (retain, nonatomic) NSString *accessNumber;

/**
 * <b>Description:</b> This property is used to get the scheduler's accountId of the meeting.
 */
@property (retain, nonatomic) NSString *accountId;

/**
 * <b>Description:</b> This property is used to obtain the sub-meeting id of a conference.
 */
@property (assign, nonatomic) int subMeetingId;

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
 * <b>Description:</b> This property is used to obtain the attendee array of a conference.
 */
@property (retain, nonatomic) NSMutableArray *attendeeArray;

@end

/** <b>Description:</b> MeetingTemplate provides interfaces to get templates of the meeting.
 * <br><b>Purpose:</b> MeetingTemplate provides interfaces to get templates of the meeting which will be used in reserving meetings. The UI needs 
 * to restore the information obtained from the templates.
 */
@interface MeetingTemplate : NSObject
{
@private

    int _templateId;
    NSString *_name;
    NSString *_subject;
    NSString *_scheduleName;
    NSString *_language;
    int _timeZone;
    int _size;
    int _mediaType;
    int _encryptMode;
    long _length;
    BOOL _isCycleType;
    NSMutableArray *_attendeeArray;
}

/**
 * <b>Description:</b> This property is used to get template id of the meeting.
 */
@property (assign, nonatomic) int templateId;

/**
 * <b>Description:</b> This property is used to get the name of the obtained template.
 */
@property (retain, nonatomic) NSString *name;

/**
 * <b>Description:</b> This property is used to get the subject of the meeting.
 */
@property (retain, nonatomic) NSString *subject;

/**
 * <b>Description:</b> This property is used to get the schedule name of the meeting.
 */
@property (retain, nonatomic) NSString *scheduleName;

/**
 * <b>Description:</b> This property is used to get the language of the meeting.
 */
@property (retain, nonatomic) NSString *language;

/**
 * <b>Description:</b> This property is used to get the time zone of the meeting.
 */
@property (assign, nonatomic) int timeZone;

/**
 * <b>Description:</b> This property is used to get the maximum number of the attendee allowed.
 */
@property (assign, nonatomic) int size;

/**
 * <b>Description:</b> This property is used to get media type of the meeting.See {@link tagMEETING_MEDIA_TYPE}
 */
@property (assign, nonatomic) int mediaType;

/**
 * <b>Description:</b> This property is used to get encryption mode of the meeting.
 */
@property (assign, nonatomic) int encryptMode;

/**
 * <b>Description:</b> This property is used to get the time length of the meeting, which is measured in seconds.
 */
@property (assign, nonatomic) long length;

/**
 * <b>Description:</b> This property is used to see whether the meeting is a cycle meeting.
 */
@property (assign, nonatomic) BOOL isCycleType;

/**
 * <b>Description:</b> This property is used to get the attendee array of the meeting.See {@link Attendee}
 */
@property (retain, nonatomic) NSMutableArray *attendeeArray;

@end

/** 
  * <b>Description:</b> ListMeetingFilter describes filter of listing meetings. UI should create
  * an object of this class when listing meetings.
*/
@interface ListMeetingFilter : NSObject
{
@private

    BOOL  _isAscend;
    int _pageIndex;
    int _pageSize;
    int _resultField;
    BOOL _isIncludeInvitedMeeting;
    NSMutableArray *_listMeetingConditionArray;
}

/**
 * <b>Description:</b> This property is used to check whether the sort style is ascend.
 */
@property (assign, nonatomic) BOOL isAscend;

/**
 * <b>Description:</b> This property is used to get the index of the page.
 */
@property (assign, nonatomic) int pageIndex;

/**
 * <b>Description:</b> This property is used to get the size of the page.
 */
@property (assign, nonatomic) int pageSize;

/**
 * <b>Description:</b> This property is used to get the result field.
 */
@property (assign, nonatomic) int resultField;

/**
 * <b>Description:</b> This property is used to check whether result contain the conferences which has invited the UI.
 */
@property (assign, nonatomic) BOOL isIncludeInvitedMeeting;

/**
 * <b>Description:</b> This property is used to get the condition array for list conferences.
 */
@property (retain, nonatomic) NSMutableArray *listMeetingConditionArray;

@end

/** 
  * <b>Description:</b> ListMeetingCondition describes conditions for listing meetings. UI should create
  * an object of this class when listing meetings.
*/
@interface ListMeetingCondition : NSObject
{
@private

    MEETING_LIST_CONDITION_KEY_TYPE _keyType;
    NSString *_value;
    int _matchType;
}

/**
 * <b>Description:</b> This property is used to get the key type for list conferences.
 */
@property (assign, nonatomic) MEETING_LIST_CONDITION_KEY_TYPE keyType;

/**
 * <b>Description:</b> This property is used to get the key value for list conferences.
 */
@property (retain, nonatomic) NSString *value;

/**
 * <b>Description:</b> This property is used to get the match type for list conferences.
 */
@property (assign, nonatomic) int matchType;

@end

/** 
 * <b>Description:</b> ListMeetingResult describes result of ListMeetingResult. UI can get ListMeetingResult 
 * from the broadcast See {@link EVENT_MEETING_LIST_MEETING_RSP}.
 */
@interface ListMeetingResult : NSObject
{
@private

    int _index;
    int _total;
    BOOL _hasPrev;
    BOOL _hasNext;
    BOOL _hasFirst;
    BOOL _hasLast;
    NSMutableArray *_listMeetingResultInfoArray;
}

/**
 * <b>Description:</b> This property is used to get the current page index of meeting list.
 */
@property (assign, nonatomic) int index;

/**
 * <b>Description:</b> This property is used to get the total count of meetings in meeting list.
 */
@property (assign, nonatomic) int total;

/**
 * <b>Description:</b> This property is used to check whether the meeting list has previous page.
 */
@property (assign, nonatomic) BOOL hasPrev;

/**
 * <b>Description:</b> This property is used to check whether the meeting list has next page.
 */
@property (assign, nonatomic) BOOL hasNext;

/**
 * <b>Description:</b> This property is used to check whether the meeting list has first page.
 */
@property (assign, nonatomic) BOOL hasFirst;

/**
 * <b>Description:</b> This property is used to check whether the meeting list has last page.
 */
@property (assign, nonatomic) BOOL hasLast;

/**
 * <b>Description:</b> This property is used to get the list of See {@link ListMeetingResultInfo}.
 */
@property (retain, nonatomic) NSMutableArray *listMeetingResultInfoArray;

@end

/** 
 * <b>Description:</b> ListMeetingResultInfo describes templates' infomation. UI can get List<ListTemplateInfo>
 * by invoking ListMeetingResut.getResultInfoList
 */
@interface ListMeetingResultInfo : NSObject
{
@private

    NSString *_startTime;
    NSString *_subject;
    NSString *_meetingId;
    int  _subMeetingId;
    NSString *_schedulerName;
    NSString *_accessNumber;
    NSString *_accountId;
    int _timeZone;
    int _size;
    int _mediaType;
    int _state;
    long _length;
}

/**
 * <b>Description:</b> This property is used to get the starttime set in the meeting.
 */
@property (retain, nonatomic) NSString *startTime;

/**
 * <b>Description:</b> This property is used to get the subject set in the meeting.
 */
@property (retain, nonatomic) NSString *subject;

/**
 * <b>Description:</b> This property is used to get the meetingId of the meeting.
 */
@property (retain, nonatomic) NSString *meetingId;

/**
 * <b>Description:</b> This property is used to get the schedulerName of the meeting.
 */
@property (retain, nonatomic) NSString *schedulerName;

/**
 * <b>Description:</b> This property is used to get the accessNumber of the meeting.
 */
@property (retain, nonatomic) NSString *accessNumber;

/**
 * <b>Description:</b> This property is used to get the scheduler's accountId of the meeting.
 */
@property (retain, nonatomic) NSString *accountId;

/**
 * <b>Description:</b> This property is used to get the time zone set in the meeting.
 */
@property (assign, nonatomic) int subMeetingId;

/**
 * <b>Description:</b> This property is used to get the time zone set in the meeting.
 */
@property (assign, nonatomic) int timeZone;

/**
 * <b>Description:</b> This property is used to get the max count of participants set in the meeting.
 */
@property (assign, nonatomic) int size;

/**
 * <b>Description:</b> this property is used to get the media type set in the meeting.See {@link tagMEETING_MEDIA_TYPE}.
 */
@property (assign, nonatomic) int mediaType;

/**
 * <b>Description:</b> this property is used to get the state of the meeting.See {@link tagMEETING_STATE}.
 */
@property (assign, nonatomic) int state;

/**
 * <b>Description:</b> This property is used to get the meeting length.
 */
@property (assign, nonatomic) long length;

@end

/** 
 * <b>Description:</b> ListTmplateInfo describes templates' infomation. UI can get List<ListTemplateInfo>
 * from the broadcast EVENT_MEETING_LIST_TEMPLATE_RSP.
 */
@interface ListTemplateInfo : NSObject
{
@private

    int _templateId;
    NSString *_name;
    int _size;
    int _mediaType;
    long _length;
}

/**
 * <b>Description:</b> This property is used to get the template ID.
 */
@property (assign, nonatomic) int templateId;

/**
 * <b>Description:</b> This property is used to get the name of the template.
 */
@property (retain, nonatomic) NSString *name;

/**
 * <b>Description:</b> This property is used to get the max count of paticipants setted in the template.
 * <br><b>Purpose:</b> To get the max count of paticipants.
 */
@property (assign, nonatomic) int size;

/**
 * <b>Description:</b> This property is used to get the media type set in the template.
 * <br><b>Purpose:</b> To get the media type set in the template.See {@link tagMEETING_MEDIA_TYPE}
 */
@property (assign, nonatomic) int mediaType;

/**
 * <b>Description:</b> This property is used to get the meeting length set in the template.
 */
@property (assign, nonatomic) long length;

@end

/** 
  * <b>Description:</b> ListMeetingFilter describes filter of listing meetings. UI should create
  * an object of this class when listing meetings.
*/
@interface ListAuthTerminalFilter : NSObject

/**
 * <b>Description:</b> This property is used to obtain if the auth terminal list sorted ascend.
 */
@property (assign, nonatomic) BOOL isAscend;

/**
 * <b>Description:</b> This property is used to obtain if the page index for listing auth terminal.
 */
@property (assign, nonatomic) int pageIndex;

/**
 * <b>Description:</b> This property is used to obtain if the page size for listing auth terminal.
 */
@property (assign, nonatomic) int pageSize;

/**
 * <b>Description:</b> This property is used to obtain if the resultField for listing auth terminal.
 */
@property (assign, nonatomic) int resultField;

@end

/** 
 * <b>Description:</b> ListAuthTerminalResultInfo describes authTerminals' infomation. UI can get List<ListAuthTerminalResultInfo>
 * by invoking ListAuthTerminalResult.getResultInfoList
 */
@interface ListAuthTerminalResultInfo : NSObject

/**
 * <b>Description:</b> This property is used to get the directory ID of the auth terminal.
 */
@property (retain, nonatomic) NSString *directoryID;

/**
 * <b>Description:</b> This property is used to get the directory name of the auth terminal.
 */
@property (retain, nonatomic) NSString *directoryName;

/**
 * <b>Description:</b> This property is used to get the ID for the auth terminal.
 */
@property (retain, nonatomic) NSString *terminalID;

/**
 * <b>Description:</b> This property is used to get the name of the auth terminal.
 */
@property (retain, nonatomic) NSString *terminalName;

/**
 * <b>Description:</b> This property is used to get the type of the auth terminal.
 */
@property (assign, nonatomic) int terminalType;

/**
 * <b>Description:</b> This property is used to get the phone number of the auth terminal.
 */
@property (retain, nonatomic) NSString *phone;

/**
 * <b>Description:</b> This property is used to get the left phone number of the auth terminal.
 */
@property (retain, nonatomic) NSString *leftPhone;

/**
 * <b>Description:</b> This property is used to get the right phone number of the auth terminal.
 */
@property (retain, nonatomic) NSString *rightPhone;

/**
 * <b>Description:</b> This property is used to get the description of the auth terminal.
 */
@property (retain, nonatomic) NSString *description;

@end


/** 
 * <b>Description:</b> ListAuthTerminalResult describes the result of listing  authTerminals. UI can get ListAuthTerminalResult 
 * from the broadcast EVENT_MEETING_LIST_AUTH_TERMINAL_RSP.
 */
@interface ListAuthTerminalResult : NSObject

/**
 * <b>Description:</b> This property is used to obtain the page index of authterminal list.
 */
@property (assign, nonatomic) int index;

/**
 * <b>Description:</b> This property is used to obtain total count of authterminals in authterminal list.
 */
@property (assign, nonatomic) int total;

/**
 * <b>Description:</b> This property is used to obtain if the authterminal list has previous page.
 */
@property (assign, nonatomic) BOOL hasPrev;

/**
 * <b>Description:</b> This property is used to obtain if the authterminal list has next page.
 */
@property (assign, nonatomic) BOOL hasNext;

/**
 * <b>Description:</b> This property is used to obtain if the authterminal list has first page.
 */
@property (assign, nonatomic) BOOL hasFirst;

/**
 * <b>Description:</b> This property is used to obtain if the authterminal list has last page.
 */
@property (assign, nonatomic) BOOL hasLast;

/**
 * <b>Description:</b> This property is used to obtain the list of ListAuthTerminalResultInfo.
 */
@property (retain, nonatomic) NSMutableArray *listAuthTerminalResultInfoArray;

@end

/**
 * <b>Description:</b> MeetingManageLoginParam indicates the class of a meeting login param.
 * <br><b>Purpose:</b> Before invoking {@link MeetingManageApi.login:} login to the server, the UI instantiates this 
 * class to construct parameters for logging.
 */
@interface MeetingManageLoginParam : NSObject
{
@private

    NSString* _password;
    NSString* _userName;
    NSString* _serverIP;
    unsigned long _cookie;
}

/**
 * <b>Description:</b> This property is used to obtain the password of meeting login parameter.
 */
@property (retain, nonatomic) NSString * password;

/**
 * <b>Description:</b> This property is used to obtain the username of meeting login parameter.
 */
@property (retain, nonatomic) NSString * userName;

/**
 * <b>Description:</b> This property is used to obtain the server IP of meeting login parameter.
 */
@property (retain, nonatomic) NSString * serverIP;

/**
 * <b>Description:</b> This property is used to obtain the cookie of meeting login parameter.
 */
@property (assign, nonatomic) unsigned long cookie;

@end

/** <b>Description:</b> MeetingManageApi indicates the class of interfaces for providing conference manage services.
 *  <br><b>Purpose:</b> The UI invokes this method to access the API of conference manage services to manage conferences.
 */
@interface MeetingManageApi : NSObject

/**
 * <b>Description:</b> This method is used to login the meeting management, UI can option conference(eq: creat/modify/list/query conference) after login.
 * <br><b>Purpose:</b> The UI invokes this method to login the meeting management.
 * @param subject Specifies login Param of the conference.
 * @return The value 0 indicates operation success, and the value 1 indicates operation failure.
 */
+ (int)login:(MeetingManageLoginParam*)meetingManageLoginParam;

/**
 * <b>Description:</b> This method is used to login out the meeting management.
 * <br><b>Purpose:</b> The UI invokes this method to login out the meeting management.
 * @return The value 0 indicates operation success, and the value 1 indicates operation failure.	 
 */
+ (int)logout;

/**
 * <b>Description:</b> This method is used to schedule a conference.
 * <br><b>Purpose:</b> The UI invokes this method to schedule a conference.
 * @param meetingInfo Specifies meeting info of the conference.
 * @return The value 0 indicates operation success, and the value 1 indicates operation failure.
 */
+ (int)scheduleMeeting:(MeetingInfo*)meetingInfo;

/**
 * <b>Description:</b> This method is used to remove conference.
 * <br><b>Purpose:</b> The UI invokes this method to remove conference. Before invoking this method, it is recommanded that the UI should prompt 
 * the user with friendly information, such as a choice box for choosing to continue or cancel. The UI can present different information based on different situations.
 * @param meetingId Specifies meeting id of the conference.
 * @return The value 0 indicates operation success, and the value 1 indicates operation failure.
 */
+ (int)removeMeeting:(NSString *)meetingId;

/**
 * <b>Description:</b> This method is used to modify conference.
 * <br><b>Purpose:</b> The UI invokes this method to modify conference.
 * @param meetingInfo Specifies meeting info of the conference.
 * @return The value 0 indicates operation success, and the value 1 indicates operation failure.
 */
+ (int)modifyMeeting:(MeetingInfo *)meetingInfo;

/**
 * <b>Description:</b> This method is used to display conference detail.
 * <br><b>Purpose:</b> The UI invokes this method to display conference detail.
 * @param meetingId Specifies meeting id of the conference.
 * @param subMeetingId Specifies submeeting id of the conference.	 
 * @return The value 0 indicates operation success, and the value 1 indicates operation failure.
 */
+ (int)displayMeeting:(NSString *)meetingId subMeeingId:(int)subMeetingId;

/**
 * <b>Description:</b> This method is used to query conference list.
 * <br><b>Purpose:</b> The UI invokes this method to query conference list.
 * @param listMeetingFilter Specifies meeting filter condition of the conference.
 * @return The value 0 indicates operation success, and the value 1 indicates operation failure.
 */
+ (int)listMeeting:(ListMeetingFilter *)listMeetingFilter;

/**
 * <b>Description:</b> This method is used to creat conference template .
 * <br><b>Purpose:</b> The UI invokes this method to creat conference template .
 * @param meetingTemplate Specifies para of the template.
 * @return The value 0 indicates operation success, and the value 1 indicates operation failure.
 */
+ (int)createTemplate:(MeetingTemplate *)meetingTemplate;

/**
 * <b>Description:</b> This method is used to remove conference template .
 * <br><b>Purpose:</b> The UI invokes this method to remove conference template. Before invoking this method, it is recommanded 
 * that the UI should prompt the user with friendly information, such as a choice box for choosing to continue or cancel. 
 * The UI can present different information based on different situations.
 * @param templateId Specifies template Id of a conference.
 * @return The value 0 indicates operation success, and the value 1 indicates operation failure.
 */
+ (int)removeTemplate:(int)templateId;

/**
 * <b>Description:</b> This method is used to modify conference template .
 * <br><b>Purpose:</b> The UI invokes this method to modify conference template .
 * @param newMeetingTemplate Specifies para of a template.
 * @return The value 0 indicates operation success, and the value 1 indicates operation failure.
 */
+ (int)modifyTemplate:(MeetingTemplate *)meetingTemplate;

/**
 * <b>Description:</b> This method is used to display conference template .
 * <br><b>Purpose:</b> The UI invokes this method to display conference template .
 * @param templateId Specifies template Id of a conference.
 * @return The value 0 indicates operation success, and the value 1 indicates operation failure.
 */
+ (int)displayTemplate:(int)templateId;

/**
 * <b>Description:</b> This method is used to query conference template list .
 * <br><b>Purpose:</b> The UI invokes this method to query conference template list .
 * @return The value 0 indicates operation success, and the value 1 indicates operation failure.
 */
+ (int)listTemplate;

/**
 * <b>Description:</b> This method is used to query auth termianl room .
 * <br><b>Purpose:</b> The UI invokes this method to query auth conference room .
 * @param listAuthTerminalFilter filter of a uth termianl room.
 * @return The value 0 indicates operation success, and the value 1 indicates operation failure.
 */
+ (int)listAuthTerminal:(ListAuthTerminalFilter *)listAuthTerminalFilter;

@end

