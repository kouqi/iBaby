/**
 * @file MessagingApi.h
 * <b>Description:</b> MessagingApi provides an entry to messaging services.
 * Using this type of interfaces, the UI accesses APIs for messaging services, including IM and Content Sharing. The Content Sharing service includes image sharing, location sharing, and file sharing.
 */
#ifndef _MESSAGING_API_H_
#define _MESSAGING_API_H_
#import <Foundation/Foundation.h>
#import <CoreGraphics/CGGeometry.h>
#import "PeerInfo.h"

/**
 * It is used to indicates the full path of the file. 
 */
#define PARAM_MESSAGE_FILE_PATH                   @"PARAM_MESSAGE_FILE_PATH"

/**
 * It is used to indicates the size of the file. 
 */
#define PARAM_MESSAGE_FILE_SIZE                   @"PARAM_MESSAGE_FILE_SIZE"

 /**
 * <b>Description:</b> It is used to broadcast the typing status of the peer end.
 * <br><b>Purpose:</b> During a chat, when the peer end is typing texts in the chat box, the SDK sends 
 * {@link EVENT_MESSAGING_COMPOSING} to the UI. Note that the SDK does not send {@link EVENT_MESSAGING_COMPOSING} 
 * when the cursor is moved to the chat box but no text is input.
 * <p>The broadcast will have the following extra values:
 * <ul>
 *   <li><em>{@link PARAM_MESSAGING_PEER_INFO}</em></li> - [NSString* ]
 *   <li><em>{@link PARAM_MESSAGING_COMPOSING_STATUS}</em></li> - [BOOL]
 * </ul>
 */
#define EVENT_MESSAGING_COMPOSING                       @"EVENT_MESSAGING_COMPOSING"

/**
 * It is a broadcast parameter of {@link EVENT_MESSAGING_COMPOSING} indicates the peer info See {@link PeerInfo}.
 */
#define PARAM_MESSAGING_PEER_INFO                       @"PARAM_MESSAGING_PEER_INFO"

/**
 * It is a broadcast parameter of {@link EVENT_MESSAGING_COMPOSING} indicates a typing status. 
 * <ul>
 *    <li><em>YES</em></li> - Indicates that the peer user is typing
 *    <li><em>NO</em></li> - Indicates that the peer user stops typing
 * </ul>
 */
#define PARAM_MESSAGING_COMPOSING_STATUS                @"PARAM_MESSAGING_COMPOSING_STATUS"

/**
 * <b>Description:</b> It is used to broadcast a received message.
 * <br><b>Purpose:</b> When the SDK detects that a new message is received, 
 * it sends {@link EVENT_MESSAGE_INCOMING} to the UI. Message here is different from 
 * short messages. When a client receives a short message, the SDK does not 
 * send {@link EVENT_MESSAGE_INCOMING} to the UI. The message object carried in this 
 * broadcast can be any subclass of Message, such as the file, location, and image.
 * <p>The broadcast will have the following extra value:
 * <ul>
 *   <li><em>{@link PARAM_MESSAGE}</em></li> - Specifies a derived class of Message. For details, see derived classes of Message.
 * </ul>
 */
#define EVENT_MESSAGE_INCOMING                          @"EVENT_MESSAGE_INCOMING"

/**
 * <b>Description:</b> It is used to broadcast a received message.
 * <br><b>Purpose:</b> When UI inserts a custom message,
 * it sends {@link EVENT_INSERT_CUSTOM_MESSAGE} to the UI.
 * <p>The broadcast will have the following extra value:
 * <ul>
 *   <li><em>{@link PARAM_MESSAGE}</em></li> - Specifies a derived class of Message. For details, see derived classes of Message.
 * </ul>
 */
#define EVENT_INSERT_CUSTOM_MESSAGE                          @"EVENT_INSERT_CUSTOM_MESSAGE"

/**
 * It is a broadcast parameter of {@link EVENT_MESSAGE_INCOMING} indicates a derived class of Message. See derived classes of {@link Message}.
 */
#define PARAM_MESSAGE                                   @"PARAM_MESSAGE"

 /**
 * <b>Description:</b> It is used to broadcast the status change of a message.
 * <br><b>Purpose:</b> When the status of a local message changes, the SDK 
 * sends {@link EVENT_MESSAGE_STATUS_CHANGED} to the UI. For example, when the SDK 
 * detects that the peer end has received or read a message, it sends the 
 * {@link EVENT_MESSAGE_STATUS_CHANGED} broadcast to the UI.
 * <p>The broadcast will have the following extra value:
 * <ul>
 *   <li><em>{@link PARAM_MESSAGE}</em></li> - Specifies a derived class of Message. For details, see derived classes of Message. 
 * </ul>
 * <p> The property status of Message object: specifies the status of a message, see {@link tag_MESSAGE_STATUS}.
 */
#define EVENT_MESSAGE_STATUS_CHANGED                    @"EVENT_MESSAGE_STATUS_CHANGED"

 /** 
 * <b>Description:</b> It is used to broadcast the progress of sending a file or an image.
 * <br><b>Purpose:</b> When a subscriber sends or receives a file or an image to or 
 * from other subscribers, the SDK sends {@link EVENT_MESSAGE_PROGRESS_CHANGED} broadcast to 
 * notify the UI of the file or image sending or receiving progress.
 * <p>The broadcast will have the following extra value:
 * <ul>
 *   <li><em>{@link PARAM_MESSAGE}</em></li> - Indicates FileMessage or a derived class of FileMessage. See FileMessage or derived classes of FileMessage.
 * </ul>
 *  <p>The property fileCurSize of FileMessage object: Specifies the sending progress.
 * <br>The property fileTotalSize of FileMessage object: Specifies the total size of a file or an image.
 */
#define EVENT_MESSAGE_PROGRESS_CHANGED                  @"EVENT_MESSAGE_PROGRESS_CHANGED"

/**
 * <b>Description:</b> It is used to broadcast that a video has been compressed.
 * <br><b>Purpose:</b> Before a video is sent, this video is compressed. After the video is compressed, the SDK sends this broadcast.
 * <p>The broadcast will have the following extra value:
 * <ul>
 *   <li><em>{@link PARAM_MESSAGE_VIDEO_FILE_NAME}</em></li> 
 *   <li><em>{@link PARAM_MESSAGE_VIDEO_FILE_SIZE}</em></li> 
 *   <li><em>{@link PARAM_MESSAGE_VIDEO_FILE_DURATION}</em></li> 
 * </ul>
 */
#define EVENT_MESSAGE_VIDEO_COMPRESS_FINISH             @"EVENT_MESSAGE_VIDEO_COMPRESS_FINISH"

/**
 * It is a broadcast parameter of {@link EVENT_MESSAGE_VIDEO_COMPRESS_FINISH} indicates the name of the video.
 */
#define PARAM_MESSAGE_VIDEO_FILE_NAME                   @"PARAM_MESSAGE_VIDEO_FILE_NAME"

/**
 * It is a broadcast parameter of {@link EVENT_MESSAGE_VIDEO_COMPRESS_FINISH} indicates the size of the file.
 */
#define PARAM_MESSAGE_VIDEO_FILE_SIZE                   @"PARAM_MESSAGE_VIDEO_FILE_SIZE"


/**
 * This constant specifies whether an instant message is saved to the local database. 
 * This constant is used together with the (sendText:(NSString *)number msgContent:(NSString *) msg extParas:(NSMutableDictionary*)imExtParas) method.
 * If the UI needs to save the instant message, it sets {@link PARAM_SEND_TEXT_SAVE_DB} to YES. 
 * Otherwise, it sets {@link PARAM_SEND_TEXT_SAVE_DB} to NO. 
 */
#define PARAM_SEND_TEXT_SAVE_DB @"isSaveDB"

/**
 * This constant specifies whether messages are sent in page mode. 
 * This constant is used together with the (sendText:(NSString *)number msgContent:(NSString *) msg extParas:(NSMutableDictionary*)imExtParas) method. 
 * It can be a parameter of intent, indicating whether an instant message is sent in page mode. 
 * If the UI needs to send messages in page mode, set {@link PARAM_SEND_TEXT_PAGE_MODE} to YES. 
 * Otherwise, set {@link PARAM_SEND_TEXT_PAGE_MODE} to NO. 
 * By default, the SDK does not adopt the page mode.
 */
#define PARAM_SEND_TEXT_PAGE_MODE @"isPageMode"

/**
 * <b>Description:</b>  PARAM_SEND_TEXT_IP_PAGE_MESSAGE is a parameter of Boolean type for sending text messages and
 * is used to determine whether messages can be sent using IP short message mode.
 * <br><b>Purpose:</b>PARAM_SEND_TEXT_IP_PAGE_MESSAGE is used with (sendText:(NSString*)msg extParas:(NSMutableDictionary*)imExtParas) and is used to determine
 * whether messages are sent using IP short message mode. If UI needs to use IP short message mode to sent messages,
 * {@link PARAM_SEND_TEXT_IP_PAGE_MESSAGE} is set to true. and the message type is MESSAGE_TYPE_IP_MESSAGE.
 * By default, SDK are not sent using IP short message mode.
 */
#define PARAM_SEND_TEXT_IP_PAGE_MESSAGE @"isIpPageMessage"
/**
 * <b>Description:</b>PARAM_SEND_TEXT_LONGITUDE is a parameter of String type for sending text messages and
 * is used to carry longitudes in the geographic location information contained in text messages to be sent.
 * <br><b>Purpose:</b> PARAM_SEND_TEXT_LONGITUDE is used with (sendText:(NSString*)msg extParas:(NSMutableDictionary*)imExtParas) and is a parameter in imExtParas.
 * If the geographic location information (geo location) needs to be carried in a text message,
 * the UI sets PARAM_SEND_TEXT_LONGITUDE to the longitude in the geographic location information.
 * The {@link PARAM_SEND_TEXT_LATITUDE} and {@link PARAM_SEND_TEXT_ACCURACY} parameters also must be set.
 * If the UI needs to obtain the geographic location information in a text message,
 * it invokes {@link TextMessage::getTextParam}, such as NSString* longitude = [textMessage getTextParam:PARAM_SEND_TEXT_LONGITUDE];
 */
#define PARAM_SEND_TEXT_LONGITUDE @"longitude"
/**
 * <b>Description:</b> PARAM_SEND_TEXT_LATITUDE is a parameter of String type for sending text messages and
 * is used to carry latitudes in the geographic location information contained in text messages to be sent.
 * <br><b>Purpose:</b>PARAM_SEND_TEXT_LATITUDE is used with (sendText:(NSString*)msg extParas:(NSMutableDictionary*)imExtParas) and is a parameter in imExtParas.
 * If the geographic location information (geo location) needs to be carried in a text message,
 * the UI sets PARAM_SEND_TEXT_LATITUDE to the latitude in the geographic location information.
 * The {@link PARAM_SEND_TEXT_LONGITUDE} and {@link PARAM_SEND_TEXT_ACCURACY} parameters also must be set.
 * If the UI needs to obtain the geographic location information in a text message,
 * it invokes {@link TextMessage::getTextParam}, such as NSString* latitude = [textMessage getTextParam:PARAM_SEND_TEXT_LATITUDE];
 */
#define PARAM_SEND_TEXT_LATITUDE @"latitude"
/**
 * <b>Description:</b> PARAM_SEND_TEXT_ACCURACY is a parameter of String type for sending text messages and
 * is used to carry accuracy in the geographic location information contained in text messages to be sent.
 * <br><b>Purpose:</b>PARAM_SEND_TEXT_ACCURACY is used with (sendText:(NSString*)msg extParas:(NSMutableDictionary*)imExtParas) and is a parameter in imExtParas.
 * If the geographic location information (geo location) needs to be carried in a text message,
 * the UI sets PARAM_SEND_TEXT_ACCURACY to the accuracy in the geographic location information.
 * The {@link PARAM_SEND_TEXT_LATITUDE} and {@link PARAM_SEND_TEXT_LONGITUDE} parameters also must be set.
 * If the UI needs to obtain the geographic location information in a text message,
 * it invokes {@link TextMessage::getTextParam}, such as NSString* accuracy = [textMessage getTextParam:PARAM_SEND_TEXT_ACCURACY];
 */
#define PARAM_SEND_TEXT_ACCURACY @"accuracy"
/**
 * <b>Description:</b> PARAM_SEND_TEXT_SEND_MODE is a parameter of Int type for sending text messages and is used to set the message sending mode.
 * <br><b>Purpose:</b>PARAM_SEND_TEXT_SEND_MODE is used with (sendText:(NSString*)msg extParas:(NSMutableDictionary*)imExtParas) and is a parameter in imExtParas.
 * The UI adds this parameter to intent if the text message sending mode needs to be set.
 * The value of this parameter can be {@link TEXT_SEND_MODE_OFFLINE_SMS} or {@link TEXT_SEND_MODE_FORCE_SMS}.
 * The returned message types of the TextMessage object are {@link MESSAGE_TYPE_TEXT_OFFLINE_SMS} and {@link MESSAGE_TYPE_TEXT_FORCE_SMS}
 * respectively.
 **/
#define PARAM_SEND_TEXT_SEND_MODE @"textSendMode"
/**
 * Indicates text send mode.
 */
typedef enum tag_TEXT_SEND_MODE
{
    
	TEXT_SEND_MODE_OFFLINE_SMS = 2,/**< @brief <b>Description:</b> TEXT_SEND_MODE_OFFLINE_SMS is a text message sending mode specifying
                                    * that the server converts instant messages into short messages before sending them to the receiver if the receiver is offline.
                                    * <br><b>Purpose:</b>TEXT_SEND_MODE_OFFLINE_SMS is a value of {@link PARAM_SEND_TEXT_SEND_MODE} in imExtParas of (sendText:(NSString*)msg extParas:(NSMutableDictionary*)imExtParas).
                                    * It is used to specify that the server converts instant messages to short messages before sending them to the receiver
                                    * if the receiver is offline and that the server sends instant messages to receivers without conversion if the receiver is online.
                                    * The message type corresponding to this message sending mode is {@link MESSAGE_TYPE_TEXT_OFFLINE_SMS}
                                    */
    
	TEXT_SEND_MODE_FORCE_SMS /**< @brief <b>Description:</b> TEXT_SEND_MODE_FORCE_SMS is a text message sending mode specifying
                             * that the server is forced to convert instant messages into short messages before sending them to the receiver.
                             * <br><b>Purpose:</b>TEXT_SEND_MODE_FORCE_SMS is a value of {@link PARAM_SEND_TEXT_SEND_MODE} in intent of (sendText:(NSString*)msg extParas:(NSMutableDictionary*)imExtParas).
                             * It is used to specify that the server is forced to convert instant messages into short messages before sending them to the receiver
                             * regardless of whether the receiver is offline. The message type corresponding to this message sending mode is
                             * {@link MESSAGE_TYPE_TEXT_FORCE_SMS}.
                             */
} TEXT_SEND_MODE;

/**
 * It is a broadcast parameter of broadcast {@link EVENT_MESSAGE_VIDEO_COMPRESS_FINISH}, indicates the duration for the video.
 */
#define PARAM_MESSAGE_VIDEO_FILE_DURATION               @"PARAM_MESSAGE_VIDEO_FILE_DURATION"

 /**
 * <b>Description:</b> It is used to broadcast the result of creating a group chat.
 * <br><b>Purpose:</b> When the peer end invokes the static method GroupConversation::createGroup to create a group chat, the SDK sends EVENT_GROUP_CREATE to notify the UI whether the group chat is 
 * successfully created. Only the group chat initiator can receive the 
 * EVENT_GROUP_CREATE broadcast.
 * <p>The broadcast will have the following extra values:
 * <ul>
 *   <li><em>{@link PARAM_GROUP_ID}</em></li> - [NSString*]
 *   <li><em>{@link PARAM_STATUS}</em></li> - [BOOL]
 * </ul>
 * <p>The parameter PARAM_STATUS will have the following extra values:
 * <ul>
 *   <li><em>YES</em></li> - Indicates a group chat creation success
 *   <li><em>NO</em></li> - Indicates a group chat creation failure
 * </ul>
 */
#define EVENT_GROUP_CREATE               @"EVENT_GROUP_CREATE"

/**
 * It is a broadcast parameter of some broadcasts (for example {@link EVENT_GROUP_DELETED}), indicates the ID for the group chat.
 */
#define PARAM_STATUS               @"PARAM_STATUS"

/**
 * It is a broadcast parameter of some broadcasts (for example {@link EVENT_GROUP_MEMBER_CHANGE}), indicates the ID for the group chat.
 */
#define PARAM_GROUP_ID                      @"PARAM_GROUP_ID"

 /**
 * <b>Description:</b> It is used to broadcast a member change in a group chat.
 * <br><b>Purpose:</b> When a member joins or leaves a group chat, the SDK 
 * sends EVENT_GROUP_MEMBER_CHANGE to the UI. If a member leaves a group chat, 
 * all remaining members receive the EVENT_GROUP_MEMBER_CHANGE broadcast. 
 * If a member joins a group chat, all original members receive the 
 * EVENT_GROUP_MEMBER_CHANGE broadcast.
 * <p>The broadcast will have the following extra values:
 * <ul>
 *   <li><em>{@link PARAM_GROUP_ID}</em></li> [NSString*]
 *   <li><em>{@link PARAM_COUNT}</em></li> - Indicates the total number of members in a group conversation
 * </ul>
 */
#define EVENT_GROUP_MEMBER_CHANGE        @"EVENT_GROUP_MEMBER_CHANGE"

/**
 * It is a broadcast parameter of {@link EVENT_GROUP_MEMBER_CHANGE} indicates the number of members in the chat.
 */
#define PARAM_COUNT               @"PARAM_COUNT"

 /**
 * <b>Description:</b> It is used to broadcast a group chat timeout and deletion.
 * <br><b>Purpose:</b> When a group chat is deleted, fails to be created, or does not 
 * receive or send messages in a period, the SDK sends EVENT_GROUP_DELETED to the UI. 
 * All members in the group chat receive the EVENT_GROUP_DELETED broadcast.
 * <p>The broadcast will have the following extra values:
 * <ul>
 *   <li><em>{@link PARAM_GROUP_ID}</em></li> - Identifies a group chat [NSString*]
 *   <li><em>{@link PARAM_STATUS}</em></li> - [BOOL]
 * </ul>
 * <p>The parameter PARAM_STATUS will have the following extra values:
 * <ul>
 *   <li><em>YES</em></li> - Indicates that a user successfully exits from the group chat
 *   <li><em>NO</em></li> - Indicates that a user fails to exit from the group chat
 * </ul>
 */
#define EVENT_GROUP_DELETED        @"EVENT_GROUP_DELETED"

/**
 * <b>Description:</b> It is used to nofify of a group chat request.
 * <br><b>Purpose:</b> When a client receives a group chat request, the SDK sends
 * MessagingApi.EVENT_GROUP_INVITE to notify the UI of this request. The UI can 
 * invoke groupIvtAccept(String globalGroupId) to accept the request and invoke 
 * groupIvtReject(String globalGroupId) to reject the request. It is recommended
 * that the UI perform interception on this broadcast during the running of the 
 * software.
 * <p>The broadcast will have the following extra values:
 * <ul>
 *   <li><em>{@link PARAM_GROUP_ID}</em></li> - Identifies a group chat [NSString*]
 *   <li><em>{@link PARAM_CHAIRMAN}</em></li> - Specifies the uri of creating the group [NSString*]
 *  <li><em>{@link PARAM_SUBJECT}</em></li> - Specifies the subject of the group [NSString*]
 * </ul>
 */
#define EVENT_GROUP_INVITE        @"EVENT_GROUP_INVITE"

/**
 * It is a broadcast parameter of {@link EVENT_GROUP_INVITE} indicates the uri of creating the group.
 */
#define PARAM_CHAIRMAN               @"PARAM_CHAIRMAN"

/**
 * It is a broadcast parameter of {@link EVENT_GROUP_INVITE} indicates the subject of the group.
 */
#define PARAM_SUBJECT               @"PARAM_SUBJECT"

/**
 * <b>Description:</b> It is used to broadcast the message indicating whether the group chat service has been canceled.
 * <br><b>Purpose:</b> The SDK sends this broadcast when a member is canceled.
 * <p>The broadcast will have the following extra values:
 * <ul>
 *   <li><em>{@link PARAM_GROUP_ID}</em></li> - [NSString*]
 *   <li><em>{@link PARAM_STATUS}</em></li> - Indicates whether a user successfully canceled [BOOL]
 * </ul>
 */
#define EVENT_GROUP_CANCELED       @"EVENT_GROUP_CANCELED"


 /**
 * <b>Description:</b> It is used to broadcast the play status changed of a voice message.
 * <br><b>Purpose:</b> It is used to broadcast that the audio playing is completed. Users use the IM UI to play the audio. After the audio playing is complete, the SDK sends this broadcast.
 * <p>The broadcast will have the following extra values:
 * <ul>
 *   <li><em>{@link PARAM_MESSAGE_KEYID}</em></li> 
 *   <li><em>{@link PARAM_STATUS}</em></li> - Indicates the play status of a voice message [BOOL]
 * </ul>
 * <p>The parameter PARAM_STATUS will have the following extra values:
 * <ul>
 *   <li><em>YES</em></li> - Indicates that the video is being played
 *   <li><em>NO</em></li> - Indicates that the video is stopped
 * </ul>
 */
