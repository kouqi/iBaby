/**
 * @file SysApi.h
 * @brief System Interface Functions
 */
#ifndef _SYSAPI_H_
#define _SYSAPI_H_
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CoreGraphics/CGGeometry.h>

/** Indicates the network status.*/
#define PARAM_NETWORK_STATUS @"LOGINAPI_NETWORK_STATUS"

/**
 * <b>Description:</b> EVENT_START_UPDATE_LOCATION is used to start location update.
 * <br><b>Purpose:</b> After the UI receives the broadcast, the UI starts location update.
 */
#define EVENT_START_UPDATE_LOCATION @"SYSAPI_EVENT_START_UPDATE_LOCATION"

/**
 * <b>Description:</b> EVENT_STOP_UPDATE_LOCATION is used to stop location update.
 * <br><b>Purpose:</b> After the UI receives the broadcast, the UI stops location update.
 */
#define EVENT_STOP_UPDATE_LOCATION @"SYSAPI_EVENT_STOP_UPDATE_LOCATION"

/**
 * <b>Description:</b> EVENT_NETWORK_CHANGE_BROADCAST is used to tell the network status.
 * <br><b>Purpose:</b> After the UI receives the broadcast, the UI can get the network status.
 * <p>The broadcast will have the following extra value:
 * <ul>
 *   <li><em>{@link #PARAM_NETWORK_STATUS}</em></li> - Indicates network status[number]
 * </ul>
 * </p>
 */
#define EVENT_NETWORK_CHANGE_BROADCAST @"SYSAPI_EVENT_NETWORK_CHANGE_BROADCAST"

/**
 * <b>Description:</b> EVENT_SYS_RECV_NOTIFY_MSG is used to broadcast an event that a NOTIFY message is received.
 * <br><b>Purpose:</b> After login successfully, When the UI receives a broadcast, it indicates that the client has received a NOTIFY message.
 * The notify message is outside of the dialog, if the notify message match the type set by the method {@link #setNotifyFilter:(int)filterType filterParam:(NSString*)filterParam}, 
 * SDK will broadcast with the contents of the Event.
 * <p>The broadcast will have the following extra value:
 * <ul>
 *   <li><em>{@link #PARAM_SYS_NOTIFY_EVENT}</em></li> - Indicates sys notify event[NSString]
 * </ul>
 * </p>
 */
#define EVENT_SYS_RECV_NOTIFY_MSG @"SYSAPI_EVENT_SYS_RECV_NOTIFY_MSG"


/**
 * Indicates the NOTIFY event string.
 */
#define PARAM_SYS_NOTIFY_EVENT @"SYSAPI_PARAM_SYS_NOTIFY_EVENT"

/** Indicates the opened paramName for UI, Parameters for App supported in RCS*/
#define MAX_DM_OPENAPI_APP_NUM   20

/** Indicates SDK will only print error level log */
#define SYS_LOG_LEVEL_ERROR  0

/** Indicates SDK will  print all level log.*/
#define SYS_LOG_LEVEL_ALL  1

/** 
 * Indicates the name of APP(i).
 * It uses the following method to get the value, see:
 * <p>
 * {@link #SysApi::getDMConfig:(NSString*)ParaName}
 * </p>
 */
#define DM_OPENAPI_APP_I_NAME           "./HuaweiExt/OpenApi/App/i/Name"

/** 
 * Indicates the key of APP(i).
 * It uses the following method to get the value, see:
 * <p>
 * {@link #SysApi::getDMConfig:(NSString*)ParaName}
 * </p>
 */
#define DM_OPENAPI_APP_I_KEY            "./HuaweiExt/OpenApi/App/i/Key"

/** 
 * Indicates the tokeid of APP(i).
 * It uses the following method to get the value, see:
 * <p>
 * {@link #SysApi::getDMConfig:(NSString*)ParaName}
 * </p>
 */
#define DM_OPENAPI_APP_I_TOKEID         "./HuaweiExt/OpenApi/App/i/TokeID"

/** 
 * Indicates the log url of APP(i).
 * It uses the following method to get the value, see:
 * <p>
 * {@link #SysApi::getDMConfig:(NSString*)ParaName}
 * </p>
 */
#define DM_OPENAPI_APP_I_LOGOURL        "./HuaweiExt/OpenApi/App/i/LogoURL"

/** 
 * Indicates the description of APP(i).
 * It uses the following method to get the value, see:
 * <p>
 * {@link #SysApi::getDMConfig:(NSString*)ParaName}
 * </p>
 */
#define DM_OPENAPI_APP_I_DESCRIPTION    "./HuaweiExt/OpenApi/App/i/Description"

/** 
 * Indicates the downlord url of APP(i).
 * It uses the following method to get the value, see:
 * <p>
 * {@link #SysApi::getDMConfig:(NSString*)ParaName}
 * </p>
 */
#define DM_OPENAPI_APP_I_DOWNLORDURL    "./HuaweiExt/OpenApi/App/i/DownlordUrl"

/** 
 * Indicates the parameter name of the device configuration parameters configured and delivered by the DM for IPC.
 * It uses the following method to get the value, see:
 * <p>
 * {@link #SysApi::getDMConfig:(NSString*)ParaName}
 * </p>
 */
#define DM_OPENAPI_DEVCFG        @"./HuaweiExt/OpenApi/DevCfgParam"

/** 
 * Indicates the parameter name of the storage access parameters configured and delivered by the DM for IPC.
 * It uses the following method to get the value, see:
 * <p>
 * {@link #SysApi::getDMConfig:(NSString*)ParaName}
 * </p>
 */
#define DM_OPENAPI_STOREACCESS   @"./HuaweiExt/OpenApi/StoreAccessParam"

/** 
 * Indicates the parameter name of the cloud storage address configured and delivered by the DM for IPC.
 * It uses the following method to get the value, see:
 * <p>
 * {@link #SysApi::getDMConfig:(NSString*)ParaName}
 * </p>
 */
#define DM_OPENAPI_STOREADDRESS  @"./HuaweiExt/OpenApi/StoreAddressParam"

/** 
 * Indicates the parameter name of the NTP server address configured and delivered by the DM for IPC.
 * It uses the following method to get the value, see:
 * <p>
 * {@link #SysApi::getDMConfig:(NSString*)ParaName}
 * </p>
 */
#define DM_OPENAPI_NTPSERVER     @"./HuaweiExt/OpenApi/NTPServerParam"

/**
 * Indicates the parameter name of supporting mass message or not. Its value is delivered by the
 * DM server and is used for the mass message. It uses the following method to get the value, see:
 * <p>
 * {@link #getDMConfig(String parmNameStr)}
 * </p>
 */
#define DM_IM_SUPPORT_MASSMESSAGE     @"./HuaweiExt/IM/Supportmass"

/**
 * Indicates the parameter name of mass message which supporting the max size of members. Its value is delivered by the
 * DM server and is used for the mass message. It uses the following method to get the value, see:
 * <p>
 * {@link #getDMConfig(String parmNameStr)}
 * </p>
 */
#define DM_MASSMSG_MEMBER_MAXSIZE     @"./IM/RCS/Ext/RCS/MassMsgMemberMaxSize"

/** 
 * Indicates the max file size in byte of file can used in file transfer.
 * It uses the following method to get the value, see:
 * <p>
 * {@link #SysApi::getDMConfig:(NSString*)ParaName}
 * </p>
 */
#define DM_OPENAPI_FT_MAX_SIZE     @"./IM/RCS/Ext/RCS/MaxSizeFileTr"

/** 
 * Indicates the maximum size of the content sent within a 1-to-1 chat session.
 * It uses the following method to get the value, see:
 * <p>
 * {@link #SysApi::getDMConfig:(NSString*)ParaName}
 * </p>
 */
#define DM_OPENAPI_IM_MAX_SIZE_1TO1     @"./IM/RCS/Ext/RCS-e/maxSize1to1Im"

/** 
 * Indicates the maximum size of the content sent within an ad-hoc group chat session.
 * It uses the following method to get the value, see:
 * <p>
 * {@link #SysApi::getDMConfig:(NSString*)ParaName}
 * </p>
 */
#define DM_OPENAPI_IM_MAX_SIZE_GROUP     @"./IM/RCS/Ext/RCS-e/maxSizeGroupIm"

/** 
 * Indicates the maximum size of the file to be sent in a mass chat.
 * It uses the following method to get the value, see:
 * <p>
 * {@link #SysApi::getDMConfig:(NSString*)ParaName}
 * </p>
 */
#define DM_MASS_FILE_MAXSIZE        @"./HuaweiExt/IM/MassFileMaxSize"

/** 
 * Indicates the parameter name of the address of the profile AS.
 * It uses the following method to get the value, see:
 * <p>
 * {@link #SysApi::getDMConfig:(NSString*)ParaName}
 * </p>
 */
#define DM_OPENAPI_PROFILEASADDR     @"./HuaweiExt/OpenApi/ProfileASAddr"

/** 
 * Indicates the parameter name of the address type of the profile AS.
 * It uses the following method to get the value, see:
 * <p>
 * {@link #SysApi::getDMConfig:(NSString*)ParaName}
 * </p>
 */
#define DM_OPENAPI_PROFILEASADDRTYPE     @"./HuaweiExt/OpenApi/ProfileASAddrType"

/** 
 * Indicates the parameter name of the address of the NAB server.
 * It uses the following method to get the value, see:
 * <p>
 * {@link #SysApi::getDMConfig:(NSString*)ParaName}
 * </p>
 */
