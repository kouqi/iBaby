/**
 * @file LoginApi.h
 * @brief Login Interface Functions
 */
#ifndef _LOGIN_API_H_
#define _LOGIN_API_H_

#import <Foundation/Foundation.h>

/** 
 * Indicates the previous login status.
 * @see LOGIN_STATUS_CONNECTING
 * @see LOGIN_STATUS_CONNECTED
 */
#define PARAM_LOGIN_OLD_STATUS @"LOGINAPI_PARAM_OLD_STATUS"

/** 
 * Indicates the current login status.
 * @see tag_LOGIN_STATUS
 */
#define PARAM_LOGIN_NEW_STATUS @"LOGINAPI_PARAM_NEW_STATUS"

/** 
 * Indicates the status change cause.
 * @see tag_LOGIN_REASON
 */
#define PARAM_LOGIN_REASON @"LOGINAPI_PARAM_REASON"

/** 
 * Indicates the register type.
 * @see tag_REGISTER_TYPE
 */
#define PARAM_REGISTER_TYPE @"LOGINAPI_REGISTER_TYPE"

/** Indicates the message of register.*/
#define PARAM_REGISTER_MSG @"LOGINAPI_REGISTER_MSG"

/** 
 * Indicates the register status.
 * @see tag_REGISTER_STATUS
 */
#define PARAM_REGISTER_STATUS @"LOGINAPI_REGISTER_STATUS"

/** Indicates the default DM version.*/
//#define DEFAULT_DM_VERSION @"V1.2.88.21-02100000"
#define DEFAULT_DM_VERSION @"V1.2.88.21-02100300"

/**
 * <b>Description:</b> It is used to broadcast a login status change. 
 * <br><b>Purpose:</b> After the login, When the UI receives a broadcast, the login status has changed, 
 * and the UI must be updated. The UI may receive the broadcast multiple times 
 * depending on the network quality. The UI is recommended to perform interception on this broadcast 
 * during the entire running of the application.
 * <p>The broadcast will have the following extra parameters:
 * <ul>
 * <li><em>{@link #PARAM_LOGIN_OLD_STATUS}</em></li> - Indicates login old status[int]
 * <li><em>{@link #PARAM_LOGIN_NEW_STATUS}</em></li> - Indicates login new status[int]
 * <li><em>{@link #PARAM_LOGIN_REASON}</em></li> - Indicates login reason[int]
 * </ul>
 * </p>
 */
#define EVENT_LOGIN_STATUS_CHANGED @"LOGINAPI_EVENT_LOGIN_STATUS_CHANGED"

/**
  * <b>Description:</b> It is used to broadcast server authorization failed by some incorrect.
  * <br><b>Purpose:</b> for example: RCS client login to server in PS network, if PS gateway not add msisdn and imsi to http header, 
  * server will return authorization failed.
  * <p>The intent will have the following extra values.
  * <ul>
  * <li><em>{@link #PARAM_LOGIN_REASON}</em></li>
  * </ul>
  * </p>
  */
#define EVENT_CONNECT_ACS_NETWORK_AUTH_FAILED @"LOGINAPI_EVENT_CONNECT_ACS_NETWORK_AUTH_FAILED"

/**
 * <b>Description:</b> It is used to broadcast the one time password(OTP) missed when the network type is wifi, it is used in dm http mode.
 * <br><b>Purpose:</b> When UI use imsi or msisdn to login server, the server return 200 ok and send an OTP to the register phone.
 * This broadcaset is used to notify UI goto input password activity.
 * <p>The intent will have the following extra values.
 * <ul>
 * <li><em>{@link #PARAM_LOGIN_REASON}</em></li>
 * </ul>
 * </p>
 */
#define EVENT_CONNECT_ACS_PASSWORD_MISSED @"LOGINAPI_EVENT_CONNECT_ACS_PASSWORD_MISSED"

/**
 * <b>Description:</b> It is used to broadcast the msisdn invalid, it is used in dm http mode.
 * <br><b>Purpose:</b> When UI use msisdn to login server, if the input msisdn is incorrect, server will report misidn invalid.
 * This broadcast is used to notify UI goto edit msisdn activity.
 * <p>The intent will have the following extra values.
 * <ul>
 * <li><em>{@link #PARAM_LOGIN_REASON}</em></li>
 * </ul>
 * </p>
 */
