/**
 * @file ContactSyncApi.h
 * @brief Contact Sync Interfaces
 */
#ifndef _CONTACT_SYNC_API_H_
#define _CONTACT_SYNC_API_H_

 	/**
	 * <b>Description:</b> It is used to broadcast synchronization success notifications.
	 * <br><b>Purpose:</b> After contact synchronization succeeds, the SDK sends a broadcast to inform the UI 
	 * of the synchronization success.
	 * <p>The broadcast will have the following extra values:
	 * <ul>
	 *    <li><em>{@link PARAM_CONTACTSYNC_SERVICE_TYPE}</em></li> - Identifies service type[int]
	 * </ul>
	 */
#define EVENT_CONTACTSYNC_OK                @"EVENT_CONTACTSYNC_OK" 

 	/**
	 * <b>Description:</b> It is used to broadcast synchronization terminate success notifications.
	 * <br><b>Purpose:</b> After contact synchronization terminate succeeds, the SDK sends a broadcast to inform the UI of the synchronization terminate success.
	 * <p>The broadcast will have the following extra values:
	 * <ul>
	 *    <li><em>{@link PARAM_CONTACTSYNC_SERVICE_TYPE}</em></li> - Identifies service type[int]
	 * </ul>
	 */
#define EVENT_CONTACTSYNC_TERMINATE_OK      @"EVENT_CONTACTSYNC_TERMINATE_OK" 


 	/**
	 * <b>Description:</b> It is used to broadcast synchronization failure notifications.
	 * <br><b>Purpose:</b> After contact synchronization fails, the SDK sends a broadcast to inform the UI 
	 * of the synchronization failure.
	 * <p>The intent will have the following extra values:
	 * <ul>
	 *    <li><em>{@link PARAM_CONTACTSYNC_SERVICE_TYPE}</em></li> - Identifies service type[int]
	 *    <li><em>{@link PARAM_CONTACTSYNC_FAILED_CODE}</em></li> - Identifies failed code[int]
	 * </ul>
	 */
#define EVENT_CONTACTSYNC_FAILED            @"EVENT_CONTACTSYNC_FAILED" 


 	/**
	 * <b>Description:</b> It is used to broadcast contact synchronization progress 
	 * information to the UI.
	 * <br><b>Purpose:</b> During the synchronization process, the SDK will send this broadcast to inform the UI 
	 * the progress of already uploaded part of the synchronization.
	 * <p>The intent will have the following extra values:
	 * <ul>
	 *    <li><em>{@link PARAM_CONTACTSYNC_SERVICE_TYPE}</em></li> - Identifies service type[int]
	 *    <li><em>{@link PARAM_CONTACTSYNC_PROGRESS}</em></li> - Identifies progress[int]
	 * </ul>
	 */
#define EVENT_CONTACTSYNC_PROGRESS          @"EVENT_CONTACTSYNC_PROGRESS"

 	/**
	 *<b>Description:</b> It is used to broadcast device change notifications 
	 * during contact synchronization.
	 * <br><b>Purpose:</b> For the Push nickname and buddy discovery service, the SDK sends this broadcast to the UI after 
	 * the SDK detects that the current device is different from the device of previous synchronization. 
	 * UI need to notify the subscriber who can choose whether to continue.
	 */
#define EVENT_CONTACTSYNC_DEVICE_CHANGE     @"EVENT_CONTACTSYNC_DEVICE_CHANGE"

/**
 * Indicates the synchronization service type. 
 * @see tag_CONTACTSYNC_SERVICE_TYPE
 */
#define PARAM_CONTACTSYNC_SERVICE_TYPE      @"PARAM_CONTACTSYNC_SERVICE_TYPE"

/**
 * Indicates the synchronization failure cause type.
 */
#define PARAM_CONTACTSYNC_FAILED_TYPE       @"PARAM_CONTACTSYNC_FAILED_TYPE"

/**
 * Indicates the synchronization failure error code. 
 * @see tag_CONTACTSYNC_NETWORK_FAILED_CODE
 */
#define PARAM_CONTACTSYNC_FAILED_CODE       @"PARAM_CONTACTSYNC_FAILED_CODE"

/**
 * Indicates the contact synchronization progress. 
 * <br>The parameter value is int type and ranges from 0 to 100.
 */
#define PARAM_CONTACTSYNC_PROGRESS          @"PARAM_CONTACTSYNC_PROGRESS"

	/**
	 * Indicates the contact download progress. 
	 * <br>The parameter value is int type and ranges from 0 to 100.
	 */
