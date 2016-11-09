/**
 * @file MwiApi.h
 * @brief mwi Interface Functions
 */
#ifndef _MWI_API_H_
#define _MWI_API_H_

#import <Foundation/Foundation.h>

/**
 * <b>Description:</b> It is used to broadcast an event that a MWI message is received.
 * <br><b>Purpose:</b> When the UI receives the broadcast, it indicates that the client has received a MWI message.
 * <p>The notification do not have any extra value:
 * </p>
 */
#define EVENT_SYS_MWI_RECV_MSG @"EVENT_SYS_MWI_RECV_MSG"

/** Indicates UI wants to get what type of the message count */
typedef enum tag_MWI_GET_MESSAGE_COUNT_TYPE
{
    EN_MWI_GET_VOICE_NEW_MESSAGE_COUNT, /*Indicates UI wants to get voice new message count*/
    EN_MWI_GET_VOICE_OLD_MESSAGE_COUNT, /*Indicates UI wants to get voice old message count*/
    EN_MWI_GET_VOICE_NEW_EMERGENT_MESSAGE_COUNT, /*Indicates UI wants to get voice new emergent message count*/
    EN_MWI_GET_VOICE_OLD_EMERGENT_MESSAGE_COUNT, /*Indicates UI wants to get voice old emergent message count*/
    EN_MWI_GET_VIDEO_NEW_MESSAGE_COUNT, /*Indicates UI wants to get video new message count*/
    EN_MWI_GET_VIDEO_OLD_MESSAGE_COUNT, /*Indicates UI wants to get video old message count*/
    EN_MWI_GET_VIDEO_NEW_EMERGENT_MESSAGE_COUNT, /*Indicates UI wants to get video new emergent message count*/
    EN_MWI_GET_VIDEO_OLD_EMERGENT_MESSAGE_COUNT, /*Indicates UI wants to get video old emergent message count*/
    EN_MWI_GET_FAX_NEW_MESSAGE_COUNT, /*Indicates UI wants to get fax new message count*/
    EN_MWI_GET_FAX_OLD_MESSAGE_COUNT, /*Indicates UI wants to get fax old message count*/
    EN_MWI_GET_FAX_NEW_EMERGENT_MESSAGE_COUNT, /*Indicates UI wants to get fax new emergent message count*/
    EN_MWI_GET_FAX_OLD_EMERGENT_MESSAGE_COUNT, /*Indicates UI wants to get fax old emergent message count*/
}MWI_GET_MESSAGE_COUNT_TYPE;

/** 
* <b>Description:</b> MwiApi provides an entry to MWI. 
* <br><b>Purpose:</b> The user interface (UI) accesses MWI application platform interfaces (APIs) 
* to implement MWI. Mwiapi provides the entry MWI to get MWI information.
*/
@interface MwiApi : NSObject
{
}
/**
 * <b>Description:</b> This method is get MWI state.
 * <br><b>Purpose:</b> When the UI received EVENT_SYS_MWI_RECV_MSG broadcast then invokes this method to get MWI state to show to user 
 *
 * @param 
 *
 * @return get the MWI state
 *      <br> 0 there is unread message
 *      <br> 1 there is not unread message
 */
+(int)getMwiMessageWait;

/**
 * <b>Description:</b> This method is get message account.
 * <br><b>Purpose:</b> When the UI received EVENT_SYS_MWI_RECV_MSG broadcast then invokes this method to get message account to show to user 
 *
 * @param 
 *
 * @return get the message account
 */
+(NSString*)getMwiMessageAccount;

/**
 * <b>Description:</b> This method is get voice message count.
 * <br><b>Purpose:</b> When the UI received EVENT_SYS_MWI_RECV_MSG broadcast then invokes this method to get message count to show to user 
 *
 * @param [in]Indicates UI wants to get what type of the message count, include vioce message, video message, fax message @ref MWI_GET_MESSAGE_COUNT_TYPE.
*
 * @return get the message count
*/
+(int)getMwiMessageCount:(int)messageType;
@end

#endif