#define DM_OPENAPI_NABSERVERADDR     @"./HuaweiExt/OpenApi/NABServerAddr"

/** 
 * Indicates the parameter name of the address type of the NAB server.
 * It uses the following method to get the value, see:
 * <p>
 * {@link #SysApi::getDMConfig:(NSString*)ParaName}
 * </p>
 */
#define DM_OPENAPI_NABSERVERADDRTYPE     @"./HuaweiExt/OpenApi/NABServerAddrType"

/** 
 * Indicates the parameter name of the address of the public account AS.
 * It uses the following method to get the value, see:
 * <p>
 * {@link #SysApi::getDMConfig:(NSString*)ParaName}
 * </p>
 */
#define DM_OPENAPI_PUBLICACCOUNTASADDR     @"./HuaweiExt/OpenApi/PublicAccountASAddr"

/** 
 * Indicates the parameter name of the address type of the public account AS.
 * It uses the following method to get the value, see:
 * <p>
 * {@link #SysApi::getDMConfig:(NSString*)ParaName}
 * </p>
 */
#define DM_OPENAPI_PUBLICACCOUNTASADDRTYPE     @"./HuaweiExt/OpenApi/PublicAccountASAddrType"

/** 
 * Indicates the parameter name of the address of the SSO server.
 * It uses the following method to get the value, see:
 * <p>
 * {@link #SysApi::getDMConfig:(NSString*)ParaName}
 * </p>
 */
#define DM_OPENAPI_SSOSERVERADDR     @"./HuaweiExt/OpenApi/SSOServerAddr"

/** 
 * Indicates the parameter name of the address type of the SSO server.
 * It uses the following method to get the value, see:
 * <p>
 * {@link #SysApi::getDMConfig:(NSString*)ParaName}
 * </p>
 */
#define DM_OPENAPI_SSOSERVERADDRTYPE     @"./HuaweiExt/OpenApi/SSOServerAddrType"

/**
 * Indicates the parameter name of the default mode of file transfer. 
 * It uses the following method to get the value, see:
 * <p>
 * {@link #SysApi::getDMConfig:(NSString*)ParaName}
 * </p>
 */
#define DM_OPENAPI_FTDEFAULTMECH     @"./APPLICATION/IM/ftDefaultMech"

/**
 * Indicates the parameter name of the rcs modules. 
 * It uses the following method to get the value, see:
 * <p>
 * {@link #SysApi::getDMConfig:(NSString*)ParaName}
 * </p>
 */
#define DM_COMMON_RCSMODULES    @"./HuaweiExt/Common/RCSModules"

/**
 * NOTIFY filter param type.
 * It is used to set the enumeration constants of the filtering criteria for NOTIFY messages.
 */
typedef enum tag_NOTIFY_FILTER_TYPE
{
    NOTIFY_FILTER_ALL = 1,     /**< @brief Indicates that the SDK does not reports all NOTIFY messages to the UI.*/
    NOTIFY_FILTER_USER_AGENT_PRODUCT_NAME,   /**< @brief Indicates that the SDK reports the NOTIFY messages that contain User-Agent name to the UI.*/
    NOTIFY_FILTER_NONE        /**< @brief Indicates that the SDK does not filter NOTIFY messages and reports all NOTIFY messages to the UI.*/
}NOTIFY_FILTER_TYPE;

/**
 * NETWORK_STATUS is used to query enumeration constants of network status.
 * The UI invokes NETWORK_STATUS to determine the current network status.
 */
typedef enum tag_NETWORK_STATUS
{
	NETWORK_NOTREACHABLE = 0,  /**< @brief Indicates that the network is unreachable.*/
	NETWORK_REACHABLEVIAWIFI,  /**< @brief Indicates that the Wi-Fi is reachable.*/
	NETWORK_REACHABLEVIAWWAN   /**< @brief Indicates that the Internet is reachable.*/
}NETWORK_STATUS;

/**
 * <b>Description:</b> TlsHelper provides an entry for UI to choose to load some kinds of TLS.
 * <br><b>Purpose:</b> The UI accesses System API to load one or more kinds of TLS.
*/
@interface TlsHelper : NSObject
{
}

/**
 * <b>Description:</b> This method is used to intialize the function of a kind of TLS.
 * <br><b>Purpose:</b> This method is invoked to load a TLS lib. Generally, it is invoked during system initialization.
 */

-(int)load;

@end

/**
 * <b>Description:</b> StgHelper provides an entry for UI to choose to load some kinds of STG.
 * <br><b>Purpose:</b> The UI accesses System API to load one or more kinds of STG.
 */
@interface StgHelper : NSObject
{
}

/**
 * <b>Description:</b> This method is used to intialize the function of a kind of STG
 * <br><b>Purpose:</b> This method is invoked to load a STG lib. Generally, it is invoked during system initialization.
 */

-(int)load;

@end

/**
 * <b>Description:</b> It provides an entry to applications.
 * <br><b>Purpose:</b> The UI accesses application APIs to implement application related services.
*/
@interface SysApi : NSObject
{
}

/**
 * <b>Description:</b> This method is used to initialize the SDK.
 * <br><b>Purpose:</b> The UI invokes it to initialize the SDK during the app startup.
 * @param version Indicates the .app file version number
 */
+ (void)init:(NSString*) version;

/**
 * <b>Description:</b> This method is used to release sys APIs before logging out of the RCS client.
 * <br><b>Purpose:</b> The UI invokes it to release sys APIs before logging out of the RCS client.
 */
+ (void)releaseApi;

/**
 * <b>Description:</b> This method is used to query the SDK version number.
 * <br><b>Purpose:</b> The UI invokes it to query the SDK version number.
 * @return The value indicates the SDK version number
 */
+ (NSString*)getVersion;

/**
 * <b>Description:</b> This method is used to set the DM version number.
 * <br><b>Purpose:</b> The UI invokes it to set the DM version number.
 * If the DM version number does not need to be set, ignore this interface.
 * @param [in] version Specifies the DM version number. The version number must be composed of four parts, such as V1.2.88.21.
 * @return 0 Indicates that the setting succeeded
 *     <br>1 Indicates that the setting failed
 */
+(int)setDMVersion:(NSString*) version;
/**
* <b>Description:</b> This method is used to set which level log that SDK will print.
* <br><b>Purpose:</b> The UI invokes this method to set which level log that SDK will print, which is used to control 
* the SDK print level.
* @param iLogLevel
*        Specifies the print log level.0: only print error level log.1:print all level log.
* @return 0 Indicates that the setting succeeded
*     <br>1 Indicates that the setting failed
*/
+ (int)setLogLevel:(int) iLogLevel;
/**
 * <b>Description:</b> This method is used to set log to be Encrypted.
 * <br><b>Purpose:</b> The UI invokes this method to set log to be Encrypted, which is used to encrypt or deencrypt 
 * the SDK log.
 * @return The value Indicates the SDK build time, for example: Nov 7 2013 12:21:11.
 */
+ (int)setLogEncrypt:(bool) bLogEncrypt;
    
/**
 * <b>Description:</b> This method is used to check whether automatic subscriber creation is enabled.
 * <br><b>Purpose:</b> Subscribers whose accounts are automatically created are defined as
 * RCSe_A subscribers.
 * @return True Indicates automatic subscriber creation
 *     <br>False Indicates non-automatic subscriber creation
 */
+(BOOL)isAutoCreateAccount;

/**
 * <b>Description:</b> This method is used to query the is used to query the SDK build time.
 * <br><b>Purpose:</b> The UI invokes it to query the SDK build time, which is used to distinguish the SDK version.
 * @return The value indicates the SDK build time
 */
+ (NSString*)getBuildTime;

 /**
 * <b>Description:</b> This method is used to obtain the parameter value configured and delivered by the DM.
 * <br><b>Purpose:</b> In the case of using the DM server, after UI login successfully, The UI invokes it to 
 * obtain the parameter value configured and delivered by the DM.
 * @param [in] ParaName Specifies the parameter name
 * <p>The parmNameStr will have the following values, for example:
 * <ul>
 *   <li><em>{@link #DM_OPENAPI_DEVCFG}</em></li>
 *   <li><em>{@link #DM_OPENAPI_STOREACCESS}</em></li>
 *   <li><em>{@link #DM_OPENAPI_STOREADDRESS}</em></li>
 *   <li><em>{@link #DM_OPENAPI_NTPSERVER}</em></li>
 *   <li><em>{@link #DM_COMMON_RCSMODULES}</em></li>
 * </ul>
 * </p>
 * @return The value indicates the parameter value configured by the DM
 */
+ (NSString*)getDMConfig:(NSString*)ParaName;


/**
 * <b>Description:</b> This method is used to load a TLS implementation.
 * <br><b>Purpose:</b> The UI invokes this method during initialization to load a TLS implementation, 
 * so as to enable the security encryption function of the SDK.
 * @param [in] helper Specifies a TLS implementation
 * @return 0 Indicates it was loaded successfully
 *     <br>1 Indicates it failed
 */
+(int)loadTls:(TlsHelper *)helper;

/**
 * <b>Description:</b> This method is used to load a STG implementation.
 * <br><b>Purpose:</b> The UI invokes this method during initialization to load a STG implementation 
 * so as to enable the firewall traversal function of the SDK.
 * @param [in] helper Specifies a STG implementation
 * @return 0 Indicates it was loaded successfully
 *     <br>1 Indicates it failed
 */
+(int)loadStg:(StgHelper *)helper;