#define EVENT_CONNECT_ACS_MSISDN_INVALID @"LOGINAPI_EVENT_CONNECT_ACS_MSISDN_INVALID"

/**
 * <b>Description:</b> It is used to broadcast a message to notify UI choose whether accept the terms of service.
 * <br><b>Purpose:</b> When UI login to server the first time, this broadcast is used to notify UI show the terms of service
 * and inform user to choose whether accept the terms of service.
 * <p>The intent will have the following extra values.
 * <ul>
 * <li><em>{@link #PARAM_LOGIN_REASON}</em></li>
 * </ul>
 * </p>
 */
#define EVENT_CONNECT_ACS_ACCEPT_TERMS_OF_SERVICE @"LOGINAPI_EVENT_CONNECT_ACS_ACCEPT_TERMS_OF_SERVICE"

/**
 * <b>Description:</b> It is used to broadcast server param reconfiguration message. 
 * <br><b>Purpose:</b> When server trigger DM param reconfiguration, this broadcast is used to notify the message type and progress.
 * <p>The intent will have the following extra values.
 * <ul>
 * <li><em>{@link #PARAM_LOGIN_REASON}</em></li>
 * </ul>
 * </p>
 */
#define EVENT_PARAM_RECONFIG @"LOGINAPI_EVENT_PARAM_RECONFIG"

/**
 * <b>Description:</b> It is used to broadcast the results of self-help subscriber creation, automatic 
 * subscriber creation, password resetting, and password modification requests.
 * <br><b>Purpose:</b> After sending self-help subscriber creation, automatic subscriber creation, password 
 * resetting, or password modification request to the server, the UI receives this broadcast which carries the 
 * request type, execution result, and description of the result.
 * <p>The broadcast will have the following extra parameters:
 * <ul>
 * <li><em>{@link #PARAM_REGISTER_TYPE}</em></li> - Indicates register type[int]
 * <li><em>{@link #PARAM_REGISTER_MSG}</em></li> - Indicates register msg[NSString]
 * <li><em>{@link #PARAM_REGISTER_STATUS}</em></li> - Indicates register status[int]
 * </ul>
 * </p> 
 */
#define EVENT_REGISTER_STATUS @"LOGINAPI_EVENT_REGISTER_STATUS"

/** 
 * Indicates login status. 
 * It is used to query enumeration constants of login status.
 * The UI invokes it to query the current login status and updates the page based on the query result.
 */
typedef enum tag_LOGIN_STATUS
{
    LOGIN_STATUS_IDLE,    /**< Indicates that invalid login status. */
    LOGIN_STATUS_CONNECTED,    /**< Indicates that a login status. The UI has successfully connected to the IMS network. */
    LOGIN_STATUS_DISCONNECTED,    /**< Indicates that a login status. The UI is disconnected or deregistered from the IMS network. For example, the UI successfully connected to the IMS network and the network is disconnected. The UI cannot access the network again.*/
    LOGIN_STATUS_CONNECTING,    /**< Indicates that a login status. The UI is connecting to the IMS network. */
    LOGIN_STATUS_DISCONNECTING    /**< Indicates that a login status. The UI is deregistering from the IMS network. */
}LOGIN_STATUS;

