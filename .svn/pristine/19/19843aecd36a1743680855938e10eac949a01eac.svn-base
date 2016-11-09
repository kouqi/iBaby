/**
 * @file ContactApi.h
 * @brief Contact Interface Functions
 */
#ifndef _CONTACT_API_H_
#define _CONTACT_API_H_
#import <UIKit/UIKit.h>

/**
 * It is a broadcast parameter indicates my persional information's type.
 * @see tag_CONTACT_ITEM_TYPE
 */
#define PARAM_CONTACT_MYINFO_TYPE @"CONTACTAPI_PARAM_MYINFO_TYPE"

/**
 * It is a broadcast parameter indicates contact buddy operate type.
 * @see tag_CONTACT_BUDDY_OPERATE_TYPE
 */
#define PARAM_CONTACT_BUDDY_OPERATE_TYPE @"CONTACTAPI_PARAM_BUDDY_OPERATE_TYPE"

/**
 * It is a broadcast parameter indicates phone info.
 * @see Phone
 */
#define PARAM_CONTACT_PHONE @"CONTACTAPI_PARAM_PHONE"

/**
 * It is a broadcast parameter indicates operate statcode.
 * @see tag_CONTACT_OPERATE_STATCODE
 */
#define PARAM_CONTACT_OPERATE_STATCODE @"CONTACTAPI_PARAM_OPERATE_STATCODE"

/**
 * It is a broadcast parameter indicates contact info.
 * @see Contact
 */
#define PARAM_CONTACT_CONTACT @"CONTACTAPI_PARAM_CONTACT_CONTACT"

/**
 * It is a broadcast parameter indicates contact operate type.
 * @see tag_CONTACT_OPERATE_TYPE
 */
#define PARAM_CONTACT_CONTACT_OPERATE_TYPE @"CONTACTAPI_PARAM_CONTACT_CONTACT_OPERATE_TYPE"

/** <b>Description:</b> It is used to broadcast the change in social presence information to the UI.
 *  <br><b>Purpose:</b> When the social presence information of a contact changes, the SDK sends this
 *  broadcast to the UI. Upon receiving this broadcast, the UI may need to update the interface.
 *  In addition, the UI invokes the Phone::checkRcsUser method to determine whether
 *  a number is an RCS subscriber. The result is delivered using {@link EVENT_CONTACT_PHONEINFO_CHANGED}.
 *  <p>The broadcast will have the following extra value:
 * <ul>
 *    <li><em>{@link PARAM_CONTACT_PHONE}</em></li>  - Identifies phone[Phone]
 * </ul>
 */
#define EVENT_CONTACT_PHONEINFO_CHANGED @"CONTACTAPI_EVENT_CONTACT_PHONEINFO_CHANGED"

/** <b>Description:</b> This broadcast is used when the server pushes the social presence information
 * of the local account.
 *  <br><b>Purpose:</b> The SDK sends this broadcast to the UI when the server pushes the social
 *  presence information of the local account. For example, the UI receives this broadcast when the
 *  UI successfully logs in or modifies and uploads the social presence information of the local account.
 *  This broadcast may not indicates that the social presence information of the local account changes.
 *  However, the UI is advised to re-obtain the social presence information of the local account each
 *  time the UI receives this broadcast.
 *  <p>The broadcast will have the following extra value:
 * <ul>
 *    <li><em>{@link PARAM_CONTACT_MYINFO_TYPE}</em></li> - Identifies myinfo type[int]
 * </ul>
 */
#define EVENT_CONTACT_MYINFO_CHANGED @"CONTACTAPI_EVENT_MYINFO_CHANGED"

/**
 * <b>Description:</b> This broadcast is used to notify the UI of the result for updating the local account's presence information.
 * <br><b>Purpose:</b> When the UI invokes a MyInfo::updateItem or
 * MyInfo::updateImage to update the presence information, the SDK uses
 * this broadcast to notify the UI of the updating result. Upon receiving the broadcast, the UI updates the interface accordingly.
 * <p>The broadcast will have the following extra values:
 * <ul>
 *    <li><em>{@link PARAM_CONTACT_MYINFO_TYPE}</em></li> - Identifies myinfo type[int]
 *    <li><em>{@link PARAM_CONTACT_OPERATE_STATCODE}</em></li> - Identifies operate statcode[int]
 * </ul>
 */
#define EVENT_CONTACT_UPDATE_MYINFO_RESULT @"CONTACTAPI_EVENT_UPDATE_MYINFO_RESULT"

/** <b>Description:</b> This broadcast is used to broadcast the result of adding or deleting a buddy to
 * the UI.
 *  <br><b>Purpose:</b> For example, when the UI invokes {@link ContactApi.rmvBuddy(Context context)} of a phone object to
 *  delete a buddy or {@link ContactApi.addBuddy(Context context)} of a phone object to add a buddy, the operation result
 *  is broadcasted to the UI using {@link ContactApi.EVENT_CONTACT_OPERATE_RESULT}.
 *  <p>The broadcast will have the following extra values:
 * <ul>
 *    <li><em>{@link PARAM_CONTACT_BUDDY_OPERATE_TYPE}</em></li> - Identifies buddy operate type[int]
 *    <li><em>{@link PARAM_CONTACT_OPERATE_STATCODE}</em></li> - Identifies operate statcode[int]
 * </ul>
 * <P>note: The parameter PARAM_CONTACT_OPERATE_STATCODE will have the following values:
 * <ul>
 *    <li><em>{@link CONTACT_OPERATE_STATCODE_SUCCESS}</em></li> - Identifies operate statcode success[int]
 *    <li><em>{@link CONTACT_OPERATE_STATCODE_TIMEOUT}</em></li> - Identifies operate statcode timeout[int]
 *    <li><em>{@link CONTACT_OPERATE_STATCODE_UNKNOWN}</em></li> - Identifies operate statcode unknown[int]
 * </ul>
 */
#define EVENT_CONTACT_OPERATE_STATCODE @"CONTACTAPI_EVENT_CONTACT_OPERATE_STATCODE"

/**
 * <b>Description:</b> EVENT_CONTACT_CONTACTINFO_CHANGED is used to broadcast contact info change.
 * @see PARAM_CONTACT_CONTACT - Identifies contact[Contact]
 * @see PARAM_CONTACT_CONTACT_OPERATE_TYPE  - Identifies operate type[int]
 */
#define EVENT_CONTACT_CONTACTINFO_CHANGED @"CONTACTAPI_EVENT_CONTACT_CONTACTINFO_CHANGED"

/**
 *<b>Description:</b> It is used to broadcast recving add buddy request.
 *<br><b>Purpose:</b> This broadcast is reserved because of the SDK will auto process add buddy request currently.
 *Under this condition, the SDK will not broadcast this event.
 */
#define EVENT_CONTACT_RECV_ADD_BUDDY_REQ @"CONTACTAPI_EVENT_RECV_ADD_BUDDY_REQ"

/** <b>Description:</b> This broadcast is used to notify the UI to refresh all buddys' status to offline when the local account is connecting or net unavailable.
 *  <br><b>Purpose:</b> Upon receiving the broadcast, the UI should invoke corresponding methods again to get the buddys' status and updates the interface accordingly. This broadcast
 *  will be sent only in the condition that {@link CONTACT_CFG_MAJOR_REFRESH_OFFLINE_IF_DISCED} is set to 1 or corresponding server switch is open.
 */
#define EVENT_CONTACT_REFRESH_OFFLINE @"CONTACTAPI_EVENT_CONTACT_REFRESH_OFFLINE"

/** Indicates the types of user type
* user type same as EN_EA_CAP_INFO_TYPE_ENUM
* It is same as EN_COPS_USER_TYPE
*/
typedef enum tag_CONTACT_USER_TYPE
{
    CONTACT_USER_TYPE_UNKNWON    = 0,  /* not to check */
    CONTACT_USER_TYPE_ACTIVE     = 1,  /* in my addr */
    CONTACT_USER_TYPE_PASSIVE    = 2,  /* not in my addr, but the peer has me */
    CONTACT_USER_TYPE_INDIRECT   = 3,  /* not in my addr, not in peer, but at least 2 same rcs addr */
    CONTACT_USER_TYPE_DOUBLE     = 4,  /* double in my addr, also in peer */
    CONTACT_USER_TYPE_BUTT
} CONTACT_USER_TYPE;

//define contact options
/** Indicates the types of sa user type
* It is same as Sa_User_Type
*/
typedef enum tag_CONTACT_RCS_USER_TYPE
{
    RCS_USER = 0,          /*RCS */
    RCSE_USER = 1,         /* RCSe */
    NO_RCS_USER = 255      /* Not RCS */
} CONTACT_RCS_USER_TYPE;

/** This enumeration can be used as the value of {@link CONTACT_CFG_MAJOR_BUDDY_DISCOVER_MODE}. */
typedef enum tag_CONTACT_BUDDY_DISCOVERY_MODE
{
    CONTACT_BUDDY_DISCOVERY_MANUAL = 0,    /**< @brief Indicates that the buddy discover mode is manual. */
    CONTACT_BUDDY_DISCOVERY_CFG    = 1,    /**< @brief Indicates that the buddy discover mode is config by user. */
    CONTACT_BUDDY_DISCOVERY_AUTO   = 2     /**< @brief Indicates that the buddy discover mode is auto.  */
} CONTACT_BUDDY_DISCOVERY_MODE;

/** This enumeration is used to indicates that buddy discover user set value. */
typedef enum tag_CONTACT_BUDDY_DISCOVERY_MODE_USER_SET
{
    CONTACT_BUDDY_DISCOVERY_MODE_USERSET_MANUAL = 0,    /**< @brief Indicates that the buddy discover user set is manual. */
    CONTACT_BUDDY_DISCOVERY_MODE_USERSET_AUTO   = 1     /**< @brief Indicates that the buddy discover user set is auto. */
} CONTACT_BUDDY_DISCOVERY_MODE_USER_SET;

/** This enumeration is used to indicates buddy discover type value. */
typedef enum tag_CONTACT_BUDDY_DISCOVER_TYPE
{
    CONTACT_BUDDY_DISCOVER_TYPE_OPTION   = 0,     /**< @brief Indicates that the buddy discover type is option. */
    CONTACT_BUDDY_DISCOVER_TYPE_MESSAGE  = 1,     /**< @brief Indicates that the buddy discover type is message. */
    CONTACT_BUDDY_DISCOVER_TYPE_CAB      = 2      /**< @brief Indicates that the buddy discover type is cab. */
} CONTACT_BUDDY_DISCOVER_TYPE;

/** This enumeration is used to indicates that config major type is the transmit and receive type of XCAP messages. */
typedef enum tag_CONTACT_CFG_XCACP_HTTP_TYPE
{
    CONTACT_CFG_XCACP_HTTP,    /**< @brief Indicates that the client is directly connected to the server using http in plain text mode. */
    CONTACT_CFG_XCACP_HTTPS,   /**< @brief Indicates that the client is directly connected to the server using http in encrypted text mode. */
    CONTACT_CFG_XCACP_SVN,     /**< @brief Indicates that the client is connected to the server through SVN in encrypted text mode.  */
} CONTACT_CFG_XCACP_HTTP_TYPE;