/**
 * <b>Description:</b> This method is used to notify the SDK that an application is not activated.
 * <br><b>Purpose:</b> After the RCS notifies the UI that an application is not activated, the UI invokes it to send the notification to the SDK.
 * @param [in] application Specifies an application object
 */
+ (void)applicationWillResignActive:(id)application;

/**
 * <b>Description:</b> This method is used to notify the SDK that an application has entered the background.
 * <br><b>Purpose:</b> After the RCS notifies the UI that an application has entered the background, the UI invokes it to send the notification to the SDK.
 * @param [in] application Specifies an application object
 */
+ (void)applicationDidEnterBackground:(id)application;

/**
 * <b>Description:</b> This method is used to notify the SDK that an application is to enter the foreground.
 * <br><b>Purpose:</b> After the RCS notifies the UI that an application is to enter the foreground, the UI invokes it to send a notification to the SDK.
 * @param [in] application Specifies an application object
 */
+ (void)applicationWillEnterForeground:(id)application;

/**
 * <b>Description:</b> This method is used to notify the SDK that an application has been activated.
 * <br><b>Purpose:</b> After the RCS notifies the UI that an application has been activated, the UI invokes it to send a notification to the SDK.
 * @param [in] application Specifies an application object
 */
+ (void)applicationDidBecomeActive:(id)application;

/**
 * <b>Description:</b> This method is used to notify the SDK that an application is to be terminated.
 * <br><b>Purpose:</b> After the RCS notifies the UI that an application is to be terminated, the UI invokes it to send a notification to the SDK.
 * @param [in] application Specifies an application object
 */
+ (void)applicationWillTerminate:(id)application;

/**
 * <b>Description:</b> This method is used to determine whether Wi-Fi has been enabled.
 * <br><b>Purpose:</b> The UI invokes it to determine whether the current Wi-Fi is available.
 * @return YES Indicates that the Wi-Fi is available
 *     <br>NO Indicates that the Wi-Fi is unavailable
 */
+ (BOOL)isEnableWIFI;

/**
 * <b>Description:</b> This method is used to determine whether 3G has been enabled.
 * <br><b>Purpose:</b> The UI invokes it to determine whether the current 3G network is available.
 * @return YES Indicates that the 3G network is available
 *     <br>NO Indicates that the 3G network is unavailable
 */
+ (BOOL)isEnable3G;

/**
 * <b>Description:</b> This method is used to determine whether the current network is available.
 * <br><b>Purpose:</b> The UI invokes it to determine whether the current network is available.
 * @return YES Indicates that the network is available
 *     <br>NO Indicates that the network is unavailable
 */
+ (BOOL)isNetworkOK;

/**
 * <b>Description:</b> This method is used to analyze the json data.
 * <br><b>Purpose:</b> The UI invokes it to analyze the json data, it is a System interface.
 */
+ (id)dictionaryWithJSONData:(NSData *)inData error:(NSError **)outError;

/**
 * <b>Description:</b> This method is used to get the local IP address of the device.
 * <br><b>Purpose:</b> The UI invokes it to get the local IP address of the device.
 * @return The value indicates the local IP address
 */
+ (NSString*)getLocalIPAddress;

/**
 * <b>Description:</b> This method is used to enable network detection function.
 * <br><b>Purpose:</b> The UI invokes it to enable network detection function.
 * @param [in] bSupt YES Indicates that enable network detection function
 *          <br>NO Indicates that enable network detection function
 */
+(void) setSuptNetDetect:(BOOL)bSupt;

/**
 * <b>Description:</b> This method is used to enable keep-alive function.
 * <br><b>Purpose:</b> The UI invokes it to enable keep-alive function.
 * @param [in] bEnable YES Indicates that enable keep-alive function
 *            <br>NO Indicates that disable keep-alive function
 */
+(void) setStunKeepAliveEnable:(BOOL)bEnable;


/**
 * <b>Description:</b> This method is used to set supoort sip stack sharing.
 * <br><b>Purpose:</b> UI can invoke this method to This method is used to set supoort sip stack sharing.
 * @param [in] bEnable YES Indicates that enable Sharing Sip Stack
 *            <br>NO Indicates that disable Sharing Sip Stack
 */
+(void) setSharingSipStack:(BOOL)bSharingStack;


/**
 * <b>Description:</b> This method is used to is used to set the filtering criteria for NOTIFY messages.
 * <br><b>Purpose:</b> The UI invokes it to determine whether the SDK needs to report NOTIFY messages to the UI.
 * If the NOTIFY messages has the filtering criterion parameter, it will report the broadcast {@link #EVENT_SYS_RECV_NOTIFY_MSG}.
 * @param [in] filterType Specifies the type of a filtering criterion
 * @param [in] filterParam Specifies the filtering criterion parameter
 * @return 0 Indicates the setting is successful
 *     <br>1 Indicates the setting fails
 */
+(int)setNotifyFilter:(int)filterType filterParam:(NSString*)filterParam;

/**
 * <b>Description:</b> This method is used to execute an SQL query.
 * <br><b>Purpose:</b> UI invokes this method to execute an SQL query.
 * <p>The table name and field name please refer the following list:
 * <ul>
 *   <li><em>{@link TBNAME_CALL_LOG}</em></li> - Call log table name. The field name is defined as TBFLD_CALLLOG_XXXXX.
 *   <li><em>{@link TBNAME_CAPABILITY}</em></li> Contact capability table name. The field name is defined as TBFLD_CAPBLT_XXXXX.
 *   <li><em>{@link TBNAME_FAVORITE}</em></li> Contact favorite table name. The field name is defined as TBFLD_FAVRT_XXXXX.
 *   <li><em>{@link TBNAME_MY_INFO}</em></li> My info table name. The field name is defined as TBFLD_MYINFO_XXXXX.
 *   <li><em>{@link TBNAME_PRESENCE}</em></li> Presence table name. The field name is defined as TBFLD_PRESNC_XXXXX.
 *   <li><em>{@link TBNAME_MESSAGE}</em></li> Message table name. The field name is defined as TBFLD_MESSAGE_XXXXX.
 *   <li><em>{@link TBNAME_CONVERSATION}</em></li> Conversation table name. The field name is defined as TBFLD_MESSAGE_XXXXX.
 *   <li><em>{@link TBNAME_GROUP_MEMBER}</em></li> Group member table name. The field name is defined as TBFLD_GRPMEMB_XXXXX.
 *   <li><em>{@link TBNAME_PUB_GROUP}</em></li> Public group table name. The field name is defined as TBFLD_PUBGRP_XXXXX.
 *   <li><em>{@link TBNAME_PUB_GRP_MEMB}</em></li> Public group member table name. The field name is defined as TBFLD_PUBGRPMEMB_XXXXX.
 *   <li><em>{@link TBNAME_EAB_CONTACT}</em></li> EAB contact table name. The field name is defined as TBFLD_EABCNT_XXXXX.
 *   <li><em>{@link TBNAME_EAB_STRANGER}</em></li> EAB stranger table name. The field name is defined as TBFLD_EABSTR_XXXXX.
 *   <li><em>{@link TBNAME_EAB_CONTACT_GRP}</em></li> EAB contact group tabl name. The field name is defined as TBFLD_ECNTGRP_XXXXX.
 *   <li><em>{@link TBNAME_EAB_MAP_RELATION}</em></li> - EAB map relation table name. The field name is defined as TBFLD_EMAPREL_XXXXX.
 * </ul>
 * @param [in] sql Specifies the SQL statement
 *
 * @return the result set
 */
+(id)dbSQLiteRunQuery:(NSString *)sql;

/**
 * <b>Description:</b> This method is used to close a result set.
 * <br><b>Purpose:</b> UI invokes this method to close a result set.
 *
 * @param [in] rs Specifies the result set.
 */
+(void)dbSQLiteCloseQuery:(id)rs;

/**
 * <b>Description:</b> This method is used to iterate through the result set.
 * <br><b>Purpose:</b> UI invokes this method to iterate through the result set.
 *
 * @param [in] rs Specifies the result set.
 *
 * @return CAAS_TRUE Indicates the row exists
 *    <br> CAAS_FALSE Indicates the row does not exist
 */
+(BOOL)dbSQLiteNextRow:(id)rs;

/**
 * <b>Description:</b> This method is used to retrieve data in string format.
 * <br><b>Purpose:</b> UI invokes this method to retrieve data in string format.
 *
 * @param [in] rs Specifies the result set.
 * @param [in] columnID Specifies the position of the column in the result set.
 *
 * @return the string value
 */
+(NSString *)dbSQLiteColumnString:(id)rs columnID:(int)columnID;

/**
 * <b>Description:</b> This method is used to retrieve data in int format.
 * <br><b>Purpose:</b> UI invokes this method to retrieve data in int format.
 *
 * @param [in] rs Specifies the result set.
 * @param [in] columnID Specifies the position of the column in the result set.
 *
 * @return the int value
 */
+(int)dbSQLiteColumnInt:(id)rs columnID:(int)columnID;

/**
 * <b>Description:</b> This method is used to retrieve data in long format.
 * <br><b>Purpose:</b> UI invokes this method to retrieve data in long format.
 *
 * @param [in] rs Specifies the result set.
 * @param [in] columnID Specifies the position of the column in the result set.
 *
 * @return the long value
 */
+(long)dbSQLiteColumnLong:(id)rs columnID:(int)columnID;

