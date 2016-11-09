/**
 * @file UportalApi.h
 * @brief Uportal Interface Functions
 */
#ifndef _UPORTAL_API_H_
#define _UPORTAL_API_H_

#import <Foundation/Foundation.h>

/** 
 * Indicates the previous uportal status.
 * @see tag_UPORTAL_STATUS
 */
#define PARAM_UPORTAL_OLD_STATUS @"UPORTALAPI_PARAM_OLD_STATUS"

/** 
 * Indicates the current uportal status.
 * @see tag_UPORTAL_STATUS
 */
#define PARAM_UPORTAL_NEW_STATUS @"UPORTALAPI_PARAM_NEW_STATUS"

/** 
 * Indicates the status code.
 */
#define PARAM_UPORTAL_STAT_CODE @"UPORTALAPI_PARAM_STAT_CODE"

/** 
 * Indicates the operation type.
 */
#define PARAM_UPORTAL_PROV_TYPE @"UPORTALAPI_PARAM_PROV_TYPE"

/** 
 * Indicates the operation status.
 */
#define PARAM_UPORTAL_PROV_STATUS @"UPORTALAPI_PARAM_PROV_STATUS"

/**
 * <b>Description:</b> It is used to broadcast a uportal status change. 
 * <br><b>Purpose:</b> After the login uportal, When the UI receives a broadcast, the uportal status has changed, 
 * and the UI must be updated. The UI may receive the broadcast multiple times 
 * depending on the network quality. The UI is recommended to perform interception on this broadcast 
 * during the entire running of the application.
 * <p>The broadcast will have the following extra parameters:
 * <ul>
 * <li><em>{@link #PARAM_UPORTAL_OLD_STATUS}</em></li> - Indicates uportal old status[int]
 * <li><em>{@link #PARAM_UPORTAL_NEW_STATUS}</em></li> - Indicates uportal new status[int]
 * <li><em>{@link #PARAM_UPORTAL_STAT_CODE}</em></li> - Indicates uportal status code[int]
 * </ul>
 * </p>
 */
#define EVENT_UPORTAL_STATUS_CHANGED @"UPORTALAPI_EVENT_LOGIN_STATUS_CHANGED"

/**
 * <b>Description:</b> It is used to notify the results of self-help password modification requests.
 * <br><b>Purpose:</b> After sending self-help password modification request to the server, the UI receives this notification which carries the 
 * request type and execution result.
 * <p>The notification will have the following extra parameters:
 * <ul>
 * <li><em>{@link #PARAM_UPORTAL_PROV_TYPE}</em></li> - Indicates uportal prov type[int]
 * <li><em>{@link #PARAM_UPORTAL_PROV_STATUS}</em></li> - Indicates uportal prov status[long]
 * </ul>
 * </p>
 */
#define EVENT_UPORTAL_PROVISION_RESULT @"UPORTALAPI_EVENT_PROVISION_RESULT"

/**
 * Indicates default or pointless type in the minor configuration tpye.
 * @see UPORTAL_ZMAXINT
 */
#define UPORTAL_ZMAXINT 0x7FFFFFFF

/** Indicates set uportal major type */
typedef enum tag_UPORTAL_MAJOR_TYPE
{
    UPORTAL_MAJOR_SERVER_IP,                /**< Indicates that the major configuration type of server IP.*/
    UPORTAL_MAJOR_SERVER_PORT,              /**< Indicates that the major configuration type of server port.*/
    UPORTAL_MAJOR_RESETPWD_URL,             /**< Indicates that the major configuration type of web url for
                                              * password reset via browser. UI can get the url, but can't set it.*/
    UPORTAL_MAJOR_ADMIN_URL,                /**< Indicates that the major configuration type of web url for
                                                * administration via browser. UI can get the url, but can't set it. */
    UPORTAL_MAJOR_TRANSPORT_TYPE = 4,       /**< Indicates that the major configuration type of transport type. (http-0/https-1)*/
    
    UPORTAL_MAJOR_BUTT = UPORTAL_ZMAXINT    /**< Indicates BUTT.*/
}UPORTAL_MAJOR_TYPE;

/** Indicates set user minor type */
typedef enum tag_UPORTAL_MINOR_TYPE
{
    UPORTAL_MINOR_BUTT = UPORTAL_ZMAXINT    /**< Indicates BUTT.*/
}UPORTAL_MINOR_TYPE;

/** 
 * Indicates uportal status. 
 * It is used to query enumeration constants of uportal status.
 * The UI invokes it to query the current uportal status and updates the page based on the query result.
 */