#define PARAM_CONTACTSYNC_DOWNLOAD_PROGRESS @"PARAM_CONTACTSYNC_DOWNLOAD_PROGRESS"

	/**
	 * Indicates the contact upload progress. 
	 * <br>The parameter value is int type and ranges from 0 to 100.
	 */
#define PARAM_CONTACTSYNC_UPLOAD_PROGRESS   @"PARAM_CONTACTSYNC_UPLOAD_PROGRESS"

/** CONTACTSYNC_SERVICE_TYPE is used to indicates service types with which contact synchronization is implemented.*/
typedef enum tag_CONTACTSYNC_SERVICE_TYPE{
    CONTACTSYNC_SERVICE_NAB = 0,                  /**< @brief Indicates the NAB service. */
    CONTACTSYNC_SERVICE_PUSH_BUDDY_DISCOVERY = 1, /**< @brief Indicates the Push nickname and buddy discovery service. */
} CONTACTSYNC_SERVICE_TYPE;

/** CONTACTSYNC_SYNC_TYPE is used to indicates the mode in which synchronization is implemented. For details about the synchronization parameters, see OMA-TS-DS. */
typedef enum tag_CONTACTSYNC_SYNC_TYPE{
    CONTACTSYNC_TWO_WAY_SYNC = 200,             /**< @brief Indicates two-way synchronization. The SDK uploads updated contact information to the server, and downloads updated contact information from the server. */
    CONTACTSYNC_SLOW_SYNC = 201,                /**< @brief Indicates slow synchronization. The SDK uploads all contacts to the server. The server compares these contacts and the contacts in the server and delivers the contacts that are not contained in the local system database to the device. */
    CONTACTSYNC_ONE_WAY_FROM_CLIENT_SYNC = 202, /**< @brief Indicates the SDK unilateral synchronization. The SDK uploads updated contacts to the server. */
    CONTACTSYNC_REFRESH_FROM_CLIENT_SYNC = 203, /**< @brief Indicates the SDK update synchronization. The SDK uploads all contacts to overwrite the contacts in the server. */
    CONTACTSYNC_ONE_WAY_FROM_SERVER_SYNC = 204, /**< @brief Indicates the server unilateral synchronization. The server delivers updated contacts to the SDK in multi-client scenarios. */
    CONTACTSYNC_REFRESH_FROM_SERVER_SYNC = 205, /**< @brief Indicates the server update synchronization. The SDK downloads all contacts from the server to overwrite the local contacts. */
	  CONTACTSYNC_SDK_SELECTED_SYNC = 220         /**< @brief Indicates the software development kit (SDK) intelligently selects one synchronization mode. If UI choose this type synchronization , the SDK preferentially selects {@link CONTACTSYNC_ONE_WAY_FROM_CLIENT_SYNC} to upload updated contacts. When updated contacts have lost or the first time synchronization is implemented for a new device, the SDK selects {link CONTACTSYNC_REFRESH_FROM_CLIENT_SYNC}. */
} CONTACTSYNC_SYNC_TYPE;

/** CONTACTSYNC_OPERATE_RETURN_CODE is used to return results of invoking contact synchronization API.*/
typedef enum tag_CONTACTSYNC_OPERATE_RETURN_CODE{
	CONTACTSYNC_OPERATE_OK,                           /**< @brief Indicates the operation succeeds. */ 
	CONTACTSYNC_OPERATE_FAILED,                       /**< @brief Indicates the operation fails. */ 
	CONTACTSYNC_OPERATE_START_CALL_TWICE,             /**< @brief Indicates a synchronization API is invoked again before specified synchronization is complete. */ 
	CONTACTSYNC_OPERATE_INEXISTENT_SYNC,              /**< @brief Indicates a synchronization API is invoked to stop or continue synchronization when no synchronization is implemented. */ 
	CONTACTSYNC_OPERATE_INVAILD_PARMETER_VALUE,       /**< @brief Indicates the parameter value is invalid. */ 
	CONTACTSYNC_OPERATE_INVAILD_PARMETER_COMBINATION, /**< @brief Indicates the invalid parameter combination. */
  CONTACTSYNC_OPERATE_SYNC_IS_TERMINATING           /**< @brief Indicates a synchronization is terminating. */
} CONTACTSYNC_OPERATE_RETURN_CODE;

