/**
* @file CallLogApi.h
* @brief Call Log Interface Functions
*/

#import <Foundation/Foundation.h>
#import "PeerInfo.h"

/** Indicates call log types. It is used to distinguish the types of call records. */
typedef enum tag_CALL_LOG_TYPE
{    
    TYPE_AUDIO_INCOMING,  /**< @brief Indicates an incoming audio call. */    
    TYPE_AUDIO_OUTGOING,  /**< @brief Indicates an outgoing audio call. */    
    TYPE_AUDIO_MISSING,   /**< @brief Indicates a missed audio call. */    
    TYPE_AUDIO_CANCEL,    /**< @brief Indicates an audio call that is cancelled before being answered. */    
    TYPE_VIDEO_INCOMING,  /**< @brief Indicates an incoming video call. */    
    TYPE_VIDEO_OUTGOING,  /**< @brief Indicates an outgoing video call. */    
    TYPE_VIDEO_MISSING,   /**< @brief Indicates a missed video call. */
    TYPE_VIDEO_CANCEL,    /**< @brief Indicates a video call that is cancelled before being answered. */
    TYPE_AUDIO_MPTY_INCOMING,  /**< @brief Indicates an incoming audio conference call. */
    TYPE_AUDIO_MPTY_OUTGOING,  /**< @brief Indicates an outgoing audio conference call. */
    TYPE_AUDIO_MPTY_MISSING,   /**< @brief Indicates a missing audio conference call. */
    TYPE_AUDIO_MPTY_CANCEL,    /**< @brief Indicates an audio conference call that is canceled before being answered. */
    TYPE_VIDEO_MPTY_INCOMING,  /**< @brief Indicates an incoming video conference call. */
    TYPE_VIDEO_MPTY_OUTGOING,  /**< @brief Indicates an outgoing video conference call. */
    TYPE_VIDEO_MPTY_MISSING,   /**< @brief Indicates a missing video conference call. */
    TYPE_VIDEO_MPTY_CANCEL     /**< @brief Indicates a video conference call that is canceled before being answered. */
}CALL_LOG_TYPE;

/** Indicates the types of calllogs of a number to be deleted.
 *  It is used to distinguish the types of call logs when delete the call logs of a number.
 */
typedef enum tag_CALL_LOG_TYPE_DELETE
{    
    TYPE_DELETE_INCOMING,  /**< @brief Indicates all incoming call logs of a number is deleted. */    
    TYPE_DELETE_OUTGOING,  /**< @brief Indicates all outgoing call logs of a number is deleted. */    
    TYPE_DELETE_MISSED     /**< @brief Indicates all missed call logs of a number is deleted. */
}CALL_LOG_TYPE_DELETE;

/** The following begin to define call log database tables and fileds. */
#define TBNAME_CALL_LOG            @"tb_callLog"      /**< Call log table name. */

#define TBFLD_CALLLOG_ID           @"id"              /**< Indicates call log ID, [0][integer primary key]. */
#define TBFLD_CALLLOG_CALL_ID      @"callId"          /**< Indicates call ID, [1][int]. */
#define TBFLD_CALLLOG_CALL_TYPE    @"callType"        /**< Indicates call type, [2][int]. */
#define TBFLD_CALLLOG_CALL_STAT    @"callStat"        /**< Indicates call state, [3][int]. */
#define TBFLD_CALLLOG_DISP_NAME    @"dispName"        /**< Indicates display name, [4][char(128)]. */
#define TBFLD_CALLLOG_PEER_NUM     @"peerNumber"      /**< Indicates peer number, [5][char(128)]. */
#define TBFLD_CALLLOG_DURATION     @"Duration"        /**< Indicates call duration, [6][double]. */
#define TBFLD_CALLLOG_START_TIME   @"starttime"       /**< Indicates call start time, [7][double]. */
#define TBFLD_CALLLOG_NUM_TYPE     @"number_type"     /**< Indicates call number type, [8][int]. */
#define TBFLD_CALLLOG_URI_TYPE     @"uri_type"        /**< Indicates uri type, [9][int]. */
#define TBFLD_CALLLOG_UNREAD_MC    @"unread_misscall" /**< Indicates unread missed call, [10][int]. */
#define TBFLD_CALLLOG_KEY_NUM      @"keyNumber"       /**< Indicates key number, [11][char(128)]. */
#define TBFLD_CALLLOG_INFORMATION  @"information"     /**< Indicates custom information, [12][char(1024)]. */