typedef enum tag_UPORTAL_STATUS
{
    UPORTAL_STATUS_IDLE,             /**< @brief Indicates that invalid uportal status. */
    UPORTAL_STATUS_CONNECTED,        /**< @brief Indicates that a uportal status. The UI has successfully connected to the U-PORTAL. */
    UPORTAL_STATUS_DISCONNECTED,     /**< @brief  Indicates that a uportal status. The UI is disconnected or deregistered from the U-PORTAL. For example, the UI successfully connected to the U-PORTAL and the network is disconnected. The UI cannot access the U-PORTAL again.*/
    UPORTAL_STATUS_CONNECTING,       /**< @brief Indicates that a uportal status. The UI is connecting to the U-PORTAL. */
    UPORTAL_STATUS_DISCONNECTING,    /**< @brief Indicates that a uportal status. The UI is deregistering from the U-PORTAL. */
    UPORTAL_STATUS_BUTT              /**< Indicates butt. */
}UPORTAL_STATUS;

/** 
 * Indicates the uportal status code.
 */
typedef enum tag_UPORTAL_STATCODE
{
    UPORTAL_STATCODE_SUCCESS,                /**< Indicates success.*/
    UPORTAL_STATCODE_AUTH_FAILED,            /**< Indicates authentication failed. */
    UPORTAL_STATCODE_CONN_TIMEOUT,           /**< Indicates the connection to server timeout. */
    UPORTAL_STATCODE_CONN_ERROR,             /**< Indicates the connection error. */
    UPORTAL_STATCODE_LOCKED,                 /**< Indicates the user is locked by server. */
    UPORTAL_STATCODE_OTHER = 255             /**< Indicates other error */
}UPORTAL_STATCODE;

/** Indicates service type. */
typedef enum tag_UPORTAL_SERVICE_TYPE
{
    UPORTAL_SERVICE_TYPE_EAB = 0,                /**< Indicates Eab. */
    UPORTAL_SERVICE_TYPE_NAB = 1,                /**< Indicates Nab. */
    UPORTAL_SERVICE_TYPE_CAB = 2,                /**< Indicates Cab. */
    UPORTAL_SERVICE_TYPE_CABCONFIG = 3,          /**< Indicates Cab Config. */
    UPORTAL_SERVICE_TYPE_GROUPSERVER = 4,        /**< Indicates Group Server. */
    UPORTAL_SERVICE_TYPE_PRESENCEPROXY = 5,      /**< Indicates Presence Proxy. */
    UPORTAL_SERVICE_TYPE_PUSH = 6,               /**< Indicates Push. */
    UPORTAL_SERVICE_TYPE_MEDIAX = 7,             /**< Indicates Mediax. */
    UPORTAL_SERVICE_TYPE_MMLTEL = 8,              /**< Indicates Mmltel. */
    UPORTAL_SERVICE_TYPE_DMS = 9             /**< Indicates Dms. */
}UPORTAL_SERVICE_TYPE;

/** Indicates service parameter. */
typedef enum tag_UPORTAL_PARAM_TYPE
{
    UPORTAL_PARAM_TYPE_ADDRESS,             /**< Indicates the address. */
    UPORTAL_PARAM_TYPE_PORT,                /**< Indicates the port. */
    UPORTAL_PARAM_TYPE_URI,                 /**< Indicates the uri. */
    UPORTAL_PARAM_TYPE_HTTPTYPE,            /**< Indicates the http type. */
    UPORTAL_PARAM_TYPE_ALL                  /**< Indicates the whole url, including http type, address, port and uri. */
}UPORTAL_PARAM_TYPE;

/** Indicates u-portal provision operation type. */
typedef enum tag_UPORTAL_PROV_TYPE
{
    UPORTAL_PROV_TYPE_MODIFYPWD = 0,       /**< Indicates it is to change password. */
}UPORTAL_PROV_TYPE;

/** 
* <b>Description:</b> UportalApi provides an entry to login U-PORTAL. 
* <br><b>Purpose:</b> The user interface (UI) accesses uportal application platform interfaces (APIs) 
* to implement login. UportalApi provides the entry login to login and logout from the U-PORTAL.
*/
@interface UportalApi : NSObject
{
}

/** 
* <b>Description:</b> This method provides initialization for uportal APIs and must be invoked before login U-PORTAL. 
* <br><b>Purpose:</b> The UI invokes it to initialize uportal APIs during system initialization before login U-PORTAL.
* @return 0 Indicates init successfully
*     <br>1 Indicates init failed
*/
+ (int)init;

/** 
* <b>Description:</b> This method is used to release uportal APIs after logging out of the RCS client.
* <br><b>Purpose:</b> The UI invokes it to release uportal APIs after logging out of the RCS client.
*/
+ (void)destroy;

