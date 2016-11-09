/**
 * @file CaasImbs.h
 * @brief imbs Interface Functions
 */
#ifndef _CAAS_IMBS_H_
#define _CAAS_IMBS_H_

#import <Foundation/Foundation.h>
#import "CaasImbsCfg.h"

/** It indicates enumeration constants of message backup setting types */
typedef enum tag_IMBS_TYPE
{
    IMBS_TYPE_QUERY, /**< @brief Indicates the type is query message backup service.*/
    IMBS_TYPE_OPEN, /**< @brief Indicates the type is open message backup service.*/
    IMBS_TYPE_CLOSE /**< @brief Indicates the type is close message backup service.*/
} IMBS_TYPE;

/** It indicates enumeration constants of current status of message backup service on server */
typedef enum tag_IMBS_STATUS
{
    IMBS_STATUS_OPEN, /**< @brief Indicates the status of message backup service on server is open.*/
    IMBS_STATUS_CLOSE, /**< @brief Indicates the status of message backup service on server is close.*/
    IMBS_STATUS_UNKNOWN /**< @brief Indicates the status of message backup service on server is unknown.*/
} IMBS_STATUS;

/** It indicates enumeration constants of state code return from server */
typedef enum tag_IMBS_STATCODE
{
    IMBS_STATCODE_SUCCESS, /**< @brief Indicates the query or set up request of client is success.*/
    IMBS_STATCODE_BAD_GW, /**< @brief Indicates client unified authentication failed, such as token exceed the time limit.*/
    IMBS_STATCODE_UNSUBSCRIBE, /**< @brief Indicates client is not subscribe the message backup service.*/
    IMBS_STATCODE_AUTH_FAILED, /**< @brief Indicates server authentication failed.*/
    IMBS_STATCODE_SERVER_ERROR, /**< @brief Indicates server error, such as operate DB failed.*/
    IMBS_STATCODE_BAD_REQ, /**< @brief Indicates the request message client send is error.*/
    IMBS_STATCODE_TIME_OUT, /**< @brief Indicates server no answer the client request.*/
    IMBS_STATCODE_OTHER = 255 /**< @brief Indicates other error, such as DNS query failed.*/
} IMBS_STATCODE;

/**
 * Indicates the type of message backup setting.
 * @see tag_IMBS_TYPE
 */
#define PARAM_IMBS_TYPE @"CAASIMBS_PARAM_TYPE"

/**
 * Indicates the current status of message backup service on server.
 * @see tag_IMBS_STATUS
 */
#define PARAM_IMBS_STATUS @"CAASIMBS_PARAM_STATUS"

/**
 * Indicates the state code return from server.
 * @see tag_IMBS_STATCODE
 */
#define PARAM_IMBS_STATCODE @"CAASIMBS_PARAM_STATCODE"

/**
 * <b>Description:</b> It is used to broadcast a query or set up result of message backup service on server.
 * <br><b>Purpose:</b> After UI query or enable or disable the message backup service on the server,
 * UI will receive the broadcast, it will tell UI that quering or enabling or disabling the message backup service is success or not.
 * <p>The broadcast will have the following extra parameters:
 * <ul>
 * <li><em>{@link #PARAM_IMBS_TYPE}</em></li> - Identifies is query or set up message backup[int]
 * <li><em>{@link #PARAM_IMBS_STATUS}</em></li> - Identifies status of message backup service on server[int]
 * <li><em>{@link #PARAM_IMBS_STATCODE}</em></li> - Identifies status code[int]
 * </ul>
 * </p>
 */
#define EVENT_IMBS_RESULT @"CAASIMBS_EVENT_RESULT"

/**
 * <b>Description:</b> CaasImbs provides an entry to query and set up message backup service.
 * <br><b>Purpose:</b> It provides the entry to query and set up message backup service.
 */
@interface CaasImbs : NSObject
{
}


/**
 * <b>Description:</b> This method provides initialization for message backup setting component.
 * <br><b>Purpose:</b> The UI invokes this method to initialize the message backup setting function during system initialization.
 */
+ (void) init;

/**
 * <b>Description:</b> This method is used to release message backup setting component.
 * <br><b>Purpose:</b> TThe UI invokes this method to destroy message backup setting component before a subscriber exits the application.
 */
+ (void) release;

/**
 * <b>Description:</b> This method is used to query message backup status on server.
 * <br><b>Purpose:</b> The UI invokes this method to query message backup status on server before open or close message backup service.
 * After this method is invoked, UI will receive the {@link #EVENT_IMBS_RESULT} broadcast.
 */
+ (void)queryMsgBackUpStatus;

/**
 * <b>Description:</b> This method is used to open the message backup service on server.
 * <br><b>Purpose:</b> The UI invokes this method to enable the message backup service on server.
 * After this method is invoked, UI will receive the {@link #EVENT_IMBS_RESULT} broadcast.
 */
+ (void) enableMsgBackUp;

/**
 * <b>Description:</b> This method is used to close the message backup service on server.
 * <br><b>Purpose:</b> The UI invokes this method to disable the message backup service on server.
 * After this method is invoked, UI will receive the {@link #EVENT_IMBS_RESULT} broadcast.
 */
+ (void) disableMsgBackUp;

@end

#endif