/** 
* Indicates the login reason.
* It is used to query enumeration constants of login cause.
* The UI invokes it to query the current login cause and updates the page based on the query result.
*/
typedef enum tag_LOGIN_REASON
{
    LOGIN_REASON_NULL,          /**< Indicates that the UI has successfully connected to the IMS network. */
    LOGIN_REASON_CONNECTING,    /**< Indicates that the UI is connecting to the server. */
    LOGIN_REASON_DISCONNECTED,    /**< Indicates that the connection between UI and the server is disconnect. */
    LOGIN_REASON_CONNCET_ERR,    /**< Indicates that an error occurs when the UI is connecting to the server. */
    LOGIN_REASON_SERVER_BUSY,    /**< Indicates that the server is busy. */
    LOGIN_REASON_AUTH_FAILED,    /**< Indicates that authentication fails. */
    LOGIN_REASON_AUTH_FAILED_RELOGIN,    /**< Indicates that authenticate failed when auto login, maybe sip register or dm start. */
    LOGIN_REASON_WRONG_LOCAL_TIME,    /**< Indicates that the local time is incorrect. */
    LOGIN_REASON_NET_UNAVAILABLE,    /**< Indicates that the network is unavailable. */
    LOGIN_REASON_USER_CANCEL,    /**< Indicates that a subscriber has canceled the login. */
    LOGIN_REASON_DEACTED,    /**< Indicates that server kill off the client. */
    LOGIN_REASON_SRV_FORCE_LOGOUT,    /**< Indicates that a subscriber is forced offline because the account has been used to log in at another place. */
    LOGIN_REASON_ACCESSTOKEN_INVALID,    /**< Indicates that access token invalid. */
    LOGIN_REASON_ACCESSTOKEN_EXPIRED,    /**< Indicates that access token expired . */
    LOGIN_REASON_APPKEY_INVALID,    /**< Indicates that application key invalid. */
    LOGIN_REASON_CONF_DISABLED,     /**< Indicates that acs response configration disable. */
    LOGIN_REASON_USER_SWITCHED,     /**< Indicates that user switched. */
    LOGIN_REASON_CONF_TMP_DISABLED,     /**< Indicates that acs response configration temporarily disable. */
    LOGIN_REASON_UNREG_USER,           /**< Indicates that unregistered user. */

    LOGIN_REASON_CONF_OTP_INVALID = 32,           /**< Indicates that rcs input otp invalid when use dm http mode. */
    LOGIN_REASON_CONF_DORMANT = 33,           /**< Indicates that dormant when use dm http mode. */
    LOGIN_REASON_CONF_ACTION_NEEDED = 34,           /**< Indicates that action needed when use dm http mode. */
    LOGIN_REASON_RMVED_USER = 39,           /**< Indicates that cancel rcs account. */
    
    LOGIN_REASON_UNKNOWN = 255    /**< Indicates that an unknown error occurs. */
}LOGIN_REASON;

/** 
* Indicates the Auto-configuration Server connecting reason.
* It is used to query enumeration constants of Auto-configuration Server connecting cause.
* The UI invokes it to query the current Auto-configuration Server connecting cause and updates the page based on the query result.
*/
typedef enum tag_CONNECT_ACS_REASON
{
    CONNECT_ACS_REASON_NETPWRK_AUTH_FAILED = 19,           /**< Indicates that network auth failed. */
    CONNECT_ACS_REASON_PWD_MISSED = 20,           /**< Indicates that password missed. */
    CONNECT_ACS_REASON_MSISDN_INVALID = 25,           /**< Indicates that msisdn invalid. */
    CONNECT_ACS_REASON_WAIT_USER_ACCEPT_TERMS_OF_SERVICE = 40        /**< Indicates wait user to accept terms of service when use dm http mode. */
}CONNECT_ACS_REASON;

/** 
* Indicates the DM param reconfiguration reason.
* It is used to query enumeration constants of DM param reconfiguration cause.
* The UI invokes it to query the current DM param reconfiguration cause and updates the page based on the query result.
*/
typedef enum tag_PARAM_RECONFIG_REASON
{
    PARAM_RECONFIG_REQUEST = 35,           /**< Indicates that reconfiguration request when use dm http mode. */
    PARAM_RECONFIG_CONFIRM_REQUEST = 36,           /**< Indicates that reconfiguration comfirm request when use dm http mode. */
    PARAM_RECONFIG_CONFIRM_ACK = 37,           /**< Indicates that reconfiguration comfirm ack when use dm http mode. */
    PARAM_RECONFIG_REQUEST_NOTIFY = 38           /**< Indicates that reconfiguration notify request when use dm http mode. */
}PARAM_RECONFIG_REASON;