/** 
 * <b>Description:</b> CallLog interfaces are used to get information about a piece of call record.
 * <br><b>Purpose:</b> The UI invokes interfaces of this class to obtain the peer number, start time, duration, and the type of a call.
 * The UI needs to create an instance of CallLog when using parameters or interfaces of this class.
 */
@interface CallLog : NSObject
{
    
@private
    
    PeerInfo* _peerInfo;
    
    NSDate* _beginTime;
    
    u_long _duration;
    
    CALL_LOG_TYPE _type;
    
    BOOL _isRead;

    unsigned int _dbId;
}

/** 
 * <b>Description:</b> It is used to obtain information of the peer party.
 * <br><b>Purpose:</b> The UI obtains information of the peer party through this property. 
 * The UI obtains an instance of PeerInfo and then sets or gets information about the peer party through properties
 * of PeerInfo.
 * <br>The property indicates an instance of PeerInfo
 */
@property(nonatomic, retain)PeerInfo* peerInfo;
/**
 * <b>Description:</b> It is used to the start time of a call.
 * <br><b>Purpose:</b> The UI obtains the start time of a call through this property. 
 * <br>The property indicates the start time of a call.
 */
@property(nonatomic, retain)NSDate* beginTime;
/**
 * <b>Description:</b> It is used to obtain the call duration.
 * <br><b>Purpose:</b> The UI obtains the call duration through this property. The duration is measured in seconds.
 * <br>The property indicates the call duration.
 */
@property(nonatomic, assign)u_long duration;
/**
 * <b>Description:</b> It is used to obtain the call type.
 * <br><b>Purpose:</b> The UI obtains the call record type through this property, by which, the UI knows whether the call is an incoming
 * call, outgoing call, or missed call.
 * <br>The property indicates the call type. See {@link tag_CALL_LOG_TYPE}.
 */
@property(nonatomic, assign)CALL_LOG_TYPE type;
/**
 * <b>Description:</b> It is used to check whether the call record has been read or not
 * <br>YES Indicates the call record has been read
 * <br>NO Indicates the call record has not been read
 */
@property(nonatomic, assign)BOOL isRead;
/**
 * <b>Description:</b> It is used to obtain the ID of a call log in the database.
 * <br><b>Purpose:</b> The UI obtains the ID of a call log in the database through this property. The obtained ID is the unique mark of 
 * a call log in the database.
 * <br>The property indicates the ID of a call record in the database
 */
@property(nonatomic, assign)unsigned int dbId;

/**
 * <b>Description:</b> This method is used to delete this piece of call log. Before invoking this method, it is recommanded that the UI should prompt the user with 
 * friendly information, such as a choice box for choosing to continue or cancel. The UI can present different information based on different situations.
 * @see CallLog
 */
- (void)remove;

@end

/** 
 * <b>Description:</b> ContactCallLog interfaces are used to collect statistic information about the call records of a specified number.
 * <br><b>Purpose:</b> The UI invokes methods of this class to collect statistic information about the call records of a number, such as the amount of 
 * incoming calls, the amount of outgoing calls, and the amount of missed calls. The UI needs to create an instance of ContactCallLog when using 
 * parameters or interfaces of this class.
 * <br>For details about a call record, please refer to CallLog.
 */
@interface ContactCallLog : NSObject
{

@private

    PeerInfo* _peerInfo;
    
    unsigned int _lastCallLogId;
    
    NSDate* _lastCallTime;
    
    u_long _lastCallDuration;
    
    CALL_LOG_TYPE _lastCallType;
    