#define EVENT_VOICE_MESSAGE_PLAY_STATUS_CHANGED       @"EVENT_VOICE_MESSAGE_PLAY_STATUS_CHANGED"

/**
 * It is a broadcast parameter of {@link EVENT_VOICE_MESSAGE_PLAY_STATUS_CHANGED} indicates the message ID. 
 */
#define PARAM_MESSAGE_KEYID                         @"PARAM_MESSAGE_KEYID"

 /**
 * <b>Description:</b> It is used to broadcast the reason of a message sending failure.
 * <br><b>Purpose:</b> The SDK has defined several reasons of message sending failure. 
 * When the UI sends a message, the SDK determines whether the message meets the 
 * sending conditions. If the SDK determines that the reason of message sending 
 * failure is one of the defined ones. It sends EVENT_MESSAGE_ERROR_NOTIFY carrying 
 * the reason of message sending failure to the UI. The SDK does not send the message 
 * or add the message to the local database.
 * <p>The broadcast will have the following extra value:
 * <ul>
 *   <li><em>{@link PARAM_MESSAGE_ERROR_TYPE}</em></li> - Specifies the failure type [int]
 * </ul>
  */
#define EVENT_MESSAGE_ERROR_NOTIFY       @"EVENT_MESSAGE_ERROR_NOTIFY"

/**
 * It is a broadcast parameter of {@link EVENT_MESSAGE_ERROR_NOTIFY} indicates the error type of a message. 
 * @see tag_MESSAGE_ERROR_TYPE
 */
#define PARAM_MESSAGE_ERROR_TYPE         @"PARAM_MESSAGE_ERROR_TYPE"

/**
 * <b>Description:</b> It is used to broadcast the change in the conversation.
 * <br><b>Purpose:</b> When SDK detect a message's status change, and the message is the last one of a session, SDK will send this broadcast to notify UI.
 * <p>The broadcast will have the following extra value:
 * <ul>
 *    <li><em>{@link PARAM_MESSAGE_CONVERSATION}</em></li> - [MessageConversation*]
 * </ul>
 */
#define EVENT_MESSAGE_CONVERSATION_CHANGE_NOTIFY       @"EVENT_MESSAGE_CONVERSATION_CHANGE_NOTIFY"

/**
 * It is a broadcast parameter of {@link EVENT_MESSAGE_CONVERSATION_CHANGE_NOTIFY} indicates a conversation.
 */
#define PARAM_MESSAGE_CONVERSATION         @"PARAM_MESSAGE_CONVERSATION"


/**
 * <b>Description:</b> This broadcast is used when a new IpMessage broadcast is received.
 * <br><b>Purpose:</b> When the SDK receives a new IpMessage, it sends the EVENT_IPMESSAGE_INCOMING 
 * broadcast to the UI. Note that the SDK does not save the IpMessage to the local database. If the IpMessage 
 * is a message segment, the UI needs to save the message. The UI restore the message after receiving all 
 * message segments.
 * <p>The broadcast will have the following extra value:
 * <ul>
 *    <li><em>{@link PARAM_MESSAGE}</em></li> - [IpMessage *]
 * </ul>
 */
#define EVENT_IPMESSAGE_INCOMING                        @"EVENT_IPMESSAGE_INCOMING"

/** 
 * <b>Description:</b> This broadcast is used to notify the UI of transmission result of an IpMessage. 
 * It can be either of the two states: success or failure.
 * <br><b>Purpose:</b> The UI is notified of the transmission result of an IpMessage using this broadcast. 
 * Currently, the SDK supports only two results: success (0) and failure (1). The UI needs to use the 
 * {@link IpMessage.MESSAGE_KEY_GLOBAL_MSG_ID} parameter to determine the IpMessage based on which this 
 * broadcast is sent.
 * <p>The broadcast dictionary will have the following extra values:
 * <ul>
 *    <li><em>{@link MESSAGE_KEY_GLOBAL_MSG_ID}</em></li> - [NSString*]
 *    <li><em>{@link MESSAGE_KEY_MSG_STATUS_CODE}</em></li> - [NSNumber*]
 * </ul>
 */
#define EVENT_IPMESSAGE_STATUS_CHANGED                  @"EVENT_IPMESSAGE_STATUS_CHANGED"


/** When UI receive {@link EVENT_IPMESSAGE_STATUS_CHANGED} broadcast, need to get the {@link MESSAGE_KEY_MSG_STATUS_CODE} through PARAM_IPMESSAGE_STATUS_CHANGED. */
#define PARAM_IPMESSAGE_STATUS_CHANGED                  @"PARAM_IPMESSAGE_STATUS_CHANGED"

/**
 * <b>Description:</b> This broadcast is used when a IpMessage is delivered.
 * <br><b>Purpose:</b> When the SDK receives a "delivered" report for an IpMessage, it sends this broadcast. 
 * The UI needs to use the {@link IpMessage.MESSAGE_KEY_GLOBAL_MSG_ID} parameter to determine the message for which is 
 * "delivered" report is sent.
 * <p>The broadcast dictionary will have the following extra values:
 * <ul>
 *    <li><em>{@link MESSAGE_KEY_GLOBAL_MSG_ID}</em></li> - [NSString*]
 *    <li><em>{@link MESSAGE_SUBMIT_TIME}</em></li> - [NSString*]
 *    <li><em>{@link MESSAGE_DONE_TIME}</em></li> - [NSString*]
 *    <li><em>{@link MESSAGE_KEY_MSG_STATUS_CODE}</em></li> - [int]
 *    <li><em>{@link MESSAGE_KEY_MSG_ERR_CODE}</em></li> - [int]
 * </ul>
 */
//#define EVENT_IPMESSAGE_RECEIPT_STATUS                  @"EVENT_IPMESSAGE_RECEIPT_STATUS"

/** When UI receive {@link EVENT_IPMESSAGE_RECEIPT_STATUS} broadcast, need to get the {@link MESSAGE_KEY_MSG_STATUS_CODE} through PARAM_IPMESSAGE_RECEIPT_STATUS. */
//#define PARAM_IPMESSAGE_RECEIPT_STATUS                  @"PARAM_IPMESSAGE_RECEIPT_STATUS"

 /** 
 * <b>Description:</b> It is used when the attribute of a group chat that has been saved to the contact list changes.
 * <br><b>Purpose:</b> The SDK sends {@link EVENT_MESSAGE_GROUP_CONVERSATION_CONTACT_CHANGED_NOTIFY} when 
 * the attribute of the group chat that has been saved to the contact list changes, 
 * including the subject of the group chat changes, a new chat is saved as a contact, 
 * the saved group chat is deleted from the contact list, and the subscriber exits the 
 * saved group chat.
 */
#define EVENT_MESSAGE_GROUP_CONVERSATION_CONTACT_CHANGED_NOTIFY                 @"EVENT_MESSAGE_GROUP_CONVERSATION_CONTACT_CHANGED_NOTIFY"

/**
 * <b>Description:</b> This broadcast is used when adding members failed in a group chat.
 * <br><b>Purpose:</b> When the SDK receives failed message of adding members, it sends this notification
 * to the UI.
 */
#define EVENT_MESSAGE_GROUP_MEMBER_ADD_FAILED                 @"EVENT_MESSAGE_GROUP_MEMBER_ADD_FAILED"

/**
 * <b>Description:</b> This broadcast is used when removing member failed in a group chat.
 * <br><b>Purpose:</b> When the SDK receives failed message of removing member, it sends this notification 
 * to the UI.
 */
#define EVENT_MESSAGE_GROUP_MEMBER_REMOVE_FAILED                 @"EVENT_MESSAGE_GROUP_MEMBER_REMOVE_FAILED"

/**
 * Indicates that an IP short message is not split.
 */
#define CLASSS_COMMON   0

/**
 * Indicates that an IP short message is split.
 */
#define CLASSS_SPLIT   1

/**
 * Indicates the 0-level priority of an IP short message.
 */
#define  PRIORITY_NON_URGENT  0

/**
 * Indicates the 1-level priority of an IP short message.
 */
#define PRIORITY_NORMAL      1

/**
 * Indicates the 2-level priority of an IP short message.
 */
#define  PRIORITY_URGENT      2

/**
 * Indicates the 3-level priority of an IP short message.
 */
#define  PRIORITY_EMERGENCY   3

/**
 * Indicates that IP short message content is encoded using ASCII.
 */
#define DATA_CODING_ASCII    @"ASCII"

/**
 * Indicates that IP short message content is encoded using GB18030.
 */
#define DATA_CODING_GB18030  @"GB18030"

/**
 * Indicates that IP short message content is encoded using UTF_8.
 */
#define DATA_CODING_UTF_8    @"UTF-8"

/**
 * Indicates that IP short message content is encoded using UCS2.
 */
#define DATA_CODING_UCS2     @"UCS2"

/**
 * Specifies the transmission result of a message. The values can be the following:
 * <ul>
 *    <li><em>0</em></li> - The message is successfully sent to the server
 *    <li><em>1</em></li> - The message fails to be sent to the server
 * </ul>
 */
#define MESSAGE_KEY_MSG_STATUS_CODE  @"status_code"

/**
 * Indicates the error code returned after an IP short message is sent.
 */
#define MESSAGE_KEY_MSG_ERR_CODE  @"error_code"

/**
 * Indicates the time when an IP short message is sent.
 */
#define  MESSAGE_SUBMIT_TIME  @"message_submit_time"

/**
 * Indicates the validity period of an IP short message.
 */
#define  MESSAGE_DONE_TIME  @"message_done_time"

/**
 * Uniquely specifies an IpMessage. It is a message ID. This parameter determines the message based on which the broadcast is sent.
 */
#define MESSAGE_KEY_GLOBAL_MSG_ID  @"global_message_id"

/**
 * Indicates the codec used to encode and decode an IP short message.
 */
#define  MESSAGE_DATA_CODING  @"message_data_coding"

/**
 * Indicates the contents of IP short messages.
 */
#define MESSAGE_KEY_MSG_CONTENT    @"message_content"

/**
 * Indicates the length of an IP short message.
 */
#define MESSAGE_LONG_MSG_LEN   @"long_message_lenth"

/**
 * Indicates that major configuration type of user agent content.
 */
#define  CONFIG_MAJOR_TYPE_USER_AGENT   20

/**
 * Indicates the max message type value.
 */
#define MAX_MESSAGE_TYPE 9999

/**
 * Indicates the receive file exceeded the time limit.
 */
#define FILE_VALIDITY_OVERTIME 0xFFFFFFFF

/** Indicates the types of Sa IM message type
* It is same as Sa_IM_MsgType
*/
typedef enum tag_MESSAGE_IM_MSGTYPE
{
    MESSAGE_TYPE_TXTMSG = 0,  /*txt message*/
    MESSAGE_TYPE_TIMEMSG,     /*use for UI display a time contains a group messages(make messages from the nearest  previous time span less than 5 minutes as a group)*/
    MESSAGE_TYPE_MAPMSG ,     /*lbs message*/
    MESSAGE_TYPE_PICMSG ,     /*image message*/
    MESSAGE_TYPE_VIDEOMSG,    /*Video message*/
    MESSAGE_TYPE_FILEMSG ,    /*common file message*/
    MESSAGE_TYPE_PTTMSG ,     /*push to tack message*/
    MESSAGE_TYPE_VCARDMSG,    /*vcard message*/
    MESSAGE_TYPE_DRAFTMSG,    /*draft message*/
    MESSAGE_TYPE_TIPMSG,      /*tip message*/
    MESSAGE_TYPE_NULLMSG,      /*reserverd*/
    MESSAGE_TYPE_IPMSG,        /*ip sms message*/
    MESSAGE_TYPE_TXTMSG_OFFLINE_STORE,      /*starhub offline store*/
    MESSAGE_TYPE_TXTMSG_OFFLINE_SMS,      /*starhub offline sms*/
    MESSAGE_TYPE_TXTMSG_FORCE_SMS,      /*starhub force sms*/
    MESSAGE_TYPE_FORCE_SESS,
    MESSAGE_TYPE_MAXMSGTYPE = 9999,
    
}MESSAGE_IM_MSGTYPE;

/** Indicates the types of Sa Send message status type 
* It is same as Sa_IM_SendStatus_Type 
*/
typedef enum tag_MESSAGE_IM_SENDSTATUS_TYPE
{
    SENDSTATUS_TYPE_IM_INIT = 0,              /*message initial status*/
    SENDSTATUS_TYPE_IM_SEND_OK = 100,               /*send ok */
    SENDSTATUS_TYPE_IM_SEND_FAILED = 401,           /*send fail*/
    SENDSTATUS_TYPE_IM_DELIVER_OK,            /*deliver ok*/
    SENDSTATUS_TYPE_IM_DELIVER_FAILED,        /*deliver failed*/
    SENDSTATUS_TYPE_IM_DISPLAY_OK = 600,            /*display ok*/
}MESSAGE_IM_SENDSTATUS_TYPE;

/** Indicates the types of Send image/file status type 
* It is same as Sa_Share_SendStatus_Type 
*/
typedef enum tag_MESSAGE_SHARE_SENDSTATUS_TYPE
{
    SENDSTATUS_TYPE_SHARE_ACCEPTED = 101,                    /*peer accepted */
    SENDSTATUS_TYPE_SHARE_SENDING,                     /*sending*/
    SENDSTATUS_TYPE_SHARE_READY,                       /*at the begining of recv and send share */
    SENDSTATUS_TYPE_SHARE_SEND_FAIL = 401,             /*send fail */
    SENDSTATUS_TYPE_SHARE_SEND_OK = 403,                    /*send ok*/
    SENDSTATUS_TYPE_SHARE_REJECTED = 500,                     /*peer rejected */
    SENDSTATUS_TYPE_SHARE_DELIVER_CANCEL,              /*cancel by sender*/
    SENDSTATUS_TYPE_SHARE_SEND_PEER_CANCEL,      /*peer cancel */
}MESSAGE_SHARE_SENDSTATUS_TYPE;

/** Indicates the types of Sa receive image/file status type 
* It is same as Sa_Share_RecStatus_Type 
*/
typedef enum tag_MESSAGE_SHARE_RECSTATUS_TYPE
{
    RECSTATUS_TYPE_SHARE_REC_ACCEPTED = 101,          /*peer accepted */
    RECSTATUS_TYPE_SHARE_RECEIVING,             /*receiving*/
    RECSTATUS_TYPE_SHARE_REC_OK,                /*receive ok*/
    RECSTATUS_TYPE_SHARE_REC_FAIL = 401,        /*receive fail */
    RECSTATUS_TYPE_SHARE_REC_INV,                /*receive invite */
    RECSTATUS_TYPE_SHARE_REC_REJECTED = 500,          /*peer rejected */
    RECSTATUS_TYPE_SHARE_REC_CANCEL,             /*cancel by receiver*/
    RECSTATUS_TYPE_SHARE_REC_PEER_CANCEL,   /*peer cancel */
}MESSAGE_SHARE_RECSTATUS_TYPE;

/** Indicates the types of Sa peer type
* It is same as Sa_IM_PeerType 
*/
typedef enum tag_MESSAGE_IM_PEERTYPE
{
    PEER_TYPE_FRIEND = 0,  /*peer is a friend */
    PEER_TYPE_STRANGER,    /*peer is a stranger*/
    PEER_TYPE_GROUP,       /*peer is group*/
    PEER_TYPE_RCSTEAM,     /*peer RcsTeam*/
    PEER_TYPE_SYSTEM,      /*peer is system*/
    PEER_TYPE_MASS,        /*peer is mass*/
    PEER_TYPE_CUSTOM,       /*peer is custom*/
    PEER_TYPE_ENTERPRISE_BULLETIN  /*peer is enterprise */
}MESSAGE_IM_PEERTYPE;

/** This enumeration is used to indicates the message type. It can be used as the value of the property type of Message object. */
typedef enum tag_MESSAGE_TYPE
{
    
    MESSAGE_TYPE_SYS_TEXT,            /**< @brief This constant is an instant message used to carry the notifications delivered from the system or server to subscribers. For example, the UI invokes * MessagingApi::setWelcomeMessage to add a {@link MESSAGE_TYPE_SYS_TEXT} message to the database. */
    
    MESSAGE_TYPE_TEXT ,               /**< @brief Indicates an IM message but not system short message. */
    
    MESSAGE_TYPE_TIME_LINE,           /**< @brief Indicates an time line messages. */
    
    MESSAGE_TYPE_DRAFT,               /**< @brief Indicates a draft message. */
    
    MESSAGE_TYPE_LOCATION,            /**< @brief Indicates a location messages. */
   
    MESSAGE_TYPE_FILE,                /**< @brief Indicates a file messages. */
    
    MESSAGE_TYPE_IMAGE,               /**< @brief Indicates a image messages. */
   
    MESSAGE_TYPE_VOICE,               /**< @brief Indicates a voice messages. */
    
    MESSAGE_TYPE_VIDEO,               /**< @brief Indicates a video messages. */
    
    MESSAGE_TYPE_VCARD,               /**< @brief Indicates a name card messages. */
    
    MESSAGE_TYPE_TIPS,                /**< @brief Currently, it is not used. */
    
    MESSAGE_TYPE_IP_MESSAGE,          /**< @brief Indicates an IP message. */
    
    MESSAGE_TYPE_TEXT_FORCE_SMS,      /**< @brief Specifies a message type. It indicates that the server is forced to convert instant messages into short messages regardless of
                                       * whether the receiver is offline. This message type is generated only when the sender sends messages using TEXT_SEND_MODE_FORCE_SMS mode
                                       * and is used only for the sender.
                                       */
    
    MESSAGE_TYPE_TEXT_OFFLINE_SMS,     /**< @brief Specifies a message type. It indicates that the server converts instant messages into short messages when the receiver is offline.
                                       * This message type is generated only when the sender sends messages using TEXT_SEND_MODE_OFFLINE_SMS mode and is used only for the sender.
                                       */
    
    MESSAGE_TYPE_SA_MAX_VALUE = MAX_MESSAGE_TYPE  /**< @brief Indicates the max message type value.     */

}MESSAGE_TYPE;

/** This enumeration is used to indicates the tip message type. It can be used as the value of the property type of Message object. */
typedef enum tag_TIP_MESSAGE_TYPE
{
    
    MESSAGE_TIP_TYPE_NONE,            /**< @brief Indecates no tip message type */
    MESSAGE_TIP_TYPE_MEMBER_ENTER,    /**< @brief Indecates tip message type member enter group*/
    MESSAGE_TIP_TYPE_MEMBER_EXIT,     /**< @brief Indecates tip message type member exit group*/
    MESSAGE_TIP_TYPE_GROUP_END,       /**< @brief Indecates tip message type group end*/
    
    MESSAGE_TIP_TYPE_SA_MAX_VALUE = MAX_MESSAGE_TYPE  /**< @brief Indicates the max tip message type value.     */
    
}TIP_MESSAGE_TYPE;

/** This enumeration is used to indicates the group type. It can be used as the value of the property type of GroupConversation object. */
typedef enum tag_GROUP_TYPE
{
    GROUP_TYPE_TEMP,            /**< @brief Indecates it is a temporary group */
    GROUP_TYPE_PUBGROUP,        /**< @brief Indecates it is a pub group*/
    GROUP_TYPE_SA_MAX_VALUE = MAX_MESSAGE_TYPE  /**< @brief Indicates the max group type value.     */
    
}GROUP_TYPE;