/**
 * <b>Description:</b> This method is used to retrieve data in BOOL format.
 * <br><b>Purpose:</b> UI invokes this method to retrieve data in BOOL format.
 *
 * @param [in] rs Specifies the result set.
 * @param [in] columnID Specifies the position of the column in the result set.
 *
 * @return the BOOL value
 */
+(BOOL)dbSQLiteColumnBool:(id)rs columnID:(int)columnID;

/**
 * <b>Description:</b> This method is used to retrieve data in double format.
 * <br><b>Purpose:</b> UI invokes this method to retrieve data in double format.
 *
 * @param [in] rs Specifies the result set.
 * @param [in] columnID Specifies the position of the column in the result set.
 *
 * @return the double value
 */
+(double)dbSQLiteColumnDouble:(id)rs columnID:(int)columnID;

/**
 * <b>Description:</b> This method is used to retrieve data in date format.
 * <br><b>Purpose:</b> UI invokes this method to retrieve data in date format.
 *
 * @param [in] rs Specifies the result set.
 * @param [in] columnID Specifies the position of the column in the result set.
 *
 * @return the date value
 */
+(NSDate *)dbSQLiteColumnDate:(id)rs columnID:(int)columnID;
    
@end

/** Indicates that the max size of the value for SettingUtil */
#ifdef __LP64__
#define SETTINGUTIL_ZMAXINT 0x7FFFFFFFFFFFFFFF
#else
#define SETTINGUTIL_ZMAXINT 0x7FFFFFFF
#endif
/** Indicates that IM message alert type */
typedef enum tag_IM_ALERT_TYPE
{
    SETTINGUTIL_RING,           /**< @brief Indicates that ring alert. */
    SETTINGUTIL_VIBRATE,        /**< @brief Indicates that vibrate alert.*/
    SETTINGUTIL_RINGANDVIBRATE, /**< @brief Indicates that ring and vibrate.*/
    SETTINGUTIL_SILENCE         /**< @brief Indicates that silence. */
}IM_ALERT_TYPE;

/** Indicates that the APP type */
typedef enum tag_App_Type
{
    SETTINGUTIL_RCS_MODEL = 0,          /**< @brief Indicates that RCS.*/
    SETTINGUTIL_OPENAPI_MODEL = 1      /**< @brief Indicates that OpenApi.*/
} APP_TYPE;

/** Indicates that major configuration type */
typedef enum tag_CFG_MAJOR_TYPE
{
    SETTINGUTIL_CFG_MAJOR_DM_MODE         = 0, /**< @brief Indicates that the major configuration type of DM mode*/
    SETTINGUTIL_CFG_MAJOR_DM_IP           = 1, /**< @brief Indicates that the major configuration type of DM IP*/
    SETTINGUTIL_CFG_MAJOR_DM_PORT         = 2, /**< @brief Indicates that the major configuration type of DM port*/

    SETTINGUTIL_CFG_MAJOR_IMS_IP          = 3, /**< @brief Indicates that the major configuration type of IMS IP*/
    SETTINGUTIL_CFG_MAJOR_IMS_PORT        = 4, /**< @brief Indicates that the major configuration type of IMS port*/
    SETTINGUTIL_CFG_MAJOR_IMS_DOMAIN      = 5, /**< @brief Indicates that the major configuration type of IMS domain*/
    SETTINGUTIL_CFG_MAJOR_IMS_REG_EXPIRES = 6, /**< @brief Indicates that the major configuration type of IMS register expires*/

    SETTINGUTIL_CFG_MAJOR_RPG_IP          = 7, /**< @brief Indicates that the major configuration type of RPG IP*/
    SETTINGUTIL_CFG_MAJOR_RPG_PORT        = 8, /**< @brief Indicates that the major configuration type of RPG port*/

    SETTINGUTIL_CFG_MAJOR_SVN_USER_NAME   = 9, /**< @brief Indicates that the major configuration type of SVN user name*/
    SETTINGUTIL_CFG_MAJOR_SVN_PASSWORD    = 10, /**< @brief Indicates that the major configuration type of SVN password*/
    SETTINGUTIL_CFG_MAJOR_SVN_COUNT       = 11, /**< @brief Indicates that the major configuration type of SVN count*/
    SETTINGUTIL_CFG_MAJOR_SVN_IP          = 12, /**< @brief Indicates that the major configuration type of SVN IP*/
    SETTINGUTIL_CFG_MAJOR_SVN_PORT        = 13, /**< @brief Indicates that the major configuration type of SVN port*/

    SETTINGUTIL_CFG_MAJOR_NICK_NAME       = 14, /**< @brief Indicates that the major configuration type of nick name*/

	SETTINGUTIL_CFG_MAJOR_USER_AGENT      = 16, /**< @brief Indicates that the major configuration type of user agent*/

    SETTINGUTIL_CFG_MAJOR_TPT_TYPE        = 17, /**< @brief Indicates that the major configuration type of transport type*/

    SETTINGUTIL_CFG_MAJOR_DM_HTTP_PORT        = 18, /**< @brief Indicates that the major configuration type of DM http port*/
    
    SETTINGUTIL_CFG_MAJOR_DM_HTTPS_PORT        = 19, /**< @brief Indicates that the major configuration type of DM https port*/

    SETTINGUTIL_CFG_MAJOR_APP_KEY         = 21, /** brief Indicates that the major configuration type of APP KEY */
    
    SETTINGUTIL_CFG_MAJOR_APP_ACCESSTOKEN = 22, /** brief Indicates that the major configuration type of APP ACCESS TOKEN */

    SETTINGUTIL_CFG_MAJOR_RCS_MODULE          = 24, /**< @brief Indicates that the major configuration type of rcs module,
                                                    default is "VoCS;VoIP;Video Over IP;Presence;Shared alone;Shared base IM;
                                                    Shared base Call;IM;SMS;FT;LS;Network Address book;". "Presence" indicates
                                                    the capability to publish social presence information which is visible to the user's buddies.*/
    SETTINGUTIL_CFG_MAJOR_APP_BADGE_DISPLAY = 25,/**< @brief Indicates that the major configuration type of if display app badge*/
    
    SETTINGUTIL_CFG_MAJOR_ACCESS_TYPE       = 31, /**< @brief Indicates that the major configuration type of Device's Access network type */
    SETTINGUTIL_CFG_MAJOR_CELL_ID           = 32, /**< @brief Indicates that the major configuration type of Device's CGI */
    SETTINGUTIL_CFG_MAJOR_USERIDPOLICY      = 34, /**< @brief Indicates that the major configuration type of P-Associate-URI*/
    
    SETTINGUTIL_CFG_MAJOR_TYPE_REGCAP       = 39, /**< @brief Indicates that major configuration type of REGISTER capability flag */
    SETTINGUTIL_CFG_MAJOR_APP_UID           = 56, /**< @brief Indicates that major configuration type of APP UID */
    SETTINGUTIL_CFG_MAJOR_APP_PASSID = 57, /**< @brief Indicates that major configuration type of APP PassID */
    SETTINGUTIL_CFG_MAJOR_APP_ARTIFACT = 58, /**< @brief Indicates that major configuration type of APP Artifact */

    SETTINGTUIL_CFG_MAJOR_MAC_ADDR = 59, /**< @brief Indicates that the major configuration type of Device's Mac Address */

    SETTINGTUIL_CFG_MAJOR_CHECK_SERVER_CERT = 62, /**< Indicates whether checking the server's certificate for Tls is supported. */
    SETTINGTUIL_CFG_MAJOR_SUPPORT_INTER_FLOW = 64, /**< Indicates that the major configuration whether support inter flow. 0:not support 1:support. default: 0.*/  

    SETTINGTUIL_CFG_MAJOR_CLIENT_VENDOR = 65, /**< @brief  Indicates that the major configuration type of client_vendor*/
    SETTINGTUIL_CFG_MAJOR_CLIENT_VERSION = 66, /**< @brief  Indicates that the major configuration type of client_version*/

    SETTINGTUIL_CFG_MAJOR_DISPLAY_NAME = 69, /**< Indicates that the major configuration of display name which used in Message and Call*/ 

    SETTINGTUIL_CFG_MAJOR_TYPE_KEEP_ALIVE_RSP_TIMER_LEN = 76,    /** Indicates that the major configuration type of the timer length for keeping alive response .
                                                                    * The default timer length is 15 seconds.It is measured in seconds.*/

    SETTINGTUIL_CFG_MAJOR_IMPI_FORMAT = 83, /**< Indicates that the major configuration of IMPI which is usend in authrization whether to need format*/
    
    SETTINGTUIL_CFG_MAJOR_UPLOG_AUTH_TYPE = 87, /**< Indicates the authorization type when upload log,
        0:not use token 1:use token. default: 0.*/

    SETTINGTUIL_CFG_MAJOR_TCP_DISCONNECT = 88, /**< Indicates that the major configuration type of TCP enable*/

    SETTINGTUIL_CFG_MAJOR_BIND_ANY_IP = 90, /**< Indicates that the major configuration type of bind any ip*/

    SETTINGUTIL_CFG_MAJOR_BUTT      /**< @brief Indicates that the invalid value*/

}CFG_MAJOR_TYPE;

/**Value of major configuration type of transport type  : Use UDP transport*/
#define VALUE_MAJOR_TYPE_TPT_UDP                @"0"

/**Value of major configuration type of transport type  : Use TCP  transport*/
#define VALUE_MAJOR_TYPE_TPT_TCP                @"1"

/**Value of major configuration type of transport type  : Use TLS transport*/
#define VALUE_MAJOR_TYPE_TPT_TLS                @"2"