    int _totalUnReadMissing;
    
    int _totalAudioIncoming;
    
    int _totalAudioOutgoing;
    
    int _totalAudioMissing;
    
    int _totalAudioCancel;
    
    int _totalVideoIncoming;
    
    int _totalVideoOutgoing;
    
    int _totalVideoMissing;
    
    int _totalVideoCancel;
}
/**
 * <b>Description:</b> It is used to obtain information of the peer party.
 * <br><b>Purpose:</b> The UI obtains information of the peer party through this property. 
 * The UI obtains an instance of PeerInfo and then sets or gets information about the peer party through properties
 * of PeerInfo.
 * <br>The property indicates an instance of PeerInfo
 */
@property(nonatomic, retain)PeerInfo* peerInfo;
/**
 * <b>Description:</b> It is used to obtain the latest call record ID of the number that is contained in an object.
 * <br><b>Purpose:</b> The UI obtains the latest call record ID of the number through this property. The obtained ID is the unique mark of 
 * a call log in the database.
 * <br>The property indicates the latest call record ID of the number that is contained in an object
 */
@property(nonatomic, assign)unsigned int lastCallLogId;
/**
 * <b>Description:</b> It is used to obtain the start time of the latest call of the contact number contained in the object.
 * <br><b>Purpose:</b> The UI obtains the start time of the latest call of the contact number through this property.
 * <br>The property indicates the start time of the latest call of the contact number that is contained in the object.
 */
@property(nonatomic, retain)NSDate* lastCallTime;
/**
 * <b>Description:</b> It is used to obtain the duration of the latest call of the contact number contained in the object.
 * <br><b>Purpose:</b> The UI obtains the duration of the latest call of the contact number through this property.
 * The duration is measured in seconds.
 * <br>The property indicates the duration of the latest call of the contact that is contained in the object
 */
@property(nonatomic, assign)u_long lastCallDuration;
/**
 * <b>Description:</b> It is used to obtain the type of the latest call of the contact number contained in the object.
 * <br><b>Purpose:</b> The UI obtains the type of the latest call of the contact number through this property. 
 * <br>The property indicates the type of the latest call of the contact number that is contained in the object. 
 * See {@link tag_CALL_LOG_TYPE}
 */
@property(nonatomic, assign)CALL_LOG_TYPE lastCallType;
/**
 * <b>Description:</b> It is used to obtain the amount of all unread missed call records of a number that is contained in the object.
 * <br>The property indicates the amount of all unread call records of a number that is contained in the object.
 */
@property(nonatomic, assign)int totalUnReadMissing;
/**
 * <b>Description:</b> It is used to obtain the amount of all incoming audio calls of a number that is contained in the object.
 * <br>The property indicates the amount of all incoming audio calls of a number that is contained in the object.
 */
@property(nonatomic, assign)int totalAudioIncoming;
/**
 * <b>Description:</b> It is used to obtain the amount of all outgoing audio calls of a number that is contained in the object.
 * <br>The property indicates the amount of all outgoing audio calls of a number that is contained in the object.
 */
@property(nonatomic, assign)int totalAudioOutgoing;
/**
 * <b>Description:</b> It is used to obtain the amount of all missed audio calls of a number that is contained in the object.
 * <br>The property indicates the amount of all missed audio calls of a number that is contained in the object.
 */
@property(nonatomic, assign)int totalAudioMissing;
/** 
 * <b>Description:</b> It is used to obtain the amount of all cancelled audio calls of a number that is contained in the object.
 * <br>The property indicates the amount of all cancelled audio calls of a number that is contained in the object.
 */
@property(nonatomic, assign)int totalAudioCancel;
/** 
 * <b>Description:</b> It is used to obtain the amount of all incoming video calls of a number that is contained in the object.
 * <br>The property indicates the amount of all incoming video calls of a number that is contained in the object.
 */
