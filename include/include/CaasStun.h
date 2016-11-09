/**
 * @file CaasStun.h
 */
#ifndef _CAAS_STUN_H
#define _CAAS_STUN_H

#import <Foundation/Foundation.h>


/**
 * <b>Description:</b> It is used to notify the results of the stun.
 * <br><b>Purpose:</b> After start stun, the UI receives this notification which carries the 
 * checking result. a @ref EVENT_STUN_RESULT
 * <p>The notification will have the following extra parameters:
 * <ul>
 * <li><em>{@link #PARAM_STUN_RESULT}</em></li>- Indicates stun result[unsigned int]
 * </ul>
 * </p>
 */
#define EVENT_STUN_RESULT     @"STUN_EVENT_RESULT"

/**
 * Indicates the stun ID in the notification NSDictionary.
 */
#define PARAM_STUN_ID         @"STUN_PARAM_ID"

/**
 * Indicates the stun result in the notification NSDictionary.
 * @see tag_STUN_RESULT_TYPE
 */
#define PARAM_STUN_RESULT     @"STUN_PARAM_RESULT"

/**
 * Indicates the result of STUN 
 */
typedef enum tag_STUN_RESULT_TYPE
{
    STUN_RESULT_NOT_DETECT = 0,        /**< @brief Indicates that not detect.*/
    STUN_RESULT_NORMAL_RSP = 1,        /**< @brief Indicates that respond normally.*/
    STUN_RESULT_NOT_RSP    = 2,        /**< @brief Indicates that not respond.*/
    STUN_RESULT_BUTT                   /**< @brief Indicates that butt.*/
} STUN_RESULT_TYPE;

/** 
 * <b>Description:</b> It provides an entry to use stun service. 
 * <br><b>Purpose:</b> The UI accesses CaasStun APIs to implement stun service.
 */
@interface CaasStun: NSObject
{
    
}

/**
 * <b>Description:</b> This method is used to initialize the stun component. 
 * <br><b>Purpose:</b> The UI invokes it to initialize stun component during system initialization before login.
 * @return 0 Indicates it succeed to initialize
 *    <br> not 0 Indicates it failed to initialize
 */
+ (int)init;

/** 
* <b>Description:</b> This method is used to release login APIs before logging out of the RCS client.
* <br><b>Purpose:</b> The UI invokes it to release login APIs before logging out of the RCS client.
* @return Indicates the stun object ID
*/
+ (unsigned int)stunAlloc;

/**
 * <b>Description:</b> This method is used to free a stun object ID. 
 * <br><b>Purpose:</b> After finishing the stun, the UI invokes this method to free a stun object ID.
 * @param [in] stunID Specifies the stun object ID
 * @return 0 Indicates it succeed to free
 *    <br> not 0 Indicates it failed to free
 */
+ (int)stunFree: (unsigned int)stunID;

/**
 * <b>Description:</b> This method is used to start stun. 
 * <br><b>Purpose:</b> The UI invokes it to start stun after allocing a stun object ID.
 * @param [in] stunID Specifies the stun object ID
 * @param [in] serverAddr Specifies the server address
 * @param [in] serverPort Specifies the server port
 * @param [in] count Specifies the count of stun, the default interval time of each stun is 2 seconds  
 * @return 0 Indicates it succeed to invoke this method
 *    <br> not 0 Indicates it failed to invoke this method
 */
+ (int)stunCheck: (unsigned int)stunID serverAddr:(NSString *)serverAddr serverPort:(unsigned int)serverPort
           count:(unsigned int)count;

@end

#endif