/** This enumeration is used to indicates the main parameter type of presence. It can be used as an input parameter of the ContactApi::getConfig method and ContactApi::setConfig method.*/
typedef enum tag_CONTACT_CFG_MAJOR_TYPE
{
    CONTACT_CFG_MAJOR_SERVICES_NUMBER             = 0,   /**< @brief Indicates that config major type is the services number. */
    CONTACT_CFG_MAJOR_BUDDY_DISCOVER_MODE         = 1,   /**< @brief Indicates that config major type is the buddy discover mode, default is {@link BUDDY_DISCOVER_MODE_VALUE_AUTO}. */
    CONTACT_CFG_MAJOR_BUDDY_DISCOVER_USER_SET     = 2,   /**< @brief Indicates that config major type is the buddy discover user set type, it is valid when buddy discover mode is {@link CONTACT_BUDDY_DISCOVERY_CFG}, default is {@link #CONTACT_BUDDY_DISCOVERY_MODE_USERSET_AUTO}. */
    CONTACT_CFG_MAJOR_BUDDY_DISCOVER_TYPE         = 3,   /**< @brief Indicates that config major type is the buddy discover type, default is {@link #CONTACT_BUDDY_DISCOVER_TYPE_MESSAGE}. */
    CONTACT_CFG_MAJOR_BUDDY_DISCOVER_MESSAGE      = 4,   /**< @brief Indicates that config major type is the buddy discover message, it is valid when buddy discover type is {@link #CONTACT_BUDDY_DISCOVER_TYPE_MESSAGE}. */
    CONTACT_CFG_MAJOR_XCAP_TYPE                   = 5,   /**< @brief Indicates that config major type is the transmit and receive type of XCAP messages, default is {@link #CONTACT_CFG_XCACP_HTTP}. */
    CONTACT_CFG_MAJOR_XCAP_GROUP_SERVER_IP        = 6,   /**< @brief Indicates that config major type is the IP address of the server. */
    CONTACT_CFG_MAJOR_XCAP_GROUP_SERVER_PORT      = 7,   /**< @brief Indicates that config major type is the server port. */
    CONTACT_CFG_MAJOR_XCAP_AGENT_PROXY_IP         = 8,   /**< @brief Indicates that config major type is the IP address of the proxy server. */
    CONTACT_CFG_MAJOR_XCAP_AGENT_PROXY_PORT       = 9,   /**< @brief Indicates that config major type is the proxy server port. */
    CONTACT_CFG_MAJOR_PRES_POLLING_PERIOD         = 10,  /**< @brief Indicates that config major type is the presence polling period, default is 604800 seconds. */
    CONTACT_CFG_MAJOR_FT_ON_2G                    = 11,  /**< @brief Indicates that config major type is wheter the file transfer is allowed or not on 2G, default is 1(allowed). */
    CONTACT_CFG_MAJOR_OPTION_QUERY_PERIOD         = 12,  /**< @brief Indicates that config major type is the option query period of two times, default is 180 seconds. */
    CONTACT_CFG_MAJOR_OPTION_POLLING_PERIOD       = 13,  /**< @brief Indicates that config major type is the option polling period, default is 172800 seconds. */
    CONTACT_CFG_MAJOR_OPTION_EXPIRES              = 14,  /**< @brief Indicates that config major type is the time of option info expires, default is 604800 seconds.*/
    CONTACT_CFG_MAJOR_RVK_DURATION                = 15,  /**< @brief Indicates that config major type is the duration of rvk friends, default is 172800 seconds. */
    CONTACT_CFG_MAJOR_XCAP_ROOT                   = 16,  /**< @brief Indicates that config major type is the XCAP root, default is @"/services". */
    CONTACT_CFG_MAJOR_QUERY_TIMES_PER_SECOND      = 17,  /**< @brief Indicates that config major type is the number of entries that batch capability queried per second(second refer to CONTACT_CFG_MAJOR_BATCH_QUERY_SECOND), default is 3 times per second. */
    CONTACT_CFG_MAJOR_SUPPORT_ACTIVE_STATUS       = 18,  /**< @brief Indicates that config major type is wheter support active status or not, default is 1(support) */
    CONTACT_CFG_MAJOR_BATCH_QUERY_SECOND          = 22,  /**< @brief Indicates that config major type is the cycle of batch capability querying, default is 1 second. */
    CONTACT_CFG_MAJOR_REFRESH_OFFLINE_IF_DISCED   = 23,  /**< @brief Indicates that config major type is whether the client should or shouldn't refresh all buddys' status to offline if disconnected, default is 0(shouldn't). */
    CONTACT_CFG_MAJOR_BUTT                = 0x7FFFFFFF   /**< @brief Indicates that config major type is an unknown type. */
} CONTACT_CFG_MAJOR_TYPE;

/** This enumeration is used to indicates that config minor type value. It can be used as an input parameter of the ContactApi::getConfig method and ContactApi::setConfig method. */
typedef enum tag_CONTACT_CFG_MINOR_TYPE
{
    CONTACT_CFG_MINOR_MAIN_ADDR           = 0,           /**< @brief Indicates that config minor type is the primary address of transmit type of XCAP messages, the server and port, the proxy server and port. */
    CONTACT_CFG_MINOR_BACKUP_ADDR         = 1,           /**< @brief Indicates that config minor type is the backup address of transmit type of XCAP messages, the server and port, the proxy server and port. */
    CONTACT_CFG_MINOR_BUTT                = 0x7FFFFFFF   /**< @brief Indicates that config minor type is an unknown type. */
} CONTACT_CFG_MINOR_TYPE;

/** This enumeration is used to indicates the contact operation result. It can be used as the value of the {@link PARAM_CONTACT_OPERATE_STATCODE} parameter for the {@link EVENT_CONTACT_OPERATE_STATCODE} broadcast and {@link EVENT_CONTACT_UPDATE_MYINFO_RESULT}. */
typedef enum tag_CONTACT_OPERATE_STATCODE
{
    CONTACT_OPERATE_STATCODE_SUCCESS,   /**< @brief Indicates that the operation result is successful. */
    CONTACT_OPERATE_STATCODE_TIMEOUT,   /**< @brief Indicates that the operation result is times out. */
    CONTACT_OPERATE_NOT_RCSUSER,        /**< @brief Indicates that the operation result is non-RCS of callee. */
    CONTACT_OPERATE_STATCODE_UNKNOWN    /**< @brief Indicates that the operation result is unknown.  */
}CONTACT_OPERATE_STATCODE;

/** This enumeration is used to indicates the contact query type. It can be used as an input parameter of the ContactApi::getContactSummaryList method and ContactApi::searchContact method. */
typedef enum tag_CONTACT_QUERY_TYPE
{
    CONTACT_QUERY_TYPE_LIST_FILTER_ALL = 1,    /**< @brief The search filter is all contacts. */
    CONTACT_QUERY_TYPE_LIST_FILTER_RCS = 2,    /**< @brief The search filter is all RCS users. */
    CONTACT_QUERY_TYPE_LIST_FILTER_ONLINE = 3  /**< @brief The search filter is all online RCS users. */
}CONTACT_QUERY_TYPE;

/** This enumeration is used to indicates the contact user discovery type. It is reserved for future use if there is new requirement. */
typedef enum tag_CONTACT_USER_DISCOVERY_TYPE
{
    CONTACT_CFG_AUTO_RCSUSER_DISCOVERY,    /**< @brief Whether enable auto rcs user discovery.(true - enable ; false - disable, default value is false) */
    CONTACT_CFG_AUTO_BUDDY_DISCOVERY       /**< @brief Whether enable auto buddy discovery.(true - enable ; false - disable, default value is false) */

}CONTACT_USER_DISCOVERY_TYPE;

/** This enumeration is used to indicates the contact item type. It can be used as the value of the {@link PARAM_CONTACT_MYINFO_TYPE} parameter for the {@link EVENT_CONTACT_MYINFO_CHANGED} broadcast.
 * It can be used as an input parameter of the Presence::getItemString method and Presence::getItemImage method.
 */
typedef enum tag_CONTACT_ITEM_TYPE
{
    CONTACT_ITEM_NICKNAME = 0,          /**< @brief The personal information's type is Nickname. The max length of nickname is 256 */
    CONTACT_ITEM_HOMEPAGE = 1,          /**< @brief The personal information's type is Homepage. The max length of homepage is 256 */
    CONTACT_ITEM_NOTE     = 2,          /**< @brief The personal information's type is Note. The max length of note is 512 */
    CONTACT_ITEM_PHOTO    = 3,          /**< @brief The personal information's type is Photo type. The max file size of photo is 50KB */
    CONTACT_ITEM_SNS_ACCESS_INFO = 4,   /**< @brief The personal information's type is SNS access info type. The max length of social network is 512 */
    CONTACT_ITEM_NOTENAME = 5,          /**< @brief The personal information's type is Notename. The max length of notename is 128 */
    CONTACT_ITEM_STATUS = 6,            /**< @brief The personal information's type is Status. */
}CONTACT_ITEM_TYPE;

/** This enumeration is used to indicates the result of invoking the update personal social presence information interface. It can be used as the returned value of MyInfo::updateItem or MyInfo::updateImage method. */
typedef enum tag_CONTACT_UPDATE_ITEM_RESULT
{
    CONTACT_UPDATE_ITEM_SUCCESS                     = 0,    /**< @brief The MyInfo::updateItem or MyInfo::updateImage method is invoked successfully. */
    CONTACT_UPDATE_ITEM_FAIL_UNKNOWN                = 1,    /**< @brief The MyInfo::updateItem or MyInfo::updateImage method is invoked unsuccessfully and the reason is unknown. */
    CONTACT_UPDATE_ITEM_FAIL_VALUE_LENGTH_OVER_MAX  = 2,    /**< @brief The MyInfo::updateItem method is invoked unsuccessfully and the reason is that the length of parameter str is too long. */
    CONTACT_UPDATE_ITEM_FAIL_PHOTO_OVER_MAX         = 3,    /**< @brief The MyInfo::updateImage method is invoked unsuccessfully and the reason is that the file size of parameter image is larger than the maximum file size. */

}CONTACT_UPDATE_ITEM_RESULT;

/** This enumeration is used to indicates the contact active status type.
 */
typedef enum tag_CONTACT_STATUS_TYPE
{
    CONTACT_ACTIVE_STATUS_ONLINE = 0,          /**< @brief The personal active status is online */
    CONTACT_ACTIVE_STATUS_BUSY = 1,          /**< @brief The personal active status is busy */
    CONTACT_ACTIVE_STATUS_AWAY     = 2,          /**< @brief The personal active status is away */
    CONTACT_ACTIVE_STATUS_CALLING    = 3,          /**< @brief The personal active status is calling */
    CONTACT_ACTIVE_STATUS_OFFLINE = 4,   /**< @brief The personal active status is offline */
    CONTACT_ACTIVE_STATUS_MEETING = 5           /**< @brief The personal active status is meeting */
}CONTACT_STATUS_TYPE;

/** This enumeration is used to indicates the buddy operate type. It can be used as the value of the {@link PARAM_CONTACT_BUDDY_OPERATE_TYPE} parameter for the {@link EVENT_CONTACT_OPERATE_STATCODE} broadcast.  */
typedef enum tag_CONTACT_BUDDY_OPERATE_TYPE
{
    CONTACT_ADD_BUDDY           = 0,   /**< @brief The operate type is add a buddy. */
    CONTACT_RMV_BUDDY           = 1,   /**< @brief The operate type is delete a buddy from buddy list. */
    CONTACT_REFUSE_BUDDY        = 2,   /**< @brief The operate type is refuse a buddy request. */
    CONTACT_SET_BUDDY_NOTENAME  = 3    /**< @brief The operate type is set a buddy's notename. */
}CONTACT_BUDDY_OPERATE_TYPE;

/** This enumeration is used to indicates the relation between myself and the speicified contact. It can be used as the value of the property friendRelation for Presence object. */
typedef enum tag_CONTACT_RELATION
{
    CONTACT_RELATION_NORMAL,    /**< @brief Indicates that the peer account is an RCS user but is not the local account's buddy. */
    CONTACT_RELATION_PENDING,   /**< @brief Indicates that the peer account is an RCS user and the local account has sent the buddy request but the peer account does not respond yet.*/
    CONTACT_RELATION_ACTIVE,    /**< @brief Indicates that the peer account is an RCS user and is the local account's buddy. */
    CONTACT_RELATION_WAITING,   /**< @brief Indicates that the peer account is an RCS user and the peer account has sent the buddy request but the local account does not respond yet. */
    CONTACT_RELATION_DELETING   /**< @brief Indicates that the peer account is an RCS user and the local account is canceling the buddy relationship with the peer account. */
}CONTACT_RELATION;

/** This enumeration is used to indicates the online or offline status of one phone. It can be used as the value of the property status for Phone object. */
typedef enum tag_CONTACT_STATUS
{
    CONTACT_STATUS_OFFLINE,    /**< @brief Indicates that a subscriber is in offline state. */
    CONTACT_STATUS_ONLINE,     /**< @brief Indicates that a subscriber is in online state. */
    CONTACT_STATUS_BUDDLE      /**< @brief Indicates that a subscriber is in invalid status. */
}CONTACT_STATUS;

/** This enumeration is used to indicates the contact operate type. It can be used as the value of the {@link PARAM_CONTACT_CONTACT_OPERATE_TYPE} parameter for the {@link EVENT_CONTACT_CONTACTINFO_CHANGED} broadcast. */
typedef enum tag_CONTACT_OPERATE_TYPE
{
    CONTACT_OPERATE_TYPE_ADD = 1,            /**< @brief The operate type is add a contact. */
    CONTACT_OPERATE_TYPE_UPDATE,             /**< @brief The operate type is update a contact. */
    CONTACT_OPERATE_TYPE_DELETE,             /**< @brief The operate type is delete a contact. */
    CONTACT_OPERATE_TYPE_EXTERNAL_CHANGE     /**< @brief The operate type external change. */
}CONTACT_OPERATE_TYPE;

/** This enumeration is used to indicates the search match type based on the search keyword. It can be used as the returned value of ContactSummary::compareType. */
typedef enum tag_CONTACT_SEARCH_TYPE
{
    EN_CONTACT_SEARCH_TYPE_NICKNAME = 0,    /**< @brief Indicates that the search result is the nick name compare to the keyword. */
    EN_CONTACT_SEARCH_TYPE_PHONETIC,        /**< @brief Indicates that the search result is the phonetic compare to the keyword. */
    EN_CONTACT_SEARCH_TYPE_NUMBER,          /**< @brief Indicates that the search result is the number compare to the keyword. */
    EN_CONTACT_SEARCH_TYPE_CONTENT          /**< @brief Indicates that the search result is the content compare to the keyword. */
} CONTACT_SEARCH_TYPE;

/** The following begin to define contact database tables and fileds. */
#define TBNAME_CAPABILITY          @"tb_capability"   /**< Contact capability table name. */

