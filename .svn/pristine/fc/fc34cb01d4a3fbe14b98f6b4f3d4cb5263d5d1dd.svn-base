/**
 * @file PushApi.h
 * @brief Push Interface Functions
 */
#ifndef _PUSH_API_H_
#define _PUSH_API_H_

#import <Foundation/Foundation.h>

/** 
 * It is used to query enumeration constants of push notification languages.
 * The UI invokes it to query push notification language types. The push notification language is the same as the system language.
 */
typedef enum tag_PUSH_LANGUAGE_TYPE
{
    PUSH_LANG_ENGLISH = 0, /**< @brief Indicates that the push notification language is English. */
    PUSH_LANG_CHINESE = 1, /**< @brief Indicates that the push notification language is Simplified Chinese. */
    PUSH_LANG_FRENCH  = 2, /**< @brief Indicates that the push notification language is French. */
    PUSH_LANG_GERMAN  = 3, /**< @brief Indicates that the push notification language is German. */
    PUSH_LANG_GREEK   = 4, /**< @brief Indicates that the push notification language is Greek. */
    PUSH_LANG_ITALIAN = 5, /**< @brief Indicates that the push notification language is Italian. */
    PUSH_LANG_RUSSIAN = 6, /**< @brief Indicates that the push notification language is Russian. */
    PUSH_LANG_SPANISH = 7, /**< @brief Indicates that the push notification language is Spanish. */
    PUSH_LANG_CHINESE_TRADITIONAL = 200, /**< @brief Indicates that the push notification language is Traditional Chinese.*/
    PUSH_LANG_BUFF = 255   /**< @brief Indicates that the invalid value.*/
} PUSH_LANGUAGE_TYPE;

/** 
 * It indicates enumeration constants of push notification types.
 * The UI invokes it to distinguish that UI enable or disable the push notification function.
 */
typedef enum tag_PUSH_TYPE
{
    PUSH_TYPE_ENABLE, /**< @brief Indicates that the push notification function has been enabled.*/
    PUSH_TYPE_DISABLE /**< @brief Indicates that the push notification function has been disabled.*/
} PUSH_TYPE;

/** 
 * Indicates a push notification identification in NSDictionary. 
 */
#define PARAM_PUSH_ID @"PUSHAPI_PARAM_PUSHID"

/** 
 * Indicates a push notification result in NSDictionary.
 * if the value is 0, it means enabling or disabling successfully,
 * if the value is 1, it means enabling or disabling unsuccessfully.
 */
#define PARAM_PUSH_RESULT @"PUSHAPI_PARAM_RESULT"

/** 
 * Indicates a push notification type in NSDictionary.
 * @see tag_PUSH_TYPE
 */
#define PARAM_PUSH_TYPE @"PUSHAPI_PARAM_TYPE"

/** 
 * Indicates a push notification appid in NSDictionary.
 */
#define PARAM_PUSH_APP_ID @"PUSHAPI_PARAM_APPID"

/** 
 * <b>Description:</b> It is used to broadcast push notifications,Indicates a push notification result.
 * <br><b>Purpose:</b> After UI enable or disable the push function to the server,
 * UI will receive the broadcast, it will tell UI that enabling or disabling the push function is success or not.
 * <p>The broadcast will have the following extra parameters:
 * <ul>
 * <li><em>{@link #PARAM_PUSH_ID}</em></li> - Indicates push id[u_long]
 * <li><em>{@link #PARAM_PUSH_TYPE}</em></li> - Indicates push type[int]
 * <li><em>{@link #PARAM_PUSH_RESULT}</em></li> - Indicates push result[u_long]
 * </ul>
 * </p>
 */
#define EVENT_PUSH_RESULT @"PUSHAPI_EVENT_RESULT"