/** CONTACTSYNC_FAILED_CODE is used to provide synchronization failure error codes.*/
typedef enum tag_CONTACTSYNC_NETWORK_FAILED_CODE
{
	CONTACTSYNC_FAILED_CODE_NETWORK_SERVER_CONNECT_ERROR = 1,    /**< @brief Indicates the SDK cannot connect to the server because the server or network is faulty. */ 
	CONTACTSYNC_FAILED_CODE_NETWORK_DISCONNECT,                  /**< @brief Indicates the SDK is disconnected from the network. */ 
	CONTACTSYNC_FAILED_CODE_NETWORK_SWITCH,                      /**< @brief Indicates the network switchover. */ 
	CONTACTSYNC_FAILED_CODE_SDK_ERROR = 61,                      /**< @brief Indicates an internal SDK error. */ 
  CONTACTSYNC_FAILED_CODE_SDK_TWO_WAY_SYNC_NOT_AVAILABLE = 71, /**< @brief Indicates the Two-way synchronization is unavailable. */     
	CONTACTSYNC_FAILED_CODE_UI_IP_PORT_NOT_SET = 81,             /**< @brief Indicates the server IP address or port number has not been specified. */ 
	CONTACTSYNC_FAILED_CODE_UI_USERNAME_PASSWORD_NOT_SET,        /**< @brief Indicates the user name or password has not been specified. */
  CONTACTSYNC_FAILED_CODE_UI_ADDRESSBOOK_UNACCESSIBLE,         /**< @brief Indicates the software can't access the address book because of phone privacy policy. */
}CONTACTSYNC_FAILED_CODE;

/** CONTACTSYNC_CONFIG_MAJOR_TYPE is used to indicates the major parameter categories.*/
typedef enum tag_CONTACTSYNC_CONFIG_MAJOR_TYPE
{
	CONTACTSYNC_CONFIG_MAJOR_TYPE_NAB,                 /**< @brief Indicates the NAB service. */ 
	CONTACTSYNC_CONFIG_MAJOR_TYPE_PUSH_BUDDY_DISCOVERY /**< @brief Indicates the Push nickname and buddy discovery service. */ 
}CONTACTSYNC_CONFIG_MAJOR_TYPE;

/** CONTACTSYNC_SERVICE_TYPE is used to indicates service types with which contact synchronization is implemented.*/
typedef enum tag_CONTACTSYNC_CONFIG_MINOR_TYPE
{
	CONTACTSYNC_CONFIG_MINOR_TYPE_SERVER_IP,         /**< @brief Indicates the server IP address. */ 
	CONTACTSYNC_CONFIG_MINOR_TYPE_SERVER_PORT,       /**< @brief Indicates the server port number. */ 
	CONTACTSYNC_CONFIG_MINOR_TYPE_USERNAME,          /**< @brief Indicates the authentication user name. */ 
	CONTACTSYNC_CONFIG_MINOR_TYPE_PASSWORD,          /**< @brief Indicates the authentication password. */ 
	CONTACTSYNC_CONFIG_MINOR_TYPE_LOCALURI,          /**< @brief Indicates the local URI. */ 
	CONTACTSYNC_CONFIG_MINOR_TYPE_SERVER_SERVICE_URI,/**< @brief Indicates the server synchronization URI. */ 
	CONTACTSYNC_CONFIG_MINOR_TYPE_SERVER_IP_BACKUP,  /**< @brief Indicates the backup server IP address. */ 
	CONTACTSYNC_CONFIG_MINOR_TYPE_SERVER_PORT_BACKUP,/**< @brief Indicates the backup server port number. */
    CONTACTSYNC_CONFIG_MINOR_TYPE_TRANSPORT_TYPE,    /**< @brief Indicates the transport type. @"0" indicates https and @"1" indicates https. */ 
	CONTACTSYNC_CONFIG_MINOR_TYPE_REQUEST_URI        /**< @brief Indicates the request uri, default is @"/sync". */
}CONTACTSYNC_CONFIG_MINOR_TYPE;

/**
 * <b>Description:</b> ContactSyncApi provides an entry to contact synchronization.
 * <br><b>Purpose:</b> The user interface (UI) accesses contact synchronization application platform interfaces (APIs) to implement contact 
 * synchronization with the network address book (NAB) service and Push nickname and buddy discovery service.
 */
@interface ContactSyncApi : NSObject

	/**
	 * <b>Description:</b> This method provides initialization for contact synchronization and must be invoked before contact synchronization.
	 * <br><b>Purpose:</b> The UI invokes ContactSyncApi::init to initialize APIs before contact synchronization.
	 */
+ (void)init;

/**
 * <b>Description:</b> This method is used to close ContactSyncApi.
 * <br><b>Purpose:</b> This method is used to release contactsync module resources. After it is invoked, contactsync service can not be used after UI next call ContactSyncApi::init.
 * For example, the program terminated by systerm UI need to call this method.
 */