#define TBFLD_CAPBLT_CAP_ID        @"capId"           /**< Indicates capability ID, [0][integer primary key]. */
#define TBFLD_CAPBLT_ONLY_URI      @"only_uri"        /**< Indicates only uri, [1][char(128)]. */
#define TBFLD_CAPBLT_PHONE_NUM     @"phoneNumber"     /**< Indicates phone number, [2][char(128)]. */
#define TBFLD_CAPBLT_IS_RCSFRND    @"isRcsFriend"     /**< Indicates is RCS friend, [3][int]. */
#define TBFLD_CAPBLT_IS_ONLINE     @"isOnline"        /**< Indicates is online, [4][int]. */
#define TBFLD_CAPBLT_IM_CAP        @"imCap"           /**< Indicates IM capability, [5][int]. */
#define TBFLD_CAPBLT_FILETRANS_CAP @"fileTransCap"    /**< Indicates file transfer capability, [6][int]. */
#define TBFLD_CAPBLT_IMGSHARE_CAP  @"imageShareCap"   /**< Indicates image share capability, [7][int]. */
#define TBFLD_CAPBLT_VDOSHARE_CAP  @"videoShareCap"   /**< Indicates video share capability, [8][int]. */
#define TBFLD_CAPBLT_PRESENCE_CAP  @"presenceCap"     /**< Indicates presence capability, [9][int]. */
#define TBFLD_CAPBLT_DISCOVER_CAP  @"discoveryCap"    /**< Indicates discovery capability, [10][int]. */
#define TBFLD_CAPBLT_MMTEL_CAP     @"MMTelCap"        /**< Indicates MMTel capability, [11][int]. */
#define TBFLD_CAPBLT_CS_CAP        @"csCap"           /**< Indicates CS call capability, [12][int]. */
#define TBFLD_CAPBLT_ACALL_CAP     @"aCallCap"        /**< Indicates audio call capability, [13][int]. */
#define TBFLD_CAPBLT_VCALL_CAP     @"vCallCap"        /**< Indicates video call capability, [14][int]. */
#define TBFLD_CAPBLT_SMS_CAP       @"smsCap"          /**< Indicates SMS capability, [15][int]. */
#define TBFLD_CAPBLT_LBS_CAP       @"lbsCap"          /**< Indicates LBS capability, [16][int]. */
#define TBFLD_CAPBLT_NAB_CAP       @"nabCap"          /**< Indicates NAB capability, [17][int]. */
#define TBFLD_CAPBLT_PS_CAP        @"psCap"           /**< Indicates PS capability, [18][int]. */
#define TBFLD_CAPBLT_FT_VIA_HTTP_CAP @"fileViaHTTPCap"/**< Indicates file transfer via http capability, [19][int]. */
#define TBFLD_CAPBLT_CHECK_TIME    @"checkTime"       /**< Indicates check time, [20][int]. */

#define TBNAME_FAVORITE            @"tb_favorite"     /**< Contact favorite table name. */

#define TBFLD_FAVRT_FAVO_ID        @"favoriteId"      /**< Indicates favorite ID, [0][integer primary key]. */
#define TBFLD_FAVRT_CONT_ID        @"contactId"       /**< Indicates contact ID, [1][unsigned int unique]. */

#define TBNAME_MY_INFO             @"tb_myinfo"       /**< My info table name. */

#define TBFLD_MYINFO_INFO_ID       @"infoId"          /**< Indicates info ID, [0][integer primary key]. */
#define TBFLD_MYINFO_SIP_NUM       @"sip_number"      /**< Indicates sip number, [1][char(128)]. */
#define TBFLD_MYINFO_ICON_PATH     @"iconPath"        /**< Indicates icon path, [2][char(256)]. */
#define TBFLD_MYINFO_ICON_ETAG     @"iconEtag"        /**< Indicates icon etag, [3][char(64)]. */
#define TBFLD_MYINFO_HDICON_PATH   @"HDiconPath"      /**< Indicates HD icon path, [4][char(256)]. */
#define TBFLD_MYINFO_HDICON_ETAG   @"HDiconEtag"      /**< Indicates HD icon etag, [5][char(64)]. */
#define TBFLD_MYINFO_NICKNAME      @"nickname"        /**< Indicates nickname, [6][char(256)]. */
#define TBFLD_MYINFO_HOMEPAGE      @"homepage"        /**< Indicates homepage, [7][char(256)]. */
#define TBFLD_MYINFO_NOTE          @"note"            /**< Indicates note, [8][char(512)]. */
#define TBFLD_MYINFO_STATUS        @"status"          /**< Indicates status, [9][int]. */
#define TBFLD_MYINFO_SOCIAL_NET    @"socialNetWork"   /**< Indicates social network, [10][char(512)]. */

#define TBNAME_PRESENCE            @"tb_presence"     /**< Presence table name. */

#define TBFLD_PRESNC_PRES_ID       @"presId"          /**< Indicates presence ID, [0][integer primary key]. */
#define TBFLD_PRESNC_ONLY_URI      @"only_uri"        /**< Indicates only uri, [1][char(128)]. */
#define TBFLD_PRESNC_SIP_NUM       @"sip_number"      /**< Indicates sip number, [2][char(128)]. */
#define TBFLD_PRESNC_RELATION      @"relation"        /**< Indicates relation, [3][int]. */
#define TBFLD_PRESNC_SGROUP        @"sGroup"          /**< Indicates S group, [4][char(128)]. */
#define TBFLD_PRESNC_IDEV_TYPE     @"ideviceType"     /**< Indicates iDevice type, [5][int]. */
#define TBFLD_PRESNC_AUTO_DSCV     @"autoDiscoveryFlag"  /**< Indicates auto discovery flag, [6][int]. */
#define TBFLD_PRESNC_ICON_PATH     @"iconPath"        /**< Indicates icon path, [7][char(256)]. */
#define TBFLD_PRESNC_ICON_ETAG     @"iconEtag"        /**< Indicates icon etag, [8][char(64)]. */
#define TBFLD_PRESNC_ICON_MD5      @"iconMD5"         /**< Indicates icon MD5, [9][char(64)]. */
#define TBFLD_PRESNC_HDICON_PATH   @"HDIconPath"      /**< Indicates HD icon path, [10][char(256)]. */
#define TBFLD_PRESNC_HDICON_ETAG   @"HDIconEtag"      /**< Indicates HD icon etag, [11][char(64)]. */
#define TBFLD_PRESNC_NICKNANE      @"nickName"        /**< Indicates nickname, [12][char(256)]. */
#define TBFLD_PRESNC_HOMEPAGE      @"homePage"        /**< Indicates homepage, [13][char(256)]. */
#define TBFLD_PRESNC_NOTE          @"note"            /**< Indicates note, [14][char(512)]. */
#define TBFLD_PRESNC_READ          @"bRead"           /**< Indicates be read, [15][int]. */
#define TBFLD_PRESNC_SOCIAL_NET    @"socialNetWork"   /**< Indicates social network, [16][char(512)]. */
#define TBFLD_PRESNC_USER_TYPE     @"userType"        /**< Indicates user type, [17][int]. */
#define TBFLD_PRESNC_NOTE_NAME     @"noteName"        /**< Indicates notename, [18][char(128)]. */

/**
 * <b>Description:</b> Capability describes the abilities that a number may have.
 * Currently, a number can have a maximum of 14 abilities, including support for IM,
 * support for file transfer, and support for video call.
 * <br><b>Purpose:</b> The UI can get properties of capability to determine whether the local end can originate
 * relevant services to the peer end. Some services can be established between both ends only when they both have relevant abilities.
 * For example, the UI can get the capability property of phone to obtain the abilities of the number.
 */
@interface Capability : NSObject
{
@private
    BOOL _isSuptIm;
    BOOL _isSuptFt;
    BOOL _isSuptIs;
    BOOL _isSuptVs;
    BOOL _isSuptSp;
    BOOL _isSuptDp;
    BOOL _isSuptMt;

    BOOL _isSuptCs;
    BOOL _isSuptAc;
    BOOL _isSuptVc;
    BOOL _isSuptSms;
    BOOL _isSuptLs;
    BOOL _isSuptNab;
    BOOL _isSuptPs;
    BOOL _isSuptFtViaHttp;
    long _lastCheckTime;
}

/**
 * <b>Description:</b> This property is used to determine whether the local end can originate the IM service to the peer end.
 * <br><b>Purpose:</b> When the local account wants to originate the IM service to the peer account, this property needs
 * to be used to determine whether both accounts support the IM function. If both accounts support the IM function, the IM
 * service can be originated. Otherwise, the UI is not advised to originate the IM service and it can prompt the subscribers
 * with friendly information.
 * <p>The property can be set to any of the following values:
 * <ul>
 *    <li><em>YES</em></li> - Indicates that both accounts support the IM function and the IM service can be originated
 *    <li><em>NO</em></li> - Indicates that at least one account does not support the IM function
 * </ul>
 */
@property(nonatomic,assign) BOOL isSuptIm;

/**
 * <b>Description:</b> This property is used to determine whether the local end can originate the filetransfer service to the peer end.
 * <br><b>Purpose:</b> When the local account wants to originate the file transfer service to the peer account, this property needs to be
 * used to determine whether both accounts support the file transfer function. If both accounts support the file transfer function, the
 * file transfer service can be originated. Otherwise, the UI is not advised to originate the file transfer service and it can prompt the
 * subscribers with friendly information.
 * <p>The property can be set to any of the following values:
 * <ul>
 *    <li><em>YES</em></li> - Indicates that both accounts support the file transfer function and the file transfer service can be originated
 *    <li><em>NO</em></li> - Indicates that at least one account does not support the file transfer function
 * </ul>
 */
@property(nonatomic,assign) BOOL isSuptFt;

/**
 * <b>Description:</b> This property is used to determine whether the local end can originate the image sharing service to the peer end.
 * <br><b>Purpose:</b> When the local account wants to originate the image sharing service to the peer account, this property needs
 * to be used to determine whether both accounts support the image sharing function. If both accounts support the image sharing function,
 * the image sharing service can be originated. Otherwise, the UI is not advised to originate the image sharing service and it can prompt
 * the subscribers with friendly information.
 * <p>The property can be set to any of the following values:
 * <ul>
 *    <li><em>YES</em></li> - Indicates that both accounts support the image sharing function and the image sharing service can be originated
 *    <li><em>NO</em></li> - Indicates that at least one account does not support the image sharing function
 * </ul>
 */
@property(nonatomic,assign) BOOL isSuptIs;

/**
 * <b>Description:</b> This property is used to determine whether the local end can originate the video sharing service to the peer end.
 * <br><b>Purpose:</b> When the local account wants to originate the video sharing service to the peer
 * account, this property needs to be used to determine whether both accounts support the video sharing
 * function. If both accounts support the video sharing function, the video sharing service can be
 * originated. Otherwise, the UI is not advised to originate the video sharing service and it can
 * prompt the subscribers with friendly information.
 * <p>The property can be set to any of the following values:
 * <ul>
 *    <li><em>YES</em></li> - Indicates that both accounts support the video sharing function and the video sharing service can be originated
 *    <li><em>NO</em></li> - Indicates that at least one account does not support the video sharing function
 * </ul>
 */
@property(nonatomic,assign) BOOL isSuptVs;

/**
 * <b>Description:</b> This property is used to determine whether the peer end supports the social presence.
 * <br><b>Purpose:</b> When the local account wants to obtain the peer's social presence information, this
 * property needs to be used to determine whether the peer account supports social presence. The local account
 * can obtain the peer's social presence information only when the peer account supports social presence.
 * This property is not recommended for the UI.
 * <p>The property can be set to any of the following values:
 * <ul>
 *    <li><em>YES</em></li> - Indicates that the peer account support social presence and the local account can obtain the peer's social presence information
 *    <li><em>NO</em></li> - Indicates that the peer account does not support the social presence
 * </ul>
 */
@property(nonatomic,assign) BOOL isSuptSp;

/**
 * <b>Description:</b> This property is used to determine whether the local end can obtain the peer's abilities using the presence function.
 * <br><b>Purpose:</b> Currently, the server configuration determines how the SDK discover a number's abilities. This property is not recommended for the UI.
 * <p>The property can be set to any of the following values:
 * <ul>
 *    <li><em>YES</em></li> - Indicates that the local account can obtain the ability information from using the presence function
 *    <li><em>NO</em></li> - Indicates that the local account cannot obtain the ability information from using the presence function
 * </ul>
 */
@property(nonatomic,assign) BOOL isSuptDp;

/**
 * <b>Description:</b> This property is used to determine whether the local end can originate the IP voice call and
 * IP video call service to the peer end.
 * <br><b>Purpose:</b> When the local account wants to originate the IP voice call and IP video call service to the
 * peer account, this property needs to be used to determine whether both accounts support the IP voice call and IP video
 * call function. If both accounts support the IP voice call and IP video call function, the IP voice call and IP video
 * call service can be originated. Otherwise, the UI is not advised to originate the IP voice call and IP video call
 * service and it can prompt the subscribers with friendly information. Currently, the SDK does not support this function.
 * <p>The property can be set to any of the following values:
 * <ul>
 *    <li><em>YES</em></li> - Indicates that the local account supports the IP voice call and IP video call function and the IP voice call and IP video call service can be originated
 *    <li><em>NO</em></li> - Indicates that the local account does not support the IP voice call and IP video call function
 * </ul>
 */