/**Value of major configuration type of transport type  : Use SVN transport */
#define VALUE_MAJOR_TYPE_TPT_SVN                @"3"

/**Value of major configuration type of transport type  : Use Auto Select*/
#define VALUE_MAJOR_TYPE_TPT_AUTO               @"4"

/**Value of major configuration type of transport type  : Use TSC and SIP over UDP*/
#define VALUE_MAJOR_TYPE_TPT_TSC                @"5"

/**Value of major configuration type of transport type  : Use NAT with UDP transport*/
#define VALUE_MAJOR_TYPE_TPT_NAT_UDP            @"6"

/**Value of major configuration type of transport type  : Use NAT with TCP transport*/
#define VALUE_MAJOR_TYPE_TPT_NAT_TCP            @"7"

/**Value of major configuration type of REGISTER capability flag: Use +g.3gpp.smsip*/
#define VALUE_MAJOR_TYPE_REGCAP_SMSIP           @"5"

/**Value of major configuration type of transport type  : Use NAT with TLS transport*/
#define VALUE_MAJOR_TYPE_TPT_NAT_TLS            @"8"

/**Value of major configuration type of transport type  : Use AUTONAT with UDP transport*/
#define VALUE_MAJOR_TYPE_TPT_AUTONAT_UDP        @"20"

/**Value of major configuration type of transport type  : Use AUTONAT with TCP transport*/
#define VALUE_MAJOR_TYPE_TPT_AUTONAT_TCP        @"21"

/**Value of major configuration type of transport type  : Use AUTONAT with TLS transport*/
#define VALUE_MAJOR_TYPE_TPT_AUTONAT_TLS        @"22"

/**Value of major configuration type of transport type  : Use AUTOSVN with UDP transport*/
#define VALUE_MAJOR_TYPE_TPT_AUTOSVN_UDP        @"30"

/**Value of major configuration type of transport type  : Use AUTOSVN with TCP transport*/
/*Start add for AUTOSVN Optimization by z00163152 at 2013-11-25*/
#define VALUE_MAJOR_TYPE_TPT_AUTOSVN_TCP        @"31"
/*Start add for AUTOSVN Optimization by z00163152 at 2013-11-25*/

/**Value of major configuration type of transport type  : Use AUTOSVN with TLS transport*/
#define VALUE_MAJOR_TYPE_TPT_AUTOSVN_TLS        @"32"

/**Value of major configuration type of transport type  : Use TSC with SIP over UDP transport*/
#define VALUE_MAJOR_TYPE_TPT_AUTOTSC_UDP        @"40"

/**Value of major configuration type of transport type  : Use TSC with SIP over TCP transport*/
#define VALUE_MAJOR_TYPE_TPT_AUTOTSC_TCP        @"41"

/**Value of major configuration type of transport type  : Use TSC with SIP over TLS transport*/
#define VALUE_MAJOR_TYPE_TPT_AUTOTSC_TLS        @"42"

/**Value of major configuration type of if display the app Badge : display*/
#define VALUE_DISPLAY_APP_BADGE                 @"1"

/**Value of major configuration type of if display the app Badge : not display*/
#define VALUE_NOT_DISPLAY_APP_BADGE             @"0"


/** Indicates that the network access type is 802.11A. */
#define VALUE_MAJOR_TYPE_ACCESS_TYPE_802_11A @"1" 

/** Indicates that the network access type is 802.11B. */
#define VALUE_MAJOR_TYPE_ACCESS_TYPE_802_11B @"2" 

/** Indicates that the network access type is 802.11G. */
#define VALUE_MAJOR_TYPE_ACCESS_TYPE_802_11G @"3" 

/** Indicates that the network access type is 802.11N. */
#define VALUE_MAJOR_TYPE_ACCESS_TYPE_802_11N @"4" 

/** Indicates that the network access type is 3GPP GERAN. */
#define VALUE_MAJOR_TYPE_ACCESS_TYPE_3GPP_GERAN @"5" 

/** Indicates that the network access type is 3GPP UTRAN FDD. */
#define VALUE_MAJOR_TYPE_ACCESS_TYPE_3GPP_UTRAN_FDD @"6" 

/** Indicates that the network access type is 3GPP UTRAN TDD. */
#define VALUE_MAJOR_TYPE_ACCESS_TYPE_3GPP_UTRAN_TDD @"7" 

/** Indicates that the network access type is 3GPP EUTRAN FDD. */
#define VALUE_MAJOR_TYPE_ACCESS_TYPE_3GPP_EUTRAN_FDD @"21" 

/** Indicates that the network access type is 3GPP EUTRAN TDD. */
#define VALUE_MAJOR_TYPE_ACCESS_TYPE_3GPP_EUTRAN_TDD @"22" 

/** Indicates that the network access type is 802.11. */
#define VALUE_MAJOR_TYPE_ACCESS_TYPE_802_11 @"24"    

/** Indicates that the network access type is 3GPP WLAN. */
#define VALUE_MAJOR_TYPE_ACCESS_TYPE_3GPP_WLAN  @"25"  

/**Value of major configuration type of P-Associate-URI List*/
#define VALUE_MAJOR_TYPE_ACCESS_TYPE_USER_POLICY_LIST @"5" 

/**Indicates that not use token when upload log.*/
#define VALUE_MAJOR_TYPE_UPLOG_AUTH_TYPE_DEFAULT @"0"

/**Indicates that use token when upload log.*/
#define VALUE_MAJOR_TYPE_UPLOG_AUTH_TYPE_TOKEN @"1"


/** Indicates that minor configuration type */
typedef enum tag_CFG_MINOR_TYPE
{
    SETTINGUTIL_CFG_MINOR_BUTT = SETTINGUTIL_ZMAXINT /**< @brief Indicates that the max value*/
}CFG_MINOR_TYPE;

/**
 * <b>Description:</b> SettingUtil provides an entry to RCS settings.
 * <br><b>Purpose:</b> The UI accesses APIs of this class to implement RCS service setting.
 */
@interface SettingUtil : NSObject
{

@private

    int _imAlertType;      /** see Sa_IM_Alert_Type */
    int _picQuality;       /** 0:low,1:high */
    int _appType;          /** Sa_App_Type */
    BOOL _readReceipt;     /** YES:open,NO:close */
    BOOL _autoReceivePic;  /** YES:open,NO:close */
    BOOL _autoReceiveFile; /** YES:open,NO:close */
    NSString* _domainName; /** Indicates the domain name*/
    NSMutableArray* _groupSoundArray;/** key:"groupUri" value:groupUri   key: "openSound" vaule: YES:open,NO:close */
    NSMutableArray* _conversationTopArray; /** element:conversationId */
    NSString* _unconditionalForward; /** Indicates the number that the user want to be forwarded unconditional */
    NSString* _busyForward;          /** Indicates the number that the user want to be forwarded to when busy */
    NSString* _noAnswerForward;      /** Indicates the number that the userwant to be forwarded to when no answer */
    NSString* _unReachForward;       /** Indicates the number that the userwant to be forwarded to when unreachable */
    BOOL _isCallWait;                /** Indicates whether call wating funtion is open or not */
    BOOL _isShowRestriction;         /** Indicates whether the user number is shown to the peer party or not */
    BOOL _audioRCSCall;              /** Indicates audio RCS call */
    BOOL _audioCSCall;               /** Indicates audio CS call */
    BOOL _audioIncoming;             /** Indicates audio incoming */
    BOOL _videoCallout;              /** Indicates video call out */
    BOOL _videoIncoming;             /** Indicates video incoming */
    BOOL _isHaveCalllogAlready;      /** Indicates whether there are call logs or not  */
    BOOL _isAddFavirateAlready;
    BOOL _isAllForwardSwitchOn;      /** Indicates the switch for all forward is on or off */
    BOOL _isCustomForwardSwitchOn;   /** Indicates the switch for costom forward is on or off */
    BOOL _isVoipTurnToCS;            /** Indicates voip turn to cs */

    NSString* _upgradenewversion;
}
/** Indicates the alert type.*/
@property (nonatomic, assign)int imAlertType;
/** Indicates the picture qualiyt.*/
@property (nonatomic, assign)int picQuality;
/** Indicates the app type.*/
@property (nonatomic, assign)int appType;
/** Indicates the flag of reading receive picture.*/
@property (nonatomic, assign)BOOL readReceipt;
/** Indicates the flag of automatic receive picture.*/
@property (nonatomic, assign)BOOL autoReceivePic;
/** Indicates the flag of automatic receive file.*/
@property (nonatomic, assign)BOOL autoReceiveFile;

/** Indicates the domain name. */
@property (nonatomic, copy)NSString* domainName;
/** 
 * Indicates the conversation array of chat voice. Both single chat and group chat use this array to control whether it needs
 * to ring or not.When setting single chat object,groupUri is filled with the other side number.When setting group chat,groupUri
 * is filled with chatUri of group chat. 
 */
@property (nonatomic, copy)NSMutableArray* groupSoundArray;
/** Indicates the conversation array of group chat to top. */
@property (nonatomic, copy)NSMutableArray* conversationTopArray;
/** Indicates the number that the user want to be forwarded unconditional */
@property (nonatomic, copy)NSString* unconditionalForward;
/** Indicates the number that the user want to be forwarded to when busy */
@property (nonatomic, copy)NSString* busyForward;
/** Indicates the number that the userwant to be forwarded to when no answer */
@property (nonatomic, copy)NSString* noAnswerForward;
/** Indicates the number that the userwant to be forwarded to when unreachable */
@property (nonatomic, copy)NSString* unReachForward;