/** This enumeration is used to indicates the message status. It can be used as the value of the property status of Message object. */
typedef enum tag_MESSAGE_STATUS
{  
    MESSAGE_STATUS_DRAFT,          /**< @brief This constant indicates the message status: saved as a draft. For example, when the UI invokes the 
	 * MessagingApi::saveDraft method of a session object to save the message as a draft, the message status is in draft state. */
	 
    MESSAGE_STATUS_PROGRESSING,     /**< @brief This constant indicates the message status: in progress of sending or receiving. For example, when the UI sends or receives a large size file, 
	* the message status is {@link MESSAGE_STATUS_PROGRESSING} before the sending or receiving is complete. In addition, the UI may receive the {@link EVENT_MESSAGING_COMPOSING} broadcast. */
	
    MESSAGE_STATUS_SEND_FAILED,     /**< @brief This constant indicates the message status: failed to send. Only the sender can receive 
	 * {@link MESSAGE_STATUS_SEND_FAILED}. For example, if a message fail to be delivered to the server after the message is sent due to network problems or transmission timeout, 
	 * the sender receives the {@link EVENT_MESSAGE_STATUS_CHANGED} broadcast and the message status becomes {@link MESSAGE_STATUS_SEND_FAILED}. */
	 
    MESSAGE_STATUS_SEND_OK,         /**< @brief This constant indicates the message status: successfully sent. Only the sender can receive {@link MESSAGE_STATUS_SEND_OK}. 
	 * After a message is successfully sent to the server from the UI, the sender receives the {@link EVENT_MESSAGE_STATUS_CHANGED} broadcast 
	 * and the message status becomes {@link MESSAGE_STATUS_SEND_OK}. */
	
    MESSAGE_STATUS_DELIVERY_FAILED, /**< @brief This constant indicates the message status: fails delivered. */
	
    MESSAGE_STATUS_DELIVERY_OK,     /**< @brief This constant indicates the message status: successfully delivered. This status applies only to senders. Only the sender can receive 
	 * {@link MESSAGE_STATUS_DELIVERY_FAILED}. After a message is successfully delivered to the peer end, the sender receives 
	 * the {@link EVENT_MESSAGE_STATUS_CHANGED} broadcast and the message status becomes {@link MESSAGE_STATUS_DELIVERY_FAILED}. */
	
    MESSAGE_STATUS_DISPLAY_OK,      /**< @brief This constant indicates the message status: read by recipient. Only the sender can receive 
	 * {@link MESSAGE_STATUS_DISPLAY_OK}. After the recipient reads the received message by invoking the read method, 
	 * the sender may receive the {@link EVENT_MESSAGE_STATUS_CHANGED} broadcast. In this case, the message status becomes {@link MESSAGE_STATUS_DISPLAY_OK}. For details, see read.*/ 
	
    MESSAGE_STATUS_CANCELLED,      /**< @brief This constant indicates message sending has been canceled by a sender or message receiving has been canceled by a receiver. */
	
	MESSAGE_STATUS_PEER_CANCELLED,  /**< @brief This constant indicates message sending has been canceled by peer endpoint. */     
	
    MESSAGE_STATUS_RECV_INV,        /**< @brief This constant indicates receiving a message invite from a senders. */
    MESSAGE_STATUS_RECV_FAILED,     /**< @brief This constant indicates receiving a message fails. This status applies only to receivers. */ 
    MESSAGE_STATUS_RECV_OK,         /**< @brief This constant indicates a message is successfully received. This status applies only to receivers. */ 
    MESSAGE_STATUS_READ,            /**< @brief This constant indicates a receiver has read a message. This status applies only to receivers.  */ 
    MESSAGE_STATUS_RECV_REJECTED   /**< @brief This constant indicates a message is rejected by receiver. This status applies only to receivers. */
}MESSAGE_STATUS;

/** This enumeration is used to indicates the error type of a message. It can be used as the value of the {@link PARAM_MESSAGE_ERROR_TYPE} 
* parameter for the {@link EVENT_MESSAGE_ERROR_NOTIFY} broadcast. */
typedef enum tag_MESSAGE_ERROR_TYPE
{ 
    ERROR_NOT_NETWORK ,                    /**< @brief Indicates that a network is unavailable. */
    ERROR_DISCONNECT_SERVER ,              /**< @brief Indicates the disconnection to the server. */ 
    ERROR_NOT_SUPPORT_OFFLINE_MESSAGE ,    /**< @brief Indicates that the offline message is not supported. */
    ERROR_NOT_SUPPORT_OFFLINE_SHARE,       /**< @brief Indicates that the offline share mode is not supported. */
    ERROR_NOT_SUPPORT_IN_TEMP_GROUP,       /**< @brief Indicates that the temporary group chat is not supported. */ 
    ERROR_FILE_OVERSIZE,                   /**< @brief Indicates that the size of the file to be sent exceeds the limit.. */
    ERROR_FILE_COPY_FAILED,                /**< @brief Indicates that the IOS liberary file copy to application(sandbox) failed. */   
    ERROR_FILE_CAN_NOT_READ                /**< @brief Indicates that SDK can't read the file from the UI set Path. */
} MESSAGE_ERROR_TYPE;

/**
 * This enumeration is used to indicates the message searching match type. It can be used as the value of the property searchMathType of MessageConversation object.
 */
typedef enum tag_MESSAGE_SEARCH_MATCH_TYPE
{  
    MATCH_NICKNAME = 0x01 ,              /**< @brief Indicates nick name matched.   */   
    MATCH_PHONETIC ,                     /**< @brief Indicates phonetic matched.    */    
    MATCH_NUMBER,                        /**< @brief Indicates number matched.      */
    MATCH_CONTENT                       /**< @brief Indicates content matched.      */
} MESSAGE_SEARCH_MATCH_TYPE;


/**
 * This enumeration is used to indicates conversation type. It can be used as the value of the property conversationType of MessageConversation object.
 */
typedef enum tag_CONVERSATION_TYPE
{ 
    PEER_FRIEND ,                            /**< @brief Indicates peer is a friend.     */
    PEER_STRANGER,                           /**< @brief Indicates peer is a stranger.   */
    PEER_GROUP ,                             /**< @brief Indicates peer is a group.      */
    PEER_SYSTEM ,                            /**< @brief Indicates peer is a system.     */
    PEER_MASS = 5,                           /**< @brief Indicates peer is a mass.       */
    PEER_CUSTOM = 6,                          /**< @brief Indicates peer is a mass.       */
    PEER_ENTERPRISE_BULLETIN                 /**< @brief Indicates peer is a enterprise.     */
} CONVERSATION_TYPE;

/** It is used to set the value of MESSAGE_CFG_MINOR_BUTT. */
#define MESSAGE_ZMAXINT 0x7FFFFFFF

/** This enumeration is used to indicates the main parameter type of presence. It can be used as an input parameter of the MessagingApi::getConfig method and MessagingApi::setConfig method. */
typedef enum tag_MESSAGE_CFG_MAJOR_TYPE
{
    MESSAGE_CFG_MAJOR_SMS_PREFERRED_DOVER_IP = 0, /**< @brief Indicates that major configuration support sms over ip. */
    MESSAGE_CFG_MAJOR_SMS_MODE               = 1, /**< @brief Indicates that major configuration type of sms mode. */
    MESSAGE_CFG_MAJOR_SMS_CT_MAX_MSG_SIZE    = 2, /**< @brief Indicates that major configuration max size of ip message.*/
    MESSAGE_CFG_MAJOR_IM_MODE                = 3, /**< @brief Indicates that major configuration type of IM mode. 0:page mode 1:session mode. default: 1 */
    MESSAGE_CFG_MAJOR_IM_IS_SUP_QUICK_MODE   = 4, /**< @brief Indicates that major configuration support im quick mode. 0:not support 1:support. default: 1 */
    MESSAGE_CFG_MAJOR_IM_MAX_PAGE_MSG_SIZE   = 5, /**< @brief Indicates that major configuration max size of page mode. */
    MESSAGE_CFG_MAJOR_IM_GROUP_FACTORY       = 7, /**< @brief Indicates that major configuration Conference Factory Uri of group chat.*/
    MESSAGE_CFG_MAJOR_IM_GROUP_IS_SUP_PERM   = 8, /**< @brief Indicates that major configuration support permannent group chat. 0:not support 1:support. default: 0 */
    MESSAGE_CFG_MAJOR_NEED_DELIVER_NTY       = 9, /**< @brief Indicates that major configuration request deliver notification. 0:not support 1:support. default: 1*/
    MESSAGE_CFG_MAJOR_NEED_DISPLAY_NTY       = 10,/**< @brief Indicates that major configuration request display notification. 0:not support 1:support. default: 1*/
    MESSAGE_CFG_MAJOR_REFUSE_DISPLAY_NTY     = 11,/**< @brief Indicates that major configuration refuse send display notification. 0:not support 1:support. default: 0*/
    MESSAGE_CFG_MAJOR_SHARE_MAX_IMAGE_SIZE   = 15,/**< @brief Indicates that major configuration max size of image share.*/
    MESSAGE_CFG_MAJOR_SHARE_MAX_FILE_SIZE    = 16,/**< @brief Indicates that major configuration max size of file transfer.*/
    MESSAGE_CFG_MAJOR_SHARE_IS_SUP_OFFLINE   = 17,/**< @brief Indicates that major configuration support share of offline. */
    MESSAGE_CFG_MAJOR_SHARE_IS_SUP_AT_2G     = 18,/**< @brief Indicates that major configuration support share under the connection of GPRS. 0:not support 1:support. default: 1*/
    MESSAGE_CFG_MAJOR_SHARE_IS_SUP_ICON      = 19,/**< @brief Indicates that major configuration support icon of share. 0:not support 1:support. default: 0*/
    MESSAGE_CFG_MAJOR_USER_AGENT             = CONFIG_MAJOR_TYPE_USER_AGENT,/**< @brief Indicates that major configuration type of user agent content.*/
    MESSAGE_CFG_MAJOR_SILENCE                = 21,/**< @brief Indicates that major configuration  receiving message is silence or not. 0:not silence 1:silence. default: 0*/
    MESSAGE_CFG_MAJOR_SYS_NOTIFY_TYPE        = 22,/**< @brief Indicates that major configuration receiving message in the background, whether to clear the existing transmission system notice before notice. 0:clear, 1:not clear. default: 1*/
    MESSAGE_CFG_MAJOR_IM_USE_BASE64          = 31,/**< @brief Indicates that major configuration to set whether text message supports to use base64 encoding or not, including text messages of 1-to 1 chat and group chat etc. 
                                                  default value 0 is not using base64. 1 is using base64, please set this configure after registering success*/
    
	MESSAGE_CFG_MAJOR_IM_USE_TIMESTAMP = 32,    /**< @brief Indicates that major configuration use timestamp in message db or not. 0:not use 1:use. default: 1*/
    MESSAGE_CFG_MAJOR_REJECT_INVITATION_WHEN_EXIT_GROUP   = 36,/**< @brief Indicates that major configuration whether to reject invitation from a group which the user has exited it.*/
    
    MESSAGE_CFG_MAJOR_BUTT                                                  /**< @brief Indicates that minor configuration default type. */

}MESSAGE_CFG_MAJOR_TYPE;

/** This enumeration is used to indicates that config minor type value. It can be used as an input parameter of the MessagingApi::getConfig method and MessagingApi::setConfig method. */
typedef enum tag_MESSAGE_CFG_MINOR_TYPE
{
    MESSAGE_CFG_MINOR_BUTT = MESSAGE_ZMAXINT  /**< @brief Indicates that minor configuration default type.  */

}MESSAGE_CFG_MINOR_TYPE;

/** The following begin to define message database tables and fileds. */
#define TBNAME_MESSAGE             @"tb_message"      /**< Message table name. */

#define TBFLD_MESSAGE_MSG_ID       @"msgId"           /**< Indicates message ID, [0][integer primary key]. */
#define TBFLD_MESSAGE_TYPE         @"type"            /**< Indicates type, [1][int]. */
#define TBFLD_MESSAGE_CONTENT      @"content"         /**< Indicates content, [2][varchar]. */
#define TBFLD_MESSAGE_DATE_TIME    @"dataTime"        /**< Indicates date time, [3][double]. */
#define TBFLD_MESSAGE_GLB_MSG_ID   @"globalMessageId" /**< Indicates global message ID, [4][varchar]. */
#define TBFLD_MESSAGE_GLB_MSG_TIME @"globalMessageTime"  /**< Indicates global message time, [5][varchar]. */
#define TBFLD_MESSAGE_HAS_RECV     @"hasReceive"      /**< Indicates has received, [6][int]. */
#define TBFLD_MESSAGE_STATE        @"state"           /**< Indicates state, [7][int]. */
#define TBFLD_MESSAGE_HAS_READ     @"hasRead"         /**< Indicates has read, [8][int]. */
#define TBFLD_MESSAGE_ONLY_URI     @"only_uri"        /**< Indicates only uri, [9][char(128)]. */
#define TBFLD_MESSAGE_PEER_URI     @"peerUri"         /**< Indicates peer uri, [10][char(128)]. */
#define TBFLD_MESSAGE_FK_SENDER    @"fk_sender"       /**< Indicates fk sender, [11][unsigned int]. */
#define TBFLD_MESSAGE_FK_CNVS      @"fk_conversation" /**< Indicates fk conversation, [12][unsigned int]. */
#define TBFLD_MESSAGE_IS_MY_MSG    @"ismy_message"    /**< Indicates is may message, [13][int]. */
#define TBFLD_MESSAGE_SHARE_ID     @"shareId"         /**< Indicates share ID, [14][unsigned int]. */
#define TBFLD_MESSAGE_FILE_NAME    @"file_name"       /**< Indicates file name, [15][varchar]. */
#define TBFLD_MESSAGE_FILE_PATH    @"file_path"       /**< Indicates file paht, [16][varchar]. */
#define TBFLD_MESSAGE_FILE_SIZE    @"file_size"       /**< Indicates file size, [17][int]. */
#define TBFLD_MESSAGE_TRANS_STATE  @"transState"      /**< Indicates transfer state, [18][int]. */
#define TBFLD_MESSAGE_TRANS_SIZE   @"transSize"       /**< Indicates transfer size, [19][int]. */
#define TBFLD_MESSAGE_FILE_TYPE    @"file_type"       /**< Indicates file type, [20][int]. */
#define TBFLD_MESSAGE_DURATION     @"duration"        /**< Indicates duration, [21][unsigned int]. */
#define TBFLD_MESSAGE_TRANS_ID     @"transId"         /**< Indicates transfer ID, [22][varchar]. */
#define TBFLD_MESSAGE_INSTANCE_ID  @"instanceId"      /**< Indicates instance ID, [23][char(256)]. */
#define TBFLD_MESSAGE_CUR_NUM      @"currentNumber"   /**< Indicates current number, [24][int]. */
#define TBFLD_MESSAGE_TOTAL_NUM    @"totalNumber"     /**< Indicates total number, [25][int]. */
#define TBFLD_MESSAGE_REF_NUM      @"refNumber"       /**< Indicates reference number, [26][int]. */
#define TBFLD_MESSAGE_FILE_HASH    @"file_hash"       /**< Indicates file hash, [29][varchar]. */
#define TBFLD_MESSAGE_TIP_TYPE     @"tip_type"        /**< Indicates tipmessage type, [30][int]. */
#define TBFLD_MESSAGE_FILE_TRANS_TYPE @"trans_type"   /**< Indicates transfer type, [31][int]. */
#define TBFLD_MESSAGE_FILE_VALIDITY @"file_validity"  /**< Indicates file validity, [32][unsigned int]. */
#define TBFLD_MESSAGE_FILE_DOWNLOAD_URL @"file_downloadurl"   /**< Indicates download url, [33][char(256)]. */
#define TBFLD_MESSAGE_MEMBER_LIST  @"member_list"     /**< Indicates the changed member list for group tip message, [34][varchar]. */
#define TBFLD_MESSAGE_DISPLAY_NAME @"displayName"     /**< Indicates the name in from header,[35][varchar].  */ 

#define TBNAME_CONVERSATION        @"tb_conversation" /**< Conversation table name. */

#define TBFLD_CONVERS_CNVS_ID      @"conversationId"  /**< Indicates conversation ID, [0][integer primary key]. */
#define TBFLD_CONVERS_MSG_TYPE     @"msg_type"        /**< Indicates message type, [1][unsigned int]. */
#define TBFLD_CONVERS_UNREAD_CNT   @"unReadCount"     /**< Indicates unread count, [2][unsigned int]. */
#define TBFLD_CONVERS_LAST_MSG     @"last_message"    /**< Indicates last message, [3][varchar]. */
#define TBFLD_CONVERS_LAST_MSG_TM  @"last_message_time"  /**< Indicates last message time, [4][double]. */
#define TBFLD_CONVERS_LAST_MSG_ST  @"lastMsgState"    /**< Indicates last message state, [5][int]. */
#define TBFLD_CONVERS_ONLY_URI     @"only_uri"        /**< Indicates only uri, [6][char(128)]. */
#define TBFLD_CONVERS_PEER_URI     @"peerUri"         /**< Indicates peer uri, [7][char(128)]. */
#define TBFLD_CONVERS_PEER_TYPE    @"peerType"        /**< Indicates peer type, [8][unsigned int]. */
#define TBFLD_CONVERS_MSG_CONTENT  @"msgContents"     /**< Indicates message contents, [9][varchar]. */
#define TBFLD_CONVERS_DRAFT_MSG    @"draft_message"   /**< Indicates draft message, [10][varchar]. */
#define TBFLD_CONVERS_GROUP_TOPIC  @"groupTopic"      /**< Indicates group topic, [11][varchar]. */
#define TBFLD_CONVERS_GLB_GROUP_ID @"globalGroupId"   /**< Indicates global group ID, [12][varchar]. */
#define TBFLD_CONVERS_TALK_URI     @"talkUri"         /**< Indicates talk uri, [13][varchar]. */
#define TBFLD_CONVERS_LAST_MSG_URI @"lastMsgUri"      /**< Indicates last message uri, [14][varchar]. */
#define TBFLD_CONVERS_CHAIR_MAN    @"chairman"      /**< Indicates chairman [14][char(128)]. */
#define TBFLD_CONVERS_SAVE_CONTACT @"isSavedToContact"/**< Indicates is saved to contact, [15][int]. */
#define TBFLD_CONVERS_DSP_CHARLIST @"isDispInChatList"/**< Indicates is displayed to char list, [16][int]. */
#define TBFLD_CONVERS_GROUP_TYPE   @"groupType"       /**< Indicates group type,[17][unsigned int]. */

#define TBNAME_GROUP_MEMBER        @"tb_groupMember"  /**< Group member table name. */

#define TBFLD_GRPMEMB_COOKIE_ID    @"cookieId"        /**< Indicates cookie ID, [0][integer primary key]. */
#define TBFLD_GRPMEMB_ONLY_URI     @"only_uri"        /**< Indicates only uri, [1][char(128)]. */
#define TBFLD_GRPMEMB_URI          @"uri"             /**< Indicates uri, [2][char(128)]. */
#define TBFLD_GRPMEMB_GLB_GROUP_ID @"globalGroupId"   /**< Indicates global group ID, [3][varchar]. */
#define TBFLD_GRPMEMB_FK_CNVS_ID   @"fkConversationId"/**< Indicates fk conversation ID, [4][int]. */
#define TBFLD_GRPMEMB_IS_CREATER   @"isCreater"       /**< Indicates is creater, [5][int]. */
#define TBFLD_GRPMEMB_PRE_TO_ADD   @"preToAdd"        /**< Indicates pre to add, [6][int]. */

#define TBNAME_PUB_GROUP           @"tb_pubgroup"     /**< Public group table name. */

#define TBFLD_PUBGRP_ID            @"Id"              /**< Indicates public group ID, [0][integer primary key]. */
#define TBFLD_PUBGRP_URI           @"uri"             /**< Indicates uri, [1][char(128)]. */
#define TBFLD_PUBGRP_URL           @"url"             /**< Indicates url, [2][char(128)]. */
#define TBFLD_PUBGRP_NAME          @"name"            /**< Indicates name, [3][char(128)]. */
#define TBFLD_PUBGRP_MEMBER        @"number"          /**< Indicates number, [4]char(128). */
#define TBFLD_PUBGRP_DESCRIPTION   @"description"     /**< Indicates description, [5][char(128)]. */
#define TBFLD_PUBGRP_BULLETIN      @"bulletin"        /**< Indicates bulletin, [6][char(128)]. */
#define TBFLD_PUBGRP_CREATOR       @"creator"         /**< Indicates creator, [7][char(128)]. */
#define TBFLD_PUBGRP_CREATE_TIME   @"createTime"      /**< Indicates create time, [8][char(64)]. */
#define TBFLD_PUBGRP_PERMIT_TYPE   @"permitType"      /**< Indicates permit type, [9][int]. */
#define TBFLD_PUBGRP_ETAG          @"etag"            /**< Indicates etag, [10][char(128)]. */

#define TBNAME_PUB_GRP_MEMB        @"tb_pubgroupMember"  /**< Public group member table name. */

#define TBFLD_PUBGRPMEMB_ID        @"Id"              /**< Indicates public group member ID, [0][integer primary key]. */
#define TBFLD_PUBGRPMEMB_GRP_URI   @"grp_uri"         /**< Indicates group uri, [1][char(128)]. */
#define TBFLD_PUBGRPMEMB_MEMB_URI  @"member_uri"      /**< Indicates group uri, [2][char(128)]. */
#define TBFLD_PUBGRPMEMB_IS_OWNER  @"isowner"         /**< Indicates is owner, [3][int]. */
#define TBFLD_PUBGRPMEMB_STATUS    @"status"          /**< Indicates status, [4][int]. */

@class MessageConversation;

/**
 * <b>Description:</b> Message describes a short message. The UI can get relevant properties to obtain the 
 * sending time, message type, and current status of a message. SDK defines multiple message types and multiple message states supported.
 * <br><b>Purpose:</b> The message class has multiple subclasses. The SDK usually uses the objects of the 
 * message class as the broadcast parameters and send them to the UI. The UI determines the message types 
 * and converts the parameters to the subclass objects of the message class.
 */
@interface Message : NSObject
{
@private

    long _keyId;
    BOOL _isSender;
    PeerInfo * _peer;
    NSString * _globalMsgId;
    NSString * _globalMsgTime;
    long long _dateTime;
    MESSAGE_TYPE _type;
    TIP_MESSAGE_TYPE _tipType;
    MESSAGE_STATUS _status;
    unsigned int _belongConversationId;
}

/**
 * <b>Description:</b> This property is used to obtain message references.
 * <br><b>Purpose:</b> In the Message instance object, property keyId is used to obtain the message references.
 * <p>The property indicates message references ID.
 */
