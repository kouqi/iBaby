/**
 * @file ConferenceApi.h
 * @brief Call Interface Functions
 */
#import <Foundation/Foundation.h>
#import "PeerInfo.h"

@class CallSession;

/** Indicates the max count of the participants in a conference */
#define CALL_CONF_MAX_PARTICIPANT_COUNT     5

/** @brief Indicates the status of a participant */
typedef enum tag_CALL_CONF_PTPT_STATUS{
    CALL_CONF_PTPT_STATUS_IDLE = 0,       /**< @brief Indicates the participant initial status */
    CALL_CONF_PTPT_STATUS_INVITING,       /**< @brief Indicates the participant is being invited */
    CALL_CONF_PTPT_STATUS_CONNECTED,      /**< @brief Indicates the participant has connected to the conference */
    CALL_CONF_PTPT_STATUS_DISCONNCTED,    /**< @brief Indicates the participant has disconnected to the conference */
    CALL_CONF_PTPT_STATUS_KICKING,        /**< @brief Indicates the participant is being kicked */
    CALL_CONF_PTPT_STATUS_BUTT            /**< @brief Indicates the invalid participant status*/
} CALL_CONF_PTPT_STATUS;

/** @brief Indicates the error code of a conference */
typedef enum tag_CALL_CONF_ERROR_CODE{
    CALL_CONF_ERROR_CODE_OK = 0,               /**< @brief Indicates no error */
    CALL_CONF_ERROR_CODE_CREATE_FAILED,        /**< @brief Indicates failed to create a conference */
} CALL_CONF_ERROR_CODE;

/** @brief Indicates the error code of a participant */
typedef enum tag_CALL_CONF_PTPT_ERROR_CODE{
    CALL_CONF_PTPT_ERROR_CODE_OK = 0,        /**< @brief Indicates no error */
    CALL_CONF_PTPT_ERROR_CODE_INVITE_FAILED, /**< @brief Indicates failed to invite a participant */
	CALL_CONF_PTPT_ERROR_CODE_KICK_FAILED,   /**< @brief Indicates failed to kick a participant */
} CALL_CONF_PTPT_ERROR_CODE;


/** Indicates the error code of a conference
 *  @see {@link tag_CALL_CONF_ERROR_CODE}
 */
#define PARAM_CALL_CONF_ERR_CODE  @"PARAM_CALL_CONF_ERR_CODE"

/** Indicates the a participant in the conference
 *  @see {@link ConfParticipant}
 */
#define PARAM_CALL_CONF_PARTICIPANT  @"PARAM_CALL_CONF_PARTICIPANT"

/** Indicates the error code of a participant
 *  @see {@link tag_CALL_CONF_PTPT_ERROR_CODE}
 */
#define PARAM_CALL_CONF_PARTICIPANT_ERR_CODE  @"PARAM_CALL_CONF_PARTICIPANT_ERR_CODE"

/** Indicates the NSMutableArray of {@link ConfParticipant} objects
 *  @see {@link ConfParticipant}
 */
#define PARAM_CALL_CONF_PARTICIPANT_ARRAY  @"PARAM_CALL_CONF_PARTICIPANT_ARRAY"

/**
 * <b>Description:</b> It is used to notify that the result of inviting or kicking a participant.
 * <br><b>Purpose:</b> When the UI invites or kicks a participant, the SDK sends this notification after recieving the result from the server.
 * The UI updates the displayed information upon receiving the notification.
 * <p>The notification will have the following extra values:
 * <ul>
 *   <li><em>{@link PARAM_CALL_CONF_PARTICIPANT}</em></li>
 *   <li><em>{@link PARAM_CALL_CONF_PARTICIPANT_ERR_CODE}</em></li>
 * </ul>
 * </p>
 */
#define EVENT_CALL_CONF_PTPT_OPERATTE_RESULLT @"EVENT_CALL_CONF_PTPT_OPERATTE_RESULLT"

/**
 * <b>Description:</b> It is used to notify that the status of one or more participants has changed.
 * <br><b>Purpose:</b> When the status of one or more participants has changed, the SDK sends this notification after recieving the NOTIFY message from the server.
 * The UI updates the displayed information upon receiving the notification.
 * <p>The notification will have the following extra values:
 * <ul>
 *   <li><em>{@link PARAM_CALL_CONF_PARTICIPANT_ARRAY}</em></li>
 * </ul>
 * </p>
 */
#define EVENT_CALL_CONF_PTPT_ARRAY_CHANGED @"EVENT_CALL_CONF_PTPT_ARRAY_CHANGED"

/**
 * <b>Description:</b> ConfParticipant indicates a participant in a conference.
 * <br><b>Purpose:</b> When the UI invites or kicks a participant in a conference, the SDK encapsulates the latest information about the participant in
 * an instance of this class and sends the instance to the UI in the {@link EVENT_CALL_CONF_PTPT_OPERATTE_RESULLT} broadcast. The UI can obtains the number, the uri and the status of the participant through the instance.
 */
@interface ConfParticipant : NSObject
{
}

/**
 * <b>Description:</b> It is used to obtain the peer information of a participant.
 */
@property (nonatomic, retain) PeerInfo* peerInfo;

/**
 * <b>Description:</b> It is used to obtain the latest status of a participant.
 */
@property (nonatomic, assign) int status;

@end

/**
 * <b>Description:</b> ConferenceApi provides various interfaces for audio and video call services.
 * <br><b>Purpose:</b> The UI invokes methods of this class to implement conference services, such as creating a conference etc.
 */
@interface ConferenceApi : NSObject
{}

/**
 * <b>Description:</b> This method is used to create a conference.
 * <br><b>Purpose:</b> The UI invokes this method to create a conference and invite participants or established CallSessions to the conference. If a video call or a conference has been established or a call is establishing, the method shouldn't be invoked.
 * @param callSessionArray Specifies the array of established CallSessions.
 * @param peerUriArray Specifies the array of the participants' uri.
 * @param extParas Specifies extended parameters, it is not used.
 * @return The value indicates CallSession of the conference. If the interface invoked failed, the return value will be nil.
 */
+(CallSession*)createConf:(NSArray*)callSessionArray uriArray:(NSArray*)peerUriArray extParas:(NSMutableDictionary*)extParas;
@end