@property(nonatomic,assign) BOOL isSuptMt;

/**
 * <b>Description:</b> This property is used to determine whether the local end can originate the voice call service to the peer end.
 * <br><b>Purpose:</b> When the local account wants to originate the voice call service to the peer account, this property needs to be
 * used to determine whether the local account supports the voice call function. If the local account supports the voice call function,
 * the voice call service can be originated. Otherwise, the UI is not advised to originate the voice call service and it can prompt the
 * subscribers with friendly information.
 * <p>The property can be set to any of the following values:
 * <ul>
 *    <li><em>YES</em></li> - Indicates that the local account supports the voice call function and the voice call service can be originated
 *    <li><em>NO</em></li> - Indicates that the local account does not support the voice call function
 * </ul>
 */
@property(nonatomic,assign) BOOL isSuptCs;

/**
 * <b>Description:</b> This property is used to determine whether the local end can originate the voice call service to the peer end.
 * <br><b>Purpose:</b> When the local account wants to originate the voice call service to the peer account, this property needs to be
 * used to determine whether the local account supports the voice call function. If the local account supports the voice call function,
 * the voice call service can be originated. Otherwise, the UI is not advised to originate the voice call service and it can prompt the
 * subscribers with friendly information.
 * <p>The property can be set to any of the following values:
 * <ul>
 *    <li><em>YES</em></li> - Indicates that the local account supports the voice call function and the voice call service can be originated
 *    <li><em>NO</em></li> - Indicates that the local account does not support the voice call function
 * </ul>
 */
@property(nonatomic,assign) BOOL isSuptAc;

/**
 * <b>Description:</b> This property is used to determine whether the local end can originate the video call service to the peer end.
 * <br><b>Purpose:</b> When the local account wants to originate the video call service to the peer account, this property needs to be
 * used to determine whether the local account supports the video call function. If the local account supports the video call function,
 * the voice call service can be originated. Otherwise, the UI is not advised to originate the video call service and it can prompt the
 * subscribers with friendly information.
 * <p>The property can be set to any of the following values:
 * <ul>
 *    <li><em>YES</em></li> - Indicates that the local account supports the video call function and the video call service can be originated
 *    <li><em>NO</em></li> - Indicates that the local account does not support the video call function
 * </ul>
 */
@property(nonatomic,assign) BOOL isSuptVc;

/**
 * <b>Description:</b> This property is used to determine whether the local end can originate the short message service (SMS).
 * <br><b>Purpose:</b> When the local account wants to originate SMS, this property needs to be used to determine whether local
 * account supports SMS. If the local account supports SMS, the SMS can be originated. Otherwise, the UI is not advised to
 * originate SMS and can prompt the subscribers with friendly information.
 * <p>The property can be set to any of the following values:
 * <ul>
 *    <li><em>YES</em></li> - Indicates that the local account supports SMS and can originate SMS
 *    <li><em>NO</em></li> - Indicates that the local account does not support SMS
 * </ul>
 */
@property(nonatomic,assign) BOOL isSuptSms;

/**
 * <b>Description:</b> This property is used to determine whether the local end can originate the location sharing service to the peer end.
 * <br><b>Purpose:</b> When the local account wants to originate the location sharing service to the peer account, this property needs to be
 * used to determine whether the local account supports the location sharing function. If the local account supports the location sharing
 * function, the location sharing service can be originated. Otherwise, the UI is not advised to originate the location sharing service and
 * it can prompt the subscribers with friendly information.
 * <p>The property can be set to any of the following values:
 * <ul>
 *    <li><em>YES</em></li> - Indicates that the local account supports the location sharing function and the location sharing service can be originated
 *    <li><em>NO</em></li> - Indicates that the local account does not support the location sharing function
 * </ul>
 */
@property(nonatomic,assign) BOOL isSuptLs;

/**
 * <b>Description:</b> This property is used to determine whether the local end can originate the network address book (NAB) service.
 * <br><b>Purpose:</b> When the local account wants to originate the NAB service, this property needs to be used to determine whether local
 * account supports the NAB service. If the local account supports the NAB service, the NAB service can be originated. Otherwise, the UI
 * is not advised to originate of the NAB service and it can prompt the subscribers with friendly information.
 * <p>The property can be set to any of the following values:
 * <ul>
 *    <li><em>YES</em></li> - Indicates that the local account supports the NAB service and can originate the NAB service
 *    <li><em>NO</em></li> - Indicates that the local account does not support the NAB service
 * </ul>
 */
@property(nonatomic,assign) BOOL isSuptNab;

/**
 * <b>Description:</b> This property is used to determine whether the local end can originate the IM service to the peer end.
 * <br><b>Purpose:</b> When the local account wants to originate the IM service to the peer account, this property needs
 * <p>The property can be set to any of the following values:
 * <ul>
 *    <li><em>YES</em></li> - Indicates that both accounts support the VoIP function and the VoIP service can be originated
 *    <li><em>NO</em></li> - Indicates that at least one account does not support the VoIP function
 * </ul>
 */
@property(nonatomic,assign) BOOL isSuptPs;

/**
 * <b>Description:</b> This property is used to determine whether the local end can originate the file transfer via HTTP service to the peer end.
 * <br><b>Purpose:</b> When the local account wants to originate the file transfer via HTTP service to the peer account, this method needs to be
 * used to determine whether both accounts support the file transfer via HTTP function. If both accounts support the file transfer via HTTP function, the
 * file transfer via HTTP service can be originated. Otherwise, the UI is not advised to originate the file transfer service and it can prompt the
 * subscribers with friendly information.
 * <ul>
 *    <li><em>YES</em></li> - Indicates that both accounts support the file transfer via HTTP function and the file transfer via HTTP service can be originated
 *    <li><em>NO</em></li> - Indicates that at least one account does not support the file transfer via HTTP function
 * </ul>
 */
@property(nonatomic,assign) BOOL isSuptFtViaHttp;

/**
 * <b>Description:</b> This property is used to obtain the last time the server updates the number ability information and presence information.
 * <br><b>Purpose:</b> When the UI needs to obtain the last time the server updates the number ability information and presence information,
 * it can invoke this property. Generally, the time is used for displaying. The UI can invoke the ContactApi::getLastCheckTime method to convert the time.
 * <p>The property indicates the time difference (in seconds) between the last query time and year 1970
 */
@property(nonatomic,assign) long lastCheckTime;

@end

/**
 * <b>Description:</b> Presence is used to obtain the presence information about a contact, including the nickname, homepage, signature and profile picture.
 * <br><b>Purpose:</b> The UI invokes methods in this class to obtain the presence information about a contact.
 */
@interface Presence : NSObject
{
@private
    NSMutableDictionary* itemList;
    int _friendRelation;
}
/**
 * <b>Description:</b> This property is used to obtain the buddy relationship between the local and peer accounts.
 * <br><b>Purpose:</b> The UI can differentiate the display of the contacts that have different buddy relationships
 * with the local account. When the UI displays information about a recommended person, it may also display the
 * buddy relationship with the local account.
 * <p>The property friendRelation can be set to any one of the {@link tag_CONTACT_RELATION} enumeration, indicates the buddy relationship between the local and peer accounts.
 */
@property(nonatomic,assign) int friendRelation;

/**
 * <b>Description:</b> This method is used to obtain the presence information about an account.
 * <br><b>Purpose:</b> The UI can invoke this method to obtain the presence information about an account.
 * Currently, the SDK can obtain the information including nickname, homepage, signature and
 * profile picture. If the UI obtains the presence information through a recommended person,
 * the mood and online status obtained using this method are the same as those obtained using recommend related methods.
 * @param [in] itemType Specifies the type of the presence information
 * <p>The value of parameter itemType can be set to any one of the {@link tag_CONTACT_ITEM_TYPE} enumeration, but {@link CONTACT_ITEM_PHOTO}.
 * <p>The property indicates certain presence information about an account. If the presence information is not configured for the account, "nil" is returned.
 */
- (NSString*) getItemString:(int) itemType;

/**
 * <b>Description:</b> This method is used to obtain the profile picture of an account.
 * <br><b>Purpose:</b> This method is low priority, UI should invoke other methods(ContactSummary.getPhoto, Phone.getPhoto, etc.) to obtain the profile picture of an account in priority.
 * If the UI obtains the presence information through the recommend object, the value returned for this
 * method is the same as the value of property photo property.
 * @param [in] itemType Currently, this parameter can be set only to {@link CONTACT_ITEM_PHOTO} of enumeration {@link tag_CONTACT_ITEM_TYPE}, which indicates that the profile picture is obtained.
 * <p>The property indicates profile picture of an account. If the profile picture is not configured for the account, "nil" is returned.
 */
- (UIImage*) getItemImage:(int) itemType;

@end

/**
 * <b>Description:</b> MyInfo provides entry to the personal social presence information about the local
 * login account, such as the nickname, homepage, signature and profile picture.
 * <br><b>Purpose:</b> The UI invokes related methods of the MyInfo object to obtain and update the
 * personal social presence information about the local login account. The UI can invoke the method ContactApi::getMyInfo to obtain the MyInfo object of the local login account.
 */
@interface MyInfo : NSObject
{
@private
    Presence* _myPresence;
}

/**
 * <b>Description:</b> This property is used to obtain the personal social presence information about the local login account.
 * <br><b>Purpose:</b> The UI gets this property to obtain the personal social presence information
 * about the local login account, such as the nickname, home page, signature, and photo.
 * <p>The property indicates the personal social presence information about the local login account. For details, see Presence.
 */
@property(nonatomic,retain) Presence* myPresence;

/**
 * <b>Description:</b> This method is used to update the personal social presence information of the local
 * login account, including the nickname, home page, note, and social network.
 * <br><b>Purpose:</b> The UI invokes MyInfo::updateItem when it has locally edited and needs to upload personal
 * social presence information to the server. The update result is sent from the SDK to the UI using a
 * broadcast. For details, see {@link EVENT_CONTACT_UPDATE_MYINFO_RESULT}. The UI receives the broadcast and
 * notifies the subscriber of the update result.
 * @param [in] itemType Specifies the type of presence information to be updated. Please refer to the {@link tag_CONTACT_ITEM_TYPE} enumeration.
 * @param [in] str Specifies the updated value. The max length of str is different according to different itemType. For more information, see the defination of each item type.
 * @return Please refer to the {@link tag_CONTACT_UPDATE_ITEM_RESULT} enumeration, which indicates the result of invoking the update personal social presence information interface.
 */
- (int) updateItem:(int) itemType value:(NSString*) str;

/**
 * <b>Description:</b> This method is used to update the personal online status of the local login account
 * <br><b>Purpose:</b> The UI invokes ContactApi::updateStatus when it needs to upload personal
 * online status to the server. The update result is sent from the SDK to the UI using a
 * broadcast. For details, see {@link EVENT_CONTACT_UPDATE_MYINFO_RESULT}.The UI receives the broadcast and
 * notifies the subscriber of the update result.
 * @param [in] iStatusType Specifies the online status type.
 * <p>The parameter iStatusType can be set to any one of the {@link tag_CONTACT_STATUS_TYPE} enumeration.
 * @return 0 Indicates that the update operation is successful
 *     <br>1 Indicates that the update operation fails
 */
- (int) updateStatus:(int) iStatusType;

/**
 * <b>Description:</b> This method is used to update the personal social presence information about the
 * local login account. Currently, this method is used only for the portrait icon update.
 * <br><b>Purpose:</b> The UI invokes MyInfo::updateImage when it has locally edited and needs to upload the
 * portrait icon to the server. The update result is sent from the SDK to the UI using a broadcast.
 * For details, see {@link EVENT_CONTACT_UPDATE_MYINFO_RESULT}. The UI receives the broadcast and notifies
 * the subscriber of the update result.
 * @param [in] itemType Specifies the type of presence information to be updated. It can be set to {@link CONTACT_ITEM_PHOTO} only of enumeration {@link tag_CONTACT_ITEM_TYPE},
 * indicating that only the portrait icon can be updated.
 * @param [in] image Specifies the updated portrait icon, the max size of the image is 50KB
 * @return Please refer to the {@link tag_CONTACT_UPDATE_ITEM_RESULT} enumeration, which indicates the result of invoking the update personal social presence information interface.
 */
- (int) updateImage:(int) itemType value:(UIImage*) image;

/**
 * <b>Description:</b> This method is used to remove the personal social presence information about the
 * local login account. Currently, this method is used only for the SNS access info.
 * <br><b>Purpose:</b> The UI invokes this method to remove the SNS access info
 * from the server. The update result is sent from the SDK to the UI using a broadcast.
 * For details, see {@link EVENT_CONTACT_UPDATE_MYINFO_RESULT}. The UI receives the broadcast and notifies
 * the subscriber of the update result. Before invoking this method, it is recommanded that the UI should prompt the user with friendly information, 
 * such as a choice box for choosing to continue or cancel. The UI can present different information based on different situations.
 * @param [in] itemType Specifies the type of presence information to be updated. It only can be set to {@link CONTACT_ITEM_SNS_ACCESS_INFO} only of enumeration {@link tag_CONTACT_ITEM_TYPE},
 * @return 0 Indicates that the portrait icon update operation is request
 *     <br>1 Indicates that the portrait icon update operation fails
 */