@property(nonatomic,assign) long keyId;

/**
 * <b>Description:</b> This property is used to determine whether the local end is the sender of a message.
 * <br><b>Purpose:</b> Generally, the UI needs to determine whether a message is sent by the local end. 
 * For example, if the UI receives the {@link EVENT_MESSAGE_STATUS_CHANGED} broadcast and the message status 
 * {@link MESSAGE_STATUS_RECV_FAILED} or {@link MESSAGE_STATUS_SEND_FAILED} is carried in the message, the UI can 
 * use only the isSender property to determine whether the local end is the sender because the values of 
 * both parameters are the same. On the UI, "Failed to receive" or "Failed to send" is displayed. 
 * The UI can differentiate sent messages from received messages when displaying messages.
 * @return YES Indicates that a message is sent from the subscriber
 *     <br>NO Indicates that a message is received by the subscriber
 */
@property(nonatomic,assign) BOOL isSender;

/**
 * <b>Description:</b> This property is used to obtain information about a message receiver.
 * <br><b>Purpose:</b> This property is used to obtain the sender information of a message, for example, 
 * name and sender, for display. See PeerInfo.
 * <p>The property indicates the information about the message receiver.
 */
@property(nonatomic,retain) PeerInfo * peer;

/**
 * <b>Description:</b> This property is used to obtain message references.
 * <br><b>Purpose:</b> In the Message instance object, globalMsgId is used to obtain the message references.
 * <p>The property indicates message references ID.
 */
@property(nonatomic,retain) NSString * globalMsgId;

/**
 * <b>Description:</b> This property is used to obtain the time when a message is sent.
 * <br><b>Purpose:</b> When the local end is the sender, this method returns the system time of the terminal 
 * for sending a message. When the local end is the recipient, this method returns the time when the server forwards the message.
 * <p>The property indicates the message sending time, which is measured in millisecond.
 * @deprecated The purpose of this method is just compatible with the old version of UI, we do not recommend the new version of UI invokes this method. Use msgDateTime instead of this function.
 */
@property(nonatomic,retain) NSString * globalMsgTime;

/**
 * <b>Description:</b> This property is used to obtain the local time of a message.
 * <br><b>Purpose:</b> This method returns the time of a message.
 * <p>The property indicates the message local time, which is measured millisecond.
 */
@property(nonatomic,assign) long long dateTime;

/**
 * <b>Description:</b> This method is used to obtain the type of a message.
 * <br><b>Purpose:</b> This method is used to obtain the type of a message. The message types include 
 * text message, image message, file message, and voice message. The UI can invoke relevant methods only 
 * after converting a message into a subclass object of the message class based on the message type.
 * <p>The property type can be set to any one of the {@link tag_MESSAGE_TYPE} enumeration
 */
@property(nonatomic,assign) MESSAGE_TYPE type;

/**
 * <b>Description:</b> This method is used to obtain the tiptype of a message which is a tip message.
 * <br><b>Purpose:</b> This method is used to obtain the tiptype of a message.The UI can invoke relevant methods only after converting a message into a subclass object of the message class based on the tip message type.
 * <p>The property type can be set to any one of the {@link tag_TIP_MESSAGE_TYPE} enumeration
 */
@property(nonatomic,assign) TIP_MESSAGE_TYPE tipType;


/**
 * <b>Description:</b> This property is used to obtain the statuses of messages.
 * <br><b>Purpose:</b> In the Message instance object, status is used to obtain the statuses of messages.
 * <p>The property type can be set to any one of the {@link tag_MESSAGE_STATUS} enumeration.
 */
@property(nonatomic,assign) MESSAGE_STATUS status;

/**
 * <b>Description:</b> This property is used to obtain the session ID the message belongs to.
 * <br><b>Purpose:</b> In the Message instance object, belongConversationId is used to session ID the message belongs to. For detail, see MessageConversation.
 * UI can also through belongConversation to find the MessageConversation the message belongs to. It is recommended that the UI gets this property to obtain the ID of a MessageConversation 
 * This property has better performance.
 * <p>The property belongConversationId can obtain the session ID the message belongs to.
 */
@property(nonatomic,assign) unsigned int belongConversationId;

/**
 * <b>Description:</b> This property is used to obtain the session the message belongs to.
 * <br><b>Purpose:</b> In the Message instance object, belongConversation is used to session ID the message belongs to. For detail, see MessageConversation.
 * UI can also through belongConversationId to find the session ID the message belongs to. It is recommended that the UI gets belongConversationId property to obtain the ID of a MessageConversation 
 * That property has better performance.
 * <p>The property belongConversation can obtain the session the message belongs to.
 */
@property(nonatomic,readonly,getter = getBelongConversation) MessageConversation* belongConversation;

/**
 * <b>Description:</b> This method is used to mark a message as "read".
 * <br><b>Purpose:</b> If it is a one-to-one chat message, the SDK sends a "read" report to the peer end 
 * based on the "read" report setting (MessagingApi::getAllowSendDisplayStatus) on the local end.
 */
- (void) read;

/**
 * <b>Description:</b> When a message fails to be sent, as a sender, the UI can invoke this method with this method to resend the message.
 * <br><b>Purpose:</b> Each subclass of Message has overridden this method. The UI needs to invoke this method of the corresponding subclass object.
 */
- (void) reSend;

/**
 * <b>Description:</b> This method is used to delete a message from the database.
 * <br><b>Purpose:</b> When the UI needs to delete a message, it can invoke this method of the message object. The SDK then permanently deletes the message from the database.
 * Before invoking this method, it is recommanded that the UI should prompt the user with friendly information, such as a choice box for choosing to continue or cancel.
 * The UI can present different information based on different situations.
 */   
-(void) remove;

/**
 * <b>Description:</b> forward is used to forward a message.
 * <br><b>Purpose:</b> After a new receiver is selected, forward is used to send the message to the new receiver.
 * @param [in] number Specifies the number of the user whose message is to be sent
 * @return The value indicates a Message object whitch has bean forwarded
 * @deprecated The purpose of this method is just compatible with the old version of UI, 
 * we do not recommend the new version of UI invokes this method. It will be abandoned.
 */
-(Message*)forward:(NSString*)number;

@end

/**
 * <b>Description:</b> IpMessage inherits the message class. IpMessage describes an IP short message. 
 * It defines the basic attributes of an IP short message, including message length, coding format, message 
 * content, priority, and validity period. The UI invokes relevant properties of an IpMessage object to obtain 
 * the attribute information of the object. In addition, there are some broadcasts, based on which the 
 * SDK notifies the UI of a new message, the message transmission status, or the "read" report.
 * <br><b>Purpose:</b> Before the UI invokes the MessagingApi::sendIPMessage method to send a IpMessage, it needs to 
 * construct a IpMessage object and set its attributes. Sometimes, the UI needs to segment an extra long IP 
 * short message. After the recipient receives the segments, the UI needs to restore the IP short message based 
 * on the attributes.
 */
@interface IpMessage : Message
{

@private

    NSString*   _pcSmsMsg;
    char*       _array;
    int         _iMsgClass;
    int         _iPriotity;
    int         _iMsgLen;
    int         _iLongMsgSeq;
    int         _iLongMsgSum;
    int         _iLongMsgId;
    NSString*   _pcDataCoding;
    NSString*   _pcDoneTime;
    bool        _bRequestDeliverReport;
}

/**
 * <b>Description:</b> This property is used to obtain the content of an IpMessage.
 * <br><b>Purpose:</b> The UI can get this property to obtain the content of an IpMessage.
 * <p>The property indicates the content of an IpMessage.
 */
@property (nonatomic,copy) NSString* pcSmsMsg;

/**
 * <b>Description:</b> This property is used to obtain the content of an IpMessage that has been using USC2.
 * <br><b>Purpose:</b> When the UI determines that the IpMessage coding format is USC2, it can get this 
 * property to obtain the content of the IpMessage that has been coded using USC2. If the coding format is not 
 * USC2, the UI does not get this property.
 * <p>The property indicates the Byte array of encoding by ucs2.
 */
@property (nonatomic,assign) char*   array;

/**
 * <b>Description:</b> This property is used to obtain the segmenting flag of an IpMessage.
 * <br><b>Purpose:</b> After the recipient receives an IpMessage, it can get this property to determine 
 * whether the message is a segmented message. If it is a segmented message, the UI needs to restore the 
 * message and display it after receiving all segments. 
 * <p>The property indicates the type of a message, which may be set to {@link CLASSS_COMMON} or {@link CLASSS_SPLIT}.
 */
@property (nonatomic,assign) int    iMsgClass;

/**
 * <b>Description:</b> This property is used to obtain the priority for sending an IpMessage.
 * <br><b>Purpose:</b> The SDK provides four priority levels for sending messages. The UI can get this 
 * property to obtain the priority of the message. The UI can prompt users with different information based on 
 * the different priorities.
 * <p>The property indicates the priority for sending a message, it can be one of the following:
 * <ul>
 *    <li><em>{@link PRIORITY_NON_URGENT}</em></li>
 *    <li><em>{@link PRIORITY_NORMAL}</em></li>
 *    <li><em>{@link PRIORITY_URGENT}</em></li>
 *    <li><em>{@link PRIORITY_EMERGENCY}</em></li>
 * </ul>
 */
@property (nonatomic,assign) int    iPriotity;

/**
 * <b>Description:</b> This property is used to obtain the content length of an IpMessage.
 * <br><b>Purpose:</b> This property is used to obtain the IP message content length in an IpMessage instance.
 * <p>The property indicates the content length of the sending message.
 */
@property (nonatomic,assign) int    iMsgLen;

/**
 * <b>Description:</b> This property is used to set the serial numbers of message segments when the UI segments an extra long message entered by a user.
 * <br><b>Purpose:</b> The message serial numbers, which represent the sequence of segments, starts from 0 
 * and are consecutive integers. This property is used for message restoration when the recipient receives 
 * all segments of a extra long IpMessage. If a message entered by a user does not need to be segmented, 
 * the UI does not get this property.
 * <p>The property indicates the serial number of a message segment.
 */
@property (nonatomic,assign) int    iLongMsgSeq;

/**
 * <b>Description:</b> This property is used to obtain the number of message segments when a message received by the UI is a message segment.
 * <br><b>Purpose:</b> The recipient UI needs to get this property to determine the number of IpMessage 
 * segments when it restores the message based on the received message segments. The UI can restore the 
 * long message only after all segments are received.
 * <p>The property indicates the number of segments split from a long message.
 */
@property (nonatomic,assign) int    iLongMsgSum;

/**
 * <b>Description:</b> This property is used to obtain the long message ID of an IpMessage.
 * <br><b>Purpose:</b> When the recipient UI receives multiple message segments, it can determine which 
 * segments belong to the same IpMessage based on the "longMsgId" so that the IpMessage can be restored based 
 * on segments with the same "longMsgId".
 * <p>The property indicates the message ID of a long message.
 */
@property (nonatomic,assign) int    iLongMsgId;

/**
 * <b>Description:</b> This property is used to obtain the coding format of an IpMessage object.
 * <br><b>Purpose:</b> The coding format is determined when an IpMessage object is used. If an IpMessage 
 * object uses USC2, the UI needs to code the message before sending it. After the recipient receives the 
 * message, the message needs to be decoded using USC2. Therefore, both the sender and recipient needs to 
 * get this property to determine the code mode. 
 * <p>The property indicates the type of encoding a sms message. Currently, the SDK support four coding formats for an IpMessage:
 * <ul> 
 *    <li><em>{@link DATA_CODING_ASCII}</em></li>
 *    <li><em>{@link DATA_CODING_GB18030}</em></li>
 *    <li><em>{@link DATA_CODING_UTF_8}</em></li>   
 *    <li><em>{@link DATA_CODING_UCS2}</em></li>
 * </ul>
 */
@property (nonatomic,copy)  NSString*  pcDataCoding;

/**
 * <b>Description:</b> This property is used to obtain the validity period of an IpMessage.
 * <br><b>Purpose:</b> After the UI receives an IpMessage, it can get this property to obtain the validity 
 * period of the message. The format of the validity period is determined by the carrier's standards.
 * <p>The property indicates the time of receipt done.
 */
@property (nonatomic,copy)  NSString*  pcDoneTime;

/**
 * <b>Description:</b> This property is used to obtain whether a "delivered" report needs to be sent to the sender for the IpMessage.
 * <br><b>Purpose:</b> If the sender requires a "delivered" report from the recipient, the SDK will 
 * automatically sends a "delivered" report to the sender.
 * <p>The property indicates that whether needing send receipt.
 */
@property (nonatomic,assign) bool bRequestDeliverReport;

@end

/**
 * <b>Description:</b> TextMessage inherits the message class. TextMessage describes a IM message. The UI can obtain message content through the properties.
 * <br><b>Purpose:</b> When the UI receives an IM message or wants to obtain the detailed information 
 * about an IM message, it needs to converts the short message into the TextMessage class before invoking 
 * relevant methods of this class to perform operations such as obtaining the message type and resending.
 */
@interface TextMessage : Message
{
@private

    NSString * _content;
    NSMutableDictionary* _contentJson;
    NSArray * _changedMemberArray;
}

/**
 * <b>Description:</b> This property is used to obtain the content of a text message.
 * <br><b>Purpose:</b> The UI gets this property to obtain the content of an IM message so that the message content is displayed on the UI.
 * <p>The property indicates the content of an IM message.
 */
@property(nonatomic,retain,getter = getContent) NSString* content;

/**
 * <b>Description:</b> This property is used to obtain the RichTextParserRowObj queue after the message is parsed.
 * <br><b>Purpose:</b> See RichTextParser in the basic feature.
 * <p>The property indicates the RichTextParserRowObj queue after the message is parsed.
 */
@property (nonatomic,retain) NSMutableArray* rowArray;

/**
 * <b>Description:</b> This property is used to obtain ths size of the message contents after the message is parsed.
 * <br><b>Purpose:</b> The UI gets this property to obtain the size of the message contents after the message is parsed.
 * <p>The property indicates the size of the message content.
 */
@property (nonatomic,assign) CGSize cellSize;

/**
 * <b>Description:</b> This property is used to indicate the changed member list for group chat in tip message.
 * <br><b>Purpose:</b> The UI can use this member array to create a tip message and display on the screen.
 * <p>The property indicates the changed member list for group chat.
 */
@property (nonatomic,retain) NSArray* changedMemberArray;

/**
 * <b>Description:</b> getTextParam is used to obtain parameters carried in text messages.
 * <br><b>Purpose:</b> If a text message carries parameters in addition to contents, such as the geographic location information,
 * the UI invokes getTextParam to obtain the parameters. If no required parameter is contained in the text message, null is returned.
 * For example, the UI uses NSString* longitude = [textMessage getTextParam:PARAM_SEND_TEXT_ACCURACY]; to obtain the longitude in the geographic location information.
 * @param param Specifies the parameters to be obtained.
 * @return Obtained parameter values are returned.
 */
- (NSString*)getTextParam:(NSString *)param;

@end

/** 
 * <b>Description:</b> LocationMessage inherits the message class. LocationMessage describes a geographic 
 * location. It provides a series of properties. The UI gets these properties to obtain the basic information 
 * about the geographic location, including longitude, latitude, brief location name, and detailed location name.
 * <br><b>Purpose:</b> When the UI receives a geographic location message or wants to obtain the detailed 
 * information about a geographic location message, it needs to converts the short message into the 
 * LocationMessage class before getting relevant properties of this class to obtain the information such as 
 * longitude, latitude, brief location name, and detailed location name..
 */
@interface LocationMessage : Message
{
@private

    double _longitude;
    double _latitude;
    NSString * _locationDesc;
}

/**
 * <b>Description:</b> This property is used to obtain the longitude of a geographic location.
 * <br><b>Purpose:</b> When the UI needs to display the longitude or obtain longitude information for the 
 * location display on a map, it can get this property. The UI may also get the latitude property.
 * <p>The property indicates the longitude of a geographic location.
 */
@property(nonatomic,assign) double longitude;

/**
 * <b>Description:</b> This property is used to obtain the latitude of a geographic location.
 * <br><b>Purpose:</b> When the UI needs to display the latitude or obtain latitude information for the 
 * location display on a map, it can get this property. The UI may also get the longitude property.
 * <p>The property indicates the latitude of a geographic location.
 */
@property(nonatomic,assign) double latitude;

/**
 * <b>Description:</b> This property is used to obtain the detailed address of a geographic location.
 * <br><b>Purpose:</b> The UI can get this property to obtain the detailed address of geographic location 
 * message. The function of this property is equivelent to that of subTitle.
 * <p>The property indicates the detailed address of a geographic location.
 */
@property(nonatomic,copy,setter = setLocationDesc:) NSString * locationDesc;

/**
 * <b>Description:</b> This property is used to obtain the address title, that is, the brief address of a geographic location.
 * <br><b>Purpose:</b> This property returns the brief address. In addition, the UI can get the subTitle to obtain the detailed address.
 * <p>The property indicates the address title of a geographic location.
 */
@property(nonatomic,assign,getter = getTitle) NSString * title;

/**
 * <b>Description:</b> This property is used to obtain the detailed address of a geographic location.
 * <br><b>Purpose:</b> When the UI displays the detailed information about a geographic location, 
 * it may be required to display the detailed address of the geographic location. In this case, it can 
 * get this property. If the detailed address is not carried when the sender sends a message, this method 
 * returns "nil".
 * <p>The property indicates the detailed address of a geographic location.
 */
@property(nonatomic,assign,getter = getSubTitle) NSString * subTitle;

@end

/**
 * <b>Description:</b> FileMessage inherits the message class. FileMessage describes a file message. 
 * It defines the basic attributes of a file message, including file absolute path, and file size. The UI gets property of a FileMessage object to obtain the attribute information of the 
 * object. The UI can also invoke relevant methods of an FileMessage object to perform operations on a file 
 * message, for example, receiving, rejecting, canceling, or get the thumbnail of a file message.
 * <br><b>Purpose:</b> When the UI receives a file message or wants to obtain the detailed information about a 
 * received file message, it needs to converts the message (the message class) into the FileMessage class before 
 * invoking relevant methods of the FileMessage. For example, when the UI receives a file transfer request and 
 * accepts the request, it needs to converts the message object carried in the broadcast to a FileMessage object 
 * before obtaining the information such as file absolute path, file size.
 */
@interface FileMessage : Message
{
@private
    BOOL _hasRead;
    NSString * _fileName;
    int _fileTotalSize;
    int _fileCurSize;
    int _stateCode;
    unsigned int _fileValidity;
}

/**
 * <b>Description:</b> This property is used to determine whether a file message has been read.
 * <br><b>Purpose:</b> The UI can get this property to determine whether a file message has been read.
 * The UI may need to differentiate read file messages from file messages that are not read for display.
 * <p>The property can be set to any of the following values:
 * <ul>
 *    <li><em>YES</em></li> - Indicates that a received message is read
 *    <li><em>NO</em></li> - Indicates that a received message is unread
 * </ul>
 */
@property(nonatomic,assign) BOOL hasRead;

/**
 * <b>Description:</b> This method is used to obtain the file name of a file message.
 * <br><b>Purpose:</b> When the UI needs to obtain the file name in a file message, it can get this property.
 * <p>The property indicates the file name.
 */
@property(nonatomic,retain) NSString * fileName;

/** 
 * <b>Description:</b> This property is used to obtain the totle size of a file to be transmitted.
 * <br><b>Purpose:</b> When the UI needs to obtain the total size of a file, the UI can invoke this property. 
 * The unit of the returned value is Byte. The UI can display the total size of the file for a user. 
 * During file transfer, if the UI needs to obtain the percentage of the transferred part to the total 
 * size of the file, it can calculate the percentage by dividing the value of property fileCurSize 
 * by the value of property fileTotalSize.
 * <p>The property indicates the totle size of a file.
 */
@property(nonatomic,assign) int fileTotalSize;

/** 
 * <b>Description:</b> This property is used to obtain the size of the transmitted part of a file.
 * <br><b>Purpose:</b> During file transfer, if the UI needs to obtain the size of the transferred part of 
 * the file, it can get this property. The unit of the returned value is Byte. During file transfer, if 
 * the UI needs to obtain the percentage of the transferred part to the total size of the file, it can calculate the percentage by dividing the value of property fileCurSize 
 * by the value of property fileTotalSize.
 * <p>The property indicates the size the transmitted part of a file.
 */
@property(nonatomic,assign) int fileCurSize;

/** 
 * <b>Description:</b> This property is used to obtain the state code when the file transmit failed.
 * <br><b>Purpose:</b> During file transfer, if the UI needs to obtain the state code when transmit failed, 
 * it can get this property. UI can make different tips according to particular state code. 
 * <p>The property indicates the state code when the file transmit failed.
 */
@property(nonatomic,assign) int stateCode;

/**
 * <b>Description:</b> This property is used to obtain the file validity of a file message.
 * <br><b>Purpose:</b> When the UI needs to obtain the file validity of a file message, it can get this property.
 * <p>The property indicates the file validity of a file.
 */
@property(nonatomic,assign) unsigned int fileValidity;