+ (void)close;

 	/**
	 *<b>Description:</b> This method provides an entry to set data configuration.
	 *<br><b>Purpose:</b> The UI must invoke ContactSyncApi::setConfigValue to set mandatory parameters 
	 * when the device manager (DM) server is not used to configure mandatory parameters.
	 * @param majorType Specifies the major parameter type 
	 * <p>The parameter majorType can be set to any one of the {@link tag_CONTACTSYNC_CONFIG_MAJOR_TYPE} enumeration.
	 * @param minorType Specifies the minor parameter type
	 * <p>The parameter minorType can be set to any one of the {@link tag_CONTACTSYNC_CONFIG_MINOR_TYPE} enumeration.
	 * @param value Specifies The config value
	 */
+(void) setConfigValue:(CONTACTSYNC_CONFIG_MAJOR_TYPE) majorType
            minorType:(CONTACTSYNC_CONFIG_MINOR_TYPE) minorType value:(NSString*) value;
			
 	/**
	 *<b>Description:</b> This method provides an entry for obtaining parameter values.
	 *<br><b>Purpose:</b> The UI invokes ContactSyncApi::getConfigValue to obtain parameter values.
	 * @param majorType Specifies the major parameter type
	 * <p>The parameter majorType can be set to any one of the {@link tag_CONTACTSYNC_CONFIG_MAJOR_TYPE} enumeration.
	 * @param minorType Specifies the minor parameter type
	 * <p>The parameter minorType can be set to any one of the {@link tag_CONTACTSYNC_CONFIG_MINOR_TYPE} enumeration.
	 * @return The value indicates the config value
	 */
+(NSString*) getConfigValue:(CONTACTSYNC_CONFIG_MAJOR_TYPE) majorType
            minorType:(CONTACTSYNC_CONFIG_MINOR_TYPE) minorType;

     /**
     * <b>Description:</b> This method is used to implement contact synchronization with a specified service in a specified mode for one time.
     * <br><b>Purpose:</b> The UI invokes ContactSyncApi::invokeSync to implement contact synchronization with a specified service in a specified mode for one time.
     * @param syncService Specifies services with which contact synchronization is implemented
	 * <p>The parameter syncService can be set to any one of the {@link tag_CONTACTSYNC_SERVICE_TYPE} enumeration.
     * @param syncType Specifies the mode in which contact synchronization is implemented
     * <p>When SyncService is set to {@link CONTACTSYNC_SERVICE_NAB}, syncType can be set to any one of the following values:
     * <ul> 
     *    <li><em>{@link CONTACTSYNC_REFRESH_FROM_CLIENT_SYNC}</em></li>
     *    <li><em>{@link CONTACTSYNC_SLOW_SYNC}</em></li>
     * </ul>
     * <p>When SyncService is set to {@link CONTACTSYNC_SERVICE_PUSH_BUDDY_DISCOVERY}, syncType can be set to the following value: 
     * <ul> 
     *    <li><em>{@link CONTACTSYNC_SDK_SELECTED_SYNC}</em></li>
     * </ul>
     * @return The value indicates operate result, can be the following value: 
     * <ul> 
     *    <li><em>{@link CONTACTSYNC_OPERATE_OK}</em></li>
     *    <li><em>{@link CONTACTSYNC_OPERATE_FAILED}</em></li>
     *    <li><em>{@link CONTACTSYNC_OPERATE_START_CALL_TWICE}</em></li>
     *    <li><em>{@link CONTACTSYNC_OPERATE_SYNC_IS_TERMINATING}</em></li>
     *    <li><em>{@link CONTACTSYNC_OPERATE_INVAILD_PARMETER_COMBINATION}</em></li>
     *    <li><em>{@link CONTACTSYNC_OPERATE_INVAILD_PARMETER}</em></li>
     * </ul>
     */
+(int) invokeSync: (CONTACTSYNC_SERVICE_TYPE) syncService syncType: (CONTACTSYNC_SYNC_TYPE) syncType;

 	/**
	 *<b>Description:</b> This method is used to terminate service-specific synchronization that is in progress.
	 *<br><b>Purpose:</b> The UI invokes ContactSyncApi::terminateSync to terminate service-specific synchronization that is in progress.
	 * @param syncService Specifies services with which contact synchronization is to be terminated
	 * <p>The parameter syncService can be set to any one of the {@link tag_CONTACTSYNC_SERVICE_TYPE} enumeration.
	 * @return The value indicates operate result, can be the following value:
     * <ul> 
     *    <li><em>{@link CONTACTSYNC_OPERATE_OK}</em></li>
     *    <li><em>{@link CONTACTSYNC_OPERATE_FAILED}</em></li>
     *    <li><em>{@link CONTACTSYNC_OPERATE_SYNC_IS_TERMINATING}</em></li>
     *    <li><em>{@link CONTACTSYNC_OPERATE_INEXISTENT_SYNC}</em></li>
     *    <li><em>{@link CONTACTSYNC_OPERATE_INVAILD_PARMETER}</em></li>
     * </ul>
	 */
