/**
 * @file UpgradeApi.h
 * @brief Upgrade Interface Functions.
 */
#ifndef _UPGRADE_API_H_
#define _UPGRADE_API_H_

#import <Foundation/Foundation.h>

/** Indicates the information of the target version. */
#define PARAM_UPGRADE_INFO @"UPGRADEAPI_PARAM_UPGRADE_INFO"

/** 
 * Indicates the new version detection result.
 * @see tag_UPGRADE_CHECK_RESULT
 */
#define PARAM_UPGRADE_CHECK_RESULT @"UPGRADEAPI_PARAM_CHECK_RESULT"

/** 
 * <b>Description:</b> It is used to broadcast an event that a new version is available.
 * <br><b>Purpose:</b> After login, the server automatically delivers the new version information to the SDK. 
 * The SDK broadcasts it to the UI. The UI notifies the subscriber that an upgrade is available.
 * <p>The broadcast will have the following extra parameter:
 * <ul>
 * <li><em>{@link #PARAM_UPGRADE_INFO}</em></li> - Indicates upgrade info[int]
 * </ul>
 * </p>
 */
#define EVENT_UPGRADE_NEW_VERSION @"UPGRADEAPI_EVENT_NEW_VERSION_REPORT"

/** 
 * <b>Description:</b> It is used to broadcast the new version detection result.
 * <br><b>Purpose:</b> The SDK checks whether a new version is available and broadcasts the result to the UI. The UI updates the interface.
 * <p>The broadcast will have the following extra parameter:
 * <ul>
 * <li><em>{@link #PARAM_UPGRADE_CHECK_RESULT}</em></li> - Indicates upgrade check result[int]
 * </ul>
 * </p>
 */
#define EVENT_UPGRADE_CHECK_RESULT @"UPGRADEAPI_EVENT_CHECK_RESULT"

/** Indicates the check status */
#define UPGRADE_STATUS_CHECKING YES

/** 
 * Indicates that it is used to query enumeration constants of new version detection results.
 * The UI determines whether to perform an upgrade based on the new version detection result.
 */
typedef enum tag_UPGRADE_CHECK_RESULT
{
    UPGRADE_CHECK_RESULT_NO_NEW_VERSION,        /**< @brief Indicates that no new version is available.*/
    UPGRADE_CHECK_RESULT_HAS_NEW_VERSION,        /**< @brief Indicates that a new version is available.*/
    UPGRADE_CHECK_RESULT_SERVER_DISCONNECT,        /**< @brief Indicates that the srver is disconnect.*/
    UPGRADE_CHECK_RESULT_CHECKING,        /**< @brief Indicates that it is Checking the new version.*/
    UPGRADE_CHECK_RESULT_TIMEOUT,        /**< @brief Indicates that the new version detection is timeout.*/
    UPGRADE_CHECK_RESULT_UNKNOWN        /**<@brief Indicates that an unknown error occurs during the new version detection.*/
}UPGRADE_CHECK_RESULT;

/** 
 * Indicates that it is used to notify SDK upgrade result.
 */
typedef enum
{
    UPGRADE_RESULT_USERCANCEL = 902, /**< @brief Indicates that user cancel upgrade. */
    UPGRADE_RESULT_NETERROR   = 903, /**< @brief Indicates that net is not available. */
    UPGRADE_RESULT_MD5ERROR   = 905, /**< @brief Indicates that check download file md5 error. */
    UPGRADE_RESULT_FAIL       = 952  /**< @brief Indicates that other fail reason. */
}Upgrade_Result;

/** 
 * <b>Description:</b> It is used to obtain the information about the new version. 
 * <br><b>Purpose:</b> When there is a new version in the server, the SDK sends the {@link #EVENT_UPGRADE_NEW_VERSION} 
 * broadcast carrying the objects of the UpgrapeInfo class to the UI. The UI invokes related interfaces 
 * of the objects to obtain the new version information.
 */