/**
 * <b>Description:</b> When a file transfer request is received, as a recipient, the UI can invoke this method to accept the file.
 * <br><b>Purpose:</b> When the recipient receives a file transfer request, the UI can prompt the recipient 
 * to determine whether to accept the file. The UI can also directly invoke this method to automatically 
 * accept the file. The file can be downloaded from the server to a local directory only after the UI 
 * invokes the FileMessage::accept method. The UI may need to update the chat logs. After the UI invokes this method, the sender receives 
 * the {link EVENT_MESSAGE_STATUS_CHANGED} broadcast.
 */
- (void) accept;

/**
 * <b>Description:</b> When a file transfer request is received, as a recipient, the UI can invoke this method to reject the file.
 * <br><b>Purpose:</b> When the recipient receives a file transfer request, the UI can prompt the recipient 
 * to determine whether to reject the file. If the file size is too large , the UI can 
 * directly invoke this method to reject the file. After the UI invokes the reject method of the FileMessage 
 * object, the server deletes the file message and it is not logged in the local chat logs. After the UI 
 * invokes this method, the sender receives the {link EVENT_MESSAGE_STATUS_CHANGED} broadcast.
 */
- (void) reject;

/**
 * <b>Description:</b> This method is used to cancel the transfer of a file before the file transfer is complete during file sending or receiving.
 * <br><b>Purpose:</b> When the UI invokes this method, the file message log is not deleted from the local 
 * chat logs. If the sender stops file transfer, the message status becomes {@link MESSAGE_STATUS_SEND_FAILED} and 
 * the sender receives the {link EVENT_MESSAGE_STATUS_CHANGED} broadcast. The recipient cannot receive 
 * the file message because the file is not transferred to the server. If the recipient stops file transfer, 
 * the recipient receives the {link EVENT_MESSAGE_STATUS_CHANGED} broadcast and the message status 
 * becomes {link MESSAGE_STATUS_RECV_FAILED}.
 */
- (void) cancel;

/**
 * <b>Description:</b> This method is used to obtain the absolute path of the file in a file message.
 * <br><b>Purpose:</b> When the UI needs to open the file in a file message, it can find the file based on 
 * the value returned by this method. Note that the UI needs to determine whether the file exist before 
 * opening the file.
 * @return The value indicates the absolute path of the file
 */
- (NSString*) getFilePath;

/**
 * <b>Description:</b> This method is used to obtain the thumbnail of a file message.
 * <br><b>Purpose:</b> The recipient can invoke this method to obtain the thumbnail only after successfully receives the message. 
 * After the sender invokes an SDK interface to send a file message with a thumbnail, the UI 
 * can invoke this method to obtain the thumbnail. The recipient can invoke this method to download the thumbnail 
 * after receiving the message only when both the sender and recipient support the thumbnail mode and the 
 * message sent by the sender carries the thumbnail.
 * @return The value indicates the thumbnail of an file. If a file message has no thumbnail, this method returns "nil".
 */
- (NSString*) getPreviewfile;

@end

/**
 * <b>Description:</b> ImageMessage inherits the FileMessage class. ImageMessage describes an image message. 
 * The UI invokes method of an ImageMessage object to obtain the image content. The UI can also invoke method of an ImageMessage object to obtain the thumbnail.
 * <br><b>Purpose:</b> When the UI receives an image message or wants to obtain the detailed information about 
 * a received image message, it needs to converts the message (the message class) into the ImageMessage class 
 * before invoking relevant methods of the ImageMessage. 
 */
@interface ImageMessage : FileMessage
{

}

/**
 * <b>Description:</b> This method is used to obtain the thumbnail of a image message.
 * <br><b>Purpose:</b> When UI receive a image message can invoke this method to obtain the thumbnail. 
 * The recipient can invoke this method to obtain the thumbnail only after successfully receives the message. 
 * After the sender invokes an SDK interface to send a image message with a thumbnail, the UI 
 * can invoke this method to obtain the thumbnail. The recipient can invoke this method to download the thumbnail 
 * after receiving the message only when both the sender and recipient support the thumbnail mode.
 * <p>The property indicates the thumbnail of an image, UI need to convert the returned value to Image.
 */
- (id) getPreviewImage;

/**
 * <b>Description:</b> This method is used to obtain the image from an image message.
 * <br><b>Purpose:</b> When the local end is a sender, the UI invokes this method of the ImageMessage 
 * class to obtain the image. When the local end is a recipient, the this method can be invoked to obtain 
 * the image only after the UI successfully download the image. If the image is not downloaded, this method 
 * returns "nil". Sometimes UI need to invoke the {@link FileMessage::accept} method to download the image.
 * @return The value can be convert to a full-size image, UI need to convert the returned value to Image.
 */
- (id) getImage;

@end

/** 
 * <b>Description:</b> VoiceMessage inherits the FileMessage class. VoiceMessage describes a voice message. 
 * It provides a series of properties. The UI invokes these properties to obtain the basic information about the 
 * voice including record duration and whether the voice message can be played. UI can invoke VoiceMessage::playOrStop method to play or stop a voice message.
 * <br><b>Purpose:</b> When the UI receives a voice message or wants to obtain the detailed information about 
 * a voice message, it needs to converts the short message into the VoiceMessage class before getting relevant 
 * properties of this class to obtain the information about the voice including record duration and whether the 
 * voice message can be played. 
 */
@interface VoiceMessage : FileMessage
{
@private

    int _duration;
    BOOL _isPlaying;
}

/** 
 * <b>Description:</b> This property is used to obtain the total duration of a voice.
 * <br><b>Purpose:</b> When the UI displays the detailed information about a voice message, it usually 
 * needs to display the total duration of the voice. In this case, the UI can get this property. The unit of the value returned by this method is second.
 * <p>The propertye indicates the voice message duration, which is measured in seconds.
 */
@property(nonatomic,assign) int duration;

/**
 * <b>Description:</b> This method is used to know whether a message is being played.
 * <br><b>Purpose:</b> The UI can get this property to determine whether a voice message is being played. 
 * The UI may need to differentiate being-played voice messages from not-being-played voice messages for display.
 * <p>The property can be set to any of the following values:
 * <ul> 
 *    <li><em>YES</em></li> - Indicates that the voice message is playing
 *    <li><em>NO</em></li> - Indicates that the voice message is not playing
 * </ul>
 */
@property(nonatomic,assign) BOOL isPlaying;


/**
 * <b>Description:</b> This method is used to play or stop playing a voice message.
 * <br><b>Purpose:</b> When a voice message is being played, the UI can invoke this method to stop playing 
 * the voice message. When a voice message is not being played, the UI can invoke this method to stop the 
 * current playing if any and start playing this voice message. If the UI invokes this method to play a voice 
 * message the first time, the SDK also marks the voice message as "read". When the SDK starts playing a 
 * voice message, it sends the {@link EVENT_VOICE_MESSAGE_PLAY_STATUS_CHANGED} broadcast to the UI. 
 * The voice playing status becomes "YES". When playing a voice message is complete, the SDK 
 * sends the {@link EVENT_VOICE_MESSAGE_PLAY_STATUS_CHANGED} broadcast to the UI. The voice playing 
 * status becomes "NO". When an error occurs during the playing of a voice message, the 
 * SDK sends the {@link EVENT_VOICE_MESSAGE_PLAY_STATUS_CHANGED} broadcast to the UI. The voice 
 * playing status becomes "NO".
  * <p>The property can be set to any of the following values:
 * <ul> 
 *    <li><em>YES</em></li> - Indicates that a voice message can play
 *    <li><em>NO</em></li> - Indicates that a voice message cannot play
 * </ul>
 */
-(BOOL)playOrStop;

@end

/**
 * <b>Description:</b> VideoMessage inherits the FileMessage class. VideoMessage describes a video message. 
 * It provides a series of properties. The UI gets these properties to obtain the basic information about the video, 
 * including video duration and whether the video message has been read.
 * <br><b>Purpose:</b> When the UI receives a voice short message or wants to obtain the detailed information 
 * about a voice short message, it needs to converts the short message into the VideoMessage class before 
 * getting relevant properties of this class to obtain information such as the video duration and whether the 
 * video message has been read.
 */
@interface VideoMessage : FileMessage
{
@private

    int _duration;
    float _width;
    float _height;
}

/**
 * <b>Description:</b> This property is used to obtain the total duration of a video.
 * <br><b>Purpose:</b> When the UI displays the detailed information about a video message, it usually 
 * needs to display the total duration of the video. In this case, the UI can get this property. The unit of the value returned by this method is second.
 * <p>The property indicates the video duration, which is measured in seconds.
 */
@property(nonatomic,assign) int duration;

/**
 * <b>Description:</b> This property is used to obtain the width of the preview picture.
 * <br><b>Purpose:</b> When UI receiving a video message, there will be a preview picture, this property indicates the width of the picture.
 * <p>The property indicates the width of the preview picture.
 */
@property(nonatomic,assign) float width;

/**
 * <b>Description:</b> This property is used to obtain the height of the preview picture.
 * <br><b>Purpose:</b> When UI receiving a video message, there will be a preview picture, this property indicates the height of the picture.
 * <p>The property indicates the height of the preview picture.
 */
@property(nonatomic,assign) float height;

/**
 * <b>Description:</b> This method is used to obtain the thumbnail of a video message.
 * <br><b>Purpose:</b> When UI receive a video message can invoke this method to obtain the thumbnail. 
 * The recipient can invoke this method to obtain the thumbnail only after successfully receives the message. 
 * After the sender invokes an SDK interface to send a video message with a thumbnail, the UI 
 * can invoke this method to obtain the thumbnail. The recipient can invoke this method to download the thumbnail 
 * after receiving the message only when both the sender and recipient support the thumbnail mode.
 * <p>The property indicates the thumbnail of an video. 
 */
- (id) getPreviewImage;

@end

/**
 * <b>Description:</b> VCardMessage provides an entry to Vcard messages and is inherited from FileMessage.
 * <br><b>Purpose:</b> The UI invokes VCardMessage to access Vcard message parameters and APIs.
 */
@interface VCardMessage : FileMessage
{
@private

    NSString * _content;
}

/**
 * <b>Description:</b> This property is used to obtain the vcard content.
 * <br><b>Purpose:</b> When UI want to get the content of a vCard message, can get this property. The returned value is in form of "name/n number".
 * <p>The property content indicates the vcard content.
 */   
@property(nonatomic,retain) NSString* content;

@end

/**
 * <b>Description:</b> MessageConversation describes a one-to-one chat. The UI can invoke this interface to access one-to-one chat related parameters and perform operations on these sessions.
 * <br><b>Purpose:</b> The UI can invoke interfaces of MessageConversation to obtain the peer end number, 
 * send the local end input status, send messages, save message draft, obtain session ID, and delete 
 * all messages in a one-to-one chat. 
 */
@interface MessageConversation : NSObject
{
@private

    unsigned int _conversationId;
    unsigned int _messageType;
    unsigned int _unreadCount;
    unsigned int _messageCount;
    NSString*    _messageContent;
    NSDate*      _messageTime;
    unsigned int _messageStatus;
    NSString*    _senderNumber;
    NSString*    _senderName;
    NSString*    _draftContent;
    unsigned int _conversationType;
    int _searchMathType;
    NSMutableArray* _searchMathRangeArray;
    NSMutableDictionary* _contentJson;
}

/**
 * <b>Description:</b> This property is used to identify a one-to-one session.
 * <br><b>Purpose:</b> The UI can get this property to identify a one-to-one session.
 * <p>The property identify a one-to-one session.
 */
@property(nonatomic,assign) unsigned int        conversationId;

/** messageType indicates the message type. See MESSAGE_TYPE.*/
@property(nonatomic,assign) unsigned int        messageType;

/**
 * <b>Description:</b> This property is used to obtain the total number of messages that are not read in a session.
 * <br><b>Purpose:</b> The UI can get this property to display the total number of messages that are not read in a session. 
 * The UI can also get messageCount to obtain the total number of messages in a session. If no message that is not read 
 * exists in the session, the value 0 is returned.
 * <p>The property indicates the number of unread messages.
 */
@property(nonatomic,assign) unsigned int        unreadCount;

/**
 * <b>Description:</b> This property is used to obtain the total number of messages in a session.
 * <br><b>Purpose:</b> The UI can get this property to display the total number of messages in a session. 
 * The UI can also get unreadCount to obtain the total number of messages that are not read.
 * <p>The property indicates the total number of messages.
 */
@property(nonatomic,assign,getter = getMessageCount) unsigned int  messageCount;

/**
 * <b>Description:</b> This property is used to obtain the last message's content.
 * <br><b>Purpose:</b> The UI can get this property to display the latest message's content in each session.
 * <p>The property indicates the last message's content.
 */
@property (nonatomic, copy, getter = getMessageContent)NSString*            messageContent;


/**
 * <b>Description:</b> This property is used to obtain the generation time of the last message in a session.
 * <br><b>Purpose:</b> If the last message is sent from the local end to the peer end, the time when the 
 * local end sends the message is returned. Otherwise, the time when the local end receives the message is 
 * returned. The time is the system time obtained from the terminal, measured in milliseconds. The returned 
 * value of this property is displayed on the UI.
 * <p>The property indicates the time of the last message, measured in milliseconds.
 */
@property (nonatomic, copy)NSDate*              messageTime;

/**
 * <b>Description:</b> This property is used to obtain the last message's status.
 * <br><b>Purpose:</b> The UI can get this property to display the latest message's status in each session. For detail, see {@link tag_MESSAGE_STATUS}.
 * <p>The property indicates the last message's status.
 */
@property(nonatomic,assign) unsigned int        messageStatus;

/**
 * <b>Description:</b> This property is used to obtain the number of the peer end in a session. 
 * <br><b>Purpose:</b> The UI can get this property to obtain the user number. The UI can also obtain 
 * the user name from the property senderName. UI can display the user number on the interface, notifying users of the message sender.
 * <p>The property indicates the subscriber number.
 */
@property (nonatomic, copy)NSString*            senderNumber;

/**
 * <b>Description:</b> This property is used to obtain the name of the peer end in a session. 
 * <br><b>Purpose:</b> The UI can get this property to obtain the user name. The UI can also obtain 
 * the user number from the property senderNumber. UI can display the user name on the interface, notifying users of the message sender.
 * <p>The property indicates the subscriber number.
 */
@property (nonatomic, copy)NSString*            senderName;

/**
 * <b>Description:</b> This property is used to obtain the content of a draft.
 * <br><b>Purpose:</b> UI gets this property to obtain the saved message draft when the user needs to display or send the message draft. 
 * For example, the UI can get this property each time a user opens the chat page of a session. If the UI does not save a message draft, "nil" is returned.
 * <p>The property indicates the draft content.
 */
@property (nonatomic, copy,getter = getDraftContent)NSString*            draftContent;

/**
 * <b>Description:</b> This property is used to obtain the conversation type. 
 * <br><b>Purpose:</b> The UI gets this property to determine which subtype a session belongs to. 
 * After the UI gets MessagingApi::getConversationList to obtain all sessions, the UI needs to 
 * get this property to determine whether a session is a one-to-one chat or group chat. After the 
 * conversation type is determined, information about the conversation can be obtained and operations on the chat can be performed.
 * <p>The property indicates the chat type, can be set to any one of the {@link tag_CONVERSATION_TYPE} enumeration.
 */
@property(nonatomic,assign) unsigned int        conversationType;

/**
 * <b>Description:</b> This property is used to obtain the matched type when searching in sessions. 
 * <br><b>Purpose:</b> When UI gets this property to obtain the matched type. If a one-to-one chat match the search keywors, UI need to get this property to judge the match type for display.
 * <p>The property indicates the matched type, can be set to any one of the {@link tag_MESSAGE_SEARCH_MATCH_TYPE} enumeration.
 */
@property(nonatomic,assign)int                  searchMathType;

/**
 * <b>Description:</b> This property is used to obtain the queue of the match message. 
 * <br><b>Purpose:</b> When UI gets this property to obtain queue of the match message. If a one-to-one chat match the search keywors, UI need to get this 
 * property to highlight the matched part. If the property searchMathType is {@link MATCH_CONTENT}, there is no need to get this property.
 * <p>The property indicates the queue of the match message.
 */
@property (nonatomic, copy)NSMutableArray *     searchMathRangeArray;

/**
 * <b>Description:</b> This method is used to remove a conversation. 
 * <br><b>Purpose:</b> The UI invokes remove to delete a session and all messages in a session and cancel the setting of 
 * displaying the session on the top of the session list. It is recommended that the UI invokes MessagingApi::getConversationList  
 * to obtain the session list again after it deletes a session. Before invoking this method, it is recommanded that the UI should prompt 
 * the user with friendly information, such as a choice box for choosing to continue or cancel. The UI can present different information 
 * based on different situations.
 */
-(void)remove;

/**
 * <b>Description:</b> This method is used to delete the saved message draft.
 * <br><b>Purpose:</b> The UI can invoke this method to delete the saved message draft in a session. 
 * This method can be invoked no matter whether a message draft has been saved. It is recommended that the UI determines 
 * whether a user has input but not sent contents each time a user leaves the chat page. If yes, the UI can invoke MessagingApi::saveDraft. 
 * If no, the UI can invoke MessageConversation::removeDraft. Before invoking this method, it is recommanded that the UI should prompt 
 * the user with friendly information, such as a choice box for choosing to continue or cancel. The UI can present different information based on different situations.
 */
-(void)removeDraft;

 /**
 * <b>Description:</b> This method is used to obtain the content of a draft.
 * <br><b>Purpose:</b> UI invokes this method to obtain the saved message draft when the user needs to display or send the message draft. 
 * For example, the UI can invoke this method each time a user opens the chat page of a session. If the UI does not save a message draft, "nil" is returned.
 * @return The value indicates the draft content
 */
-(NSString*)getDraft;

 /**
 * <b>Description:</b> This method is used to set the number of messages that are not read in a session to 0. The status 
 * of messages except voice messages and video messages is set to read.
 * <br><b>Purpose:</b> The UI invokes this method to set the status of all the messages in a session to read. In this case, 
 * if the UI gets unreadCount property, the value 0 is returned. However, the status of voice messages and video messages is changed 
 * to read only after users play the voice or video file. The SDK sends read reports to the peer end 
 * based on the setting of read reports on the local end. If a user needs to browse all the messages in a session, the UI needs to invoke this method.
 */
-(void)read;

/**
 * <b>Description:</b> This method is used to check whether a conversation is stuck to the top.
 * <br><b>Purpose:</b> The UI can invoke this method to determine whether a session is set to be displayed on the top of the session list.
 * @return YES Indicates that a conversation is stuck to the top
 *     <br>NO Indicates that a conversation is not stuck to the top
 */
-(BOOL)isTop;

/**
 * <b>Description:</b> This method is used to set or cancel a session to be displayed on the top of the session list.
 * <br><b>Purpose:</b> If a session is displayed on the top of the session list, the session is not displayed on the 
 * top after the UI invokes this method. If a session is not displayed on the top of the session list, the session 
 * is displayed on the top after the UI invokes this method. After the UI invokes MessagingApi::getConversationList, the 
 * session set to be displayed on the top is displayed on the top of the session list. If multiple sessions are set to 
 * be displayed on the top, the sessions are displayed in sequence based on the latest set time.
 */
-(void)toggleTop;

/**
 * <b>Description:</b> This method is used to obtain the ID list of messages of a certain type.
 * <br><b>Purpose:</b> UI invokes this method to obtain all ID lists of messages of a certain type for functions such as viewing the album.
 * @param [in] msgType Specifies the message type. See {@link tag_MESSAGE_TYPE}
 * @return The value indicates the ID list of messages of a certain type
 */
-(NSArray*)getMessageKeyIdArrayOfType:(int)msgType;

/**
 * <b>Description:</b> This method is used to obtain a message or the derived object based on the key ID.
 * <br><b>Purpose:</b> UI invokes this method to get a spercific message by message ID.
 * @param [in] keyId Identify the message ID
 * @return The value indicates a Message object 
 */
-(Message*)getMessageByKeyId:(int)keyId;

@end

/**
 * <b>Description:</b> GroupConversation is used to display the group chat information and is inherited from MessageConversation.
 */
@interface GroupConversation : MessageConversation
{
@private

    NSString*            _topic;
    NSString*            _groupNumber;
    NSString*            _chairMan;
    NSString*            _globalGroupId;
    BOOL                 _isSavedToContact;
    unsigned int         _groupType;
}

/**
 * <b>Description:</b> This property is used to obtain group conversation titles.
 * <br><b>Purpose:</b> The UI can get this property to obtain the set subject when the group is created 
 * after a user enters a group chat for the first time. If the UI gets this property after the local 
 * end updates the group chat subject, the UI can only obtain the group chat subject saved in the local 
 * database. The group chat subject is only used for UI display.
 * <p>The property indicates a group conversation title.
 */
@property (nonatomic, copy)NSString*            topic;

/** Indicates the group chat number, indicates the local groupId. UI invoked globalGroupId to get global groupId */
@property (nonatomic, copy)NSString*            groupNumber;

/** Indicates the group chairman */
@property (nonatomic, copy)NSString*            chairMan;

/** Indicates the global groupId */
@property (nonatomic, copy)NSString*            globalGroupId;