/** 
* Indicates RPG Provision operation status.
* It is used to query enumeration constants of register status.
* The UI invokes it to query the result of register and updates the page based on it.
*/
typedef enum tag_REGISTER_STATUS
{
    PROV_OP_SUCCESS                    = 0,   /**< Indicates that it is successful.*/
    PROV_OP_DUPLICATE_REGISTER         = 201, /**< Indicates that duplicate register.*/
    PROV_OP_WRONG_VERIFY_CODE          = 202, /**< Indicates that wrong verify code.*/
    PROV_OP_WRONG_ORIGINAL_PWD         = 203, /**< Indicates that wrong original password.*/
    PROV_OP_INVALID_REQUEST            = 204, /**< Indicates that invalid request.*/
    PROV_OP_OUTDATED_VERIFY_CODE       = 205, /**< Indicates that outdated verify code.*/
    PROV_OP_SERVER_ERROR               = 206, /**< Indicates that server error.*/
    PROV_OP_WRONG_USERNAME_FORMAT      = 207, /**< Indicates that wrong username format.*/
    PROV_OP_REQUEST_VERIFY_CODE_FAILED = 208, /**< Indicates that requesting verify code failed.*/
    PROV_OP_REQUEST_USER_NOT_EXISTED   = 209, /**< Indicates that request user is not existed.*/
    PROV_OP_FAILED_RESET_PWD           = 210, /**< Indicates that resetting password failed.*/
    PROV_OP_VERIFY_CODE_MISSED         = 402, /**< Indicates that verify code missed.*/
    PROV_OP_SERVER_BUSY                = 503, /**< Indicates that server is busy.*/
    PROV_OP_REQUEST_TIMEOUT            = 900, /**< Indicates that request is timeout.*/
    PROV_OP_SERVER_UNREACHABLE         = 901, /**< Indicates that server is unreachable.*/
    PROV_OP_INTERNAL_ERROR             = 902, /**< Indicates that internal error.*/
    PROV_OP_UNKNOWN_ERROR              = 999  /**< Indicates that unkown error.*/
}REGISTER_STATUS;

/** 
* Indicates RPG Provision operation type.
* It is used to query enumeration constants of register type.
* The UI invoke it to query the register operation type.
*/
typedef enum tag_REGISTER_TYPE
{
    PROV_OP_TYPE_REGISTER  = 0, /**< Indicates that it is to register.*/
    PROV_OP_TYPE_RESETPWD  = 1, /**< Indicates that it is to reset password. */
    PROV_OP_TYPE_CHANGEPWD = 2 /**< Indicates that it is to change password. */
}Register_Type;

/** 
* <b>Description:</b> UserInfo is used to query information of subscribers who have logged in. 
* <br><b>Purpose:</b> It is used to query information of subscribers who have logged in,
* including country code, area code, user name, password and user name for authentication.
*/
@interface UserInfo : NSObject
{
@private
    /** Indicates a country code. For example, the country code of China is +86. */
    NSString* _countryCode;
    
    /** Indicates an area code. For example, the area code of Shenzhen city is 755. */
    NSString* _areaCode;
    
    /** Indicates a user name. */
    NSString* _username;

    /** Indicates a user name for authentication. */
    NSString* _authname;
    
    /** Indicates a password. */
    NSString* _password;
}

/** Indicates a country code. For example, the country code of China is +86. */
@property(nonatomic,retain) NSString* countryCode;
/** Indicates an area code. For example, the area code of Shenzhen city is 755. */
@property(nonatomic,retain) NSString* areaCode;

/** Indicates a user name. */
@property(nonatomic,retain) NSString* username;

/** Indicates a user name for authentication. */
@property(nonatomic,retain) NSString* authname;

/** Indicates a password. */
@property(nonatomic,retain) NSString* password;

@end

/** 
* <b>Description:</b> It is used to query subscribers' configuration data. 
* <br><b>Purpose:</b> The UI invokes it to query subscribers' configuration data.
* such as whether the password is remembered, automatic login is enabled, and whether a 
* subscriber can automatically log in. Whether a subscriber can automatically log 
* in is set by the SDK.
*/
@interface LoginCfg : NSObject
{
@private
    /** Indicates whether a subscriber uses the password remembering function. */
    BOOL _isRememberPassword;
    /** Indicates whether a subscriber uses the automatic login function. */
    BOOL _isAutoLogin;
    /**
     * Indicates whether a subscriber can automatically log in. If a subscriber successfully logs in, 
     * this parameter is set to 1. If a subscriber fails the initial login, or the user name or password 
     * is incorrect, this parameter is set to 0. In this case, the UI determines whether prompts the 
     * subscriber to enter a user name and password.
     */
    BOOL _isVerified;
}
/** Indicates whether a subscriber uses the password remembering function. */
@property(nonatomic,assign) BOOL isRememberPassword;

/** Indicates whether a subscriber uses the automatic login function. */
@property(nonatomic,assign) BOOL isAutoLogin;

/**
 * Indicates whether a subscriber can automatically log in. If a subscriber successfully logs in, 
 * this parameter is set to 1. If a subscriber fails the initial login, or the user name or password 
 * is incorrect, this parameter is set to 0. In this case, the UI determines whether prompts the 
 * subscriber to enter a user name and password.
 */
@property(nonatomic,assign) BOOL isVerified;
@end