@property(nonatomic, assign)int totalVideoIncoming;
/** 
 * <b>Description:</b> It is used to obtain the amount of all outgoing video calls of a number that is contained in the object.
 * <br>The property indicates the amount of all outgoing video calls of a number that is contained in the object.
 */
@property(nonatomic, assign)int totalVideoOutgoing;
/** 
 * <b>Description:</b> It is  used to obtain the amount of all missed video calls of a number that is contained in the object.
 * <br>The property indicates the amount of all missed video calls of a number that is contained in the object.
 */
@property(nonatomic, assign)int totalVideoMissing;
/** 
 * <b>Description:</b> It is  used to obtain the amount of all cancelled video calls of a number that is contained in the object.
 * <br>The property indicates the amount of all cancelled video calls of a number that is contained in the object.
 */
@property(nonatomic, assign)int totalVideoCancel;

/**
 * <b>Description:</b> This method is used to delete all call records of a number that is contained in the object. Before invoking this method, it is recommanded that the UI should 
 * prompt the user with friendly information, such as a choice box for choosing to continue or cancel. The UI can present different information based on different situations.
 */
- (void)remove;

@end

/**
 * It is used to notify updates of call logs.
 * When call logs need updates (inserting or deleting call logs), UI will receive a notification named EVENT_CALLLOG_UPDATED.
 */
#define EVENT_CALLLOG_UPDATED @"CALLLOGAPI CALLLOG UPDATED"

/**
 * <b>Description:</b> CallLogApi provides various interfaces to operate call records.
 * <br><b>Purpose:</b> CallLogApi is used to provide an entry for operating call records. The UI invokes methods of this class 
 * to obtain or delete call records.
 * <br>For details about call records of a number, please refer to ContactCallLog. 
 * <br>For details about a call record,  please refer to CallLog.
 */
@interface CallLogApi : NSObject

/**
 * <b>Description:</b> This method is used to initialize APIs of CallLogApi
 * <br><b>Purpose:</b> Before invoking APIs of this class, the UI must invoke this method to initialize them,
 * generally, during the system initialization. 
 */
+ (void)init;

/**
 * <b>Description:</b> This method is used to obtain the call record list.
 * <br><b>Purpose:</b> The UI invokes this method to obtain the call record list. Each number has a unique call record 
 * in the call list. All call records are listed based on the start time, starting from the latest call. Generally, the UI 
 * invokes this method when displaying the call record page. 
 * <br>If the UI does not need to classify call records by numbers, it needs to invoke {@link getCallLogList:}.
 * @param limit Specifies the maximum number of returned call records. If limit <= 0, all call records are returned.
 * @return The value indicates the call record list. An element in the call record list is an object of ContactCallLog.
 */
+ (NSArray*)getContactCallLogList:(int)limit;

/**
 * <b>Description:</b> This method is used to obtain the call record list.
 * <br><b>Purpose:</b> The UI invokes this method to obtain call record list. In the call record list, all calls are
 * listed based on the start time, starting from the latest call. Generally, the UI invokes this method when displaying 
 * the call record page. 
 * @param limit Specifies the maximum number of returned call records. If limit <= 0, all call records are returned.
 * @return The value indicates the call record list. An element in the call record list is an object of CallLog.
 * @see getContactCallLogList:
 */
+ (NSArray*)getCallLogList:(int)limit;

/**
 * <b>Description:</b> This method is used to obtain the latest callee number.
 * <br><b>Purpose:</b> The UI invokes this method to obtain the latest callee number for re-dialing.
 * @return The value indicates the latest callee number
 */
+ (NSString*)getLastOutGoingCallNumber;

/**
 * <b>Description:</b> This method is used to obtain all call records of a number.
 * <br><b>Purpose:</b> The UI invokes this method to obtain all call records of a number. In the obtained call record list, 
 * all calls are listed based on the start time, starting from the latest call. Generally, this method is used together 
 * with {@link getContactCallLogList:}.
 * @param number Specifies the phone number of related call records to be obtained. 
 * @return The value indicates the call record list. An element in the call records list is an object of CallLog.
 */