+(int) terminateSync:(CONTACTSYNC_SERVICE_TYPE) syncService;

 	/**
	 *<b>Description:</b> This method is used to terminate the current synchronization after the UI receives a notification from the SDK.
	 *<br><b>Purpose:</b> The SDK does not send the UI device change notifications during contact synchronization with 
	 * the NAB service. For the Push nickname and buddy discovery service, the SDK sends a 
	 * device change notification to the UI after the SDK detects that the current device is 
	 * different from the device of previous synchronization. The UI can invoke ContactSyncApi::
	 * terminateSyncWhenDeviceChange to terminate the current synchronization, preventing the server data from being overwritten by the current device data.
	 * @return The value indicates operate result, can be the following value:
     * <ul> 
     *    <li><em>{@link CONTACTSYNC_OPERATE_OK}</em></li>
     * </ul>
	 */
+(int)terminateSyncWhenDeviceChange;

 	/**
	 *<b>Description:</b> This method is used to continue the current synchronization after the UI receives a notification from the SDK.
	 *<br><b>Purpose:</b> The SDK does not send the UI device change notifications during contact synchronization with the NAB service.
	 * For the Push nickname and buddy discovery service, the SDK sends a device change notification
	 * to the UI after the SDK detects that the current device is different from the device
	 * of previous synchronization. The UI can invoke ContactSyncApi::continueSyncWhenDeviceChange
	 * to continue the current synchronization, and the contacts on the current device will
	 * overwrite contacts on the server.
	 * @return The value indicates operate result, can be the following value:
     * <ul> 
     *    <li><em>{@link CONTACTSYNC_OPERATE_OK}</em></li>
     * </ul>
	 */
+(int)continueSyncWhenDeviceChange;

 	/**
	 *<b>Description:</b> This method is used to enable the SDK to automatically synchronize updated contacts to the server.
	 *<br><b>Purpose:</b> For the Push nickname and buddy discovery service, subscribers need to know 
	 * whether a new contact is an RCS subscriber in real time. After ContactSyncApi::enableSyncService 
	 * is invoked, the SDK automatically detects contact database changes and uploads updated names and numbers 
	 * to the Push nickname and buddy discovery server, facilitating real-time buddy discovery.
	 * @param syncService Specifies service with which automatic synchronization for updated contacts is to be enabled
	 * <p>The parameter syncService can be set to any of the following values:
     * <ul> 
     *    <li><em>{@link CONTACTSYNC_SERVICE_PUSH_BUDDY_DISCOVERY}</em></li>
     * </ul>
	 * @return The value indicates operate result, can be the following value:
     * <ul> 
     *    <li><em>{@link CONTACTSYNC_OPERATE_OK}</em></li>
     *    <li><em>{@link CONTACTSYNC_OPERATE_FAILED}</em></li>
     *    <li><em>{@link CONTACTSYNC_OPERATE_INVAILD_PARMETER}</em></li>
     * </ul>
	 */
+(int)enableSyncService:(int) syncService;

 	/**
	 *<b>Description:</b> This method is used to disable the SDK to automatically synchronize updated contacts to the server.
	 *<br><b>Purpose:</b> After ContactSyncApi::disableSyncService is invoked with the Push nickname and buddy discovery service, 
	 * the SDK stops detecting updated contacts and does not automatically initiate contact synchronization
	 * @param syncService Specifies service with which automatic synchronization for updated contacts is to be enabled. 
	 * <p>The parameter syncService can be set to any of the following values:
     * <ul> 
     *    <li><em>{@link CONTACTSYNC_SERVICE_PUSH_BUDDY_DISCOVERY}</em></li>
     * </ul>
	 * @return The value indicates operate result, can be the following value:
     * <ul> 
     *    <li><em>{@link CONTACTSYNC_OPERATE_OK}</em></li>
     *    <li><em>{@link CONTACTSYNC_OPERATE_FAILED}</em></li>
     *    <li><em>{@link CONTACTSYNC_OPERATE_INVAILD_PARMETER}</em></li>
     * </ul>
	 */
+(int)disableSyncService:(int) syncService;

@end

#endif