/** 
 * <b>Description:</b> It is used to broadcast push notifications,Indicates a push notification result.
 * <br><b>Purpose:</b> After UI enable or disable the push function to the server,
 * UI will receive the broadcast, it will tell UI that enabling or disabling the push function is success or not.
 * <p>The broadcast will have the following extra parameters:
 * <ul>
 * <li><em>{@link #PARAM_PUSH_ID}</em></li> - Indicates push id[u_long]
 * <li><em>{@link #PARAM_PUSH_TYPE}</em></li> - Indicates push type[int]
 * <li><em>{@link #PARAM_PUSH_RESULT}</em></li> - Indicates push result[u_long]
 * <li><em>{@link #PARAM_PUSH_APPID}</em></li> - Indicates APP ID[NSString *]
 * </ul>
 * </p>
 */
#define EVENT_MULTI_PUSH_RESULT @"PUSHAPI_MULTI_PUSH_EVENT_RESULT"

/** Indicates that the max size of the value for Setting */
#define PUSH_SETTING_ZMAXINT 0x7FFFFFFF

/** 
 * It indicates the major types for push configuration.
 * The UI invokes it to set the push parameters.
 */
typedef enum tag_PUSH_CFG_MAJOR_TYPE
{
    PUSH_CFG_MAJOR_PUSH_CONFIG      = 0, /**< @brief Indicates that the major type of push configuration. */
    
    PUSH_CFG_MAJOR_BUTT                  /**< @brief Indicates that the invalid value. */
} PUSH_CFG_MAJOR_TYPE;

/** 
 * It indicates the minor types for push configuration.
 * The UI invokes it to set the push parameters.
 */
typedef enum tag_PUSH_CFG_MINOR_TYPE
{
    PUSH_CFG_MINOR_SUPPORT_PUSH      = 0,  /**< @brief Indicates that the minor configuration type of supporting push. */
    PUSH_CFG_MINOR_PUSH_SERVER_URL   = 1,  /**< @brief Indicates that the minor configuration type of push server url. */
    PUSH_CFG_MINOR_PUSH_EXPIRE       = 2,  /**< @brief Indicates that the minor configuration type of push expire. */
    PUSH_CFG_MINOR_PUSH_SERVER_URL_BACKUP   = 3,  /**< @brief Indicates that the minor configuration type of push backup server url,it can not be used in DNS mode.*/
    PUSH_CFG_MINOR_BUTT = PUSH_SETTING_ZMAXINT    /**< @brief Indicates that the default minor type of push configuration. */
} PUSH_CFG_MINOR_TYPE;

/** 
* <b>Description:</b> It provides an entry to push notifications.
* <br><b>Purpose:</b>  The UI accesses APIs of push notification to implement push notification services.
* This class provides kinds of interfaces, such as getting whether IMS network supports push, getting push 
* notification parameters and enabling or disabling push notification function to the server.
*/
@interface PushApi : NSObject
{
}


/**
 * <b>Description:</b> This method provides initialization for push notification APIs.
 * <br><b>Purpose:</b> It is used to initialize push notification APIs during system initialization 
 * before the push notification function is used.
 */
+ (void) init;

/** 
* <b>Description:</b> It is used to release push APIs before logging out of the RCS client.
* <br><b>Purpose:</b> The UI invokes it to release push APIs before logging out of the RCS client.
*/
+ (void) releaseApi;

/**
 * <b>Description:</b> It is used to enable the push notification function.
 * <br><b>Purpose:</b> The UI invokes it to enable the push notification function. it is mandatory for 
 * the push notification function. After this method is invoked, UI will receive the {@link #EVENT_PUSH_RESULT} broadcast.
 * @param [in] language Specifies the current language
 * <p>The value of parameter language can be set to any one of the {@link tag_PUSH_LANGUAGE_TYPE} enumeration.
 * @param [in] tokenId Specifies to identifies a mobile phone token
 * @param [in] pushId Specifies to identifies a push notification
 */
+ (void) enablePush:(int)language tokenId:(NSString*)tokenId pushId:(unsigned long*)pushId;