/**
 * <b>Description:</b> This property is used to determine whether a group chat is saved as a group chat contact.
 * <br><b>Purpose:</b> The UI can get this property to determine whether a group chat is saved as a group chat contact.
 * @return YES Indicates that a group chat session has been saved to the contact list
 *     <br>NO Indicates that a group chat session is not saved to the contact list
 */
@property (nonatomic, assign)BOOL               isSavedToContact;

/** messageType indicates the group type. See GROUP_TYPE.*/
@property(nonatomic,assign) unsigned int        groupType;

/**
 * <b>Description:</b> This method is used to create a group chat. 
 * <br><b>Purpose:</b> After the UI invokes this method to create a group chat, 
 * the SDK sends {@link EVENT_GROUP_CREATE} to notify the creator whether the group chat creation is successful.
 * @param [in] topic Specifies the group chat topic. The topic must be specified.
 * @param [in] members Specifies the group chat member. The input value is an array of NSString onjects. The number of members in a group chat must be greater than or equal to 1.
 * @return YES Indicates that UI successfully invoke the createGroup method 
 *     <br>NO Indicates that UI fails to invoke the createGroup method 
 */
+(BOOL)createGroup:(NSArray*)members topic:(NSString*)topic;

/**
 * <b>Description:</b> This method is used to extend a single chat to group chat.
 * <br><b>Purpose:</b> When UI want to extend a single chat to a group chat, can invoke this method. 
 * @param [in] peerNumber Specifies the peer number in single chat.
 * @param [in] members Specifies the list of members to be added in the chat (including the peer number in the original single chat)
 * @param [in] topic Specifies the topic about the group chat. The topic must be specified.
 * @return YES Indicates that single chat is successfully extended to group chat
 *     <br>NO Indicates that single chat fails to be extended to group chat
 */
+(BOOL)extendSingleToGroup:(NSString*)peerNumber menbers:(NSArray*)members topic:(NSString*)topic;

/**
 * <b>Description:</b> getConversationByNumber is used to obtain the conversation of a group chat.
 * <br><b>Purpose:</b> The conversation of a group chat is obtained based on the group chat number.
 * @param [in] number Indicates the group chat number
 * @return GroupConversation* specifies the obtained group chat conversation.
 */
+(GroupConversation*)getConversationByNumber:(NSString*)number;

/**
 * <b>Description:</b> This method is used to obtain the conversation of a public group chat.
 * <br><b>Purpose:</b> The conversation of a group chat is obtained based on the public group ID.
 * @param [in] uri Indicates the public group ID
 * @return GroupConversation* specifies the obtained group chat conversation.
 */
+(GroupConversation*)getConversationByUri:(NSString*)uri;

/**
 * <b>Description:</b> This method is used to obtain the public group ID based on the group chat number.
 * <br><b>Purpose:</b> The public group ID is obtained based on the group chat number.
 * @param [in] number Indicates the group chat number
 * @return NSString* if the conversation is a public group conversation then return the group ID, else return nil.
 */
+(NSString*)getPubGroupConversationUri:(NSString*)number;

/**
 * <b>Description:</b> This method is used to obtain the numbers of all members in a group conversation.
 * <br><b>Purpose:</b> After the UI obtains the number of a member in a group chat, the UI can invoke the 
 * method of the contact module to obtain the name of the number and display it on the UI.
 * @return The value indicates a list of members. The returned value is an array of NSString objects.
 */
-(NSArray*)getMembers;

 /**
 * <b>Description:</b> This method is used to add members to a group conversation.
 * <br><b>Purpose:</b> Any member in a group chat can invoke this method to add a member. 
 * At present, the SDK does not limit the number of members in a group chat. However, the UI 
 * performance is affected if there are a large number of members in a group chat.
 * @param [in] members Specifies the new member list. It is an array of NSString objects. The number of members must be greater than or equal to 1.
 * @return YES Indicates that members are successfully added
 *     <BR>NO Indicates that members fail to be added
 */
-(BOOL)addMembers:(NSArray*)members;

/**
 * <b>Description:</b> This method is used to remove members in a group conversation.
 * <br><b>Purpose:</b> Only chairman in a group chat can invoke this method to remove a member.  Before invoking this method, it is recommanded 
 * that the UI should prompt the user with friendly information, such as a choice box for choosing to continue or cancel. The UI can present different information 
 * based on different situations.
 * @param [in] members Specifies the member list want to remove. It is an array of NSString objects. The number of members must be greater than or equal to 1.
 * @return YES Indicates that members are successfully added
 *     <BR>NO Indicates that members fail to be added
 */
-(BOOL)removeMembers:(NSArray*)members;

 /**
 * <b>Description:</b> This method is used to update group conversation titles.
 * <br><b>Purpose:</b> After the UI invokes this method to update the group chat subject, 
 * the new subject is stored in the local database, and the new subject is not informed to other members. 
 * Other members cannot obtain the new subject stored in the local database.
 * @param [in] topic Specifies the new title of a conversation
 */
-(void)updateTopic:(NSString*)topic;

 /**
  * <b>Description:</b> This method is used to set the number of messages that are not read in a session to 0. The status 
  * of messages except voice messages and video messages is set to read.
  * <br><b>Purpose:</b> The UI invokes this method to set the status of all the messages in a session to read. In this case, 
  * if the UI gets unreadCount property, the value 0 is returned. However, the status of voice messages, video messages and file is changed 
  * to read only after users play the voice or video file. If a user needs to browse all the messages in a session, the UI needs to invoke this method.
  */
-(void)read;

/**
 * <b>Description:</b> This method is used to leave a group conversation.
 * <br><b>Purpose:</b> The UI can invoke this method to enable a user to proactively exit the group chat. 
 * After this method is invoked, the user cannot chat in this group chat. However, the UI will not delete 
 * the group chat or the chat contents. If the UI sets the group chat to be displayed on the top, 
 * the setting is valid after this method is invoked.
 */
-(void)exit;

/**
 * <b>Description:</b> This method is used to leave a group conversation.
 * <br><b>Purpose:</b> The UI can invoke this method to enable a user to proactively exit the group chat.
 * @param [in] bClearRecord Specifies whether clear records of this group
 */
-(void)exit:(BOOL)bClearRecord;


/**
 * <b>Description:</b> This method is used to determine whether a group chat is permanent.
 * <br><b>Purpose:</b> The UI can invoke this method to determine whether a group chat is permanent. 
 * If a group chat is not permanent, it will be released after the timer expires. The users cannot chat 
 * in the group chat after the timer expires. Whether an account supports permanent group chat is determined 
 * by server parameters.
 * @return YES Indicates that a conversation is a permanent one
 *     <br>NO Indicates that a conversation is not a permanent one
 */
-(BOOL)isPermanent;

/**
 * <b>Description:</b> This method is used to save the input text of a user as a message draft.
 * <br><b>Purpose:</b> If a user is interrupted by other things or the user does not send the input text to the peer end after the user inputs chat contents, 
 * the UI can invoke this method to save the input text of the user as a message draft. The SDK can save only one message draft for a session. This method 
 * can be invoked for multiple times. However, the latest contents will override the previous contents.
 * @param [in] msg Specifies the draft content
 * @return YES Indicates that saving as draft success
 *     <br>NO Indicates that saving as draft fails
 */
- (BOOL) saveDraft:(NSString *) msg;

/**
 * <b>Description:</b> This method is used to delete the saved message draft.
 * <br><b>Purpose:</b> The UI can invoke this method to delete the saved message draft in a session. 
 * This method can be invoked no matter whether a message draft has been saved. It is recommended that the UI determines 
 * whether a user has input but not sent contents each time a user leaves the chat page. If yes, the UI can invoke GroupConversation::saveDraft. 
 * If no, the UI can invoke GroupConversation::removeDraft. Before invoking this method, it is recommanded that the UI should prompt the user 
 * with friendly information, such as a choice box for choosing to continue or cancel. The UI can present different information based on different situations.
 */
-(void)removeDraft;

/**
 * <b>Description:</b> This method is used to delete all messages in a session. However, the session is retained.
 * <br><b>Purpose:</b> The UI can invoke this interface to clear all chat records in a session. In this case, if the UI gets messageCount property, the value 0 is returned.
 * Before invoking this method, it is recommanded that the UI should prompt the user with friendly information, such as a choice box for choosing to continue or cancel. 
 * The UI can present different information based on different situations.
 * @return The value indicates the number of removed messages
 */
-(void)removeAllMessage;

/**
 * <b>Description:</b> This method is used to obtain all messages in a session.
 * <br><b>Purpose:</b> This interface is used to obtain all messages in a session for the first time. The UI can invoke this 
 * interface to display all messages in a session. The UI can also invoke (getMessageList:(int)start count:(int) count) to obtain a specified number 
 * of messages. 
 * @return The value indicates the message set, is an array of Message object. The UI can classify messages into different subtypes based on the message type.
 */
- (NSArray*) getMessageList;

/**
 * <b>Description:</b> This method is used to obtain the message list.
 * <br><b>Purpose:</b> This method is invoked to obtain a number of messages by starting from a particular one.
 * @param [in] start Specifies the sequence count of the message, starting with which a specified number of messages are to be obtained
 * @param [in] count Specifies the count of messages to be obtained
 * @return The value indicates a set of messages that meet the conditions.
 */
- (NSArray*) getMessageList:(int)start count:(int) count;

/**
 * <b>Description:</b> This method is used to obtain the message list.
 * <br><b>Purpose:</b> This method is invoked to obtain a number of messages that match the matchkey contents, and obtain matchIndex.
 * @param [in] count Specifies the count of messages to be obtained
 * @param [in] matchKey Specifies the matching content.
 * @param [out] matchIndex Specifies the match index where the matching Message is in the MessageList returned.
 * @return The value indicates a set of messages that meet the conditions, UI invoke getMessageList or getMessageList:(int)start count:(int) count method to get more messages.
 */
- (NSArray*) getMessageList:(int) count matchKey:(NSString*)matchKey matchIndex:(int*)matchIndex;

/**
 * <b>Description:</b> This method is used to search the message list by searchText and searchUserNums .
 * <br><b>Purpose:</b> This method is invoked to obtain a number of messages that match the searchText or searchUserNums param.
 * @param [in] searchText Specifies the matching content
 * @param [in] searchUserNums Specifies the matching user phone array
 * @param [in] start Specifies the sequence number of the message, starting with which a specified number of messages are to be obtained
 * @param [in] count Specifies the number of messages to be obtained
 * @return The value indicates a set of messages that meet the conditions
 */
- (NSArray*) searchMessage:(NSString*)searchText searchUserNums:(NSArray*)searchUserNums start:(int)start count:(int) count;

/**
 * <b>Description:</b> This method is used to get the message list from a item of search list .
 * <br><b>Purpose:</b> This method is invoked to obtain a number of messages.
 * @param [in] message Specifies the matching message
 * @param [in] count Specifies the number of messages to be obtained
 * @param [out] matchIndex Specifies the matching index of the message, first call pass matchIndex is not "nil",or else pass matchIndex is "nil".
 * @return The value indicates a set of messages that meet the conditions
 */
- (NSArray*) getMoreUserMessageList:(Message*)message count:(int)count matchIndex:(int*)matchIndex;

/**
 * <b>Description:</b> This method is used to get the message list from a item of search list .
 * <br><b>Purpose:</b> This method is invoked to obtain a number of messages.
 * @param [in] message Specifies the matching message.
 * @param [in] count Specifies the number of messages to be obtained.
 * @param [out] matchIndex Specifies the matching index of the message, first call pass matchIndex is not "nil",or else pass matchIndex is "nil".
 * @param [in] isDescend, if YES indicates select the messages order by descend, else order by ascend.
 * @return The value indicates a set of messages that meet the conditions.
 */
- (NSArray*) getMoreUserMessageList:(Message*)message count:(int)count matchIndex:(int*)matchIndex isDescend:(BOOL)isDescend;

/**
 * <b>Description:</b> This method is used to send a text message.
 * <br><b>Purpose:</b> The UI can invoke this method to send a text message in a group session. The SDK will store the text message in the database.
 * @param [in] msg Specifies the message content
 * @return The value indicates the text message to be sent
 */
- (TextMessage*) sendText:(NSString *) msg;

/**
 * <b>Description:</b> This method is used to send a text message and set parameters of the message.
 * <br><b>Purpose:</b> The UI can invoke this method to set parameters of a message instead of sending the message in the default mode. 
 * At present, the UI can only set whether an instant message is sent in page mode and whether a message is saved to the local database after it is sent.
 * @param [in] msg Specifies the contents of the text message to be sent
 * @param [in] imExtParas Specifies the field that carriers message parameters
 * @return The value indicates the text message
 */
- (TextMessage*) sendText:(NSString*)msg extParas:(NSMutableDictionary*)imExtParas;


/**
 * <b>Description:</b> This method is used to send a location message.
 * <br><b>Purpose:</b> The UI can invoke this method to send a location message in a session. The SDK will store the location message in the database.
 * @param [in] longitude Specifies the longitude
 * @param [in] latitude Specifies the latitude
 * @param [in] title Specifies an address title
 * @param [in] subTitle Specifies a detailed address
 * @return The value indicates the location message to be sent
 */
- (LocationMessage*) sendLocation:(NSString *)title subTitle:(NSString*)subTitle longitude:(double)longitude latitude:(double)latitude;

/**
 * <b>Description:</b> This method is used to send a image message.
 * <br><b>Purpose:</b> The UI can invoke this method to send a image message in a session. The SDK will store the image message in the database.
 * @param [in] imageInfo Specifies the image resource stored in the local device
 * @return The value indicates the image message to be sent
 * @deprecated  The purpose of this method is just compatible with the old version of UI, we do not recommend the new version of UI invokes this method. Use (ImageMessage*) sendImage:(NSString *) number imagePath:(NSString *) imagePath thumbPath:(NSString *)thumbPath instead of this function.
 */
- (ImageMessage*) sendImage:(NSDictionary *) imageInfo;

/**
 * <b>Description:</b> This method is used to send a image message.
 * <br><b>Purpose:</b> The UI can invoke this method to send a image message in a session. The SDK will store the image message in the database.
 * @param [in] imagePath Specifies the full path of the image to be sent, must smaller than the MAX_FILE_SIZE defined by DM.
 * @param [in] thumbPath Specifies the path of the image thumbnail or icon. The size of the image thumbnail or icon must be smaller than 15 KB. 
 * The recommended size is no larger than 10 KB.
 * @return The value indicates the image message to be sent
 */
- (ImageMessage*) sendImage:(NSString *) imagePath thumbPath:(NSString *)thumbPath;

/**
 * <b>Description:</b> This method is used to send a voice message.
 * <br><b>Purpose:</b> The UI can invoke this method to send a voice message in a session. The SDK will store the voice message in the database.
 * Please note that, for recording better, delay of 500 millseconds then invoke the interface
 * @return The value indicates the voice message to be sent
 */
- (VoiceMessage*)sendVoice;

/**
 * <b>Description:</b> This method is used to send a video message.
 * <br><b>Purpose:</b> The UI can invoke this method to send a video message in a session. The SDK will store the video message in the database.
 * @param [in] fileName Specifies the name of the video file stored in the local device, for attention, it is not a absolute path
 * @return The value indicates the the video message to be sent
 * @deprecated  The purpose of this method is just compatible with the old version of UI, we do not recommend the new version of UI invokes this method. Use (VideoMessage*) sendVideo:(NSString *) videoPath thumbPath:(NSString *)thumbPath instead of this function.
 */
- (VideoMessage*) sendVideo:(NSString *) fileName;

/**
 * <b>Description:</b> This method is used to send a video message.
 * <br><b>Purpose:</b> The UI can invoke this method to send a video message in a session. The SDK will store the video message in the database.
 * @param [in] videoPath Specifies the full path of the video to be sent, must smaller than the MAX_FILE_SIZE defined by DM.
 * @param [in] thumbPath Specifies the path of the video thumbnail or icon. The size of the video thumbnail or icon must be smaller than 10 KB. 
 * The recommended size is no larger than 5 KB. If null, means not support preview images.
 * @return The value indicates the the image message to be sent
 */
- (VideoMessage*) sendVideo:(NSString *) videoPath thumbPath:(NSString *)thumbPath;

/**
 *<b>Description:</b> This method is used to send a name card.
 * <br><b>Purpose:</b> The UI can invoke this method to send a vcard message in a session. The SDK will store the vcard message in the database. 
 * @param [in] fileName Specifies the absolute path of the name card stored in the local device
 * @return The value indicates the the vcard message to be sent
 */
-(VCardMessage *)sendVcard:(NSString*)fileName;


/**
 * <b>Description:</b> sendFile is used to send files with thumbnail or icon.
 * <br><b>Purpose:</b> The UI invokes this method to send a file with the thumbnail or icon to a specified subscriber.
 * @param [in] filePath Specifies the full path of the file to be sent, must smaller than MAX_FILE_SIZE defined by DM.
 * @param [in] thumbPath Specifies the thumbnail or icon path of the file need to be sent. The file must smaller than 10kB. The recommended size is no larger than 5 KB.
 * @return a FileMessage object indicates the file is sending or "nil" indicates send operation is failed.
 */
- (FileMessage*) sendFile:(NSString*)filePath thumbPath:(NSString*)thumbPath;

 /**
 * <b>Description:</b> This method is used to save a group chat as a group chat contact. The group chat contact can be displayed in the contact list to facilitate search.
 * <br><b>Purpose:</b> If the UI takes part in a group chat constantly, it can save this group chat as a 
 * group chat contact. The SDK records the settings. Each time the UI uses the same account, the UI can 
 * query the group chat contacts saved on the UE. For details, see MessagingApi::getGroupListInContact. 
 * The UI can save multiple group chats as the group chat contacts. The SDK through 
 * {@link EVENT_MESSAGE_GROUP_CONVERSATION_CONTACT_CHANGED_NOTIFY} to notify the UI of the operation results.
 * @return YES Indicates that a group chat session is successfully saved to the contact list
 *     <br>NO Indicates that a group chat session fails to be saved to the contact list
 */
- (BOOL)saveToContact;

 /**
 * <b>Description:</b> This method is used to delete a group chat from the group chat contacts.
 * <br><b>Purpose:</b> The UI can invoke this method to delete a group chat from the group chat contacts. 
 * The SDK through {@link EVENT_MESSAGE_GROUP_CONVERSATION_CONTACT_CHANGED_NOTIFY} to notify the UI of the operation results. Before invoking this method,
 * it is recommanded that the UI should prompt the user with friendly information, such as a choice box for choosing to continue or cancel. The UI can present 
 * different information based on different situations.
 * @return YES Indicates that a group chat session is successfully deleted from the contact list 
 *     <br>NO Indicates that a group chat session fails to be deleted from the contact list
 */
- (BOOL)deleteFromContact;

 /**
 * <b>Description:</b> This method is used to hide group chats that are saved as the group chat contacts from the local session list.
 * <br><b>Purpose:</b> The UI can invoke this method to hide a group chat that is saved as a group chat 
 * contact from the local session list. In this case, when the UI invokes MessagingApi::getConversationList, 
 * this group chat is not included in the return results. The group chat still exists on the group chat 
 * contact list.
 * @return YES Indicates that a group chat session is hidden
 *     <br>NO Indicates that a group chat session fails to be hidden
 */
- (BOOL)hideFromConversationList;


/**
 * <b>Description:</b> This method is used to create a group chat. 
 * <br><b>Purpose:</b> After the UI invokes this method to create a group chat, 
 * the SDK sends {@link EVENT_GROUP_CREATE} to notify the creator whether the group chat creation is successful.
 * @param [in] members Specifies the group chat member. The input value is an array of NSString onjects. The number of members in a group chat must be greater than or equal to 1.
 * @param [in] topic Specifies the group chat topic. The topic must be specified.
 * @param [in] inReplyToContId Specifies the Contribution ID the receiver replies to
 * @return YES Indicates that UI successfully invoke the createGroup method 
 *     <br>NO Indicates that UI fails to invoke the createGroup method 
 */
+(BOOL)createGroup:(NSArray*)members topic:(NSString*)topic inReplyToContId:(NSString*)inReplyToContId;

/**
 * <b>Description:</b> This method is used to send file with thumbnail or icon in a session.
 * <br><b>Purpose:</b> The UI invokes it to send a file with the thumbnail or icon in a group chat. 
 * @param [in] filePath Specifies the full path of the file to be sent, must smaller than the MAX_FILE_SIZE defined by DM.
 * @param [in] thumbPath Specifies the path of the file thumbnail or icon. The size of the file thumbnail or icon must be smaller than 10 KB. The recommended size is no larger than 5 KB.
 * @param [in] inReplyToContId Specifies the Contribution ID the receiver replies to
 * @param [in] replyTo Specifies the address the receiver replies to
 * @return The FileMessage object indicates the file is sending or nil indicates send operation is failed.
 */
- (FileMessage*) sendFile:(NSString*)filePath thumbPath:(NSString*)thumbPath replyToContId:(NSString*)inReplyToContId replyTo:(NSString*)replyTo;

@end

/**
 * <b>Description:</b> MassConversation is a subtype of Conversation and describes a mass message chat object.
 * The UI can invoke this interface to access mass message chat related parameters and perform operations on
 * these sessions.
 * <br><b>Purpose:</b> Interface of MassConversation is used to obtain the mass member list in a mass message conversation,
 * send text message and send file message to mass members. For details, see Conversation.
 */