+ (NSArray*)getCallLogListByNumber:(NSString*)number;

/**
 * <b>Description:</b> This method is used to obtain all call records group by audio call or video call.
 * <br><b>Purpose:</b> The UI invokes this method to obtain all call records group by call type. In the obtained call record list,
 * all calls are listed based on the start time, starting from the latest call. 
 * @param callType Specifies the call type.If the param is not correct,this operation would fail and return nil. See
 *      <ul>
 *         <li><em>{@link TYPE_AUDIO}</em></li>
 *         <li><em>{@link TYPE_VIDEO}</em></li>
 *      </ul> 
 * @return The value indicates the call record list. An element in the call records list is an object of CallLog.
 */
+ (NSArray*)getCallLogListByCallType:(int)callType;

/**
 * <b>Description:</b> This method is used to obtain unread missed call records.
 * <br><b>Purpose:</b> The UI invokes this method to obtain unread missed call records.
 * @return The value indicates the call records list. An element in the call records list is an object of CallLog.
 */
+ (NSArray*)getUnreadMissCallLogs;

/**
 * <b>Description:</b> This method is used to obtain unread missed call records of a number.
 * <br><b>Purpose:</b> The UI invokes this method to obtain unread missed call records of a number. 
 * @param number Specifies the phone number of related call records to be inquired
 * @return The value indicates the call records list. An element in the call records list is an object of CallLog.
 */
+ (NSArray*)getUnreadMissCallLogByNumber:(NSString*)number;

/**
 * <b>Description:</b> This method is used to delete unread missed call records.
 * <br><b>Purpose:</b> The UI invokes this method to delete unread missed call records. Before invoking this method, it is recommanded that the UI
 * should prompt the user with friendly information, such as a choice box for choosing to continue or cancel. The UI can present different information
 * based on different situations.
 */
+ (void)removeUnreadMissCallRecords;

/**
 * <b>Description:</b> This method is used to delete unread missed call records of a number.
 * <br><b>Purpose:</b> The UI invokes this method to delete unread missed call records of a number. Before invoking this method, it is recommanded that 
 * the UI should prompt the user with friendly information, such as a choice box for choosing to continue or cancel. The UI can present different information 
 * based on different situations.
 * @param number Specifies the phone number of related call records to be inquired
 */
+ (void)removeUnreadMissCallRecordsByNumber:(NSString*)number;

/**
 * <b>Description:</b> This method is used to obtain missed call records.
 * <br><b>Purpose:</b> The UI invokes this method to obtain missed call records.
 * @return The value indicates the call records list. An element in the call records list is an object of CallLog.
 */
+ (NSArray* )getMissedCallLogs;

/**
 * <b>Description:</b> This method is used to delete all call records of a number
 * <br><b>Purpose:</b> The UI invokes this method to delete all call records of a number. Before invoking this method, it is recommanded that the UI should 
 * prompt the user with friendly information, such as a choice box for choosing to continue or cancel. The UI can present different information based on different situations.
 * @param number Specifies the phone number of related call records to be deleted.
 * @return YES Indicates that operation succeeds
 *     <br>NO Indicates that operation fails
 */
+ (BOOL)removeAllByNumber:(NSString*)number;

/**
 * <b>Description:</b> This method is used to delete all call records.
 * <br><b>Purpose:</b> The UI invokes this method to delete all call records. Before invoking this method, it is recommanded that the UI should prompt
 * the user with friendly information, such as a choice box for choosing to continue or cancel. The UI can present different information based on different situations.
 */
+ (void)removeAll;

/**
 * <b>Description:</b> This method is used to insert a piece of call record.
 * <br><b>Purpose:</b> The UI invokes this method to insert a piece of call record.
 * @param callLog Specifies the call log to be inserted
 * @return YES Indicates that operation succeeds
 *     <br>NO Indicates that operation fails
 */
+ (BOOL)insert:(CallLog*)callLog;