/** 
* <b>Description:</b> LoginApi provides an entry to login. 
* <br><b>Purpose:</b> The user interface (UI) accesses login application platform interfaces (APIs) 
* to implement login. LoginApi provides the entry login to login and logout from the IMS network and 
* is used to set login network data and obtain the login user information.
*/
@interface LoginApi : NSObject
{
}

/**
 * <b>Description:</b> This method provides initialization for login APIs and must be invoked before login.
 * <br><b>Purpose:</b> The UI invokes it to initialize login APIs during system initialization before login.
 * @param [in] version Specifies the DM version number. The version number must be composed of four parts, such as V1.2.88.21.
 */
+ (void)init:(NSString*) version;

/** 
* <b>Description:</b> This method provides initialization for login APIs and must be invoked before login. 
* <br><b>Purpose:</b> The UI invokes it to initialize login APIs during system initialization before login.
*/
+ (void)init;

/** 
* <b>Description:</b> This method is used to release login APIs before logging out of the RCS client.
* <br><b>Purpose:</b> The UI invokes it to release login APIs before logging out of the RCS client.
*/
+ (void)releaseApi;

/**
 * <b>Description:</b> This method is used for login to the IMS network.
 * <br><b>Purpose:</b> The UI invokes it to log in to the IMS network. 
 * The SDK sends a REGISTER message to request login to the IMS network. 
 * After the IMS network authenticates the SDK, the login succeeds.
 * @param [in] userInfo Specifies the country code, user name, and password for login.
 * @see UserInfo
 * @param [in] loginCfg Specifies whether a subscriber uses the functions password remembering, 
 * automatic login, and automatic launch during startup.
 * @see LoginCfg
 */
+ (void)login:(UserInfo*) userInfo config:(LoginCfg*) loginCfg;

/**
 * <b>Description:</b> This method is used to deregister from the IMS network.
 * <br><b>Purpose:</b>The UI invokes it to deregister from the IMS network only when the UI exits 
 * the program and changes the account. After it is invoked, IMS services can be used after the next login.
 */
+ (void)logout;

/**
 * <b>Description:</b> This method is used to query the current login status.
 * <br><b>Purpose:</b> The UI invokes it to query the current login status and performs operations based on the status.
 * @return The value indicates the login status
 * @see tag_LOGIN_STATUS
 */
+ (int) getStatus;

/**
 * <b>Description:</b> This method is used to query the list of all subscribers who have successfully logged in.
 * <br><b>Purpose:</b> The UI invokes it to query the list of all subscribers who have successfully logged in.
 * @return The value indicates the list of all subscribers who have successfully logged in,
 * the array of the UserInfo.
 * @see UserInfo
 */
+ (NSMutableArray*) getHistoryUsers;

/**
 * <b>Description:</b> This method is used to query names of subscribers who successfully logged in last time.
 * <br><b>Purpose:</b> The UI invokes it to query names of subscribers who successfully logged in last time.
 * For example, to implement automatic login, the UI must invoke this method after the initialization 
 * to obtain the names of subscribers who successfully logged in last time.
 * @return The value indicates names of subscribers who successfully logged in last time 
 *     <br>The value Null indicates that no subscriber logged in last time
 */
+ (NSString*) getLastUserName;

/**
 * <b>Description:</b> This method is used to query names of subscribers who are logging in currently.
 * <br><b>Purpose:</b> The UI invokes it to query names of subscribers who are logging in currently,
 * the UI can obtain the names of the subscribers even the subscribers fail to log in.
 * @return The value indicates names of subscribers who are logging in currently 
 *     <br>The value Null indicates that no subscriber is logging in currently
 */
+ (NSString*) getCurUserName;

/**
 * <b>Description:</b> This method is used to obtain the list of P-Associated-URI.
 * <br><b>Purpose:</b> After the UI obtains the list of P-Associated-URI.
 * @return The value indicates the list of P-Associated-URI.
 */
+ (NSMutableArray*) getAssoUri;

/**
 * <b>Description:</b> This method is used to query a specified subscriber's information.
 * <br><b>Purpose:</b> The UI invokes it to query a specified subscriber's information, 
 * including user name, password, country code, and area code. 
 * @param [in] username Specifies a subscriber whose information is to be queried
 * @return The value indicates the information of a subscriber
 * @see UserInfo
 */
+ (UserInfo*) getUserInfo:(NSString*) username;