@interface MassConversation : MessageConversation
{
}

/**
 * <b>Description:</b> This method is used to create a mass chat.
 * <br><b>Purpose:</b> After the UI invokes this interface to create a mass chat,
 * @param [in] members Specifies the mass chat member number list. The number of members in a mass chat must be greater than or equal to 1.
 * @return The value indicates the MassConversation object
 */
+(MassConversation*) createMass:(NSArray*)MemberList;

/**
 * <b>Description:</b> This method is used to send a text message.
 * <br><b>Purpose:</b> The UI can invoke this method to send a text message to the mass members.
 * @param [in] msg Specifies the message content
 * @return The value indicates the text message to be sent
 */
-(TextMessage*) sendText:(NSString*)msg;

/**
 *<b>Description:</b> This method is used to send a text message in a mass chat and set parameters of the message.
 *<br><b>Purpose:</b> The UI can invoke this interface to set parameters of a message, for example to send location message.
 * @param [in] msg Specifies the contents of the text message to be sent
 * @param [in] imExtParas Specifies the field that carriers message parameters
 * <p>At present, the UI can set the following parameters:
 * <ul>
 *    <li><em>{@link PARAM_SEND_TEXT_LONGITUDE}</em></li>
 *    <li><em>{@link PARAM_SEND_TEXT_LATITUDE}</em></li>
 *    <li><em>{@link PARAM_SEND_TEXT_ACCURACY}</em></li>
 * </ul>
 * @return The value indicates a text message
 */
- (TextMessage*) sendText:(NSString *)msg extParas:(NSMutableDictionary *)imExtParas;

/**
 * <b>Description:</b> This method is used to send a file with a preview image.
 * <br><b>Purpose:</b> The UI can invoke this method to send a file to the mass members and display the file as a preview image on the mass members.
 * Note: All members need to support preview images. Otherwise, the one which does not support preview images can only receive the file in common mode. After the file is successfully
 * received or sent, the UI can invoke FileMessage.getPreviewImage() to obtain the preview image of the file.
 * @param [in] file Specifies the absolute path of the file stored in the local device
 * @param [in] previewImage Specifies the absolute path of the preview image stored in the local device
 * @return The value indicates the file message to be sent
 */
-(FileMessage*) sendFile:(NSString*)filePath thumbPath:(NSString*)thumbPath;

/**
 * <b>Description:</b> This method is used to send a voice message in a mass chat.
 * <br><b>Purpose:</b> The UI can invoke this method to send a voice message in a session. The SDK will store the voice message in the database.
 * Please note that, for recording better, delay of 500 millseconds then invoke the interface
 * @return The value indicates the voice message to be sent
 */
- (VoiceMessage*)sendVoice;

/**
 * <b>Description:</b> This method is used to send video in a mass chat.
 * <br><b>Purpose:</b> The UI can invoke this method to send a video message to the mass members. The SDK will store the video message in the database.
 * @param [in] videoPath Specifies the full path of the video to be sent, must smaller than the MAX_FILE_SIZE defined by DM.
 * @param [in] thumbPath Specifies the path of the video thumbnail or icon. The size of the video thumbnail or icon must be smaller than 10 KB. The recommended
 * size is no larger than 5 KB. If null, means not support preview images.
 * @return The value indicates the resource stored in the local device
 */
- (VideoMessage*) sendVideo: (NSString *) videoPath thumbPath:(NSString *) thumbPath;

/**
 * <b>Description:</b> This method is used to send images in a mass chat.
 * <br><b>Purpose:</b> The UI can invoke this method to send a image message to the mass members. The SDK will store the image message in the database.
 * @param [in] imagePath Specifies the full path of the image to be sent, must smaller than the MAX_FILE_SIZE defined by DM.
 * @param [in] thumbPath Specifies the path of the image thumbnail or icon. The size of the image thumbnail or icon must be smaller than 15 KB. 
 * The recommended size is no larger than 10 KB.
 * @return The value indicates the resource stored in the local device
 */
- (ImageMessage*) sendImage:(NSString *) imagePath thumbPath:(NSString *)thumbPath;

/**
 *<b>Description:</b> This method is used to send vcard messages in a mass chat.
 * <br><b>Purpose:</b> The UI can invoke this method to send a vcard to the mass members. The SDK will store the vcard message in the database.
 * @param [in] fileName Specifies the absolute path of the vcard
 * @return The value indicates a vcard message
 */
-(VCardMessage *)sendVcard:(NSString*)fileName;

/**
 * <b>Description:</b> This method is used to delete the mass chat
 * <br><b>Purpose:</b> After the UI invokes this interface, the mass chat will be deleted. Users cannot chat in this mass chat any more. Before invoking this method, 
 * it is recommanded that the UI should prompt the user with friendly information, such as a choice box for choosing to continue or cancel. The UI can present 
 * different information based on different situations.
 */
-(void) remove;

/**
 * <b>Description:</b> This method is used to obtain the numbers of all members in a mass conversation.
 * <br><b>Purpose:</b> After the UI obtains the number of a member in a mass chat, the UI can invoke the
 * interface of the contact module to obtain the name of the number and display it on the UI.
 * @return The value indicates a list of members
 */
-(NSArray*) getMembers;

@end

/**
 * <b>Description:</b> MassConversation is a subtype of Conversation and describes a mass message chat object.
 * The UI can invoke this interface to access mass message chat related parameters and perform operations on
 * these sessions.
 * <br><b>Purpose:</b> Interface of MassConversation is used to obtain the mass member list in a mass message conversation,
 * send text message and send file message to mass members. For details, see Conversation.
 */
@interface CustomConversation : MessageConversation
{
}

@end

/**
 * <b>Description:</b> MessagingApi provides an entry for messaging services. 
 * It provides APIs to obtain the locally saved session objects, set whether the local 
 * login account needs and agrees to send "delivered" and "read" reports, and set and 
 * obtain configuration parameters related to messaging services.
 * <br><b>Purpose:</b> The UI invokes MessagingApi to implement messaging services, 
 * including Instant Messaging (IM) and Content Sharing services. 
 * The Content Sharing service includes image sharing, location sharing, 
 * and file sharing. Before invoking MessagingApi, the UI must invoke the init method to 
 * initialize MessagingApi.
 */
@interface MessagingApi : NSObject
{
}

/**
 * <b>Description:</b> This method is used to initialize Messaging services before they are used.
 * <br><b>Purpose:</b> The UI invokes MessagingApi::init to initialize Messaging APIs during system initialization before the Messaging services are used.
 * @return 0 Indicates initialize successful
 *     <br>1 Indicates initialize failed
 */
+ (id) init;

/**
 *<b>Description:</b> This method is used to release messaging module resources.
 * <br><b>Purpose:</b> This method is used to release messaging module resources. After it is invoked, messaging services can not be used after UI next call MessagingApi::init.
 * For example, the program exits or cancel UI need to call this method.
 */
+ (void) close;

/**
 * <b>Description:</b> This method is used to obtain all local conversations, including for one-to-one chats and group chats.
 * <br><b>Purpose:</b> The UI invokes MessagingApi::getConversationList to obtain all local conversations. 
 * After this method is invoked, a set of all local conversations is returned. The UI can obtain 
 * all conversation contents, number of conversation records, and the content of the last conversation 
 * only when the UI has obtained the related session objects.
 * @return The value indicates a set of all conversations. The returned value is an array of MessageConversation object. 
 */
+ (NSArray*) getConversationList;

 /**
 * <b>Description:</b> This method is used to obtain the list of the group chats that have been saved as contacts.
 * <br><b>Purpose:</b> The UI invokes MessagingApi::getGroupListInContact to obtain the list of the group chats that have 
 * been saved as contacts so that the UI can display the group chats in the contact list and enable 
 * subscribers to find the chats and initiate conversations quickly. For details about the saving of a 
 * group chat as a contact, see GroupConversation::saveToContact.
 * @return The value indicates the list of the group chats that have been saved as contacts. For detail, see GroupConversation.
 */
+ (NSArray*) getGroupListInContact;

 /**
 * <b>Description:</b> This method is used to obtain all messages with a specified user.
 * <br><b>Purpose:</b> This method is used to obtain all messages in a session for the first time. The UI can invoke this 
 * method to display all messages in a one-to-one chat with a specified user. 
 * @param [in] number Specifies the phone number of the user with whom messages were exchanged
 * @return The value indicates the message set, see Message. The UI can classify messages into different subtypes based on the message type.
 */
+ (NSArray*) getMessageList:(NSString *) number;

/**
 * <b>Description:</b> This method is used to obtain the message list of a specified user.
 * <br><b>Purpose:</b> This method is invoked to obtain all messages of a type exchanged with a specified user.
 * @param [in] number Specifies the phone number of the user with whom messages were exchanged
 * @param [in] msgType Specifies the type of messages to be obtained
 * @return The value indicates a set of messages that meet the conditions, see Message. 
 */
+ (NSArray*) getMessageList:(NSString *) number msgType:(int)msgType;

/**
 * <b>Description:</b> getMessageList is used to obtain the message list in chatting with a specified user.
 * <br><b>Purpose:</b> getMessageList is invoked to obtain a number of historical chat records exchanged with a number of specified users by starting with a particular one.
 * @param [in] number Indicates the number of a user
 * @param [in] start Indicates the sequence number of the message, starting with which a specified number of messages are to be obtained.
 * @param [in] count Indicates the count of messages to be obtained
 * @return NSArray specifies a set of messages that meet the conditions
 */
+ (NSArray*) getMessageList:(NSString *) number Start:(int)start Count:(int) count;

/**
 * <b>Description:</b> getMessageList is used to obtain the message list of users.
 * <br><b>Purpose:</b> getMessageList is invoked to obtain a number of messages that match the matchkey contents, and obtain matchIndex.
 * @param [in] number Indicates the user number
 * @param [in] count Indicates the count of messages
 * @param [in] matchKey Indicates matched contents
 * @param [out] matchIndex Indicates the match index where the matching Message is in the MessageList returned.
 * @return NSArray specifies a set of messages that meet the conditions, UI invoke getMessageList or getMessageList:(int)start count:(int) count method to get more messages.
 */
+ (NSArray*) getMessageList:(NSString *) number count:(int) count matchKey:(NSString*)matchKey matchIndex:(int*)matchIndex;


/**
 * <b>Description:</b> This method is used to obtain the session between the local UE and a specific number.
 * <br><b>Purpose:</b> The UI can invoke this interface to obtain one-to-one chat sessions between the local 
 * UE and a specific number. If the local database saves one-to-one chat sessions of this number, 
 * matched sessions will be displayed after this interface is invoked. If the local database does not save 
 * one-to-one chat sessions of this number, the SDK creates a one-to-one chat session as the returned value. 
 * Users can chat in this session after the UI invokes related interface.
 * @param [in] number Specifies the subscriber number with which the conversation is to be obtained
 * @return The value indicates the one-to-one chat between the local end and a specific number
 */
+(MessageConversation*)getConversationByNumber:(NSString*)number;

/**
 * <b>Description:</b> This method is used to send a text message with a specific number in a one-to-one chat.
 * <br><b>Purpose:</b> The UI invokes this method to send a text message to a specified contact.
 * @param [in] number Specifies the number of the contact to whom a text message is to be sent
 * @param [in] msg Specifies the content of a text message
 * @return The value indicates the text message object. For details, see TextMessage.
 * @deprecated The purpose of this method is just compatible with the old version of UI, we do not recommend the new version of UI invokes this method. Use Conversation::sendText instead of this function.
 */
+ (TextMessage*) sendText:(NSString *)number msgContent:(NSString *) msg;

/**
 *<b>Description:</b> This method is used to send a text message to a specified user and set parameters of the message in a one-to-one chat.
 *<br><b>Purpose:</b> The UI can invoke this interface to set parameters of a message instead of sending the message in the default mode. For example, 
 * the UI can only set whether an instant message is sent in page mode and whether a message is saved to the local database after it is sent.
 * @param [in] number Specifies the phone number of the user to whom a location is to be sent
 * @param [in] msg Specifies the contents of the text message to be sent
 * @param [in] imExtParas Specifies the field that carriers message parameters
 * <p>At present, the UI can set the following parameters:
 * <ul> 
 *    <li><em>{@link PARAM_SEND_TEXT_PAGE_MODE}</em></li>
 *    <li><em>{@link PARAM_SEND_TEXT_SAVE_DB}</em></li>
 *    <li><em>{@link PARAM_SEND_TEXT_IP_PAGE_MESSAGE}</em></li>
 * </ul>
 * @return The value indicates a text message
 */
+ (TextMessage*) sendText:(NSString *)number msgContent:(NSString *) msg extParas:(NSMutableDictionary*)imExtParas;

/**
 *<b>Description:</b> This method is used to send location messages in a one-to-one chat.
 * <br><b>Purpose:</b> The UI can invoke this method to send a location message in a session to a specified user. The SDK will store the location message in the database.
 * @param [in] number Specifies the phone number of the user to whom a location is to be sent
 * @param [in] latitude Specifies the latitude of the location
 * @param [in] longitude Specifies the longitude of the location
 * @param [in] title Specifies the title of the location
 * @param [in] subTitle Specifies the detail info of the location
 * @return The value indicates a location message
 */
+ (LocationMessage*) sendLocation:(NSString *) number title:(NSString *)title subTitle:(NSString*)subTitle longitude:(double)longitude latitude:(double)latitude;

/**
 * <b>Description:</b> This method is used to compress the images.
 * <br><b>Purpose:</b> The UI invokes this method to compress the images to be sent. Before UI invokes MessagingApi::sendImage method to send image message, it need to invoke this method to compress the image.
 * @param [in] imageInfo Specifies the returned images from the image system
 * @return YES Indicates that the images are successfully compressed
 *     <br>No Indicates that the images fail to be compressed
 */
+ (BOOL) compressImage:(NSDictionary*)imageInfo;

/**
 * <b>Description:</b> This method is used to send images in a one-to-one chat.
 * <br><b>Purpose:</b> When an image wants to be sent between end-to-end, The UI can invoke this method to send a 
 * image message to a specified user in this session. The SDK will store the image message in the database.
 * <br><b>attention:</b> This method is used to send an image file. It is suggested the UI should invoke sendFile interface.
 * @param [in] number Specifies the phone number of the contact to whom an image is to be sent
 * @param [in] imageInfo Specifies the image information
 * @return The value indicates the resource stored in the local device
 * @deprecated The purpose of this method is just compatible with the old version of UI, we do not recommend the new version of UI invokes this method. Use (ImageMessage*) sendImage:(NSString *) number imagePath:(NSString *) imagePath thumbPath:(NSString *)thumbPath instead of this function.
 */
+ (ImageMessage*) sendImage:(NSString *) number imageInfo:(NSDictionary *) imageInfo;

/**
 * <b>Description:</b> This method is used to send images in a one-to-one chat.
 * <br><b>Purpose:</b> When an image wants to be sent between end-to-end, The UI can invoke this method to send a image message to a specified user in this session. 
 * The SDK will store the image message in the database.
 * <br><b>attention:</b> This method is used to send an image file. It is suggested the UI should invoke sendFile interface.
 * @param [in] number Specifies the phone number of the contact to whom an image is to be sent
 * @param [in] imagePath Specifies the full path of the image to be sent, must smaller than the MAX_FILE_SIZE defined by DM.
 * @param [in] thumbPath Specifies the path of the image thumbnail or icon. The size of the image thumbnail or icon must be smaller than 15 KB. 
 * The recommended size is no larger than 10 KB.
 * @return The value indicates the resource stored in the local device
 */
+ (ImageMessage*) sendImage:(NSString *) number imagePath:(NSString *) imagePath thumbPath:(NSString *)thumbPath;

/**
 * <b>Description:</b> This method is used to send images in a one-to-one chat.
 * <br><b>Purpose:</b> When an image wants to be shared between end-to-end during a CS call, The UI can invoke this method to send a image message to a 
 * specified user in this session. The SDK will store the image message in the database.
 * <br><b>attention:</b> This method is used to send an image only in the CS call scene. If want to send an image in other scene, the UI could invoke sendFile interface.
 * @param [in] number Specifies the phone number of the contact to whom an image is to be sent
 * @param [in] imagePath Specifies the full path of the image to be sent, must smaller than the MAX_FILE_SIZE defined by DM.
 * @return The value indicates the resource stored in the local device
 */
+ (ImageMessage*) shareImage:(NSString *) number imagePath:(NSString *) imagePath;

/**
 * <b>Description:</b> This method is used to send the inputting status of the local end to the peer end.
 * <br><b>Purpose:</b> During a one-to-one chat, after the UI detects that the input contents of the local user 
 * changes, the UI invokes this method to send the inputting status to the peer end. The peer end 
 * needs to register {@link EVENT_MESSAGING_COMPOSING} to intercept the input status change of the other end. 
 * If the local end stops inputting, the UI does not need to invoke any method. 
 * The SDK automatically informs the peer end.
 * @param [in] number Specifies the number of the contact to whom a message is to be sent
 */
+ (void) sendComposing:(NSString *) number;

/**
 * <b>Description:</b> sendFile is used to send files.  
 * <br><b>Purpose:</b> The UI invokes sendFile to send files to a specified user.
 * @param [in] number Indicates the phone number of the user
 * @param [in] filename Indicates the name of the file to be sent
 * @return FileMessage* specifies the file object. See FileMessage
 * @deprecated The purpose of this method is just compatible with the old version of UI, we do not recommend the new version of UI invokes this method. Use (FileMessage*) sendFile:(NSString *) number filePath:(NSString *) filePath thumbPath:(NSString *)thumbPath instead of this function.
 */
+ (FileMessage*) sendFile:(NSString *) number fileName:(NSString *) fileName;

/**
 * <b>Description:</b> This method is used to send file with thumbnail or icon in a one-to-one chat.
 * <br><b>Purpose:</b> The UI invokes MessagingApi.sendFile to send a file with the thumbnail or icon to a specified subscriber. 
 * @param [in] number Specifies the number of the subscriber to whom a file to be sent.
 * @param [in] filePath Specifies the full path of the file to be sent, must smaller than the MAX_FILE_SIZE defined by DM.
 * @param [in] thumbPath Specifies the path of the file thumbnail or icon. The size of the file thumbnail or icon must be smaller than 10 KB. The recommended size is no larger than 5 KB.
 * @return The FileMessage object indicates the file is sending or nil indicates send operation is failed.
 */
+ (FileMessage*) sendFile:(NSString *) number filePath:(NSString *) filePath thumbPath:(NSString *)thumbPath;

/**
 * <b>Description:</b> This method is used to copy a IOS system library file(image or video) to the directory that SDK can access dirctly.
 * <br><b>Purpose:</b> The UI invokes this method to copy IOS system library file for SDK.
 * @param [in] fileInfo Specifies a NSDictionay object contains the system library file information
 * @return The value indicates a NSDictionary object
 * <br>The key PARAM_MESSAGE_FILE_PATH indicates the file path of new file which copied, Its value is NSString object.
 * <br>The key PARAM_MESSAGE_FILE_SIZE indicates the file size of new file which copied, Its value is NSNumber type.
 * <br>nil indicate the IOS system library file(image or video) fail to be copied.
 */
+ (NSDictionary*) copySystemFileToApplication:(NSDictionary*)fileInfo;


/**
 * <b>Description:</b> This method is used to save a message as a draft in one-to-one chat.
 * <br><b>Purpose:</b> If a user is interrupted by other things or the user does not send the input text to the peer end after the user inputs chat contents, 
 * the UI can invoke this method to save the input text of the user as a message draft. The SDK can save only one message draft for a session. This method 
 * can be invoked for multiple times. However, the latest contents will override the previous contents.
 * @param [in] msg Specifies the draft content
 * @return 1 Indicates that a message is saved as a draft
 *     <br>0 Indicates that saving as draft fails
 */
+ (BOOL) saveDraft:(NSString *) number msg:(NSString *) msg;

 /**
 * <b>Description:</b> This method is used to start recording voice.
 * <br><b>Purpose:</b> The UI invokes this method for recording voice. 
 * @return YES Indicates that voice record is successfully started
 *     <br>NO Indicates that voice record fails to be recorded
 */
+ (BOOL)startRecordVoice;

 /**
 * <b>Description:</b> This method is used to stop recording.
 * <br><b>Purpose:</b> The UI invokes this method for stop recording. The UI needs to record the time when the recording stops, which 
 * will be used when the UI invokes sendVoice to send PTT messages.
 * @return YES Indicates that voice record is successfully stoped
 *     <br>NO Indicates that voice record fails to be stoped
 */
+ (void)stopRecordVoice;

 /**
 * <b>Description:</b> This method is used to stop recording and delete the recording file.
 * <br><b>Purpose:</b> After the UI invokes MessagingApi::startRecordVoice for recording, if the UI wants to stop recording, the UI can invoke this method. The SDK will not delete the recording file.
 * @return YES Indicates that voice record is successfully cancled
 *     <br>NO Indicates that voice record fails to be cancled
 */
+ (BOOL)cancelRecordVoice;