/**
 * <b>Description:</b> This method is used insert custom call log<br>
 * <b>Purpose:</b> UI invokes this method to insert custom call log.
 *
 * @param callLog
 *            Specifies common fileds of call log to be inserted.
 * @param customInformation
 *            Specifies the custom information of call log that to be inserted.
 * @return YES indicates that succeeds <br>
 *         NO  indicates that fails
 */
+ (BOOL)insertCustom:(CallLog*)callLog customInformation:(NSString*)information;

/**
 * <b>Description:</b> This method is used to obtain latest call records which are grouped by peer numbers.
 * <br><b>Purpose:</b> The UI invokes this method to obtain latest call records which are grouped by peer numbers.
 * @param limit Specifies the maximum number of call records to be deleted. If limit <= 0, all call records that meet 
 * the condition are deleted.
 * @return The value indicates the call records list. An element in the call records list is an object of CallLog.
 */
+ (NSArray *)getLatestCalllogGroupByPeerNumWithLimit:(int)limit;

/**
 * <b>Description:</b> This method is used to release resources in call section. This method is not in use now!
 */
+ (void)release;

/**
 * <b>Description:</b> This method is used to remove calllogs of a number by call log type (such as missed, incoming or outgoing) 
 * <br><b>Purpose:</b> e.g. For a number 15915XXX227, this method will delete the records of specified type of the number 15915XXX227, 
 * but will not delete that of the number +8615915XXX227. Before invoking this method, it is recommanded that the UI should prompt the user
 * with friendly information, such as a choice box for choosing to continue or cancel. The UI can present different information based on different situations.
 * @param number Specifies the number of the contact. The number couldn't be null, otherwise, this operation would fail.
 * @param calllogType Specifies what type of records of a number are deleted. Other illegal params of call log type will bring 
 * this operation to failure. See {@link tag_CALL_LOG_TYPE_DELETE}.
 */
+ (void)removeCalllogsByNumber:(NSString*)number andType:(CALL_LOG_TYPE_DELETE)type;


/**
 * <b>Description:</b> This method is used  to obtain a call record list.
 * <br><b>Purpose:</b> The UI invokes this method to obtain a call record list. In this call record list, the call records of the same
 * call type, same number and same day will be listed together.
 * @param limit Specifies the maximum number of returned call records.
 * @return The value indicates the call records list. An element in the call records list is an object of CallLog.
 */   
+ (NSArray *)getLatestCalllogGroupByPeerNumDayCallTypeWithLimit:(int)limit;

/**
 * <b>Description:</b> This method is used  to obtain call records of a number.
 * <br><b>Purpose:</b> The UI invokes this method to obtain call records of a number. The call records have same call type and started on
 * the same day.
 * @param number Specifies the phone number of related call records to be inquired.
 * @param callType Specifies the call type.If the param is not correct,this operation would fail and return nil. See
 *      <ul>
 *         <li><em>{@link TYPE_AUDIO}</em></li>
 *         <li><em>{@link TYPE_VIDEO}</em></li>
 *      </ul> 
 * @param day Specifies the day of the start time.
 * @return The value indicates the call records list. An element in the call records list is an object of CallLog.
 */
+ (NSArray*)getCallLogListByNumber:(NSString*)number callType:(unsigned int)type day:(long)day;

/**
 * <b>Description:</b> This method is used to obtain a call record list.
 * <br><b>Purpose:</b> The UI invokes this method to obtain a call record list. In this call record list, all calls are
 * listed based on the start time, starting from the latest call. Besides, the missed call records of a number will be 
 * combined to just one record,and the other call records of a number will also be combined to one record.
 * @param limit Specifies the maximum number of returned call records.
 * @return The value indicates the call records list. An element in the call records list is an object of CallLog.
 */   
+ (NSArray *)getCalllogsCombineMissedWithLimit:(int)limit;

@end

@interface CallGroupedLog : CallLog
{
@private
    
    int _count;
    long _day;
    unsigned int _callType;
}

@property(nonatomic, assign)int count;
@property(nonatomic, assign)long day;
@property(nonatomic, assign)unsigned int callType;

@end