/**
 * <b>Description:</b> This method is used to query a specified subscriber's configuration data.
 * <br><b>Purpose:</b> The UI invokes it to query a specified subscriber's configuration data, 
 * such as whether the password is remembered, automatic login is enabled, and whether a subscriber 
 * can automatically log in. To implement the automatic login, the UI must invoke it during the 
 * initialization to query whether it can automatically login.
 * @param [in] username  Specifies a subscriber whose configuration data is to be queried
 * @return The value indicates the configuration data
 * @see LoginCfg
 */
+ (LoginCfg*) getLoginCfg:(NSString*) username;

/**
 * <b>Description:</b> This method is used to remove a specified subscriber from the login list.
 * <br><b>Purpose:</b> The UI invokes it to remove a specified subscriber from the login list. Before invoking this method, it is recommanded that the UI should prompt the user
 * with friendly information, such as a choice box for choosing to continue or cancel. The UI can present different information based on different situations.
 * @param [in] username Specifies a subscriber who is to be removed from the login list
 */
+ (void) delUser:(NSString*) userName;

/**
 * <b>Description:</b> This method is used to clean the password of the user.
 * <br><b>Purpose:</b> When the user logout, the UI can use this interface to clean the password. For safety, it is proposed to use this interface.  
 * @param [in] userName Specifies the user name whose password is to be cleaned
 */
+ (void) cleanUserPassword:(NSString*) userName;

/**
 * <b>Description:</b> This method is used to apply for the verification code for self-help subscriber creation.
 * <br><b>Purpose:</b> After a subscriber enters the country code and user name and taps a button 
 * to get a verification code, the UI invokes this method to send a request to the server for a 
 * verification code used for registration.
 * @param [in] countryCode Specifies a country code. For example, the country code of China is +86.
 * @param [in] username Specifies a user name
 */
+ (void) provRequestVeriyCodeForRegister:(NSString*)countrycode userName:(NSString*)userName;

/**
 * <b>Description:</b> This method is used to submit a self-help subscriber creation application.
 * <br><b>Purpose:</b> After a subscriber enters the obtained verification code and taps a button to apply for subscriber 
 * creation, the UI invokes this method to send a registration request to the server. Then, the UI receives the {@link #EVENT_REGISTER_STATUS} 
 * broadcast which carries the request result.
 * @param [in] countryCode Specifies a country code. For example, the country code of China is +86.
 * @param [in] username Specifies a user name
 * @param [in] pwd Specifies a password
 * @param [in] verifiedCode Specifies a verification code
 */
+ (void) provCommitRegister:(NSString*)countrycode userName:(NSString*)userName pwd:(NSString*)pwd verifiedCode:(NSString*)verifiedCode;

/**
 * <b>Description:</b> This method is used to stop a self-help subscriber creation application.
 * <br><b>Purpose:</b> During the sending of a registration request to the server, the UI invokes this 
 * method to stop the registration request when the subscriber wants to. The SDK does not send the 
 * {@link #EVENT_REGISTER_STATUS} broadcast which carries the request result to the UI if the request is stopped.
 */
+ (void) provStopRegister;

/**
 * <b>Description:</b> This method is used to obtain verification codes for resetting passwords.
 * <br><b>Purpose:</b> After a subscriber enters the country code and user name and taps a button to get 
 * a verification code, the UI invokes this method to send a request to the server for the verification code 
 * used to reset a password.
 * @param [in] countryCode Specifies a country code. For example, the country code of China is +86.
 * @param [in] username Specifies a user name
 */
+ (void) provRequestVeriyCodeForResetPwd:(NSString*)countrycode userName:(NSString*)userName;

/**
 * <b>Description:</b> This method is used to send password resetting request.
 * <br><b>Purpose:</b> After a subscriber enters the obtained verification code and taps a button 
 * to reset a password, the UI invokes this method to send a password resetting request to the server. 
 * Then, the UI receives the {@link #EVENT_REGISTER_STATUS} broadcast which carries the request result.
 * @param [in] countryCode Specifies a country code. For example, the country code of China is +86.
 * @param [in] username Specifies a user name
 * @param [in] pwd Specifies a password
 * @param [in] verifiedCode Specifies a verification code
 */
+ (void) provCommitResetPwd:(NSString*)countrycode userName:(NSString*)userName pwd:(NSString*)pwd verifiedCode:(NSString*)verifiedCode;