/**
 * <b>Description:</b> This method is used for login to the U-PORTAL.
 * <br><b>Purpose:</b> The UI invokes it to login to the U-PORTAL. 
 * The SDK sends a HTTP message to request login to the U-PORTAL. 
 * After the U-PORTAL authenticates the SDK, the login succeeds.
 * @param [in] userName Specifies the user name for login.
 * @param [in] password Specifies the password for login.
 * @return 0 Indicates function call successfully
 *     <br>1 Indicates function call failed
 */
+ (int)login:(NSString*) userName password:(NSString*) password;

/**
 * <b>Description:</b> This method is used to logout from theU-PORTAL.
 * <br><b>Purpose:</b>The UI invokes it to login from the U-PORTAL only when the UI exits 
 * the program and changes the account. After it is invoked, U-PORTAL services can be used after the next login.
 * @return 0 Indicates function call successfully
 *     <br>1 Indicates function call failed
 */
+ (int)logout;

/**
 * <b>Description:</b> This method is used to modify password.
 * <br><b>Purpose:</b> The UI invokes this method to modify password.
 *
 * @param [in] userName Specifies the user name.
 * @param [in] oldPwd Specifies the old password.
 * @param [in] newPwd Specifies the new password.
 * @return 0 Indicates function call successfully
 *     <br>1 Indicates function call failed
 */
+ (int)modifyPwd:(NSString*) userName oldPwd:(NSString*) oldPwd newPwd:(NSString*) newPwd;

/**
 * <b>Description:</b> This method is used to set the uportal configure information.
 * <br><b>Purpose:</b> The UI invokes it to set a configuration parameter value.
 * @param [in] iMajorType Specifies the major type, @ref UPORTAL_MAJOR_TYPE.
 * @param [in] iMinorType Specifies the minor type, @ref UPORTAL_MINOR_TYPE.
 * @param [in] pcValue Specifies the configure value
 *
 * @return CAAS_OK Indicates the setting succeed
 *    <br> CAAS_FAILED Indicates the setting failed
 */
+ (int)setConfig:(int)majorType minorType:(int)minorType value:(NSString *)value;

/**
 * <b>Description:</b> This method is used to get the uportal configure information.
 * <br><b>Purpose:</b> The UI invokes it to obtain a configuration parameter value.
 * @param [in] iMajorType Specifies the major type, @ref UPORTAL_MAJOR_TYPE.
 * @param [in] iMinorType Specifies the minor type, @ref UPORTAL_MINOR_TYPE.
 *
 * @return The value indicates the user configure information
 */
+ (NSString *)getConfig:(int)majorType minorType:(int)minorType;

/**
 * <b>Description:</b> This method is used to obtain service parameter.
 * <br><b>Purpose:</b> After login the u-portal successfully, UI invokes it to obtain the service parameter and set it to the
 * service component. UI needs to invoke this methods many times for different service type and parameter type.
 *
 * @param [in] serviceType Specifies the service type, @ref UPORTAL_SERVICE_TYPE.
 * @param [in] paramType Specifies the parameter type, @ref UPORTAL_PARAM_TYPE.
 * @return The value indicates the param value.
 */
+ (NSString *)getParam:(int)serviceType paramType:(int)paramType;

/**
 * <b>Description:</b> This method is used to get access token returned from the u-portal.
 * <br><b>Purpose:</b> The UI invokes this method to get access token from the u-portal only when the UI needs
 * to pass this token to browser.
 *
 * @return The value indicates access token.
 */
+ (NSString *)getToken;

/**
 * <b>Description:</b> This method is used to get user role returned from the u-portal.
 * <br><b>Purpose:</b> The UI invokes this method to get user role from the u-portal only when the UI needs
 * to access administration portal. The value will be @"CorpAdminLogin" or nil.
 *
 * @return The value indicates user role. If more than one role is returned, they are separated by semicolon.
 */
+ (NSString *)getUserRole;

/**
 * <b>Description:</b> This method is used to get conference resource list returned from the u-portal.
 * <br><b>Purpose:</b> The UI invokes this method to get conference resource list from the u-portal after login. 
 * The UI presents different entrance according to conference resource list.
 *
 * @return The value indicates conference resource list with semicolon delimeter, such as "Audio;sdVideo;hdVideo;Data"
 */
 + (NSString *)getConfResList;

/**
 * <b>Description:</b> This method is used to get authorized user name.
 * <br><b>Purpose:</b> After login to the u-portal successfully, the UI can invoke this method to get authorized user name. 
 *
 * @return The value indicates authorized user name.
 */
+ (NSString *)getUserName;

/**
 * <b>Description:</b> This method is used to get conference factory id.
 * <br><b>Purpose:</b> After login to the u-portal successfully, the UI can invoke this method to get conference factory id. 
 *
 * @return The value indicates conference factory id.
 */
+ (NSString *)getConfFactoryId;
@end

#endif