/** Indicates whether call wating funtion is open or not. */
@property (nonatomic, assign)BOOL isCallWait;

/** Indicates whether the user number is shown to the peer party or not. */
@property (nonatomic, assign)BOOL isShowRestriction;
/** Indicates audio RCS call. */
@property (nonatomic, assign)BOOL audioRCSCall;
/** Indicates audio CS call. */
@property (nonatomic, assign)BOOL audioCSCall;
/** Indicates audio incoming. */
@property (nonatomic, assign)BOOL audioIncoming;
/** Indicates video call out. */
@property (nonatomic, assign)BOOL videoCallout;
/** Indicates video incoming. */
@property (nonatomic, assign)BOOL videoIncoming;
/** Indicates whether there are call logs or not.  */
@property (nonatomic, assign)BOOL isHaveCalllogAlready;
/** Indicates Whether the contact is loaded.  */
@property (nonatomic, assign)BOOL isAddFavirateAlready;
/** Indicates the switch for all forward is on or off. */
@property (nonatomic, assign)BOOL isAllForwardSwitchOn;
/** Indicates the switch for costom forward is on or off. */
@property (nonatomic, assign)BOOL isCustomForwardSwitchOn;
/** Indicates voip turn to cs. */
@property (nonatomic, assign)BOOL isVoipTurnToCS;
/** Indicates the upgrape new version. */
@property (nonatomic, copy)NSString* upgradenewversion;

/**
 * <b>Description:</b> This method is used to initialize RCS setting APIs.
 * <br><b>Purpose:</b> The UI invokes it to initialize RCS setting APIs before setting the RCS.
 * @return The value indicates the SettingUtil object
 */
+ (id)init;

/**
 * <b>Description:</b> This method is used to release setting APIs before existing from the RCS configuration service.
 * <br><b>Purpose:</b> The UI invokes it to release setting APIs before existing from the RCS configuration service.
 */
+ (void)releaseApi;

/**
 * <b>Description:</b> This method is used to obtain the contents of RCS invitation messages.
 * <br><b>Purpose:</b> Subscribers can send non-RCS contacts short messages to invite them to use the RCS. The UI invokes this 
 * method to obtain the contents of the short messages.
 * @return The value indicates the contents of the short message used to invite contacts to use the RCS
 */
+(NSString *)cfgGetInviteFriendInfo;

/**
 * <b>Description:</b> This method is used to is used to set RCS network configuration.
 * <br><b>Purpose:</b> The UI invokes it to set network configuration.
 * @param [in] pstNetworkCfg Specifies the dictionary that stores the configuration data
 */
+(void)cfgsetnetworkcfg:(id)pstNetworkCfg;

/**
 * <b>Description:</b> This method is used to obtain RCS network configuration.
 * <br><b>Purpose:</b> The UI invokes it to obtain RCS network configuration.
 * @return The value indicates the dictionary that stores the configuration data
 */
+(id)cfgGetNetworkCfg;

/**
 * <b>Description:</b> This method is used to determine whether a subscriber can automatically login.
 * <br><b>Purpose:</b> To implement automatic login, the UI invokes it to determine whether a subscriber can automatically login.
 * @return YES Indicates that a subscriber can automatically login
 *     <br>NO Indicates that a subscriber can not automatically login
 */
+(BOOL)isLastVerified;

/**
 * <b>Description:</b> This method is used to obtain the value of a user-defined parameter.
 * <br><b>Purpose:</b> The UI invokes it to obtain the value of a user-defined parameter.
 * @param [in] dwIndex Specifies a parameter index
 * @return The value indicates a char* parameter value
 */
+(char*)cfgGetCustomPara:(unsigned long)dwIndex;

/**
 * <b>Description:</b> This method is used to set the value of a user-defined parameter.
 * <br><b>Purpose:</b> The UI invokes it to set the value of a user-defined parameter.
 * @param [in] dwIndex Specifies a parameter index
 * @param [in] pcValue Specifies  a value to be set
 */
+(void)cfgSetCustomPara:(unsigned long) dwIndex value:(char*)pcValue;

/**
 * <b>Description:</b> This method is used to set the trust CA file.
 * <br><b>Purpose:</b> The UI invokes it to set the path of CA file to check services.
 * @param [in] pcPath Specifies  a value to CA file path
 */
+(void)cfgSetTrustCaFilePath:(char*)pcPath;

/**
 * <b>Description:</b> This method is used to set the value of an RCS configuration item.
 * <br><b>Purpose:</b> The UI invokes it to set the value of an RCS configuration item.
 * @param [in] model Specifies the value of an RCS configuration item
 */
+(void)writeSetting:(SettingUtil*)model;

/**
 * <b>Description:</b> This method is used to obtain an RCS configuration model.
 * <br><b>Purpose:</b> The UI invokes it to obtain an RCS configuration model if all RCS configuration items are required.
 * @return The value indicates the SettingUtil object that contains all RCS configuration items.
 */
+(SettingUtil*)getSettingModel;

/**
 * <b>Description:</b> This method is used to obtain a configuration parameter value.
 * <br><b>Purpose:</b> when no DM server is deployed for the IMS network, the UI invokes it to obtain a configuration parameter value.
 * @param [in] majorType Specifies the major parameter type, for example, See
 * <p>The value of parameter majorType can be set to any one of the {@link tag_CFG_MAJOR_TYPE} enumeration.
 * @param [in] minorType Specifies the minor parameter type, for example, See
 * <p>The value of parameter majorType can be set to any one of the {@link tag_CFG_MINOR_TYPE} enumeration.
 * @return The value indicates a parameter value
 */
+(NSString*) cfgGetValue:(int)majorType minortype:(int)minorType;

/**
 * <b>Description:</b> This method is used to set a configuration parameter value.
 * <br><b>Purpose:</b> when no DM server is deployed for the IMS network, the UI invokes it to set a configuration parameter value.
 * @param [in] majorType Specifies the major parameter type, for example, See
 * <p>The value of parameter majorType can be set to any one of the {@link tag_CFG_MAJOR_TYPE} enumeration.
 * @param [in] minorType Specifies the minor parameter type, for example, See
 * <p>The value of parameter majorType can be set to any one of the {@link tag_CFG_MINOR_TYPE} enumeration.
 * @param [in] configValue Specifies a parameter value
 */
+(void) setConfigValue:(int)majorType minortype:(int)minorType configvalue:(NSString*)configValue;

@end

/** Indicates that the setting result.*/
typedef enum tag_COMMONUTIL_SETNOTBACKUP
{
    COMMONUTIL_SET_OK,     /**< @brief Indicates that the setting is OK */

    COMMONUTIL_SET_FAILED  /** < @brief Indicates that the setting failed */
}COMMONUTIL_SETNOTBACKUP;

/**
 * <b>Description:</b> CAASCommonUtil provides an entry to common RCS functions.
 * <br><b>Purpose:</b> The UI accesses APIs of this class to implement common RCS functions.
 */
@interface CAASCommonUtil : NSObject
{

}

/**
 * <b>Description:</b> This method is used to save the information of a user-defined item.
 * <br><b>Purpose:</b> The UI invokes it to save the information of a user-defined item.
 * @param [in] param Specifies the information to be saved
 * @param [in] key Specifies the key of an object to be saved
 */
+(void)writeGParamFromPlist:(id)param WithKey:(NSString*)key;

/**
 * <b>Description:</b> This method is used to read the information of a user-defined item.
 * <br><b>Purpose:</b> The UI invokes it to read the information of a user-defined item.
 * @param [in] key Specifies the key of a user-defined item
 * @return The value Indicates the stored subscriber information
 *     <br>nil Indicates no subscriber information
 */
+(id)readGParamFromPlistWithKey:(NSString*)key;

/**
 * <b>Description:</b> This method is used to save the information of user-defined items in batches.
 * <br><b>Purpose:</b> The UI invokes it to save the information of user-defined items in batches.
 * @param [in] userInfoArray Specifies saving user-defined items in batches
 * @return YES Indicates that saving user-defined items in batches succeeds
 *     <br>NO Indicates that saving user-defined items in batches fails
 */
+(BOOL)saveUserInfo:(NSMutableDictionary*)userInfoArray;

/**
 * <b>Description:</b> This method is used to read the information of user-defined items in batches.
 * <br><b>Purpose:</b> The UI invokes it to read the information of user-defined items in batches.
 * @return The value Indicates the stored subscriber information
 *     <br>nil Indicates no subscriber information
 */
+(NSMutableDictionary*)readUserInfo;

/**
 * <b>Description:</b> This method is used to obtain a phone number.
 * <br><b>Purpose:</b> When UI wants to get the contact number, the UI invokes it to obtain a phone number for the URI.
 * @param [in] Specifies uri a SIP number, such as sip:+8612345678889@domainname.com.
 * @return The value indicates a phone number in NSString format, such as +8612345678889.
 */
+(NSString*)getPhoneNumByUri:(NSString*)uri;

/**
 * <b>Description:</b> This method is used to normalize phone numbers in the local address book into digit numbers.
 * <br><b>Purpose:</b> The UI invokes it to normalize phone numbers in the local address book into digit numbers.
 * @param [in] number Specifies a phone number to be normalized
 * @return The value indicates a normalized number
 */
+ (NSString*)getPhoneNumber:(NSString*)number;

/**
 * <b>Description:</b> This method is used to normalize digit numbers into SIP numbers.
 * <br><b>Purpose:</b> The UI is recommended not to use this interface.
 * @param [in] phoneNum Specifies a phone number to be normalized
 * @return The value indicates a normalized number
 */