@interface UpgradeInfo : NSObject
{
@private
     /** Indicates the new version number.*/
    NSString * _laterVersion;
    
     /** Indicates the URL of the new version.*/
    NSString * _urlStr;
    
    /** Indicates the MD5 verification value of the new version.*/
    NSString * _urlMd5;
    
    /** Indicates the secondary URL of the new version.*/
    NSString * _url2Str;
    
    /** Indicates the MD5 verification value of the new version in the secondary URL.*/
    NSString * _url2Md5;
    
    /** Indicates descriptions of the new version.*/
    NSString * _laterVersionDesc;
    
    /** Indicates whether a forcible upgrade is required.*/
    int _forceUpgradeFlag;
    
    BOOL _chgdesflag;             //version change description exist flag
}

/**
 * <b>Description:</b> This property is used to obtain the new version number.
 * <br><b>Purpose:</b> After receiving the {@link #EVENT_UPGRADE_NEW_VERSION} broadcast, 
 * UI invokes it to obtain the new version number, it can display the new version number 
 * to subscribers.
 * <p>The property indicates the new version number, such as V1.0.5.15.
 */
@property(nonatomic,retain) NSString * laterVersion;

/**
 * <b>Description:</b> This property is used to obtain the downloading path of the new version.
 * <br><b>Purpose:</b> After receiving the {@link #EVENT_UPGRADE_NEW_VERSION} broadcast, 
 * the UI invokes it to obtain the downloading path of the new version. 
 * After obtaining the downloading path URL, the UI converts the URL into a URI, which enables 
 * subscribers to open the path and download the new version using browsers.
 * <p>The property indicates the downloading path URL of the new version, such as "http://XXX.com/xxx.apk".
 */
@property(nonatomic,retain) NSString * urlStr;

/** 
 * <b>Description:</b> This property is used to obtain the MD5 verification value of the new version.
 * <br><b>Purpose:</b> After receiving the {@link #EVENT_UPGRADE_NEW_VERSION} broadcast,
 * the UI invokes it to obtain the MD5 value of the new version. After
 * the new version is downloaded, the UI calculates the MD5 value of the new version and 
 * compares it with the obtained MD5 value to determine whether the downloaded new version is correct.
 * <p>The property indicates MD5 verification value of the new version.
 */
@property(nonatomic,retain) NSString * urlMd5;

/**
 * <b>Description:</b> This property is used to obtain the standby downloading path of the new version.
 * <br><b>Purpose:</b> After receiving the {@link #EVENT_UPGRADE_NEW_VERSION} broadcast, 
 * and determining that the downloading path obtained by invoking the urlStr
 * is unavailable, the UI invokes it to obtain the standby downloading path. After obtaining 
 * the standby downloading path URL, the UI converts the URL into a URI, which enables 
 * subscribers to open the path and download the new version using browsers.
 * <p>The property indicates the standby downloading path URL of the new version.
 */
@property(nonatomic,retain) NSString * url2Str;

/** 
 * <b>Description:</b> This property is used to obtain the MD5 verification value of the new version.
 * <br><b>Purpose:</b> After receiving the {@link #EVENT_UPGRADE_NEW_VERSION} broadcast,
 * and obtaining the standby downloading path of the new version, the UI invokes it to obtain the MD5 
 * value of the new version stored in the standby downloading path. After the new version is downloaded, 
 * the UI calculates the MD5 value of the new version and compares it with the obtained MD5 value to 
 * determine whether the downloaded new version is correct.
 * <p>The property indicates the MD5 value of the new version stored in the standby downloading path.
 */
@property(nonatomic,retain) NSString * url2Md5;

/**
 * <b>Description:</b> This property is used to obtain the description of change information in the new version.
 * <br><b>Purpose:</b> After receiving the {@link #EVENT_UPGRADE_NEW_VERSION} broadcast, 
 * UI invokes it to obtain the change information in the new version compared with the old one. The UI can 
 * display the change information to subscribers.
 * <p>The property indicates the description of change information in the new version.
 */