/**
 * <b>Description:</b> This method is used to stop playing the current voice.
 * <br><b>Purpose:</b> After the UI invokes MessagingApi::stopCurrentVoice method, SDK will stop playing the voice. UI can't continue to play the voiceMessage, UI need to invoke playOrStop method to replay it.
 * @return YES Indicates that voice playing is successfully stoped
 *     <br>NO Indicates that voice playing fails to stop
 */
+ (BOOL)stopCurrentVoice;


 /**
 * <b>Description:</b> This method is used to send a voice message in a one-to-one chat.
 * <br><b>Purpose:</b> The UI can invoke this method to send a voice message in a session. The SDK will store the voice message in the database.
 * Please note that, for recording better, delay of 500 millseconds then invoke the interface
 * @param [in] number Specifies the number of the contact to whom a voice file is to be sent
 * @return The value indicates the voice message to be sent
 */
+ (VoiceMessage*)sendVoice:(NSString *)number;

/**
 * <b>Description:</b> This method is used to obtain the voice duration.
 * <br><b>Purpose:</b> UI can get this method to get the duration of a voice message for display.
 * @return float specifies the voice duration
 */
+ (float)getVoiceDuration;

/**
 * <b>Description:</b> This method is used to obtain the current voice play status.
 * <br><b>Purpose:</b> UI can get this method to obtain the current voice play status.
 * @return YES Indicates that voice is being played
 *     <br>NO Indicates that voice playing has stopped
 */
+ (BOOL)getVoicePlayStatus;

/**
 * <b>Description:</b> This method is invoked to obtain the current voice recording status and determine whether voice is being recorded.
 * <br><b>Purpose:</b> UI can get this method to obtain the current voice recording status and determine whether voice is being recorded.
 * @return YES Indicates that voice is being recorded
 *     <br>NO Indicates that the voice recording has stopped
 */
+ (BOOL)getVoiceRecordStatus;

/**
 * <b>Description:</b> This method is used to obtain the voice volume of the recorded voice file.
 * <br><b>Purpose:</b> After the UI invokes MessagingApi::startRecordVoice of the SDK for recording, the UI can invoke this 
 * method at a certain interval to obtain the voice volume. The UI can convert the returned value into customized volume level. 
 * @return The value indicates the volume level. The return value is in the range [0,1]. (1 represents the maximum value of system; 0 represents mute)
 */
+ (float)getVoiceRecordVolume;


 /**
 * <b>Description:</b> This method is used to determine whether instant messages can be sent to receivers 
 * when the receivers are offline.
 * <br><b>Purpose:</b> If dedicated parameters of the DM server have been configured to support the sending of 
 * instant messages to offline receivers, senders can send instant messages. It is recommended that the UI 
 * invoke isSupOfflineShare to determine whether instant messages can be sent to offline receivers. If the 
 * SDK does not support the sending of instant messages to offline receivers, the UI displays a message to 
 * notify subscribers.
 * @return YES Indicates that instant messages can be sent to offline receivers
 *     <br>NO Indicates that instant messages cannot be sent to offline receivers
 */
+ (BOOL)isSupOfflineShare;

 /**
 * <b>Description:</b> This method is used to configure whether senders request for "delivered" reports 
 * from receivers after the receivers receive messages.
 * <br><b>Purpose:</b> The UI invokes this method to configure whether senders request 
 * for "delivered" reports from receivers after the receivers receive messages. By default, senders 
 * require receivers to send "delivered" reports and receivers agree to send "delivered" reports. 
 * When senders request for "delivered" reports, they receive the {@link EVENT_MESSAGE_STATUS_CHANGED} broadcast. 
 * The message status in the broadcast is {@link MESSAGE_STATUS_DELIVERY_OK}. The SDK does not support the 
 * configuration about whether receivers agree to send "delivered" reports. If local ends functioning 
 * as senders request for "delivered" reports, the request is carried in every message sent by the 
 * local ends. The SDK remembers the configuration. To change the configuration, the UI needs to 
 * invoke this method again.
 * @param [in] request Specifies whether the delivery reports are required
 * <p>The parameter request can be set to any of the following values:
 * <ul> 
 *    <li><em>YES</em></li> - Indicates that "delivered" reports are required
 *    <li><em>NO</em></li> - Indicates that "delivered" reports are not required
 * </ul>
 * @return 0 Indicates that the configuration is successful
 *     <br>Other values indicates that the configuration fails
 */
+ (int) setRequestDeliveryStatus:(BOOL) request;


 /**
 * <b>Description:</b> This method is used to configure whether senders request for "read" 
 * reports from receivers after the receivers read messages.
 * <br><b>Purpose:</b> The UI invokes this method to configure whether senders request 
 * for "read" reports from receivers after the receivers read messages. By default, senders require 
 * receivers to send "read" reports and receivers agree to send "read" reports. When senders request 
 * for "read" reports from receivers and the receivers agree to send "read" reports, the senders 
 * receive {@link EVENT_MESSAGE_STATUS_CHANGED} broadcast. The message status in the broadcast is 
 * {@link MESSAGE_STATUS_READ}. If local ends functioning as senders request for "read" reports, the 
 * request is carried in every message sent by the local ends. The SDK remembers the configuration. 
 * To change the configuration, the UI needs to invoke this method again.
 * @param [in] request Specifies whether the read status reports are required
 * <p>The parameter request can be set to any of the following values:
 * <ul> 
 *    <li><em>YES</em></li> - Indicates that "read" reports are required
 *    <li><em>NO</em></li> - Indicates that "read" reports are not required
 * </ul>
 * @return 0 Indicates that the configuration is successful
 *     <br>Other values indicates that the configuration fails
 */
+ (int) setRequestDisplayStatus:(BOOL) request;

 /**
 * <b>Description:</b> This method is used to configure whether receivers agree to send "read" reports to senders after reading messages.
 * <br><b>Purpose:</b> The UI invokes this method to configure whether 
 * receivers agree to send "read" reports to senders after reading messages. By default, receivers 
 * agree to send "read" reports to senders. After receivers send "read" reports to senders, senders 
 * receive the {@link EVENT_MESSAGE_STATUS_CHANGED} broadcast. The message status in the broadcast is 
 * {@link MESSAGE_STATUS_READ}. If receivers agree to send "read" reports, the SDK automatically sends 
 * senders "read" reports for all messages after receivers read these messages. The SDK remembers 
 * the configuration. To change the configuration, the UI needs to invoke this method again.
 * @param [in] allow Specifies whether the receiver allow to send read reports to the sender
 * <p>The parameter allow can be set to any of the following values:
 * <ul> 
 *    <li><em>YES</em></li> - Indicates that a receiver agrees to send "read" reports
 *    <li><em>NO</em></li> - Indicates that a receiver does not agree to send "read" reports
 * </ul>
 * @return 0 Indicates that the configuration is successful
 *     <br>Other values indicates that the configuration fails
 */
+ (int) setAllowSendDisplayStatus:(BOOL) allow;

 /**
 * <b>Description:</b> This method is used to obtain the configuration about whether local ends 
 * functioning as senders request for "delivered" reports from receivers.
 * <br><b>Purpose:</b> The UI invokes this method to obtain the configuration about 
 * whether local ends functioning as senders request for "delivered" reports from receivers. 
 * After a subscriber modifies the configuration, the UI can invoke this interface to check whether 
 * the configuration has been updated. By default, receivers are required to send "delivered" reports.
 * @return 1 Indicates that receivers are required to send "delivered" reports
 *     <br>0 Indicates that receivers are not required to send "delivered" reports
 */
+ (BOOL) getRequestDeliveryStatus;

 /**
 * <b>Description:</b> This method is used to obtain the configuration about whether local ends 
 * functioning as senders request for "read" reports from receivers.
 * <br><b>Purpose:</b> The UI invokes this method to obtain the configuration about whether 
 * local end functioning as senders request for "read" reports from receivers. After a subscriber 
 * modifies the configuration, the UI can invoke this interface to check whether the configuration 
 * has been updated. By default, receivers are required to send "read" reports.
 * @return 1 Indicates that receivers are required to send "read" reports
 *     <br>0 Indicates that receivers are not required to send "read" reports
 */
+ (BOOL) getRequestDisplayStatus;


 /**
 * <b>Description:</b> This method is used to obtain configuration about whether local ends functioning 
 * as receivers agree to send "read" reports when senders requests for "read" reports from the receivers.
 * <br><b>Purpose:</b> The UI invokes this method to obtain the configuration about 
 * whether local ends functioning as receivers agree to send "read" reports to senders. After a 
 * subscriber modifies the configuration, the UI can invoke this interface to check whether the 
 * configuration has been updated. By default, the SDK agrees to send "read" reports to senders.
 * @return 1 Indicates that the local end agrees to send "read" reports
 *     <br>0 Indicates that the local end does not agree to send "read" reports
 */
+ (BOOL) getAllowSendDisplayStatus;

 /**
 * <b>Description:</b> This method is used to set a welcome message.
 * <br><b>Purpose:</b> The UI invokes this method to add a welcome message to the chat history 
 * between the login account and the service number. UI can get the service number by DM server. Note that the welcome message 
 * is directly added to the local database instead of being sent to clients, and the message type is 
 * {@link MESSAGE_TYPE_SYS_TEXT}. In the initial installation scenario, the UI can invoke this method  
 * to display welcome messages to subscribers.
 * @param [in] msg Specifies the welcome message content
 */
+ (void) setWelcomeMsg:(NSString *) msg;

/**
 * <b>Description:</b> This method is used to search for the conversation list.
 * <br><b>Purpose:</b> The UI invokes this method to search for the conversation list and provide a conversation record list that contains the matched nicknames, numbers, or chat messages.
 * @param [in] serchKey Indicates the search requirement
 * @param [in] isNumKeyBoard Indicates whether the search is conducted by entering numbers on the keypad
 * @return The value indicates the conversation set, the property searchMathType and searchMathRangeArray of MessageConversation that meet the search conditions. See MessageConversation.
 */
+(NSArray*)searchConversationsByKey:(NSString*)serchKey isNumKeyBoard:(BOOL)isNumKeyBoard;

/**
 * <b>Description:</b> This method is used to set the current chat user.
 * <br><b>Purpose:</b> The UI invokes this method to set the current chat user and determine whether the received message is about the current user. 
 * @param [in] number Indicates the user number
 * @param [in] type Indicates the conversation type. For detail, see {@link tag_CONVERSATION_TYPE}.
 * @deprecated The purpose of this method is just compatible with the old version of UI, we do not recommend the new version of UI invokes this method., SDK will no longer maintain. When UI send message to a specific number, it can specified number of the other side through the input parameter.
 */
+(void)setCurrentPeerNumber:(NSString*)number conversationType:(CONVERSATION_TYPE)type;

/**
 *<b>Description:</b> This method is used to send vcard messages in a one-to-one chat.
 * <br><b>Purpose:</b> The UI can invoke this method to send a vcard message in a session. The SDK will store the vcard message in the database. 
 * @param [in] number Specifies the user number
 * @param [in] fileName Specifies the absolute path of the message
 * @return The value indicates a vcard message
 */
+(VCardMessage *)sendVcard:(NSString*)number fileName:(NSString*)fileName;

/**
 * <b>Description:</b> compressVideo is used to compress videos. 
 * <br><b>Purpose:</b> The UI invokes this method to compress the videos to be sent. Before UI invokes MessagingApi::sendVideo method to send video message, it need to invoke this method to compress the video, 
 * when compressed, UI will receive EVENT_MESSAGE_VIDEO_COMPRESS_FINISH.
 * it was suggested to invoke this method to compress the video to make video smaller, it is optional. If UI invoke this method, the compressed videos will saved in
 * in the default path, such as "/var/mobile/Applications/6AEC1648-3559-4B4E-9783-7B96C1B595A8/Documents/video/"
 * @param [in] videoInfo Specifies the video information returned from the video system, after a shooting video, system will execute the method: 
 * - (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info, info will be gived by the method.  
 * @return YES Indicates that successful
 *     <br> NO Indicates that failed
 */
+ (BOOL) compressVideo:(NSDictionary*)videoInfo;

/**
 *<b>Description:</b> This method is used to send video messages in a one-to-one chat.
 * <br><b>Purpose:</b> The UI can invoke this method to send a video message in a session. The SDK will store the video message in the database.
 * if UI invoke MessagingApi::compressVideo to compress the video, SDK will get the video file in the default path by 
 * the name, such as in the path of "/var/mobile/Applications/6AEC1648-3559-4B4E-9783-7B96C1B595A8/Documents/video/"
 * @param [in] number Specifies the user number
 * @param [in] fileName Specifies the name of the video file stored in the local device, for attention, it is not a absolute path
 * @return The value indicates a video message
 */
+ (VideoMessage*) sendVideo:(NSString *) number fileName:(NSString *) fileName;

/**
 * <b>Description:</b> This method is used to send video in a one-to-one chat.
 * <br><b>Purpose:</b> The UI can invoke this method to send a video message to a specified user in a session. The SDK will store the video message in the database.
 * @param [in] number Specifies the phone number of the contact to whom an video is to be sent
 * @param [in] imagePath Specifies the full path of the video to be sent, must smaller than the MAX_FILE_SIZE defined by DM.
 * @param [in] thumbPath Specifies the path of the video thumbnail or icon. The size of the video thumbnail or icon must be smaller than 10 KB. The recommended 
 * size is no larger than 5 KB. If null, means not support preview images.
 * @return The value indicates the resource stored in the local device
 */
+ (VideoMessage*) sendVideo:(NSString *) number videoPath:(NSString *) videoPath thumbPath:(NSString *) thumbPath;

 /**
 * <b>Description:</b> This method is used to send an IP short message to a specified contact in a one-to-one chat.
 * <br><b>Purpose:</b> The UI invokes this method only when the SDK supports the UI for the sending of IP messages.
 * @param [in] pcMsgId Indentifies an IP short message. It cannot be unspecified.
 * @param [in] pcUri Specifies the number of the contact to whom IP short messages are to be sent. It cannot be unspecified.
 * @param [in] ipMessage Specifies the object of the IP short message to be sent and stores the content and attribute of the IP message.
 * @return 0 Indicates that an IP short message is sent
 *     <br>1 Indicates that an IP short message fails to be sent
 */
+ (int) sendIPMessage:(NSString*)pcMsgId pcUri:(NSString*)pcUri IPMessage:(IpMessage *)ipMessage;

 /**
 * <b>Description:</b> This method is used to set a configuration parameter value.
 * <br><b>Purpose:</b> The UI invokes MessagingApi::setConfig to set the configuration parameters required by a message 
 * to be sent when the DM server is not configured for an IMS network.
 * @param [in] majorType Specifies the major configuration parameter. The name of the major configuration parameter must be configured.
 * <p>The value of parameter majorType can be set to any one of the {@link tag_MESSAGE_CFG_MAJOR_TYPE} enumeration.
 * @param [in] minorType Specifies the minor configuration parameter to be set. It is an extended parameter and is not used currently. By default use {@link MESSAGE_CFG_MINOR_BUTT}
 * @param [in] configValue Specifies the value of the major configuration parameter to be set
 * @return 0 Indicates that the setting succeeds
 *     <br>1 Indicates that the setting fails
 */
+ (int) setconfig:(int)majorType minortype:(int)minorType configvalue:(NSString*)configValue;

/**
 * <b>Description:</b> This method is used to obtain configuration parameter values.
 * <br><b>Purpose:</b> The UI invokes MessagingApi::getConfig when it needs to obtain configuration parameter values. 
 * When the DM server is not configured for an IMS network, the UI can set configuration parameters. 
 * For details, see MessagingApi::setConfig. Then, the UI can invoke MessagingApi::getConfig to obtain whether the setting is stored.
 * @param [in] majorType Specifies the major configuration parameter name to be obtained
 * <p>The value of parameter majorType can be set to any one of the {@link tag_MESSAGE_CFG_MAJOR_TYPE} enumeration.
 * @param [in] minorType Specifies the minor configuration parameter to be obtained. It is an extended parameter and is not used currently. By default use {@link MESSAGE_CFG_MINOR_BUTT}.
 * @return The value indicates the value of the major configuration parameter
 */
+(NSString*) getconfig:(int)majorType minortype:(int)minorType;


/**
 * <b>Description:</b> This method is used to establish a low layer link for a one-to-one chat session when 
 * a user uses the same account to log in to a server using multiple terminals.
 * <br><b>Purpose:</b> The UI can invoke this method to establish a low layer link for a one-to-one chat 
 * session. If the low layer link exists, the SDK does not establish the low layer link again. 
 * If a user uses the same account to log in to a server using multiple terminals, 
 * the UI is recommended to invoke this method each time a user enters the one-to-one chat page or 
 * sends a message. If multiple UEs receive a message from another UE simultaneously, 
 * and one of the receivers invokes this method to establish a one-to-one chat session with the sender, 
 * other receivers cannot invoke this method.
 * @return 0 Indicates that configuration items are successfully set
 *     <br>1 Indicates that setting fails
 */
+(int) sendSingleIvtAccept:(NSString *)peerUri;

/**
 * <b>Description:</b> This method is used to terminate a low layer link after the local end proactively ends a one-to-one chat session.
 * <br><b>Purpose:</b> This method applies to scenarios when a user uses the same account to log 
 * in to a server using multiple terminals. The UI can invoke this method to end a one-to-one chat session. 
 * After the UI invokes this method, the SDK releases low layer resources related to this session. 
 * However, the SDK saves the session and chat records. If the UI wants to chat in this session, it must invoke 
 * the sendSingleIvtAccept method to establish low layer link after the receiver receives a message.
 * @return 0 Indicates that configuration items are successfully set
 *     <br>1 Indicates that setting fails
 */
+(int)chatLeave: (NSString *)peerUri;

/**
 * <b>Description:</b> This method is used to accept a group chat request.
 * <br><b>Purpose:</b> This method is used in multi-client scenarios. When the UI receives the 
 * broadcast {@link EVENT_GROUP_INVITE} used to notify of a group chat request, and the 
 * subscribers accepts the request, the UI invokes this method. After the request times out, 
 * the invoking of this method is invalid because the request becomes invalid. In multi-client 
 * scenarios, if multiple clients receive group chat requests from a client, and the UI of one client 
 * invokes this method to accept the request before other clients, other clients cannot join 
 * this group conversation by accepting the request.
 * @param [in] globalGrpId Indentifies a group chat
 * @return 1 Indicates that join this group conversation successful
 *     <br>0 Indicates that join this group conversation fails
 */
+(int)groupIvtAccept:(NSString*)globalGrpId;

/**
 * <b>Description:</b> This method is used to reject a group chat request. 
 * <br><b>Purpose:</b> This method is used in multi-client scenarios. When the UI 
 * receives the broadcast {@link EVENT_GROUP_INVITE} used to notify of a group chat request, 
 * and the subscriber rejects the request, the UI invokes this method. After the request times out, 
 * the invoking of this method is invalid because the request becomes invalid. In multi-client 
 * scenarios, if multiple clients receive group chat requests from a client, and the UI of one client 
 * invokes this method to reject the request before other clients, other clients cannot join this 
 * group conversation by accepting the request.
 * @param [in] globalGrpId Indentifies a group chat
 * @return 1 Indicates that reject this group conversation successful
 *     <br>0 Indicates that reject this group conversation fails
 */
+(int)groupIvtReject:(NSString*)globalGrpId;

/**
 * <b>Description:</b> This method is used to insert or update a custom chat.
 * <br><b>Purpose:</b> This method is used to display a custom chat in UI.
 * @param [in] number Indentifies the number in custom chat.
 * @param [in] displayName Indentifies the displayName in custom chat.
 * @return YES Indicates that insert or update this custom chat successful
 *     <br>NO Indicates that insert or update this custom chat fails
 */
+(BOOL) insertCustomConversation:(NSString*)number displayName:(NSString*)displayName;

/**
 * <b>Description:</b> This method is used to send a text message with a specific number in a one-to-one chat.
 * <br><b>Purpose:</b> The UI invokes this method to send a text message to a specified contact.
 * @param [in] number Specifies the number of the contact to whom a text message is to be sent
 * @param [in] msg Specifies the content of a text message
 * @param [in] inReplyToContId Specifies the Contribution ID the receiver replies to
 * @param [in] replyTo Specifies the address the receiver replies to
 * @return The value indicates the text message object. For details, see TextMessage.
 * For attention: This interface is reserved
 */
+ (TextMessage*) sendText:(NSString *)number msgContent:(NSString *) msg replyToContId:(NSString*)inReplyToContId replyTo:(NSString*)replyTo;

/**
 * <b>Description:</b> This method is used to send files.  
 * <br><b>Purpose:</b> The UI invokes sendFile to send files to a specified user.
 * @param [in] number Indicates the phone number of the user
 * @param [in] filename Indicates the name of the file to be sent
 * @param [in] inReplyToContId Specifies the Contribution ID the receiver replies to
 * @param [in] replyTo Specifies the address the receiver replies to
 * @return FileMessage* specifies the file object. See FileMessage
 * For attention: This interface is reserved
 */
+ (FileMessage*) sendFile:(NSString *) number fileName:(NSString *) fileName replyToContId:(NSString*)inReplyToContId replyTo:(NSString*)replyTo;

@end

#endif