- (int) removeItem:(int) itemType;
@end

/**
 * <b>Description:</b> Phone provides an entry to the information related to a specified number, such as the
 * number, number type, whether the subscriber using the number is an RCS subscriber, presence information
 * about the number, and number capability. The UI can gets properties and methods of the Phone object to obtain related
 * information about a specified number, and add, delete, and reject buddies.
 * <br><b>Purpose:</b> The UI invokes properties of the Phone object when it needs to obtain the detailed
 * information about a specified number. For example, the UI invokes ContactApi::getPhone method
 * to obtain the Phone object corresponding to a specified number.
 */
@interface Phone : NSObject
{
@private
    long _contactId;
    NSString *_number;
    NSString *_type;
    NSString *_displayName;
    NSString* _sessionTag;
    UIImage *_photo;
    int _status;
    int _serviceStatus;
    int _isRcsUser;
    Presence* _presence;
    Capability* _capability;
    NSString* _searchMatchContent;
    NSMutableArray* _rangeArray;
    int _realStatus;
}

/**
 * <b>Description:</b> This property is used to obtain the ID of the contact who stores a specified number.
 * <br><b>Purpose:</b> The UI gets this property to obtain the ID of the contact who stores a specified
 * number. An ID uniquely identifies a contact and is obtained from the local database. The UI can use this
 * ID to obtain detailed information about the contact, for details, see ContactApi::getContact,
 * and the UI can perform operations on the contact, for example, the UI invokes ContactApi::addFavoriteContact
 * to add the contact as a favorite contact.
 * <p>The property indicates the ID of the contact who stores a specified number
 */
@property(nonatomic,assign) long contactId;

/**
 * <b>Description:</b> This property is used to obtain the number of a Phone object.
 * <br><b>Purpose:</b> The UI gets this property to obtain the number of a Phone object. One Phone object corresponds only to one number.
 * <p>The property indicates the number of a Phone object
 */
@property(nonatomic,retain) NSString* number;

/**
 * <b>Description:</b> This property is used to obtain the type of a specified number.
 * <br><b>Purpose:</b> The UI gets this property to obtain the type of a specified number. The type is
 * obtained from the local database and used for display.
 * <p>The property indicates the type of a specified number. For details, see definition about type, for detail, see eg.home/mobile/office etc.
 */
@property(nonatomic,retain) NSString* type;

/**
 * <b>Description:</b> This property is used to obtain the name of the contact using a specified number.
 * <br><b>Purpose:</b> The UI gets this property to obtain the name of the contact using a specified
 * number. The name is obtained from the local database and used for display.
 * <p>The property indicates the name of the contact using a specified number
 */
@property(nonatomic,retain) NSString* displayName;

 /**
 * <b>Description:</b> This property is used to obtain the initials of a number.
 * <br><b>Purpose:</b> The UI gets this property to obtain the initials of a contact who stores a specified
 * number. The initials is obtained from the local database and used for display.
 * <p>The property indicates the initials of a specified number
 */
@property(nonatomic,retain) NSString* sessionTag;

/**
 * <b>Description:</b> This property is used to obtain the portrait picture of a contract who stores a specified number.
 * <br><b>Purpose:</b> The UI gets this property to obtain the portrait picture of a contact who stores a
 * specified number. The portrait picture is obtained from the local database and used for display. Note that the return values of Phone.photo and Phone.presence::getItemImage are the same,
 * but they may be different between Contact.photo or ContactSummary.photo on the condition that one contact has more than one phone number. The return value of Contact.photo or
 * ContactSummary.photo is the first RCS phone-number's photo.
 * <p>The property indicates the portrait picture of a contact who stores a specified number
 */
@property(nonatomic,retain) UIImage* photo;

/**
 * <b>Description:</b> This property is used to obtain the current status of a specified number when the SDK support status,
 * see CONTACT_CFG_MAJOR_SUPPORT_ACTIVE_STATUS.
 * <br><b>Purpose:</b> Before getting this property, the UI gets property isRcsUser to determine whether the user
 * using a specified number is a RCS subscriber. The UI gets this property to obtain the status of the
 * number when it determines that the user using the number is an RCS subscriber. Currently, the
 * SDK provides three statuses. {@link CONTACT_STATUS_ONLINE}, {@link CONTACT_STATUS_OFFLINE} and {@link CONTACT_STATUS_BUDDLE}
 * are defined in the enumeration {@link tag_CONTACT_STATUS}. The UI displays different views for numbers in different statuses.
 * <p>Note: When both the local and peer ends support the Social Presence capability, the value of status is the same as the
 * value of serviceStatus. The returned value indicates the real status of the number of the peer end. When either the local end or
 * peer end does not support the Social Presence capability, if the peer end is a registered subscriber, {@link CONTACT_STATUS_ONLINE}
 * is returned; if the peer end is an unregistered subscriber, {@link CONTACT_STATUS_BUDDLE} is returned.
 */
@property(nonatomic,assign) int status;

/**
 * <b>Description:</b> This property is used to obtain the current service status of a specified number when the SDK support status,
 * see CONTACT_CFG_MAJOR_SUPPORT_ACTIVE_STATUS.
 * <br><b>Purpose:</b> Before getting this property, the UI gets property isRcsUser to determine whether the user
 * using a specified number is a RCS subscriber. The UI gets this property to obtain the service status of the
 * number when it determines that the user using the number is an RCS subscriber. Currently, the
 * SDK provides three statuses. {@link CONTACT_STATUS_ONLINE}, {@link CONTACT_STATUS_OFFLINE} and {@link CONTACT_STATUS_BUDDLE}
 * are defined in the enumeration {@link tag_CONTACT_STATUS}. The UI displays different views for numbers in different service statuses.
 * <p>Note:Service status indicates the real status of a number.
 */
@property(nonatomic,assign) int serviceStatus;

/**
 * <b>Description:</b> This property is used to determine whether a user using a specified number is a RCS subscriber.
 * <br><b>Purpose:</b> The UI gets this property to determine whether a user using a specified number is
 * an RCS subscriber. A RCS subscriber is a subscriber who uses the number whose RCSType is USER_TYPE_RCS. The UI displays different views for RCS and non-RCS subscribers. Non-RCS subscribers
 * cannot initiate RCS services, such as the IM service.
 * <p>The property can be set to any of the following values:
 * <ul>
 *    <li><em>0</em></li> - Indicates a RCS subscriber
 *    <li><em>1</em></li> - Indicates a non-RCS subscriber
 * </ul>
 */
@property(nonatomic,assign) int isRcsUser;

/**
 * <b>Description:</b> This property is used to obtain the presence information about a specified number.
 * <br><b>Purpose:</b> The UI gets this property to obtain the presence information about a specified number. For details, see Presence.
 * <p>The property indicates the presence information about a specified number. If a number does not have the presence information, "nil" is returned.
 */
@property(nonatomic,retain) Presence* presence;

/**
 * <b>Description:</b> This property is used to obtain the capability of a specified number.
 * <br><b>Purpose:</b> The UI gets this property to obtain the capability information about a
 * specified number. Before initiating a service to a number, the UI must get this property to
 * determine whether the number has the service capability. For details, see Capability.
 * <p>The property indicates the capability of a specified number
 */
@property(nonatomic,retain) Capability* capability;

/**
 * <b>Description:</b> This property is used to obtain the matched content from the full display name or phone string when a contact is searched for.
 * <br><b>Purpose:</b> The UI gets this property to obtain the matched content when searching
 * for a contact. Generally, this property is used to highlight the desired content during searching.
 * <p>The property indicates the matched contents
 */
@property(nonatomic,retain) NSString* searchMatchContent;

/**
 * <b>Description:</b> This property is used to obtain the ranges of the matched contents when a contact is searched for.
 * <br><b>Purpose:</b> The UI gets this property to obtain the ranges of the matched contents when searching for a contact. Generally, this property is used to highlight the desired content
 * during searching.
 * <p>The property indicates the ranges of the matched contents
 */
@property(nonatomic,retain) NSMutableArray* rangeArray;

/**
 * <b>Description:</b> This property is used to obtain the real status of a specified number when the SDK support status,
 * see CONTACT_CFG_MAJOR_SUPPORT_ACTIVE_STATUS.
 * <br><b>Purpose:</b> Before getting this property, the UI gets property isRcsUser to determine whether the user
 * using a specified number is a RCS subscriber. The UI gets this property to obtain the real status of the
 * number when it determines that the user using the number is an RCS subscriber. Currently, the
 * SDK provides three statuses. {@link CONTACT_ACTIVE_STATUS_ONLINE}, {@link CONTACT_ACTIVE_STATUS_BUSY}, {@link CONTACT_ACTIVE_STATUS_AWAY},
 * {@link CONTACT_ACTIVE_STATUS_CALLING}, {@link CONTACT_ACTIVE_STATUS_OFFLINE}, {@link CONTACT_ACTIVE_STATUS_MEETING}
 * are defined in the enumeration {@link tag_CONTACT_STATUS_TYPE}. The UI displays different views for numbers in different statuses.
 */
@property(nonatomic,assign) int realStatus;

/**
 * <b>Description:</b> This method is used to detect whether a user using a specified number is a RCS subscriber in real time.
 * <br><b>Purpose:</b> The UI invokes checkRcsUser to have the server detect whether a user using a
 * specified number is a RCS subscriber in real time. The detection result is returned from the SDK
 * to the UI using a broadcast. For details, see {@link EVENT_CONTACT_PHONEINFO_CHANGED}.
 * @return 0 Indicates that the detect operation is successful
 *     <br>1 Indicates that the detect operation fails
 */
- (int) checkRcsUser;

/**
 * <b>Description:</b> This method is used to query the capability of a specified user in real time.
 * <br><b>Purpose:</b> The UI invokes queryCapability to send a message to a specified user(if the user registered currently) or to the
 * server(if the user not registered currently) in real time, and then receives a response message which contains the specified user's
 * capability. The result is returned from the SDK to the UI using a broadcast. For details, see {@link EVENT_CONTACT_PHONEINFO_CHANGED}.
 * @return 0 Indicates that the query operation is successful
 *     <br>1 Indicates that the query operation fails
 */
- (int) queryCapability;

/**
 * <b>Description:</b> This method is used to store UserData for UI.
 * <br><b>Purpose:</b> This method is used to store UserData for UI.
 * @param [NSString*] key Specifies the key of the UserData
 * @param [NSString*] value Specifies the value of the UserData,if nil,remove UserData by key.
 * @return 0 Indicates that the operation is successfully
 *     <br>1 Indicates that the operation is fails
 */
- (int) setUserData:(NSString *)key value:(id)value;

/**
 * <b>Description:</b> This method is used to store UserData for UI.
 * <br><b>Purpose:</b> This method is used to store UserData for UI.
 * @param [NSString*] key Specifies the key of the UserData
 * @return 0 Indicates that the operation is successfully
 *     <br>1 Indicates that the operation is fails
 */
- (id) getUserData:(NSString *)key;

/**
 * <b>Description:</b> This method is used to add a specified number as a RCS buddy of the local login account.
 * <br><b>Purpose:</b> The UI invokes addBuddy to add a specified number as a RCS buddy of the local login
 * account. The result is sent from the SDK to the UI using the {@link EVENT_CONTACT_OPERATE_STATCODE} broadcast.
 * @return 0 Indicates that the add operation is successful
 *     <br>1 Indicates that the add operation fails
 */
- (int) addBuddy;

/**
 * <b>Description:</b> This method is used to cancel buddy relationship with a specified number.
 * <br><b>Purpose:</b> The UI invokes rmvBuddy to cancel buddy relationship with a specified number.
 * The result is sent from the SDK to the UI using the {@link EVENT_CONTACT_OPERATE_STATCODE} broadcast.
 * @return 0 Indicates that the cancel operation is successful
 *     <br>1 Indicates that the cancel operation fails
 */
- (int) rmvBuddy;

/**
 * <b>Description:</b> This method is used to reject the RSC buddy request from a specified number.
 * <br><b>Purpose:</b> The UI invokes refuseBuddy to reject the RSC buddy request from a specified number.
 * The result is sent from the SDK to the UI using the {@link EVENT_CONTACT_OPERATE_STATCODE} broadcast.
 * @return 0 Indicates that the reject operation is successful
 *     <br>1 Indicates that the reject operation fails
 */
- (int) refuseBuddy;

/**
 * <b>Description:</b> This method is used to set a RCS buddy's notename.
 * <br><b>Purpose:</b> The UI invokes setNoteName to set a RSC buddy's notename.
 * The result is sent from the SDK to the UI using the {@link EVENT_CONTACT_OPERATE_STATCODE} broadcast.
 * @return 0 Indicates that the setting operation is successful
 *     <br>1 Indicates that the setting operation fails
 */
- (int) setNoteName:(NSString *)noteName;

@end