/**
 * <b>Description:</b> This method is used to stop password resetting request to the server.
 * <br><b>Purpose:</b> During the sending of a password resetting request to the server, the UI invokes 
 * this method to stop the request when the subscriber wants to. The SDK does not send the {@link #EVENT_REGISTER_STATUS} broadcast 
 * which carries the request result to the UI if the request is stopped.
 */
+ (void) provStopResetPwd;

/**
 * <b>Description:</b> This method is used to send password modification request to the server.
 * <br><b>Purpose:</b> After a subscriber enters new and old passwords and taps a button to modify the old password, 
 * the UI invokes this method to send a password modification request to the server. Then, the UI receives the 
 * {@link #EVENT_REGISTER_STATUS} broadcast which carries the request result.
 * @param [in] countrycode Specifies a country code. For example, the country code of China is +86..
 * @param [in] username Specifies a user name
 * @param [in] oldUserPwd Specifies an old password
 * @param [in] userPwd Specifies a new password
 */
+ (void) provChangePwd:(NSString*)countrycode userName:(NSString*)userName oldUserPwd:(NSString*)oldUserPwd userPwd:(NSString*)userPwd;

/**
 * <b>Description:</b> This method is used to stop password modification request to the server.
 * <br><b>Purpose:</b> During the sending of a password modification request to the server, the UI invokes this 
 * method to stop the request when the subscriber wants to. The SDK does not send the {@link #EVENT_REGISTER_STATUS} broadcast 
 * which carries the request result to the UI if the request is stopped.
 */
+ (void) provStopChangePwd;

/**
 * <b>Description:</b> This method is used to determine whether network configuration is enabled.
 * <br><b>Purpose:</b> The UI invokes it to determine whether network configuration is enabled, UI
 * doesn't need to pay attention to it.
 * @return 1 Indicates that network configuration is enabled
 *     <br>0 Indicates that network configuration is disabled
 */
+ (BOOL)cfgGetDisNetworkCfg;

/**
 * <b>Description:</b> This method is used to set the AppKey and AccessToken obtained from the management platform.
 * <br><b>Purpose:</b> After obtaining the AppKey and AccessToken for authentication from the management platform, 
 * the UI invokes it before the login to set the AppKey and AccessToken. The interface is invoked 
 * only for services that need to be authenticated by the management platform.
 * @param [in] AppKey Specifies the authentication key obtained from the management platform
 * @param [in] AccessToken Specifies he authentication token obtained from the management platform
 */
+ (int)setOauthInfo:(NSString*)AppKey AccessToken:(NSString*)AccessToken;

/**
* <b>Description:</b> This method is used to set the autoconfiguration parameters for http dm mode.
* for example,setParamAfterReject(0,0) means to init configuration
* <br><b>Purpose:</b> First login successed, The UI invokes getDMConfig method to show user message,
* if user choose reject,The UI invokes this method to set the autoconfiguration parameters for to init 
* configuration.
* @param [in] version
*            Specifies the autoconfiguration version
* @param [in] validity
*            Specifies the autoconfiguration validity
* @return 0 Indicates setting successfully
*     <br>1 Indicates setting failed
* @deprecated The purpose of this method is just compatible with the old version of UI, we do not recommend the new version of UI invokes this method. 
* It is replaced by setConfigVersionsInfo:(int)version validity:(int)validity.
*/
+ (int)setParamAfterReject:(int)version validity:(int)validity;

/**
* <b>Description:</b> This method is used to set the autoconfiguration parameters for http dm mode.
* <br><b>Purpose:</b> First login successed, The UI invokes getDMConfig method to show user message,
* if user choose reject,The UI invokes this method to set the autoconfiguration parameters for to init configuration.
* When Server trigger DM param update, UI invokes this method to set the autoconfiguration parameters for to init configuration.
* @param [in] version
*            Specifies the autoconfiguration version
* @param [in] validity
*            Specifies the autoconfiguration validity
* @return 0 Indicates setting successfully
*     <br>1 Indicates setting failed
*/
+ (int)setConfigVersionsInfo:(int)version validity:(int)validity;

/**
 * <b>Description:</b> This method is used to update the current register status.
 * <br><b>Purpose:</b> After a subscriber receives a push notification and taps the notification,
 * the UI invokes LoginAPI. pushRefreshRegister to update the current register 
 * status. Before invoking it, the UI must determine whether the subscriber has successfully logged in. 
 * If the subscriber does not log in, the UI does not invoke the interface. To determine whether a 
 * subscriber has successfully logged in, the UI can invoke.
 * @see getStatus
 */