/**
 * <b>Description:</b> It is used to enable the push notification function for multiple app.
 * <br><b>Purpose:</b> The UI invokes it to enable the push notification function. it is mandatory for 
 * the push notification function. After this method is invoked, UI will receive the {@link #EVENT_MULTI_PUSH_RESULT} broadcast.
 * @param [in] language Specifies the current language
 * <p>The value of parameter language can be set to any one of the {@link tag_PUSH_LANGUAGE_TYPE} enumeration.
 * @param [in] tokenId Specifies to identifies a mobile phone token
 * @param [in] pushId Specifies to identifies a push notification
 * @param [in] appId Specifies to identifies a app
 *<p>The value of parameter appId can not be nil.
 */
+ (void) enableMultiPush:(int)language tokenId:(NSString*)tokenId pushId:(unsigned long*)pushId appId:(NSString*)appId;

/**
 * <b>Description:</b> It is used to disable the push notification function.
 * <br><b>Purpose:</b> The UI invokes it to disable the push notification function. No push notification 
 * is delivered after it is invoked. After this method is invoked, UI will receive the {@link #EVENT_PUSH_RESULT} broadcast.
 * @param [in] language Specifies the current language
 * <p>The value of parameter language can be set to any one of the {@link tag_PUSH_LANGUAGE_TYPE} enumeration.
 * @param [in] tokenId Specifies to identifies a mobile phone token
 * @param [in] pushId Specifies to identifies a push notification
 */
+ (void) disablePush:(int)language tokenId:(NSString*)tokenId pushId:(unsigned long*)pushId;

/**
 * <b>Description:</b> It is used to disable the push notification function for multiple app.
 * <br><b>Purpose:</b> The UI invokes it to disable the push notification function. No push notification 
 * is delivered after it is invoked. After this method is invoked, UI will receive the {@link #EVENT_MULTI_PUSH_RESULT} broadcast.
 * @param [in] language Specifies the current language
 * <p>The value of parameter language can be set to any one of the {@link tag_PUSH_LANGUAGE_TYPE} enumeration.
 * @param [in] tokenId Specifies to identifies a mobile phone token
 * @param [in] pushId Specifies to identifies a push notification
  * @param [in] appId Specifies to identifies a app
 *<p>The value of parameter appId can not be nil.
 */
+ (void) disableMultiPush:(int)language tokenId:(NSString*)tokenId pushId:(unsigned long*)pushId appId:(NSString*)appId;

/**
 * <b>Description:</b> It is used to query whether the network supports the push function.
 * <br><b>Purpose:</b> The UI invokes it to query whether the network supports the push function 
 * before the push function is used.
 * @return YES Indicates it support push function
 *     <br>NO Indicates it does not support push function
 */
+ (BOOL)getIsSupportPush;

/**
 * <b>Description:</b> This method is used to get specified configuration value in call section.
 * <br><b>Purpose:</b> when no DM server is deployed for the IMS network, the UI invokes this method 
 * to obtain a configuration parameter value.
 * @param [in] majorType Specifies major tpye of the specified configuration
 * <p>The value of parameter majorType can be set to any one of the {@link tag_PUSH_CFG_MAJOR_TYPE} enumeration.
 * @param [in] minorType Specifies minor tpye of the specified configuration
 * <p>The value of parameter minorType can be set to any one of the {@link tag_PUSH_CFG_MINOR_TYPE} enumeration.
 * @return The value indicates the specified configuration value
 */
+(NSString*) getConfig:(int)majorType minortype:(int)minorType;

/**
 * <b>Description:</b> This method is used to set specified configuration value in call section.
 * <br><b>Purpose:</b> when no DM server is deployed for the IMS network, the UI invokes this method 
 * to set a configuration parameter value. 
 * @param [in] majorType Specifies major tpye of the specified configuration
 * <p>The value of parameter majorType can be set to any one of the {@link tag_PUSH_CFG_MAJOR_TYPE} enumeration.
 * @param [in] minorType Specifies minor tpye of the specified configuration
 * <p>The value of parameter minorType can be set to any one of the {@link tag_PUSH_CFG_MINOR_TYPE} enumeration.
 * @param configValue Specifies the specified configuration value
 */
+(void) setConfig:(int)majorType minortype:(int)minorType configvalue:(NSString*)configValue;

@end

#endif