/**
 * <b>Description:</b> Contact provides entry to the detailed information about a contact, including the
 * contact ID, name (full name, first name, middle name, and last name), address (country, city, and street),
 * mailboxes, numbers, and portrait icon. The UI can gets related properties of the Contact object to obtain
 * detailed information about a contact.
 * <br><b>Purpose:</b> Before obtaining the detailed information of a contact, the UI must obtain the Contact
 * object of the contact. For example, the UI can invoke ContactApi::getContact carrying the
 * contactId parameter to obtain the Contact object of the contact. If the UI only needs to obtain the brief
 * information about a contact, see ContactSummary.
 */
@interface Contact : NSObject <NSCopying>
{
@private
    long _contactId;
    NSString* _displayName;
    NSString* _firstName;
    NSString* _lastName;
    NSString* _middleName;
    NSString* _street;
    NSString* _city;
    NSString* _state;
    NSString* _postcode;
    NSString* _country;
    UIImage* _photo;
    NSString* _note;
    int _starred;
    NSString* _organise;
    NSString* _department;
    NSString* _organise_title;
    NSString* _remarks;
    NSMutableArray* _phoneList;
    NSMutableArray* _emailList;
}

/**
 * <b>Description:</b> This property is used to obtain the ID of a contact.
 * <br><b>Purpose:</b> The UI gets this property to obtain the ID of a contact. An ID uniquely
 * identifies a contact and is obtained from the local database. The UI can perform operations on
 * the contact, for example the UI can invoke ContactApi::addFavoriteContact to add
 * the contact as a favorite contact.
 * @return The value indicates the ID of a contact
 */
@property(nonatomic,assign) long contactId;

/**
 * <b>Description:</b> This property is used to obtain the name of a contact.
 * <br><b>Purpose:</b> The UI gets this property to obtain the name of a contact. The name is obtained
 * from the local database and used for display. The UI can also get other properties to obtain the contact's
 * first name, middle name, and last name, separately.
 * @return The value indicates the name of a contact
 */
@property(nonatomic,retain) NSString* displayName;

/**
 * <b>Description:</b> This property is used to obtain the first name of a contact.
 * <br><b>Purpose:</b> The UI gets this property to obtain the first name of a contact. The first name
 * is obtained from the local database separately and used for display. The UI can also get property displayName
 * to directly obtain the full name of the contact.
 * @return The value indicates the first name of a contact
 */
@property(nonatomic,retain) NSString* firstName;

/**
 * <b>Description:</b> This property is used to obtain the last name of a contact.
 * <br><b>Purpose:</b> The UI gets this property to obtain the last name of a contact. The last name
 * is obtained from the local database separately and used for display. The UI can also get property displayName
 * to directly obtain the full name of the contact.
 * @return The value indicates the last name of a contact
 */
@property(nonatomic,retain) NSString* lastName;
/**
 * <b>Description:</b> This property is used to obtain the middle name of a contact.
 * <br><b>Purpose:</b> The UI gets this property to obtain the middle name of a contact. The middle
 * name is obtained from the local database separately and used for display. The UI can also get property displayName
 * to directly obtain the full name of the contact.
 * @return The value indicates the middle name of a contact
 */
@property(nonatomic,retain) NSString* middleName;

/**
 * <b>Description:</b> This property is used to obtain the street in the contact address.
 * <br><b>Purpose:</b> The UI gets this property to obtain the street in the contact address. The street
 * is obtained from the local database and used for display.
 * @return The value indicates the street in the contact address
 */
@property(nonatomic,retain) NSString* street;

/**
 * <b>Description:</b> This property is used to obtain the city in the contact address.
 * <br><b>Purpose:</b> The UI gets this property to obtain the city in the contact address. The city is
 * obtained from the local database and used for display.
 * @return The value indicates the city in the contact address
 */
@property(nonatomic,retain) NSString* city;

/**
 * <b>Description:</b> This property is used to obtain the state or province in the contact address.
 * <br><b>Purpose:</b> The UI gets this property to obtain the state or province in the contact address.
 * The state or province information is obtained from the local database and used for display.
 * @return The value indicates the state or province in the contact address
 */
@property(nonatomic,retain) NSString* state;

/**
 * <b>Description:</b> This property is used to obtain the postal code in the contact address.
 * <br><b>Purpose:</b> The UI gets this property to obtain the postal code in the contact address. The
 * post code is obtained from the local database and used for display.
 * @return The value indicates the postal code in the contact address
 */
@property(nonatomic,retain) NSString* postcode;

/**
 * <b>Description:</b> This property is used to obtain the country in the contact address.
 * <br><b>Purpose:</b> The UI gets this property to obtain the country in the contact address. The country
 * is obtained from the local database and used for display.
 * @return The value indicates the country in the contact address
 */
@property(nonatomic,retain) NSString* country;

/**
 * <b>Description:</b> This property is used to obtain the portrait picture of a contact.
 * <br><b>Purpose:</b> The UI gets this property to obtain the portrait picture of a contact. The portrait
 * picture is obtained from the local database and used for display.
 * @return The value indicates the portrait picture of a contact
 */
@property(nonatomic,retain) UIImage* photo;

/**
 * <b>Description:</b> This property is used to obtain the signature of a contact.
 * <br><b>Purpose:</b> The UI gets this property to obtain the signature of a contact. The signature is
 * obtained from the presence information and is displayed when the UI displays the detailed information
 * of the contact. If the contact has several phone-numbers, this property indicates the first buddy's signature.
 * @return The value indicates the signature of a contact
 */
@property(nonatomic,retain) NSString* note;

/**
 * <b>Description:</b> This property is used determine whether a contact is a favorite contact of the local login account.
 * <br><b>Purpose:</b> The UI gets this property to determine whether a contact is a favorite contact
 * of the local login account and displays different views for favorite and non-favorite contacts. The
 * UI can also invoke related methods of ContactApi to add, cancel, and obtain favorite contacts of the
 * local login account.
 * @return 1 Indicates that the contact is a favorite contact
 *     <br>Other values Indicate that the contact is not a favorite contact
 */
@property(nonatomic,assign) int starred;

/**
 * <b>Description:</b> This property is used to obtain the company which a contact works for.
 * <br><b>Purpose:</b> The UI gets this property to obtain the company which a contact works for.
 * The information about the company is obtained from the local database and used for display.
 * @return The value indicates the company which a contact works for
 */
@property(nonatomic,retain) NSString* organise;

/**
 * <b>Description:</b> This property is used to obtain the department which a contact works for.
 * <br><b>Purpose:</b> The UI gets this property to obtain the department which a contact works for.
 * The information about the department is obtained from the local database and used for display.
 * @return The value indicates the department which a contact works for
 */
@property(nonatomic,retain) NSString* department;

/**
 * <b>Description:</b> This property is used to obtain the position of a contact
 * <br><b>Purpose:</b> The UI gets this property to obtain the position of a contact. The position
 * is obtained from the local database and used for display.
 * @return The value indicates the position of a contact
 */
@property(nonatomic,retain) NSString* organise_title;

/**
 * <b>Description:</b> This property is used to obtain the remarks of a contact.
 * <br><b>Purpose:</b> The UI gets this property to obtain the remarks of a contact. The remarks are
 * obtained from the local database and used for display.
 * @return The value indicates the remarks of a contact
 */
@property(nonatomic,retain) NSString* remarks;

/**
 * <b>Description:</b> This property is used to obtain the phone number array of a contact.
 * <br><b>Purpose:</b> The UI gets this property to obtain the phone number array of a contact.
 * @return The value indicates the phones of the contact. The return value is a array of Phone. If a contact does not have phones, "nil" is returned.
 */
@property(nonatomic,retain) NSMutableArray* phoneList;

/**
 * <b>Description:</b> This property is used to obtain the all mailboxes of a contact.
 * <br><b>Purpose:</b> The UI gets this property to obtain the array of all mailboxes numbers of a contact.
 * The mailboxes are obtained from the local database and used for display.
 * @return The value indicates the mailboxes of a contact. The return value is a array of NSString. If a contact does not have mailboxes, "nil" is returned.
 *
 */
@property(nonatomic,retain) NSMutableArray* emailList;

/**
 * <b>Description:</b> This method is used to update the contact infomation and save the new infomation about the contact to the local database.
 * <br><b>Purpose:</b> When UI change a contact information through the SDK, hoping to save these information to the local database, need to call this method.
 * For example, UI modified the user name, phone numbers, mailboxes and other information, then call this method, all the new information will be save to the database.
 * The save result will notify UI through {@link EVENT_CONTACT_CONTACTINFO_CHANGED}.
 * @return 0 Specifies that operate ok
 *     <br>1 Specifies that operate failed
 */
- (int) update;

@end

/**
 * <b>Description:</b> ContactSummary provides brief information about a contact, including the contact ID,
 * name, portrait icon, mood, and RCS subscriber flag. The UI can invoke related properties of the ContactSummary
 * object to obtain brief information about a contact.
 * <br><b>Purpose:</b> ContactSummary stores only brief information about a contact and is usually invoked
 * when contacts needs to be displayed on the contact list. If the UI needs to obtain detailed information
 * about a contact, see Contact.
 */
@interface ContactSummary : NSObject
{
@private
    long _contactId;
    UIImage* _photo;
    NSString* _displayName;
    NSString* _sessionTag;
    NSString* _note;
    BOOL _isRcsUser;
    int _status;
    NSString* _searchMatchContent;
    NSMutableArray* _rangeArray;
    int _compareType;
    int _matchPhoneIndex;
}

/**
 * <b>Description:</b> This property is used to obtain the ID of a contact.
 * <br><b>Purpose:</b> The UI gets this property to obtain the ID of a contact. An ID uniquely
 * identifies a contact and is obtained from the local database. The UI can use this ID to obtain
 * detailed information about the contact, for details, see ContactApi::getContact,
 * and the UI can perform operations on the contact, for example, the UI invokes
 * ContactApi::addFavoriteContact to add the contact as a favorite contact.
 * @return The value the ID of a contact
 */
@property(nonatomic,assign) long contactId;

/**
 * <b>Description:</b> This property is used to obtain the profile picture of a contact.
 * <br><b>Purpose:</b> This property is used to obtain the profile picture of a contact.
 * Generally, the profile picture is used only for UI display.
 * <p>The property indicates the profile picture of a contact. If the profile picture is not configured,
 * "nil" is returned and a default profile picture can be displayed on the UI.
 */
@property(nonatomic,retain) UIImage* photo;

/**
 * <b>Description:</b> This property is used to obtain the name of a contact.
 * <br><b>Purpose:</b> The UI gets this property to obtain the name of a contact. The name is
 * obtained from the local database and used for display.
 * @return The value indicates the name of a contact
 */
@property(nonatomic,retain) NSString* displayName;

/**
 * <b>Description:</b> This property is used to obtain the initials.
 * <br><b>Purpose:</b> The UI gets this property to obtain the initials of a contact.
 * The initials is obtained from the local database and used for display. For example, the UI can
 * use the initials to implement letter navigation bar.
 * <p>The property indicates the initials of a contact
 */
@property(nonatomic,retain) NSString* sessionTag;

/**
 * <b>Description:</b> This property is used to obtain the signature of a contact.
 * <br><b>Purpose:</b> The UI gets this property to obtain the signature of a contact. The signature is
 * obtained from the presence information and is displayed when the UI displays the detailed information
 * of the contact. If the contact has several phone-numbers, this property indicates the first buddy's signature.
 * <p>The property indicates the signature of a contact
 */
@property(nonatomic,retain) NSString* note;

/**
 * <b>Description:</b> This property is used to determine whether a contact is an RCS subscriber.
 * <br><b>Purpose:</b> The UI gets this property to determine whether a contact is
 * a RCS subscriber. A RCS subscriber is a subscriber who uses the number whose RCSType is USER_TYPE_RCS. The UI displays different views for RCS and non-RCS subscribers. Non-RCS subscribers
 * cannot initiate RCS services, such as the IM service. If the contact has several phone-numbers, this property returns
 * YES as long as one phone-number is an RCS subscriber.
 * <p>The property can be set to any of the following values:
 * <ul>
 *    <li><em>YES</em></li> - Indicates a RCS subscriber
 *    <li><em>NO</em></li> - Indicates a non-RCS subscriber
 * </ul>
 */
@property(nonatomic,assign) BOOL isRcsUser;

/**
 * <b>Description:</b> This property is used to obtain the current status value of a contact when the SDK support status,
 * see CONTACT_CFG_MAJOR_SUPPORT_ACTIVE_STATUS.
 * <br><b>Purpose:</b> Before getting this property, the UI gets property isRcsUser to determine whether the contact
 * is a RCS subscriber. The UI gets this property to obtain the status of the contact when it determines that the contact
 * is a RCS subscriber. Currently, the SDK provides three statuses. {@link CONTACT_STATUS_ONLINE}, {@link CONTACT_STATUS_OFFLINE}
 * and {@link CONTACT_STATUS_BUDDLE} are defined in the enumeration {@link tag_CONTACT_STATUS}. The UI displays different views
 * for contacts in different statuses. If the contact has several phone-numbers, this property returns
 * {@link CONTACT_STATUS_ONLINE} as long as one phone-number is online.
 * <p>Note: When both the local and peer ends support the Social Presence capability, the value of status indicates the real status
 * of the peer end. When either the local end or peer end does not support the Social Presence capability, if the peer end is a registered
 * subscriber, {@link CONTACT_STATUS_ONLINE} is returned; if the peer end is an unregistered subscriber, {@link CONTACT_STATUS_BUDDLE} is returned.
 */