+ (NSString*)adjustToUriX:(NSString*)phoneNum;

/**
 * <b>Description:</b> This method is used to compare whether two entered numbers are the same.
 * <br><b>Purpose:</b> The UI invokes it to compare whether two entered numbers are the same. 
 * The entered numbers can be in the SIP, tel, and international number formats. The UI compares 
 * whether the last consecutive digits (specified by {@link #setMaxUriLenForCmp}) between two entered numbers are the same.
 * @param [in] srcUri Specifies a source number
 * @param [in] desUri Specifies a number to be compared
 * @return YES Indicates that a source number is the same as a number to be compared
 *     <br>NO Indicates that a source number is different from a number to be compared
 */
+(BOOL)compareUri:(NSString*)srcUri desUri:(NSString*)desUri;

/**
 * <b>Description:</b> This method is used to set the maximum number match length.
 * <br><b>Purpose:</b> The UI invokes it to set the maximum number match length so that the UI compares 
 * numbers based on the specified length. The default value is 9 which can be modified only during the 
 * system initialization. After the modification, the SDK will record the setting.
 * @param [in] maxUriLen Specifies the maximum number match length
 * @return 0 Indicates that the setting is successful
 *     <br>1 Indicates that the setting fails
 */
+ (int)setMaxUriLenForCmp:(int)maxUriLen;

/**
 * <b>Description:</b> This method is used to obtain the maximum number match length.
 * <br><b>Purpose:</b> The UI invokes it to obtain the maximum number match length. For details, see {@link #setMaxUriLenForCmp}.
 * @return The value indicates maximum number match length
 */
+ (int)getMaxUriLenForCmp;

/**
 * <b>Description:</b> This method is used to get the path for saving video files.
 * <br><b>Purpose:</b> The UI invokes it to access a file path name for saving video files.
 * @return The value indicates a file path name
 */
+(NSString *)videoPath;

/**
 * <b>Description:</b> This method is used to obtain the path of a file.
 * <br><b>Purpose:</b> The UI invokes it to access a local file.
 * @return The value indicates a file path name
 */
+(NSString *)FilePath;

/**
 * <b>Description:</b> This method is used to obtain the path of a file.
 * <br><b>Purpose:</b> The UI invokes it to access local files.
 * @return The value indicates a file path name
 */
+(NSString *)FilesPath;

/**
 * <b>Description:</b> This method is used to delete a file.
 * <br><b>Purpose:</b> When UI wants to delete a file, the UI invokes it to delete a file. Before invoking this method, 
 * it is recommanded that the UI should prompt the user with friendly information, such as a choice box for choosing to 
 * continue or cancel. The UI can present different information based on different situations.
 * @param [in] path Specifies the path from which a file is to be deleted. /mnt/sdcard/hrslog is an example file path.
 * @return YES Indicates that a file is deleted successfully
 *     <br>NO Indicates that a file is deleted unsuccessfully
 */
+(BOOL)deleteFileByPath:(NSString *)path;

/**
 * <b>Description:</b> This method is used to obtain a file name based on a path name.
 * <br><b>Purpose:</b> The UI invokes it to obtain a file name based on a path name.
 * @param [in] path Specifies a full name of a path
 * @return The value indicates a file name
 */
+(NSString*)getFileNameByPath:(NSString*)path;

/**
 * <b>Description:</b> This method is used to scale an image to a specified size.
 * <br><b>Purpose:</b> The UI invokes it to scale an image to a specified size.
 * @param  [in] img Specifies img an image to be scaled
 * @param  [in] size Specifies the size after scaling
 * @return The value indicates a scaled image
 */
+(UIImage *)scaleToSize:(UIImage *)img size:(CGSize)size;

/**
 * <b>Description:</b> This method is used to remove duplicate members from the arrays before setting up a group chat.
 * <br><b>Purpose:</b> The UI invokes it to remove duplicate members before setting up a group chat.
 * @param [in] uriArray Specifies the arrays to be processed
 * @return The value indicates the arrays where duplicate members are to be removed
 */
+(NSArray*)trimDuplicateArray:(NSArray*)uriArray;

/**
 * <b>Description:</b> This method is used to remove duplicate members from the arrays before setting up a group chat
 * except specified uniform resource identifiers (URIs).
 * <br><b>Purpose:</b> The UI invokes it to remove duplicate members except specified URIs before setting up a group chat.
 * @param [in] uri Specifies the URIs that are not removed
 * @param [in] uriArray Specifies the arrays to be processed
 * @return The value indicates the arrays where duplicate members are to be removed
 */
+(NSArray*)trimDuplicateArrayAndWithoutUri:(NSString*)uri arr:(NSArray*)uriArray;

/**
 * <b>Description:</b> This method is used to save an image to the album.
 * <br><b>Purpose:</b> The UI invokes it to save an image to the album.
 * @param [in] image Specifies an image to be saved
 * @param [in] target Specifies the target object to be saved
 * @param [in] selector Specifies an API that is used to process the image saving,
 * such as -(void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo.
 */
+(void)savedPhotosAlbum:(UIImage*)image target:(id)target selector:(SEL)selector;

/**
 * <b>Description:</b> This method is used to save video to photo album.
 * <br><b>Purpose:</b> The UI invokes it to save video to photo album.
 * @param [in] videoPath Specifies the video path
 * @param [in] target Specifies the target object to be saved
 * @param [in] selector Specifies an API that is used to process the video saving.
 */
+(void)savedVideoToPhotosAlbum:(NSString*)videoPath target:(id)target selector:(SEL)selector;

/**
 * <b>Description:</b> This method is used to set whether a call exists currently.
 * <br><b>Purpose:</b> The UI invokes it to set whether a call exists if a call is to be initiated or received.
 * @param [in] isExist YES Indicates that a call exists
 *            <br>NO Indicates that no call exists
 */
+(void)setIsExistCall:(BOOL)isExist;

/**
 * <b>Description:</b> This method is used to query whether a call exists currently.
 * <br><b>Purpose:</b> The UI invokes it to query whether a call exists currently if an IM message or a call is required.
 * @return YES Indicates that a call exists
 *     <br>NO Indicates that no call exists
 */
+(BOOL)getIsExistcall;

/**
 * <b>Description:</b> This method is used to convert the time in UTC format to NSDate format.
 * <br><b>Purpose:</b> The UI invokes it to convert the time in UTC format to NSDate format.
 * @param [in] dateStr Specifies the time in UTC format
 * @return The value indicates the time in NSData format
 */
+(NSDate*)convertUTCStrToDate:(NSString*)dateStr;

/**
 * <b>Description:</b> This method is used to obtain the current system time in NSDate format.
 * <br><b>Purpose:</b> The UI invokes it to obtain the current system time in NSDate format.
 * @return The value indicates the time in NSData format
 */
+(NSDate *)getNowTime;

/**
 * <b>Description:</b> This method is used to convert the time in NSdate format to date+time format.
 * <br><b>Purpose:</b> The UI invokes it to convert the time in NSdate format to date+time format.
 * @param [in] date Specifies the time to be converted
 * @return The value indicates the date+time in NSString format
 */
+(NSString *)getDateAndTime:(NSDate *)date;

/**
 * <b>Description:</b> This method is used to convert the time in NSdate format to month+date format.
 * <br><b>Purpose:</b> The UI invokes it to convert the time in NSdate format to month+date format.
 * @param [in] date Specifies the time to be converted
 * @return The value indicates the month+date in NSString format
 */
+(NSString *)getMonthAndDay:(NSDate *)date;

/**
 * <b>Description:</b> This method is used to convert the time in NSdate format to year+month+date format.
 * <br><b>Purpose:</b> The UI invokes it to convert the time in NSdate format to year+month+date format.
 * @param [in] date Specifies the time to be converted
 * @return The value indicates the year+month+date in NSString format
 */
+(NSString *)getYearMonthAndDay:(NSDate *)date;

/**
 * <b>Description:</b> This method is used to convert time in NSdate format to hour+minute+second format.
 * <br><b>Purpose:</b> The UI invokes it to convert time in NSdate format to hour+minute+second format.
 * @param [in] date Specifies the time to be converted
 * @return The value indicates the hour+minute+second in NSString format
 */
+(NSString *)getHourMinAndSecond:(NSDate *)date;

/**
 * <b>Description:</b> This method is used to convert time in NSdate format to hour+minute format.
 * <br><b>Purpose:</b> The UI invokes it to convert time in NSdate format to hour+minute format.
 * @param [in] date Specifies the time to be converted
 * @return The value indicates the hour+minute in NSString format
 */
+(NSString *)getHourAndMin:(NSDate *)date;

/**
 * <b>Description:</b> This method is used to determine whether the enter date is yesterday of the current date.
 * <br><b>Purpose:</b> The UI invokes it to determine whether the entered date is displayed as "yesterday" or a string.
 * @param [in] date Specifies the time to be converted
 * @return The value indicates that If the enter date is yesterday of the current date, the entered date is displayed as "yesterday".
 * If the enter date is not yesterday of the current date, the entered date is displayed as a string.
 */
+(NSString *)isYesterday:(NSDate *)date;

/**
 * <b>Description:</b> This method is used to determine the time format based on the entered time.
 * <br><b>Purpose:</b> The UI invokes it to determine the time format based on the entered time, such as the current time, yesterday, and historical time.
 * @param [in] date Specifies the time to be converted
 * @return The value indicates that If the entered time is yesterday, yesterday is displayed. If the current time is entered, the time is displayed.
 * If the historical time is entered, the year+month+date is displayed.
 */