+ (void)pushRefreshRegister;

/**
 * <b>Description:</b> This method is used to set the extended information for the Authority header field in registration messages.
 * <br><b>Purpose:</b> Before invoking the login, the UI invokes setAuthExt to set the extended information for 
 * the Authority header field in the registration message. After the setting, registered SIP messages carry the extended information 
 * and are sent to the IMS network.
 *
 * @param [in] AuthExt
 *            Specifies the extended information to be carried. Should not be nil.
 * @return 0 Indicates that the setting succeeds
 *     <br>1 Indicates that the setting fails
 */
+ (int)setAuthExt:(NSString*)AuthExt;

/**
 * <b>Description:</b> This method is used to start TMS(Terminal Management Server) register when user accept the terms of service in dm http mode.
 * <br><b>Purpose:</b> The UI invokes it to register to the TMS when user accept the terms of service. 
 * The SDK sends a HTTPS message to request register to the TMS. If the authentication of TMS server is passed, the subscriber register to the IMS network
 *
 * @return 0 Indicates that the setting succeeds
 *     <br>1 Indicates that the setting fails
 */
+ (int)acceptTermsOfService;

/**
 * <b>Description:</b> This method is used to start configuration request with msisdn in dm http mode.
 * <br><b>Purpose:</b> When the subscriber is RCSe_A, and use http dm mode,UI invokes this method to start register request, 
 * the SDK sends a HTTP message to request configration to the ACS server. If the authentication of the ACS server 
 * is passed, SDK will send a broadcast to UI ask OTP password.
 *
 * @param  [in]  msisdn
 *            Specifies the msisdn
 * @return 0 Indicates that the setting succeeds
 *     <br>1 Indicates that the setting fails
 */
+ (int)startAcsRegisterRequestWithMsisdn:(NSString*)msisdn;

/**
 * <b>Description:</b> This method is start configuration request with OTP password in dm http mode.
 * <br><b>Purpose:</b> When the subscriber is RCSe_A, if UI received missed OTP broadcast then invokes this method to start register request, 
 * the SDK sends a HTTP message to request configration to the ACS server. If the authentication of the ACS server 
 * is passed, the subscriber logs in to the IMS network.
 * 
 * @param [in] msisdn
*            Specifies the Msisdn
 * @param [in] OTP
*            Specifies the One Time Password(OTP) send by the ACS server through SMS
 * @return 0 Indicates that the setting succeeds
 *     <br> 1 Indicates that the setting fails
 */
+ (int)startAcsRegisterRequestWithOTP:(NSString*)msisdn OTP:(NSString*)OTP;

/**
 * <b>Description:</b> This method is get informaiton of configuration request in dm http mode.
 * <br><b>Purpose:</b> When the UI received reconfiguration request broadcast then invokes this method to get informaiton to show to user 
 *
 * @param [in] text
*            Specifies Text of the information   
 * @return 0 Indicates that the setting succeeds
 *     <br> 1 Indicates that the setting fails
 */
+ (int)getSysRequestInfo:(NSString*)text;

/**
 * <b>Description:</b> This method is used to set information of user login when sharing sip stack.
 * <br><b>Purpose:</b> This method is used to set information of user login when sharing sip stack. The UI 
 * invokes this interface to before invoking {@link SysApi::setSharingSipStack:}
 * @param [in] strPassociatedURI Specifies the user uri.
 * @param [in] strPassWord Specifies the user password.
 * @param [in] strLocalIP Specifies the local ip address.
 * @param [in] iLocalPort Specifies the local port.
 * @param [in] strSBCIP Specifies the server ip address.
 * @param [in] iSBCPort Specifies the server port. 
 * @param [in] strRoute Specifies the route address in sip message.
 * @param [in] strRealm Specifies the realm in sip message.
 * @return 0 Indicates that the setting succeeds
 *     <br> 1 Indicates that the setting fails
 */
+(int)QSip_SetBaseInfo:(NSString*)strPassociatedURI strPassWord:(NSString*)strPassWord strLocalIP:(NSString*)strLocalIP iLocalPort:(int)iLocalPort 
                            strSBCIP:(NSString*)strSBCIP iSBCPort:(int)iSBCPort strRoute:(NSString*)strRoute strRealm:(NSString*)strRealm;

@end

#endif