@property(nonatomic,assign) int status;

/**
 * <b>Description:</b> This property is used to obtain the matched content from the full display name or phone string when a contact is searched for.
 * <br><b>Purpose:</b> The UI gets this property to obtain the matched content when searching
 * for a contact. Generally, this property is used to highlight the desired content during searching.
 * <p>The property indicates the matched contents
 */
@property(nonatomic,retain) NSString* searchMatchContent;

/**
 * <b>Description:</b> This property is used to obtain the ranges of the matched contents when a contact is searched for.
 * <br><b>Purpose:</b> The UI gets this property to obtain the ranges of the matched contents when searching for a contact. Generally, this property is used to highlight the desired content
 * during searching.
 * <p>The property indicates the ranges of the matched contents
 */
@property(nonatomic,retain) NSMutableArray* rangeArray;

/**
 * <b>Description:</b> This property is used to obtain the compare type when the contact is in the return of search result.
 * <br><b>Purpose:</b> When UI search contacts in all the system contacts, if a contact in the returned result, the property indicates the compare type is the name or number.
 * For ditail, see {@link tag_CONTACT_SEARCH_TYPE}.
 * <p>The property indicates the compare type
 */
@property(nonatomic,assign) int compareType;

/**
 * <b>Description:</b> This property is used to obtain the compare type when the contact is in the return of search result.
 * <br><b>Purpose:</b> The UI gets this property to obtain the ranges of the matched contents when searching for a contact. Generally, this property is used to highlight the desired content
 * during searching.
 * <p>The property indicates the ranges of the matched contents
 */
@property(nonatomic,assign) int matchPhoneIndex;

@end

/**
 * <b>Description:</b> Recommend describes a recommended person. It defines the basic attributes of a recommended person,
 * including ID, name, number, profile picture, signature, online status, abilities, and whether the person is an RCS user.
 * The UI invokes methods and properties of a recommend object to obtain the attribute information of the object.
 * <br><b>Purpose:</b> The UI can obtain the basic property of recommended persons using the recommend class.
 * The SDK stores the information about recommended persons pushed by the server in the local database. The UI can invoke
 * the ContactApi::getRecommendList method to obtain the information. In this case, the returned value is the recommend
 * object list. The SDK define the persons that have certain buddy relationship with the local account and are not in the
 * local contacts as recommended persons. The name, online status, profile picture, presence information, and ability
 * information obtained by the local account are correct only when the buddy relationship is {@link CONTACT_RELATION_ACTIVE}.
 * The UI can obtain the buddy relationship using the property friendRelation of the Presence object.
 */
@interface Recommend : NSObject
{
@private
    long _recommendId;
    NSString* _displayName;
    NSString* _number;
    BOOL _readFlag;
    UIImage* _photo;
    int _status;
    int _isRcsUser;
    Presence* _presence;
    Capability* _capability;
}

/**
 * <b>Description:</b> This property is used to obtain the ID of a contact you may know.
 * <br><b>Purpose:</b> The UI can get this property to obtain the ID of a recommended person.
 * The ID is unique in the local terminal. The UI does not require focus on this property.
 * <p>The property indicates the id of the recommend person
 */
@property(nonatomic,assign) long recommendId;

/**
 * <b>Description:</b> This property is used to obtain the name of a contact you may know.
 * <br><b>Purpose:</b> The UI can get this property when it needs to learn the name of a recommended person.
 * Generally, when the UI displays the information about a recommended person or you save a recommended person
 * to the contacts, the name needs to be obtained.
 * <p>The property indicates the displayname of the recommend person. If the information about a recommended person does not
 * contain the name, the number is returned for the name.
 */
@property(nonatomic,retain) NSString* displayName;

/**
 * <b>Description:</b> This property is used to obtain the phone number of a contact you may know.
 * <br><b>Purpose:</b> The UI can get this property when it needs to learn the phone number of a recommended person.
 * Generally, when the UI displays the information about a recommended person or you save a recommended person
 * to the contacts, the phone number needs to be obtained.
 * <p>The property indicates the phone number of the recommend person
 */
@property(nonatomic,retain) NSString* number;

/**
 * <b>Description:</b> This property is used to determine whether the local account has read the information about a recommended person.
 * <br><b>Purpose:</b> The display of a recommended person varies depending on whether the information about the recommended person has
 * been read. After a user logs in, the SDK marks all recommended persons who the server delivers for the first time as "unread". If
 * a recommended person who is marked as "read" requests to be a buddy with the local account, the SDK marks the recommended person
 * as "unread" again after receiving the request.
 * @return YES Indicates that the information of a contact you may know has been read
 *     <br>NO Indicates that the information of a contact you may know has not been read
 */
@property(nonatomic,assign,setter = setReadFlag:) BOOL readFlag;

/**
 * <b>Description:</b> This property is used to obtain the profile picture of a contact you may know.
 * <br><b>Purpose:</b> This property is used to obtain the profile picture of a recommended person.
 * Generally, the profile picture is used only for UI display.
 * <p>The property indicates the profile picture of a recommended person. If the profile picture is not configured,
 * "nil" is returned and a default profile picture can be displayed on the UI.
 */
@property(nonatomic,retain) UIImage* photo;

/**
 * <b>Description:</b> This property is used to obtain the current status value of a recommended person when the SDK support status,
 * see CONTACT_CFG_MAJOR_SUPPORT_ACTIVE_STATUS.
 * <br><b>Purpose:</b> The UI gets this property to obtain the status of a recommended person. Currently, the
 * SDK provides three statuses. {@link CONTACT_STATUS_ONLINE}, {@link CONTACT_STATUS_OFFLINE} and {@link CONTACT_STATUS_BUDDLE}
 * are defined in the enumeration {@link tag_CONTACT_STATUS}. The UI displays different views for recommended persons in different statuses.
 * <p>The property indicates the status of a recommended person
 */
@property(nonatomic,assign) int status;

/**
 * <b>Description:</b> This property is used to determine whether a contact is an RCS subscriber.
 * <br><b>Purpose:</b> Currently, all recommended persons obtained by invoking the ContactApi:getRecommendList method are RCS users.
 * @return YES Indicates that a contact is an RCS subscriber
 *     <br>NO Indicates that a contact is not an RCS subscriber
 */
@property(nonatomic,assign) int isRcsUser;

/**
 * <b>Description:</b> This property is used to obtain the presence information of a contact you may know.
 * <br><b>Purpose:</b> The UI can get this property to obtain the presence information of a recommended person.
 * Properties of the presence class can be get to obtain the information including nickname, homepage, signature and profile picture.
 * For details, see Presence. Generally, the UI needs to
 * invoke the property when the a user views the detailed information about a recommended person.
 * <p>The property indicates the contact's presence info
 */
@property(nonatomic,retain) Presence* presence;

/**
 * <b>Description:</b> This property is used to obtain the RCS capability information of a contact you may know.
 * <br><b>Purpose:</b> The UI can get this property to obtain the ability information of a recommended person.
 * The ability information includes whether IM is supported, whether file transfer is supported, and whether
 * video call is supported. For details, see Capability. The UI can get
 * this property of the capability class to determine whether the local end can originate relevant services
 * to recommended persons.
 * <p>The property indicates the ability information of a recommended person
 */
@property(nonatomic,retain) Capability* capability;

/**
 * <b>Description:</b> This method is used to add a recommended person to the RCS buddy list of the local account.
 * <br><b>Purpose:</b> This method is not used when the buddy discovery mode configured on the server is automatic mode.
 * SDK will send the result by event {@link EVENT_CONTACT_OPERATE_STATCODE}.
 * @return 0 Indicates that add buddy process successfully
 *     <br>1 Indicates that add buddy process fails
 */
- (int) addBuddy;

/**
 * <b>Description:</b> This method is used to cancel the RCS buddy relationship with a recommended person.
 * <br><b>Purpose:</b> The UI does not require focus on this method.
 * @return 0 Indicates that remove buddy process successfully
 *     <br>1 Indicates that remove buddy process fails
 */
- (int) rmvBuddy;

/**
 * <b>Description:</b> This method is used to reject the request for the RCS buddy relationship from a recommended person.
 * <br><b>Purpose:</b> After the UI invokes this method, it invokes the ContactApi::getRecommendList method to obtain the list of
 * recommended persons, which does not include the rejected person until the person sends a request for adding the local account
 * to the buddy list again. To remove a recommended person from the list of recommended persons, the UI can invoke
 * this method.
 * @return 0 Indicates that rejecte buddy request process successfully
 *     <br>1 Indicates that rejecte buddy request process fails
 */
- (int) refuseBuddy;

@end

/**
 * <b>Description:</b> ContactApi provides the entry of contact interfaces.
 * <br><b>Purpose:</b> The UI invokes methods in this class to access APIs to obtain contacts' information so that the UI can display contacts' status and service capabilities.
 */
@interface ContactApi : NSObject
{

}

/**
 * <b>Description:</b> This method is used to initialize ContactApi. To use the contacts function, the UI must invoke this method.
 * <br><b>Purpose:</b> Before using the contacts function, the UI needs to invoke this method to
 * initialize contacts. Generally, this method is used during system initialization.
 */
+ (void) init;

/**
 * <b>Description:</b> This method is used to close ContactApi.
 * <br><b>Purpose:</b> This method is used to release contact module resources. After it is invoked, contact and presence services can not be used after UI next call ContactApi::init.
 * For example, the program terminated by systerm UI need to call this method.
 */
+ (void) close;

/**
 * <b>Description:</b> This method is used to obtain a configuration parameter value.
 * <br><b>Purpose:</b> The UI invokes ContactApi::getConfig to obtain a configuration parameter value.
 * @param [in] majorType Specifies the major parameter type. It can be set to any one of the {@link tag_CONTACT_CFG_MAJOR_TYPE} enumeration.
 * @param [in] minorType Specifies the minor parameter type. It can be set to any one of the {@link tag_CONTACT_CFG_MINOR_TYPE} enumeration.
 * @return The value indicates the config value
 */
+ (NSString*) getConfig:(int)majorType minortype:(int)minorType;

/**
 * <b>Description:</b> This method is used to set a configuration parameter value.
 * <br><b>Purpose:</b> The UI invokes ContactApi::setConfig to set a configuration parameter value.
 * @param [in] majorType Specifies the major parameter type. It can be set to any one of the {@link tag_CONTACT_CFG_MAJOR_TYPE} enumeration.
 * @param [in] minorType Specifies the minor parameter type. It can be set to any one of the {@link tag_CONTACT_CFG_MINOR_TYPE} enumeration.
 * @param [in] configValue Specifies the config value
 * @return 0 Indicates that the setting succeeds
 *     <br>1 Ipecifies that the setting fails
 */
+(int) setConfig:(int)majorType minortype:(int)minorType configvalue:(NSString*)configValue;

/**
 * <b>Description:</b> This method is used to obtain the social presence information about an account.
 * <br><b>Purpose:</b> After the UI successfully logs in, it can invoke this method to obtain the social
 * presence information about the account. For details, see MyInfo.
 * @return The value indicates the object of the social presence information about an account
 */
+ (MyInfo*) getMyInfo;

/**
 * <b>Description:</b> This method is used to obtain the information related to a number based on the number.
 * <br><b>Purpose:</b> When the UI needs to obtain the detailed information related to a number based
 * on the number, it can invoke this method. For details, see Phone.
 * @param [in] number Specifies phone numbers in tel format, for example, "13512345678".
 * @return The value indicates a Phone object related to the number. If the information cannot be found, "nil" is returned.
 */
+ (Phone*) getPhone:(NSString*) number;

/**
 * <b>Description:</b> This method is used to obtain the detailed information about a contact based on the contactId parameter.
 * <br><b>Purpose:</b> When the UI needs to obtain the detailed information about a number specified by
 * the ID, the UI can invoke this method. For details, see Contact.
 * @param [in] contactId Specifies the ID of a contact
 * @return The value indicates a Contact object related to the ID. If the information cannot be found, "nil" is returned.
 */
+ (Contact*) getContact:(long) contactId;

/**
 * <b>Description:</b> This method is used to obtain the summary information about a contact based on the contactId parameter.
 * <br><b>Purpose:</b> When the UI needs to obtain the summary information about a contact specified by
 * the ID, the UI can invoke this method. For details, see ContactSummary.
 * @param [in] contactId Specifies the ID of a contact
 * @return The value indicates a ContactSummary object related to the ID. If the information cannot be found, "nil" is returned.
 */
+ (ContactSummary *)getContactSummary:(long)contactId;