+(NSString *)getCallHistoryCellTime:(NSDate *)date;

/**
 * <b>Description:</b> This method is used to compare whether two dates are the same.
 * <br><b>Purpose:</b> The UI invokes it to determine whether the date of a chat record is the same as the date of another one.
 * The date of the last chat record is compared first.
 * @param [in] fist Specifies the reference time
 * @param [in] second Specifies the time to be compared
 * @return YES Indicates that two dates are the same
 *     <br>NO Indicates that two dates are different
 */
+(BOOL)twoDateIsSameDay:(NSDate *)fist second:(NSDate *)second;

/**
 * <b>Description:</b> This method is used to compare whether two dates are in the same year.
 * <br><b>Purpose:</b> The UI invokes it to determine whether the dates of two chat records are in the same year.
 * The date of the last chat record is compared first.
 * @param [in] fist Specifies the reference time
 * @param [in] second Specifies the time to be compared
 * @return YES Indicates that two dates are in the same year
 *     <br>NO Indicates that two dates are not in the same year
 */

+(BOOL)twoDateIsSameYear:(NSDate *)fist second:(NSDate *)second;

/**
 * <b>Description:</b> This method is used to obtain the longitude and latitude of the current location.
 * <br><b>Purpose:</b> The UI invokes it to obtain the longitude and latitude of the current location.
 * @param [in] content Specifies the contents to be parsed
 * @param [in] longitude Specifies the longitude
 * @param [in] latitude Specifies the latitude
 */
+(void)getLBSLocationByContent:(NSString*)content longitude:(double*)longitude latitude:(double*)latitude;

@end

/**
 * tag_RICHTEXTPARSER_PREFIXTYPE is used to define the prefix type or rich text parser.
 */
typedef enum tag_RICHTEXTPARSER_PREFIXTYPE  
{
    RICHTEXTPARSER_PREDEFAULT,       /**< @brief Indicates the default prefix */
    RICHTEXTPARSER_PREDRAFT = 100,   /**< @brief Indicates the prefix for draft*/
    RICHTEXTPARSER_PREFAIL           /**< @brief Indicates the prefix for sending failure*/
}RICHTEXTPARSER_PREFIXTYPE;


/**
 * tag_RICHTEXTPARSER_ELEMENTTYPE is used to define the element type for rich text parser.
 */
typedef enum tag_RICHTEXTPARSER_ELEMENTTYPE {
    RICHTEXTPARSER_ELEMENTTXT,        /**< @brief Indicates that the element is TXT type */
    RICHTEXTPARSER_ELEMENTEMOTION,    /**< @brief Indicates that the element is motion type */
    RICHTEXTPARSER_ELEMENTLINK  ,     /**< @brief Indicates that the element is LINK type */
    RICHTEXTPARSER_ELEMENTIMAGE ,     /**< @brief Indicates that the element is image type */
    RICHTEXTPARSER_ELEMENTDIGIT,      /**< @brief Indicates that the element is digit type */
    RICHTEXTPARSER_ELEMENTDRAFT = RICHTEXTPARSER_PREDRAFT, /**< @brief Indicates that the element is draft type */
    RICHTEXTPARSER_ELEMENTFAIL = RICHTEXTPARSER_PREFAIL    /**< @brief Indicates that the element is fail type */
}RICHTEXTPARSER_ELEMENTTYPE; 


/**
 * tag_RICHTEXTPARSER_CUSTOMPARSETYPE is used to define the custom parse type for newline and truncation. 
 */
typedef enum tag_RICHTEXTPARSER_CUSTOMPARSETYPE {

    RICHTEXTPARSER_BREAKLINEBYWORD = 1,         /**< @brief Indicates that newline by word wrap */ 
    RICHTEXTPARSER_BREAKLINEBYCHARATER = 1<<1,  /**< @brief Indicates that newline by charater */ 
    RICHTEXTPARSER_TAILTRUNCATION = 1<<2,       /**< @brief Indicates that the truncation comes from the tail, it is not supported yet, */ 
    RICHTEXTPARSER_HEADTRUNCATION = 1<<3,       /**< @brief Indicates that the truncation comes from the head, it is not supported yet. */ 
    RICHTEXTPARSER_MIDDLETRUNCATION = 1<<4,     /**< @brief Indicates that the truncation comes from the midlle, it is not supported yet. */ 
    RICHTEXTPARSER_DEFAULTCLIP = 1<<5,          /**< @brief Indicates that the automatical truncation when it is long.*/
    RICHTEXTPARSER_DEFAULTPARSETYPE = (RICHTEXTPARSER_BREAKLINEBYWORD | RICHTEXTPARSER_DEFAULTCLIP)   /**< @brief Indicates that the default type for newline and truncation */
}RICHTEXTPARSER_CUSTOMPARSETYPE;

/**
 * RichTextParserRowObj is used to define the object for the parsered content . 
 */
@interface RichTextParserRowObj : NSObject    
{
    NSMutableArray* _arrayElement;  /**< @brief Indicates that element array for the content in one line*/
    CGFloat _height;   /**< @brief Indicates the height of the line*/
}

/**Indicates that element array for the content in one line*/
@property (nonatomic, retain) NSMutableArray* arrayElement;

/**Indicates the height of the line*/
@property (nonatomic) CGFloat height;

@end


/**
 * RichTextParserElementBaseObj is used to define the object for the element. 
 */
@interface RichTextParserElementBaseObj : NSObject
{
    int _type;        /**< @brief Indicates that element type*/
    NSString* _text;  /**< @brief Indicates that element content*/
}

/**
 * <b>Description:</b> This method is used to init the element object with type and text.
 * <br><b>Purpose:</b> The UI invokes it to init the element.
 * @param [in] type Specifies the element type
 * @param [in] text Specifies the element content
 */
- (id)initWithType:(int)type data:(NSString*)text;

/**Indicates that element type*/
@property (nonatomic,assign) int type;

/**Indicates that element content*/
@property (nonatomic, copy) NSString* text;

@end

/**
 * RichTextParserElementObj is used to define the object for the URL type. 
 */
@interface RichTextParserElementObj : RichTextParserElementBaseObj
{
    NSString* _url; /**< @brief Indicates that element type is URL*/
    CGRect _frame;  /**< @brief Indicates the element frame*/
    CGFloat _rowHeight; /**< @brief Indicates the row height */
}

/**Indicates that element type is URL*/
@property (nonatomic, copy) NSString* url;

/**Indicates the element frame*/
@property (nonatomic,assign) CGRect frame;

/**Indicates the row height */
@property (nonatomic,assign) CGFloat rowHeight;

@end

/**
 * <b>Description:</b> RichTextParser is used to provide an entry to the RichTextParser module.
 * <br><b>Purpose:</b> The UI invokes RichTextParser to specify the URL, frame, and row height of the RichTextParser module.
 */
@interface RichTextParser : NSObject
{
}

/**Indicates the parse type ,see RICHTEXTPARSER_CUSTOMPARSETYPE */
@property (nonatomic,assign,setter = setParseType:, getter = getParseType) int parseType;

/**Indicates the max line for parsed content , the default value is the actual line of parsed content */
@property (nonatomic,assign,setter = setMaxLine:, getter = getMaxLine) int maxLine; 

/**Indicates the fontSize */
@property (nonatomic,assign,setter = setFontSize:, getter = getFontSize) int fontSize; 

/**Indicates the iconHeight */
@property (nonatomic,assign,setter = setIconHeight:, getter = getIconHeight) float iconHeight; 

/**Indicates the prefix Type¡ê?see RICHTEXTPARSER_PREFIXTYPE  */
@property (nonatomic,assign,setter = setPrefixType:, getter = getPrefixType) int prefixType; 

/**Indicates the prefix length */
@property (nonatomic,assign,setter = setPrefixLen:, getter = getPrefixLen) int prefixLen;

/**
 * <b>Description:</b> This method is used to initialize the RichTextParser APIs.
 * <br><b>Purpose:</b> The UI invokes it to initialize the RichTextParser APIs before starting the RichTextParser service.
 */
+(id)init;

/**
 * <b>Description:</b> This method is used to release the RichTextParser APIs.
 * <br><b>Purpose:</b> The UI invokes it to release RichTextParser APIs before exiting from the RichTextParser service.
 */
+(void)releaseApi;

/**
 * <b>Description:</b> This method is used to parse the JSON data.
 * <br><b>Purpose:</b> The UI invokes it to parse the JSON data.
 * @param [in] data Specifies the contents to be parsed
 * @param [in] width Specifies the row width
 * @param [in] cacheArray Specifies the parsed content
 */
-(CGSize)parseData:(NSString*)data withWidth:(CGFloat)width cacheArray:(NSMutableArray*)cacheArray;

/**
 * <b>Description:</b> This method is used to load emotion information to the array.
 * <br><b>Purpose:</b> The UI invokes it to load emotion information to the array.
 * @param [in] moodPathArray Specifies the array that stores emotion information
 */
+(void)loadEmotions:(NSArray*)moodPathArray;

/**
 * <b>Description:</b> This method is used to obtain the emotion information based on a key.
 * <br><b>Purpose:</b> The UI invokes it to obtain the emotion information.
 * @param [in] key Specifies a key
 * @return The value indicates the MutableArray that stores emotion information
 */
+(id)getEmotionByKey:(NSString*)key;

@end
#endif