@property(nonatomic,retain) NSString * laterVersionDesc;

/**
 * <b>Description:</b> This property is used to get the force upgrade flag.
 * <br><b>Purpose:</b> After receiving the {@link #EVENT_UPGRADE_NEW_VERSION} broadcast, 
 * the UI invokes it to determine whether the new version is a forcible upgrade version or not. 
 * If it is a forcible upgrade version, the current version cannot be used and subscribers must upgrade
 * the current version to the new version. If it is not a forcible upgrade version, subscribers can 
 * choose not to upgrade the current version to the new version.
 * there is an old version set in the upgrade server,if the current version is
 * less than the old version, forceUpgradeFlag value is 1
 * <p>The property indicates that whether it is a forcible upgrade version or not.
 * if the value is 1, and indicates that it needs to force upgrade, other means the version is not a forcible upgrade version.
 */
@property(nonatomic,assign) int forceUpgradeFlag;

/** Indicates Whether to change the description.*/
@property(nonatomic,assign) BOOL chgdesflag;
@end

/** 
 * <b>Description:</b> It provides an entry to upgrade.It provides the entry for upgrade initialization, 
 * manual upgrade detection, upgrade status detection, and upgrade notification. 
 * <br><b>Purpose:</b> If the UI uses the upgrade functions provided by the SDK, the UI accesses upgrade 
 * APIs to implement upgrade. For example, during the system initialization, the UI invokes UpgrapeApi.init 
 * for upgrade initialization and registers {@link #EVENT_UPGRADE_NEW_VERSION} and {@link #EVENT_UPGRADE_CHECK_RESAULT} broadcasts, 
 * separately.
 */

@interface UpgradeApi : NSObject
{
}

/**
 * <b>Description:</b> This method provides initialization for upgrade APIs.
 * <br><b>Purpose:</b> It is used to initialize upgrade APIs during system initialization before an upgrade. 
 */
+ (void) init;

/**
 * <b>Description:</b> This method is used to release UpgradeApi components.
 * <br><b>Purpose:</b> Before exiting the UpgradeApi service, UI invokes it to release the interface of this class. 
 */
+ (void) releaseApi;

/**
 * <b>Description:</b> This method is used to check whether a new version is available.
 * <br><b>Purpose:</b> After login, the UI invokes it to check whether a new version is available. If the server has
 * new version that is available, SDK will broadcast the result to UI via {@link #EVENT_UPGRADE_NEW_VERSION}, if the 
 * server does not have new version or the connect is timeout, SDK will broadcast the result to UI via {@link #EVENT_UPGRADE_CHECK_RESULT}.
 * @return 0 Indicates that a new version detection is successfully executed.
 *     <br>1 Indicates that a new version detection fails to be executed.
 * @see EVENT_UPGRADE_CHECK_RESULT
 */
+ (int) checkNewVersion;

/**
 * <b>Description:</b> This method is used to check whether a new version detection is being performed.
 * <br><b>Purpose:</b> After a subscriber starts the new version detection, the UI invokes it to check whether a new version detection is 
 * being performed and returns different values based on the check result.
 * @return YES Indicates that a new version detection is being performed
 *    <br> NO Indicates that no new version detection is being performed
 */
+ (BOOL) getCheckingStatus;

/**
 * <b>Description:</b> This method is used to notify the upgrade server of the upgrade result.
 * <br><b>Purpose:</b> When a subscriber detects an upgrade but cancels the upgrade, the UI invokes this method to notify the upgrade 
 * server of the upgrade result.
 * @param [in] Specifies the upgrade result
 * @see Upgrade_Result
 * @return 0 Indicates that a notify upgrade result is successfully executed
 *     <br>1 Indicates that a notify upgrade result fails to be executed
 */
+ (BOOL) notifyUpgradeResult:(int)result;
@end
#endif