/**
 * <b>Description:</b> This method is used to obtain the brief information contact list of a specified contact type.
 * <br><b>Purpose:</b> When the UI needs to display the brief information contact list, the UI can
 * invoke this method to obtain the contact list of a specified contact type.
 * @param [in] listFilter Specifies the filtering condition for obtaining the contact list
 * <p>The parameter listFilter can be set to any of the enumeration {@link tag_CONTACT_QUERY_TYPE}.
 * @return A mutable array. Every element of the array is a NSMutableDictionary object. The NSMutableDictionary object contain two sets of Key-Value. The first set of Key
 * is @"sessionTag", corresponding Value(NSString *) is the first letter of contact's displayName. The second set of Key(NSString *) is the first letter of contact's displayName,
 * corresponding Value(NSMutableArray *) is a mutable array which contains some ContactSummary objects.
 */
+ (NSMutableArray*) getContactSummaryList:(int) listFilter;

/**
 * <b>Description:</b> This method is used to add a contact.
 * <br><b>Purpose:</b> The UI invokes this method to add a contact to local database. The add result will notify UI throuth {@link EVENT_CONTACT_CONTACTINFO_CHANGED}.
 * @param [in] contact Specifies a contact's id
 * @return The value is a Contact object specifies the added contact's info. (if return nil, specifies add operation fail!)
 */
+ (Contact*) addContact:(Contact*) contact;

/**
 * <b>Description:</b> This method is used to delete a contact.
 * <br><b>Purpose:</b> The UI invokes this method to delete a contact from local database. The delete result will notify UI throuth {@link EVENT_CONTACT_CONTACTINFO_CHANGED}.
 * Before invoking this method, it is recommanded that the UI should prompt the user with friendly information, such as a choice box for choosing to continue or cancel. 
 * The UI can present different information based on different situations.
 * @param [in] contactId Specifies a contact's id
 * @return 0 Indicates that operate ok
 *     <br>1 Indicates that operate failed
 */
+ (int) deleteContact:(long) contactId;

/**
 * <b>Description:</b> This method is used to search contacts based on lookupKey.
 * <br><b>Purpose:</b> The UI invokes this method to search contacts based on specified conditions.
 * @param [in] lookupKey Specifies the search condition
 * @param [in] listFilter Specifies the list filter
 * <p>The parameter listFilter can be set to any of the enumeration {@link tag_CONTACT_QUERY_TYPE}.
 * @return The value is an array of ContactSummary object. Each contact match the lookupKey and listFilter.
 */
+ (NSArray*) searchContact:(NSString*) lookupKey listFilter:(int) listFilter;

/**
 * <b>Description:</b> This method is used to quickly search phones from phone's number (and display-name) based on lookupKey.
 * <br><b>Purpose:</b> The UI invokes this method to quickly search phones from phone's number (and display-name) based on specified conditions.
 * @param [in] lookupKey Specifies the search condition
 * @param [in] isSuperDial reserved field, the SDK don't support super-dial mode for this method
 * @param [in] bWithoutName Indicates whether to filter the phones which was searched from phone's display-name
 * @return The value is an array of Phone object. Each phone match the lookupKey.
 */
+ (NSArray *)quickSearchPhone:(NSString *)lookupKey isSuperDial:(BOOL)isSuperDial withoutName:(BOOL)bWithoutName;

/**
 * <b>Description:</b> This method is used to quickly search phones from phone's display-name based on lookupKey.
 * <br><b>Purpose:</b> The UI invokes this method to quickly search phones from phone's display-name based on specified conditions.
 * @param [in] lookupKey Specifies the search condition, for attention, it only supports the number on the dial, for example: when searching "zhang",
 *  the input is "94264"
 * @param [in] isSuperDial reserved field, the SDK don't support super-dial mode for this method
 * @return The value is an array of Phone object. Each phone match the lookupKey.
 */
+ (NSArray *)quickSearchName:(NSString *)lookupKey isSuperDial:(BOOL)isSuperDial;

/**
 * <b>Description:</b> This method is used to find the range of the first occurrence of a given string within the aString using the super-dial mode.
 * <br><b>Purpose:</b> The UI invokes this method to highlight each searching result's display-name or number.
 * @param [in] aString Specifies the original string
 * @param [in] searchString Specifies the string to search for
 * @return An NSRange structure giving the location and length in the aString of the first occurrence of searchString
 */
+ (NSRange)rangeOfNameString:(NSString *)aString withSearchString:(NSString *)searchString;

/**
 * <b>Description:</b> This method is used to search phones based on lookupKey and listFilter.
 * <br><b>Purpose:</b> The UI invokes this method to search phones based on lookupKey and listFilter.
 * @param [in] lookupKey Indicates the keyword used to search
 * @param [in] listFilter Indicates the filter of the result, see {@link tag_CONTACT_QUERY_TYPE}.
 * @param [in] isSuperDial Indicates do or don't use the super dial keyboard
 * @return The return value is an array in which each member is a Phone object specifies the phone info
 * @see #CONTACT_QUERY_TYPE
 * @see Phone
 */
+ (NSArray*) searchPhone:(NSString*) lookupKey listFilter:(int) listFilter isSuperDial:(BOOL) isSuperDial;

/**
 * <b>Description:</b> This method is used to obtain the list of favorite contacts.
 * <br><b>Purpose:</b> When the UI needs to obtain the list of favorite contacts saved by the local
 * account, it can invoke this method.
 * @param [in] limit Specifies the maximum number of returned contacts
 * @return The value indicates an array of ContactSummry object
 */
+ (NSArray*) getFavoriteContactList:(unsigned int) limit;

/**
 * <b>Description:</b> This method is used to obtain the count of favorite contacts.
 * <br><b>Purpose:</b> When the UI needs to obtain the count of favorite contacts about local auuount, it can invoke this method.
 * @return The return value specifies the the count of favorite contacts.
 */
+ (int) getFavoriteContactCount;

/**
 * <b>Description:</b> This method is used to add a contact as a favorite contact.
 * <br><b>Purpose:</b> The UI invokes this method to add a contact as a favorite contact. Note that the
 * contact referred to must be a contact saved in the local contact list. The SDK has created an
 * independent table that differentiates favorite contacts from other contacts, and the information
 * in the table is not saved in the system database.
 * @param [in] contactId Specifies a contact's id
 * @return 0 Specifies that operate ok
 *     <br>1 Specifies that operate failed
 */
+ (int) addFavoriteContact:(long) contactId;

/**
 * <b>Description:</b> This method is used to delete a contact from favorite contact list.
 * <br><b>Purpose:</b> When the UI needs to remove a contact from the favorite contact list, it can
 * invoke this method. The UI is advised to invoke the ContactApi::isFavoriteContact method to determine whether
 * a contact is in the favorite contact list before invoking this method. The SDK removes the contact
 * only from the favorite contact list created by the SDK. Before invoking this method, it is recommanded that the UI 
 * should prompt the user with friendly information, such as a choice box for choosing to continue or cancel. 
 * The UI can present different information based on different situations.
 * @param [in] contactId Specifies a contact's id
 * @return 0 Specifies that operate ok
 *     <br>1 Specifies that operate failed
 */
+ (int) deleteFavoriteContact:(long) contactId;

/**
 * <b>Description:</b> This method is used to judge a contact is or isn't a favortie contact.
 * @param [in] contactId Indicates the contact Id
 * @return YES Specifies a favortie contact
 *     <br>NO Specifies isn't a favorite contact
 */
+ (BOOL) isFavoriteContact:(long) contactId;

/**
 * <b>Description:</b> This method is used to get customer service number of the software.
 * <br><b>Purpose:</b> The UI can invoke this method to obtain the customer service number of the software. This number
 * is a parameter configured on the server. A third party who needs to configure the customer service
 * number can configure it on the server so that the UI can invoke this method.
 * @return The value indicates the customer service number of the software
 */
+ (NSString*) getServiceNumber;

/**
 * <b>Description:</b> This method is used to obtain the list of persons recommended by the server.
 * <br><b>Purpose:</b> The UI can obtain the list of persons recommended by the server by invoking
 * this method. For details, see Recommend. The person recommendation enriches users' social activities.
 * @return The value indicates a list of RCS subscribers recommended by the RCS server
 */
+ (NSArray*) getRecommendList;

/**
 * <b>Description:</b> This method is used to obtain the list of buddies who can see the login account.
 * <br><b>Purpose:</b> The UI invokes this method to obtain the array of buddies who can see the login account.
 * @return The value indicates a list of Phone objects who can see the login account
 */
+ (NSArray*) getWhoCanSeeMeList;

/**
 * <b>Description:</b> This method is used to determine whether the local account can discover RCS users using the Presence mode.
 * <br><b>Purpose:</b> Currently, the SDK provides three modes for discovering RCS users who are
 * related to the local account. The mode is determined the parameter configured on the server.
 * By invoking this method, the UI can determine whether the server is configured to discover
 * RCS users using the Presence mode.
 * @return YES Indicates enable presence service
 *     <br>NO Indicates isn't enable presence service
 */
+ (BOOL) isPresenceEnable;

/**
 * <b>Description:</b> This method is used to get the number's detail info array.
 * <br><b>Purpose:</b> UI invokes this method to obtain a array of contacts who save the number parameter.
 * @param [in] number Specifies the number
 * @return The value is a array in which each member is a Phone object whose element belongs to one specific contact
 */
+ (NSArray*) getPhoneList:(NSString*) number;

/**
 * <b>Description:</b> This method is used to determine whether the local account can discover RCS users using the Converged Address Book.
 * <br><b>Purpose:</b> Currently, the SDK provides three modes for discovering RCS users who are related to
 * the local account. The mode is determined the parameter configured on the server. By invoking this
 * method, the UI can determine whether the server is configured to discover RCS users using the
 * Converged Address Book.
 * @return YES Indicates the local account can discover RCS users using the Converged Address Book
 *     <br>NO Indicates the local account can not discover RCS users using the Converged Address Book
 */
+ (BOOL) isSupportCabDiscovery;

/**
 * <b>Description:</b> This method is used to generate a vCard on the local device based on the information about a locally saved contact.
 * <br><b>Purpose:</b> For example, when the UI needs to share a locally saved contact with others in
 * vCard format, it can invoke this method to generate a vCard and then invoke the MessagingApi::sendVcard
 * method to send the vCard. Currently, the vCard supported by this method contains the first name,
 * middle name, and family name. In addition, the vCard supports a maximum of three phone numbers. Note
 * that this method returns "nil" when the terminal has no SD card or the contact does not exist.
 * @param [in] contactId Specifies the ID of the contact based on who a vCard is generated
 * @return The value indicates the path in which the vCard is saved
 */
+ (NSString*) makeVcard:(unsigned int) contactId;

/**
 * <b>Description:</b> This method is used to get a contact from a vcard file.
 * <br><b>Purpose:</b> For example, when the UI receive a vcard file£¬UI can invoke this method to get the contact object based on the vcard file.
 * @param [in] filename Specifies the path in which the vCard is saved
 * @return The value can be convert to a Contact object
 */
+ (id) getVcard:(NSString*) fileName;

/**
 * <b>Description:</b> This method is used to get the count of all contacts in the system address book.
 * <br><b>Purpose:</b> When UI want to display the count of all contacts in the system database, can invoke this method.
 * @return The value indicates all contacts count
 */
+ (int) getContactsCount;

/**
 * <b>Description:</b> This method is used to get the photo of someone who was successfully logged in.
 * <br><b>Purpose:</b> For example, when the UI want to display someone's photo before logging in, the UI can invoke this method.
 * @param [in] username Indicates someone who was successfully logged in
 * @return The photo image
 */
+ (UIImage *)getUserPhoto:(NSString *)username;

/**
     * <b>Description:</b> This method is used to get contact summary which matched the phone cout.
     * <br><b>Purpose:</b> The UI invokes getContactSummaryWithMatchPhoneCount to get contact summary.
     * @param arr Specifies the array of phone contact
     * @param isSearch Specifies the search
     * @return The value indicates all matched contact summary.
     * @deprecated The purpose of this method is just compatible with the old version of UI, we do not recommend the new version of UI invokes this method.
     */
+ (int) getContactSummaryWithMatchPhoneCount:(NSArray*) arr isSearch:(BOOL) isSearch;

/**
     * <b>Description:</b> This method is used to get contact summary which matched the phone.
     * <br><b>Purpose:</b> The UI invokes sendText(String number, String msg) to send a text message to a specified contact.
     * @param arr Specifies the number of the contact to whom a text message is to be sent
     * @param index Specifies the index
     * @param matchPhoneIndex Specifies the match index
     * @param isSearch Specifies the search
     * @return The value indicates all matched contact summary.
     * @deprecated The purpose of this method is just compatible with the old version of UI, we do not recommend the new version of UI invokes this method.
     */
+ (id) getContactSummaryWithMatchPhone:(NSArray*) arr index:(int) index matchPhoneIndex:(int*) matchPhoneIndex isSearch:(BOOL) isSearch;

/**
     * <b>Description:</b> This method is used to get last check time.
     * <br><b>Purpose:</b> The UI invokes getLastCheckTime to get last check time.
     * @param lastCheckTime Specifies the check time
     * @return The value indicates the time.
     * @deprecated The purpose of this method is just compatible with the old version of UI, we do not recommend the new version of UI invokes this method.
     */
+(id)getLastCheckTime:(unsigned int)lastCheckTime;

@end

#endif
