/**
 * @file EabApi.h
 * @brief Enterprise Address Book Interface Functions
 */
#ifndef _EAB_API_H_
#define _EAB_API_H_

#import <Foundation/Foundation.h>

/**
 * This broadcast parameter specifies the old name of a contact group.
 */
#define PARAM_EAB_OLD_GROUP_NAME @"PARAM_EAB_OLD_GROUP_NAME"

/**
 * This broadcast parameter specifies the new name of a contact group.
 */
#define PARAM_EAB_NEW_GROUP_NAME @"PARAM_EAB_NEW_GROUP_NAME"

/**
 * This broadcast specifies the operation result code.
 * @see tag_EAB_RESULT_CODE
 */
#define PARAM_EAB_RESULT_CODE @"PARAM_EAB_RESULT_CODE"

/**
 * This broadcast specifies a contact group name.
 */
#define PARAM_EAB_GROUP_NAME @"PARAM_EAB_GROUP_NAME"

/**
 * This broadcast parameter specifies a contact URI.
 */
#define PARAM_EAB_CONTACT_URI @"PARAM_EAB_CONTACT_URI"

/**
 * This constant is a broadcast parameter. Its value is the same as that of the cookie parameter set when the UI invokes the
 * EabApi.searchServerContact:lookupKey:startPage:pageSize: or EabGroup.addCustomContact method. The UI can determine by this parameter which time of
 * operation a broadcast is returned for.
 */
#define PARAM_EAB_COOKIE @"PARAM_EAB_COOKIE"

/**
 * This broadcast specifies a list of contacts that meet the search criteria and pagination criteria.
 * @see EabContact
 */
#define PARAM_EAB_CONTACT_LIST @"PARAM_EAB_CONTACT_LIST"

/**
 * This broadcast parameter specifies that start page of the contact search results.
 */
#define PARAM_EAB_START_PAGE @"PARAM_EAB_START_PAGE"

/**
 * This broadcast parameter specifies the maximum number of contacts that can be displayed on each page.
 */
#define PARAM_EAB_PAGE_SIZE @"PARAM_EAB_PAGE_SIZE"

/**
 * This broadcast parameter specifies the number of pages that contains the contact search results.
 */
#define PARAM_EAB_TOTAL_PAGE @"PARAM_EAB_TOTAL_PAGE"

/**
 * This broadcast specifies the total number of matched contacts.
 */
#define PARAM_EAB_TOTAL_COUNT @"PARAM_EAB_TOTAL_COUNT"

/**
 * This broadcast specifies a list of contacts that meet the search criteria and pagination criteria.
 * @see EabContact
 */
#define PARAM_EAB_DEPT_LIST @"PARAM_EAB_DEPT_LIST"

/**
 * This broadcast specifies the total number of matched department.
 */
#define PARAM_EAB_TOTAL_DEPT_COUNT @"PARAM_EAB_TOTAL_DEPT_COUNT"

/**
 * This broadcast specifies the total number of matched employee.
 */
#define PARAM_EAB_TOTAL_EMPLOYEE_COUNT @"PARAM_EAB_TOTAL_EMPLOYEE_COUNT"

/**
 * This broadcast parameter specifies the name of a contact group that one contact moved to.
 */
#define PARAM_EAB_MOVE_TO_GROUP_NAME @"PARAM_EAB_MOVE_TO_GROUP_NAME"

/**
 * This broadcast specifies a list of group names that the contact originally belonged to when deleted from all groups.
 */
#define PARAM_EAB_GROUP_NAME_LIST @"PARAM_EAB_GROUP_NAME_LIST"


/**
 * This broadcast specifies a list of changed groups.
 * @see EabGroupChangeInfo
 */
#define PARAM_EAB_GROUP_CHANGE_LIST @"PARAM_EAB_GROUP_CHANGE_LIST"


/** <b>Description:</b> EabApi.EVENT_EAB_MOD_GROUP_NAME_RESULT broadcasts the result of changing a contact group name.
 *  <br><b>Purpose:</b> After the UI invokes EabGroup.modifyGroupName to modify a contact group name, the SDK sends EabApi.EVENT_EAB_MOD_GROUP_NAME_RESULT to notify
 *  the UI of the modification result. The UI needs to determine whether the modification is successful by the operation result code. If the modification is successful,
 *  the UI obtains the old and new contact group names from the broadcast parameters and update the contact group name.
 *  <p>The broadcast will have the following extra value:
 *  <ul>
 *     <li><em>{@link PARAM_EAB_OLD_GROUP_NAME}</em></li> - [NSString *]
 *     <li><em>{@link PARAM_EAB_NEW_GROUP_NAME}</em></li> - [NSString *]
 *     <li><em>{@link PARAM_EAB_RESULT_CODE}</em></li> - [int]
 *  </ul>
 */
#define EVENT_EAB_MOD_GROUP_NAME_RESULT @"EVENT_EAB_MOD_GROUP_NAME_RESULT"

/** <b>Description:</b> EabApi.EVENT_EAB_ADD_CONTACT_RESULT broadcasts the result of adding an enterprise contact to a contact group.
 *  <br><b>Purpose:</b> After the UI invokes EabGroup.addContact to add an enterprise contact to a contact group, the SDK sends EabApi.EVENT_EAB_ADD_CONTACT_RESULT to notify the UI
 *  of the adding result. The UI needs to determine whether the addition is successful by the operation result code. If the addition is successful, the UI obtains the
 *  new enterprise contact's URI and the contact group name from the broadcast parameters and updates the contacts in the contact group.
 *  <p>The broadcast will have the following extra value:
 *  <ul>
 *     <li><em>{@link PARAM_EAB_GROUP_NAME}</em></li> - [NSString *]
 *     <li><em>{@link PARAM_EAB_CONTACT_URI}</em></li> - [NSString *]
 *     <li><em>{@link PARAM_EAB_RESULT_CODE}</em></li> - [int]
 *  </ul>
 */
#define EVENT_EAB_ADD_CONTACT_RESULT @"EVENT_EAB_ADD_CONTACT_RESULT"

/** <b>Description:</b> EabApi.EVENT_EAB_DELETE_CONTACT_RESULT broadcasts the result of deleting a contact from a contact group.
 *  <br><b>Purpose:</b> After the UI invokes EabGroup.deleteContact to delete a contact from a contact group, the SDK sends EabApi.EVENT_EAB_DELETE_CONTACT_RESULT to notify
 *  the UI of the deletion result. The UI needs to determine whether the deletion is successful by the operation result code. If the deletion is successful, the UI obtains the
 *  deleted contact's URI and the contact group name from the broadcast parameters and updates the contacts in the contact group.
 *  <p>The broadcast will have the following extra value:
 *  <ul>
 *     <li><em>{@link PARAM_EAB_GROUP_NAME}</em></li> - [NSString *]
 *     <li><em>{@link PARAM_EAB_CONTACT_URI}</em></li> - [NSString *]
 *     <li><em>{@link PARAM_EAB_RESULT_CODE}</em></li> - [int]
 *  </ul>
 */
#define EVENT_EAB_DELETE_CONTACT_RESULT @"EVENT_EAB_DELETE_CONTACT_RESULT"


/** <b>Description:</b> EabApi.EVENT_EAB_DELETE_CONTACT_IN_ALL_GROUP_RESULT broadcasts the result of deleting a contact from all contact group that it belongs to.
 *  <br><b>Purpose:</b> After the UI invokes EabGroup.deleteContactInAllGroups to delete a contact from all contact group that it belongs to, the SDK sends EabApi.EVENT_EAB_DELETE_CONTACT_IN_ALL_GROUP_RESULT to notify
 *  the UI of the deletion result. The UI needs to determine whether the deletion is successful by the operation result code. If the deletion is successful, the UI obtains the
 *  deleted contact's URI and the contact group name list from the broadcast parameters and updates the contacts in the contact groups.
 *  <p>The broadcast will have the following extra value:
 *  <ul>
 *     <li><em>{@link PARAM_EAB_RESULT_CODE}</em></li> - [int]
 *     <li><em>{@link PARAM_EAB_CONTACT_URI}</em></li> - [NSString *]
 *     <li><em>{@link PARAM_EAB_GROUP_NAME_LIST}</em></li> - [NSMutableArray *]
 *  </ul>
 */
#define EVENT_EAB_DELETE_CONTACT_IN_ALL_GROUP_RESULT @"EVENT_EAB_DELETE_CONTACT_IN_ALL_GROUP_RESULT"

/** <b>Description:</b> EabApi.EVENT_EAB_ADD_CUSTOM_CONTACT_RESULT broadcasts the result of adding a custom contact to a contact group.
 *  <br><b>Purpose:</b> After the UI invokes EabGroup.addCustomContact to add a custom contact to a contact group, the SDK sends EabApi.EVENT_EAB_ADD_CUSTOM_CONTACT_RESULT to
 *  notify the UI of the adding result. The UI needs to determine whether the addition is successful by the operation result code. If the addition is successful,
 *  the UI obtains the new custom contact's URI and the contact group name from the broadcast parameters and updates the custom contacts in the contact group.
 *  <p>The broadcast will have the following extra value:
 *  <ul>
 *     <li><em>{@link PARAM_EAB_COOKIE}</em></li> - [long]
 *     <li><em>{@link PARAM_EAB_GROUP_NAME}</em></li> - [NSString *]
 *     <li><em>{@link PARAM_EAB_CONTACT_URI}</em></li> - [NSString *]
 *     <li><em>{@link PARAM_EAB_RESULT_CODE}</em></li> - [int]
 *  </ul>
 */
#define EVENT_EAB_ADD_CUSTOM_CONTACT_RESULT @"EVENT_EAB_ADD_CUSTOM_CONTACT_RESULT"

/** <b>Description:</b> EabApi.EVENT_EAB_UPDATE_CUSTOM_CONTACT_RESULT broadcasts the result of updating a custom contact.
 *  <br><b>Purpose:</b> After the UI invokes EabGroup.updateCustomContact to update a custom contact, the SDK sends EabApi.EVENT_EAB_UPDATE_CUSTOM_CONTACT_RESULT to
 *  notify the UI of the updating result. The UI needs to determine whether the update is successful by the operation result code. If the update is successful,
 *  the UI obtains the new custom contact's URI and the contact group name from the broadcast parameters. And then UI can invoke EabApi.getContactInfo to get the updated EabContact object.
 *  <p>The broadcast will have the following extra value:
 *  <ul>
 *     <li><em>{@link PARAM_EAB_GROUP_NAME}</em></li> - [NSString *]
 *     <li><em>{@link PARAM_EAB_CONTACT_URI}</em></li> - [NSString *]
 *     <li><em>{@link PARAM_EAB_RESULT_CODE}</em></li> - [int]
 *  </ul>
 */
#define EVENT_EAB_UPDATE_CUSTOM_CONTACT_RESULT @"EVENT_EAB_UPDATE_CUSTOM_CONTACT_RESULT"


/** <b>Description:</b> EabApi.EVENT_EAB_MOVE_CONTACT_RESULT broadcasts the result of moving a contact from one group to another.
 *  <br><b>Purpose:</b> After the UI invokes EabGroup.moveContact:toGroup: to move a contact, the SDK sends EabApi.EVENT_EAB_MOVE_CONTACT_RESULT to notify the UI of the creation result. The UI needs to
 *  determine whether the operation is successful by the operation result code. If the operation is successful, the UI obtains the moving from group name and moving to group name from the broadcast parameter.
 *  <p>The broadcast will have the following extra value:
 *  <ul>
 *     <li><em>{@link PARAM_EAB_CONTACT_URI}</em></li> - [NSString *]
 *     <li><em>{@link PARAM_EAB_GROUP_NAME}</em></li> - [NSString *]
 *     <li><em>{@link PARAM_EAB_MOVE_TO_GROUP_NAME}</em></li> - [NSString *]
 *     <li><em>{@link PARAM_EAB_RESULT_CODE}</em></li> - [int]
 *  </ul>
 */
#define EVENT_EAB_MOVE_CONTACT_RESULT @"EVENT_EAB_MOVE_CONTACT_RESULT"


/** <b>Description:</b> EabApi.EVENT_EAB_GROUP_LIST_CHANGED broadcasts changes in contact group lists.
 *  <br><b>Purpose:</b> Each time a subscriber logs in to a client, the SDK obtains from the server the newest contact group lists of the subscriber. After receiving the contact
 *  group lists from the server, the SDK sends EabApi.EVENT_EAB_GROUP_LIST_CHANGED to notify the UI of changes in the contact group lists. The UI can receive this broadcast only
 *  within a specified period of time after a successful login. After the UI receives this broadcast, it should get the NSMutableArray of EabGroupChangeInfo from the extra value
 *  of EabApi.PARAM_EAB_GROUP_CHANGE_LIST. The UI can get which contact group is changed from the array, and then the UI should refresh the contact list in the changed contact group.
 *  <p>The broadcast will have the following extra value:
 *  and refresh the contact page of the client.
 *  <ul>
 *     <li><em>{@link PARAM_EAB_GROUP_CHANGE_LIST}</em></li> - [NSMutableArray *]
 *  </ul>
 */
#define EVENT_EAB_GROUP_LIST_CHANGED @"EVENT_EAB_GROUP_LIST_CHANGED"

/** <b>Description:</b> EabApi.EVENT_EAB_CONTACT_INFO_CHANGED broadcasts changes of an enterprise contact information.
 *  <br><b>Purpose:</b> When the UI invokes EabApi.getContactInfo to query information about an enterprise contact, the SDK may send EabApi.EVENT_EAB_CONTACT_INFO_CHANGED to the UI.
 *  If the SDK database does not store information about the enterprise contact, the SDK obtains the information from the server and sends it in the EabApi.EVENT_EAB_CONTACT_INFO_CHANGED
 *  broadcast to the UI. If the local database stores information about the enterprise contact and the information has been stored for shorter than 24 hours, the SDK directly returns the
 *  information to the UI. If the information about the enterprise contact has been stored for longer than 24 hours, the SDK returns the information int the database first and then obtains
 *  the latest information from the server and sends it in the EabApi.EVENT_EAB_CONTACT_INFO_CHANGED broadcast to the UI.
 *  <p>The broadcast will have the following extra value:
 *  <ul>
 *     <li><em>{@link PARAM_EAB_CONTACT_URI}</em></li> - [NSString *]
 *  </ul>
 */
#define EVENT_EAB_CONTACT_INFO_CHANGED @"EVENT_EAB_CONTACT_INFO_CHANGED"

/** <b>Description:</b> EabApi.EVENT_EAB_GROUP_CONTACT_SUMMARY_CHANGED broadcasts changes of brief information about contacts.
 *  <br><b>Purpose:</b> Each time a subscriber logs in to the client, the SDK obtains from the server in multiple times information about all contacts in all contact groups. The SDK can
 *  obtain information about 20 contacts each time. The SDK obtains information about contacts in another contact group only after it obtains information about all contacts in a contact group.
 *  Each time the SDK obtains information about contacts, it sends EabApi.EVENT_EAB_GROUP_CONTACT_SUMMARY_CHANGED to the UI if it detects changes of information about any contact. The UI can
 *  receive this broadcast only within a specified period of time after a successful login. When the UI receives this broadcast, it can obtain the contact group name from the broadcast parameter.
 *  It is recommended that the UI invoke EabApi.getGroupContactSummaryList to obtain contacts in the specified contact group again after it receives the EabApi.EVENT_EAB_GROUP_CONTACT_SUMMARY_CHANGED broadcast.
 *  <p>The broadcast will have the following extra value:
 *  <ul>
 *     <li><em>{@link PARAM_EAB_GROUP_NAME}</em></li> - [NSString *]
 *  </ul>
 */
#define EVENT_EAB_GROUP_CONTACT_SUMMARY_CHANGED @"EVENT_EAB_GROUP_CONTACT_SUMMARY_CHANGED"

/** <b>Description:</b> EabApi.EVENT_EAB_SEARCH_SERVER_CONTACT_RESULT broadcasts the result of search contacts in the EAB.
 *  <br><b>Purpose:</b> After the UI invokes EabApi.searchServerContact to search contacts in the EAB, the SDK sends the matched contacts in the EabApi.EVENT_EAB_SEARCH_SERVER_CONTACT_RESULT broadcast
 *  to the UI. When invoking EabApi.searchServerContact, the UI can specify the page number and the maximum number of contacts can be displayed on a page.
 *  <p>The broadcast will have the following extra value:
 *  <ul>
 *     <li><em>{@link PARAM_EAB_COOKIE}</em></li> - [long]
 *     <li><em>{@link PARAM_EAB_CONTACT_LIST}</em></li> - [NSMutableArray *]
 *     <li><em>{@link PARAM_EAB_START_PAGE}</em></li> - [long]
 *     <li><em>{@link PARAM_EAB_PAGE_SIZE}</em></li> - [long]
 *     <li><em>{@link PARAM_EAB_TOTAL_PAGE}</em></li> - [long]
 *     <li><em>{@link PARAM_EAB_TOTAL_COUNT}</em></li> - [long]
 *     <li><em>{@link PARAM_EAB_RESULT_CODE}</em></li> - [int]
 *  </ul>
 */
#define EVENT_EAB_SEARCH_SERVER_CONTACT_RESULT @"EVENT_EAB_SEARCH_SERVER_CONTACT_RESULT"

/** <b>Description:</b> EabApi.EVENT_EAB_CREATE_GROUP_RESULT broadcasts the result of creating a contact group.
 *  <br><b>Purpose:</b> After the UI invokes EabApi.createGroup to create a contact group, the SDK sends EabApi.EVENT_EAB_CREATE_GROUP_RESULT to notify the UI of the creation result. The UI needs to
 *  determine whether the creation is successful by the operation result code. If the creation is successful, the UI obtains the new contact group name from the broadcast parameter. It is recommended
 *  that the UI invoke EabApi.getGroupList to obtain the contact group lists again after it receives the EabApi.EVENT_EAB_CREATE_GROUP_RESULT broadcast.
 *  <p>The broadcast will have the following extra value:
 *  <ul>
 *     <li><em>{@link PARAM_EAB_GROUP_NAME}</em></li> - [NSString *]
 *     <li><em>{@link PARAM_EAB_RESULT_CODE}</em></li> - [int]
 *  </ul>
 */
#define EVENT_EAB_CREATE_GROUP_RESULT @"EVENT_EAB_CREATE_GROUP_RESULT"

/** <b>Description:</b> EabApi.EVENT_EAB_DELETE_GROUP_RESULT broadcasts the result of deleting a contact group.
 *  <br><b>Purpose:</b> After the UI invokes EabApi.deleteGroup to delete a contact group, the SDK sends EabApi.EVENT_EAB_DELETE_GROUP_RESULT to notify the UI of the deletion result. The UI needs to
 *  determine whether the deletion is successful by the operation result code. If the deletion is successful, the UI obtains the deleted contact group name from the broadcast parameter. It is recommended
 *  that the UI invoke EabApi.getGroupList to obtain the contact group lists again after it receives the EabApi.EVENT_EAB_DELETE_GROUP_RESULT broadcast.
 *  <p>The broadcast will have the following extra value:
 *  <ul>
 *     <li><em>{@link PARAM_EAB_GROUP_NAME}</em></li> - [NSString *]
 *     <li><em>{@link PARAM_EAB_RESULT_CODE}</em></li> - [int]
 *  </ul>
 */
#define EVENT_EAB_DELETE_GROUP_RESULT @"EVENT_EAB_DELETE_GROUP_RESULT"

/** <b>Description:</b> EabApi.EVENT_EAB_BE_ADDED_CONTACT notifies a subscriber that the subscriber is added as a contact by another subscriber.
 *  <br><b>Purpose:</b> After the UI invokes EabGroup.addContact to add a subscriber to one of its own contact group, the SDK sends EabApi.EVENT_EAB_BE_ADDED_CONTACT to that subscriber. When a subscriber
 *  adds another subscriber as a contact, the first subscriber does not need the approval of the second subscriber. If the second subscriber also wants to add the first subscriber as a contact, the second
 *  subscriber can invoke EabGroup.addContact.
 *  <p>The broadcast will have the following extra value:
 *  <ul>
 *     <li><em>{@link PARAM_EAB_CONTACT_URI}</em></li> - [NSString *]
 *  </ul>
 */
#define EVENT_EAB_BE_ADDED_CONTACT @"EVENT_EAB_BE_ADDED_CONTACT"


/** <b>Description:</b> EVENT_EAB_SEARCH_SERVER_STRUCTURE_INFO_RESULT broadcasts the result of search structures in the EAB.
 *  <br><b>Purpose:</b> After the UI invokes EabApi.searchServerEnterpriseStructure to search contacts in the EAB, the SDK sends the matched contacts in the EabApi.EVENT_EAB_SEARCH_SERVER_STRUCTURE_INFO_RESULT broadcast
 *  to the UI. When invoking EabApi.searchServerEnterpriseStructure, the UI can specify the page number and the maximum number of records can be displayed on a page.
 *  <p>The broadcast will have the following extra value:
 *  <ul>
 *     <li><em>{@link PARAM_EAB_COOKIE}</em></li> - [long]
 *     <li><em>{@link PARAM_EAB_CONTACT_LIST}</em></li> - [NSMutableArray *]
 *     <li><em>{@link PARAM_EAB_DEPT_LIST}</em></li> - [NSMutableArray *]
 *     <li><em>{@link PARAM_EAB_START_PAGE}</em></li> - [long]
 *     <li><em>{@link PARAM_EAB_PAGE_SIZE}</em></li> - [long]
 *     <li><em>{@link PARAM_EAB_TOTAL_DEPT_COUNT}</em></li> - [long]
 *     <li><em>{@link PARAM_EAB_TOTAL_EMPLOYEE_COUNT}</em></li> - [long]
 *     <li><em>{@link PARAM_EAB_RESULT_CODE}</em></li> - [int]
 *  </ul>
 */
#define EVENT_EAB_SEARCH_SERVER_STRUCTURE_INFO_RESULT @"EVENT_EAB_SEARCH_SERVER_STRUCTURE_INFO_RESULT"

/** This enumeration is used to indicates the contact type. */
typedef enum tag_EAB_CONTACT_TYPE
{
    EAB_CONTACT_TYPE_ENTERPRISE             = 0,    /**< @brief Indicates an enterprise contact. */
    EAB_CONTACT_TYPE_CUSTOM                 = 1,    /**< @brief Indicates a custom contact. */
    EAB_CONTACT_TYPE_BUTT                   = 255   /**< @brief Indicates the default value. */
} EAB_CONTACT_TYPE;

/** This enumeration is used to indicates the contact group change type. */
typedef enum tag_EAB_CONTACT_GROUP_CHANGE_TYPE
{
    EAB_CONTACT_GROUP_ADD      = 0,                 /**<  group is added. */
    EAB_CONTACT_GROUP_UPDATE   = 1,                 /**<  group is update. */
    EAB_CONTACT_GROUP_DELETE   = 2,                 /**<  group is deleted. */
    EAB_CONTACT_GROUP_CHANGE_BUTT   = 255,          /**<  the deault type. */
}EAB_CONTACT_GROUP_CHANGE_TYPE;


/** This enumeration is used to indicates operation result. */
typedef enum tag_EAB_RESULT_CODE
{
    EAB_RESULT_CODE_OK,             /**< @brief Indicates that the operation result is successful. */
    EAB_RESULT_CODE_SERVER_ERROR,    /**< @brief Indicates that the operation result is failed. */
    EAB_RESULT_CODE_CONTACT_SEARCH_OVER_MAX_NUM    /**< @brief Indicates that the search result is over Max Amount Defined By Server. */
} EAB_RESULT_CODE;

/** This enumeration is used to indicates the main parameter type of EAB. It can be used as an input parameter of the EabApi.getConfig:minorType: method and EabApi.setConfig:minorType:configValue: method.*/
typedef enum tag_EAB_CFG_MAJOR_TYPE
{
    EAB_CFG_MAJOR_EAB_IP                    = 0,            /**< @brief Indicates that config major type is the IP address of the EAB server. */
    EAB_CFG_MAJOR_PGM_IP                    = 1,            /**< @brief Indicates that config major type is the IP address of the PGM server. */
    EAB_CFG_MAJOR_BUTT                      = 0x7FFFFFFF    /**< @brief Indicates that config major type is an unknown type. */
} EAB_CFG_MAJOR_TYPE;

/** This enumeration is used to indicates that config minor type value. It can be used as an input parameter of the EabApi.getConfig:minorType: method and EabApi.setConfig:minorType:configValue: method.*/
typedef enum tag_EAB_CFG_MINOR_TYPE
{
    EAB_CFG_MINOR_BUTT                      = 0x7FFFFFFF    /**< @brief Indicates that config minor type is an unknown type. */
} EAB_CFG_MINOR_TYPE;

/** The following begin to define EAB database tables and fileds. */
#define TBNAME_EAB_CONTACT         @"tb_eabContact"   /**< EAB contact table name. */

#define TBFLD_EABCNT_CNT_ID        @"contactId"       /**< Indicates contact ID, [0][integer primary key]. */
#define TBFLD_EABCNT_CNT_URI       @"contactUri"      /**< Indicates contact URI, [1][char(128)]. */
#define TBFLD_EABCNT_NAME          @"name"            /**< Indicates name, [2][char(128)]. */
#define TBFLD_EABCNT_NAT_NAME      @"nativeName"      /**< Indicates native name, [3][char(128)]. */
#define TBFLD_EABCNT_ACCOUNT       @"account"         /**< Indicates account, [4][char(128)]. */
#define TBFLD_EABCNT_SRV_NUM       @"serviceNumber"   /**< Indicates service number, [5][char(128)]. */
#define TBFLD_EABCNT_WORK_ID       @"workId"          /**< Indicates work ID, [6][char(128)]. */
#define TBFLD_EABCNT_GENDER        @"gender"          /**< Indicates gender, [7][char(128)]. */
#define TBFLD_EABCNT_TITLE         @"title"           /**< Indicates title, [8][char(128)]. */
#define TBFLD_EABCNT_COMPANY       @"company"         /**< Indicates company, [9][char(128)]. */
#define TBFLD_EABCNT_DEPARTMENT    @"department"      /**< Indicates department, [10][char(128)]. */
#define TBFLD_EABCNT_MBL_PHONE     @"mobilePhone"     /**< Indicates mobile phone, [11][char(128)]. */
#define TBFLD_EABCNT_FIX_PHONE     @"fixedPhone"      /**< Indicates fixed phone, [12][char(128)]. */
#define TBFLD_EABCNT_OTH_PHONE     @"otherPhone"      /**< Indicates other phone, [13][char(128)]. */
#define TBFLD_EABCNT_FAX           @"fax"             /**< Indicates fax, [14][char(128)]. */
#define TBFLD_EABCNT_EXTENSION     @"extension"       /**< Indicates extension, [15][char(128)]. */
#define TBFLD_EABCNT_EMAIL         @"email"           /**< Indicates email, [16][char(128)]. */
#define TBFLD_EABCNT_ZIPCODE       @"zipCode"         /**< Indicates zipcode, [17][char(128)]. */
#define TBFLD_EABCNT_ADDRESS       @"address"         /**< Indicates address, [18][char(128)]. */
#define TBFLD_EABCNT_SIGNATURE     @"signature"       /**< Indicates signature, [19][char(128)]. */
#define TBFLD_EABCNT_IS_STRANGER   @"isStranger"      /**< Indicates is stranger, [20][int]. */
#define TBFLD_EABCNT_ETAG          @"etag"            /**< Indicates etag, [21][char(64)]. */
#define TBFLD_EABCNT_TIMESTAMP     @"timeStamp"       /**< Indicates timestamp, [22][double]. */
#define TBFLD_EABCNT_CONTACT_TYPE  @"contactType"     /**< Indicates contact type, refer EAB_CONTACT_TYPE, [23][int]. */
#define TBFLD_EABCNT_DISPLAYNAME   @"displayName"     /**< Indicates display name, [24][char(128)]. */
#define TBFLD_EABCNT_DESCRIPTION   @"description"     /**< Indicates description, [25][char(128)]. */
#define TBFLD_EABCNT_HOME_PHONE    @"homePhone"      /**< Indicates home phone, [26][char(128)]. */

#define TBNAME_EAB_STRANGER        @"tb_eabStranger"  /**< EAB stranger table name. */

#define TBFLD_EABSTR_STR_ID        @"strangerId"      /**< Indicates stranger ID, [0][integer primary key]. */
#define TBFLD_EABSTR_STR_URI       @"strangerUri"     /**< Indicates stranger URI, [1][char(128)]. */
#define TBFLD_EABSTR_NAME          @"name"            /**< Indicates name, [2][char(128)]. */
#define TBFLD_EABSTR_NAT_NAME      @"nativeName"      /**< Indicates native name, [3][char(128)]. */
#define TBFLD_EABSTR_ACCOUNT       @"account"         /**< Indicates account, [4][char(128)]. */
#define TBFLD_EABSTR_SRV_NUM       @"serviceNumber"   /**< Indicates service number, [5][char(128)]. */
#define TBFLD_EABSTR_WORK_ID       @"workId"          /**< Indicates work ID, [6][char(128)]. */
#define TBFLD_EABSTR_GENDER        @"gender"          /**< Indicates gender, [7][char(128)]. */
#define TBFLD_EABSTR_TITLE         @"title"           /**< Indicates title, [8][char(128)]. */
#define TBFLD_EABSTR_COMPANY       @"company"         /**< Indicates company, [9][char(128)]. */
#define TBFLD_EABSTR_DEPARTMENT    @"department"      /**< Indicates department, [10][char(128)]. */
#define TBFLD_EABSTR_MBL_PHONE     @"mobilePhone"     /**< Indicates mobile phone, [11][char(128)]. */
#define TBFLD_EABSTR_FIX_PHONE     @"fixedPhone"      /**< Indicates fixed phone, [12][char(128)]. */
#define TBFLD_EABSTR_OTH_PHONE     @"otherPhone"      /**< Indicates other phone, [13][char(128)]. */
#define TBFLD_EABSTR_FAX           @"fax"             /**< Indicates fax, [14][char(128)]. */
#define TBFLD_EABSTR_EXTENSION     @"extension"       /**< Indicates extension, [15][char(128)]. */
#define TBFLD_EABSTR_EMAIL         @"email"           /**< Indicates email, [16][char(128)]. */
#define TBFLD_EABSTR_ZIPCODE       @"zipCode"         /**< Indicates zipcode, [17][char(128)]. */
#define TBFLD_EABSTR_ADDRESS       @"address"         /**< Indicates address, [18][char(128)]. */
#define TBFLD_EABSTR_SIGNATURE     @"signature"       /**< Indicates signature, [19][char(128)]. */
#define TBFLD_EABSTR_IS_STRANGER   @"isStranger"      /**< Indicates is stranger, [20][int]. */
#define TBFLD_EABSTR_ETAG          @"etag"            /**< Indicates etag, [21][char(64)]. */
#define TBFLD_EABSTR_TIMESTAMP     @"timeStamp"       /**< Indicates timestamp, [22][double]. */
#define TBFLD_EABSTR_HOME_PHONE    @"homePhone"       /**< Indicates home phone, [23][char(128)]. */

#define TBNAME_EAB_CONTACT_GRP     @"tb_eabContactGroup" /**< EAB contact group table name. */

#define TBFLD_ECNTGRP_CNT_GRP_ID   @"contactGrpId"    /**< Indicates contact group ID, [0][integer primary key]. */
#define TBFLD_ECNTGRP_CNT_GRP_NAME @"contactGrpName"  /**< Indicates contact group name, [1][char(128)]. */
#define TBFLD_ECNTGRP_CNT_GRP_URI  @"contactGrpUri"   /**< Indicates contact group URI, [2][char(128)]. */
#define TBFLD_ECNTGRP_ETAG         @"etag"            /**< Indicates etag, [3][char(64)]. */

#define TBNAME_EAB_MAP_RELATION    @"tb_eabMapRelation"  /**< EAB map relation table name. */

#define TBFLD_EMAPREL_MAP_REL_ID   @"mapRelationId"   /**< Indicates map relation ID, [0][integer primary key]. */
#define TBFLD_EMAPREL_CNT_GRP_NAME @"contactGrpName"  /**< Indicates contact group name, [1][char(128)]. */
#define TBFLD_EMAPREL_CNT_URI      @"contactUri"      /**< Indicates contact URI, [2][char(128)]. */

/**
 * <b>Description:</b> The EabContact class is an abstract of detailed information about a contact. It includes the following fields: name, name in native language, account, service number, URI, employee ID, gender,
 * company, department, position, mobile phone number, fixed phone number, other telephone number, fax number, short number, email address, zip code, address, and personal description. Some of these fields may be
 * left empty. If a field is left empty, the SDK returns nil to the UI. Information about contacts is configured and managed by the server administrator. The UI can identify which group a contact belongs by the
 * EabContact class.
 * <br><b>Purpose:</b> Objects of the EabContact class can be the returned value of the EabApi.getContactInfo method or can be broadcast parameters sent to the UI. The UI can invoke methods of this class to obtain
 * detailed information about a contact.
 */
@interface EabContact : NSObject <NSCopying>
{
@private
    int _contactType;
    NSString *_name;
    NSString *_nativeName;
    NSString *_account;
    NSString *_serviceNumber;
    NSString *_uri;
    NSString *_workId;
    NSString *_gender;
    NSString *_title;
    NSString *_company;
    NSString *_department;
    NSString *_mobilePhone;
    NSString *_fixedPhone;
    NSString *_homePhone;
    NSString *_otherPhone;
    NSString *_fax;
    NSString *_extension;
    NSString *_email;
    NSString *_zipcode;
    NSString *_address;
    NSString *_signature;
    NSString *_displayName;
    NSString *_description;
    BOOL _isStranger;
    NSMutableArray *_groupList;
}

/**
 * <b>Description:</b> This property is used to obtain the contact type.
 * <br><b>Purpose:</b> The UI gets this property to obtain the contact type.
 * @return Indicates the contact type @ref EAB_CONTACT_TYPE.
 */
@property(nonatomic, assign) int contactType;

/**
 * <b>Description:</b> This property is used to obtain a contact's name.
 * <br><b>Purpose:</b> The UI gets this property to obtain a contact's name.
 * @return Indicates a contact's name.
 */
@property(nonatomic, retain) NSString *name;

/**
 * <b>Description:</b> This property is used to obtain a contact's name in native language.
 * <br><b>Purpose:</b> The UI gets this property to obtain a contact's name in native language.
 * @return Indicates a contact's name in native language.
 */
@property(nonatomic, retain) NSString *nativeName;

/**
 * <b>Description:</b> This property is used to obtain a contact's account.
 * <br><b>Purpose:</b> The UI gets this property to obtain a contact's account.
 * @return Indicates a contact's account.
 */
@property(nonatomic, retain) NSString *account;

/**
 * <b>Description:</b> This property is used to obtain a contact's service number.
 * <br><b>Purpose:</b> The UI gets this property to obtain a contact's service number.
 * @return Indicates a contact's service number.
 */
@property(nonatomic, retain) NSString *serviceNumber;

/**
 * <b>Description:</b> This property is used to obtain a contact's URI.
 * <br><b>Purpose:</b> The UI gets this property to obtain a contact's URI.
 * @return Indicates a contact's URI.
 */
@property(nonatomic, retain) NSString *uri;

/**
 * <b>Description:</b> This property is used to obtain a contact's employee ID.
 * <br><b>Purpose:</b> The UI gets this property to obtain a contact's employee ID.
 * @return Indicates a contact's employee ID.
 */
@property(nonatomic, retain) NSString *workId;

/**
 * <b>Description:</b> This property is used to obtain a contact's gender.
 * <br><b>Purpose:</b> The UI gets this property to obtain a contact's gender.
 * @return Indicates a contact's gender.
 */
@property(nonatomic, retain) NSString *gender;

/**
 * <b>Description:</b> This property is used to obtain a contact's position.
 * <br><b>Purpose:</b> The UI gets this property to obtain a contact's position.
 * @return Indicates a contact's position.
 */
@property(nonatomic, retain) NSString *title;

/**
 * <b>Description:</b> This property is used to obtain the name of the company for which a contact works.
 * <br><b>Purpose:</b> The UI gets this property to obtain the name of the company for which a contact works.
 * @return Indicates the name of the company for which a contact works.
 */
@property(nonatomic, retain) NSString *company;

/**
 * <b>Description:</b> This property is used to obtain the name of the department in which a contact works.
 * <br><b>Purpose:</b> The UI gets this property to obtain the name of the department in which a contact works.
 * @return Indicates the name of the department in which a contact works.
 */
@property(nonatomic, retain) NSString *department;

/**
 * <b>Description:</b> This property is used to obtain a contact's mobile phone number.
 * <br><b>Purpose:</b> The UI gets this property to obtain a contact's mobile phone number.
 * @return Indicates a contact's mobile phone number.
 */
@property(nonatomic, retain) NSString *mobilePhone;

/**
 * <b>Description:</b> This property is used to obtain a contact's fixed phone number.
 * <br><b>Purpose:</b> The UI gets this property to obtain a contact's fixed phone number.
 * @return Indicates a contact's fixed phone number.
 */
@property(nonatomic, retain) NSString *fixedPhone;

/**
 * <b>Description:</b> This property is used to obtain a contact's home phone number.
 * <br><b>Purpose:</b> The UI gets this property to obtain a contact's home phone number.
 * @return Indicates a contact's home phone number.
 */
@property(nonatomic, retain) NSString *homePhone;

/**
 * <b>Description:</b> This property is used to obtain a contact's other phone number.
 * <br><b>Purpose:</b> The UI gets this property to obtain a contact's other phone number.
 * @return Indicates a contact's other phone number.
 */
@property(nonatomic, retain) NSString *otherPhone;

/**
 * <b>Description:</b> This property is used to obtain a contact's fax number.
 * <br><b>Purpose:</b> The UI gets this property to obtain a contact's fax number.
 * @return Indicates a contact's fax number.
 */
@property(nonatomic, retain) NSString *fax;

/**
 * <b>Description:</b> This property is used to obtain a contact's short number.
 * <br><b>Purpose:</b> The UI gets this property to obtain a contact's short number.
 * @return Indicates a contact's short number.
 */
@property(nonatomic, retain) NSString *extension;

/**
 * <b>Description:</b> This property is used to obtain a contact's email address.
 * <br><b>Purpose:</b> The UI gets this property to obtain a contact's email address.
 * @return Indicates a contact's email address.
 */
@property(nonatomic, retain) NSString *email;

/**
 * <b>Description:</b> This property is used to obtain the zip code of a contact.
 * <br><b>Purpose:</b> The UI gets this property to obtain the zip code of a contact.
 * @return Indicates the zip code of contact.
 */
@property(nonatomic, retain) NSString *zipcode;

/**
 * <b>Description:</b> This property is used to obtain a contact's address.
 * <br><b>Purpose:</b> The UI gets this property to obtain a contact's address.
 * @return Indicates a contact's address.
 */
@property(nonatomic, retain) NSString *address;

/**
 * <b>Description:</b> This property is used to obtain a contact's signature.
 * <br><b>Purpose:</b> The UI gets this property to obtain a contact's signature.
 * @return Indicates a contact's signature.
 */
@property(nonatomic, retain) NSString *signature;

/**
 * <b>Description:</b> This property is used to obtain a contact's displayname.
 * <br><b>Purpose:</b> The UI gets this property to obtain a contact's displayname.
 * @return Indicates a contact's displayname.
 */
@property(nonatomic, retain) NSString *displayName;

/**
 * <b>Description:</b> This property is used to obtain a contact's description.
 * <br><b>Purpose:</b> The UI gets this property to obtain a contact's description.
 * @return Indicates a contact's description.
 */
@property(nonatomic, retain) NSString *description;

/**
 * <b>Description:</b> This property is used to determine whether a contact is a stranger or not.
 * <br><b>Purpose:</b> Strangers refer to subscribers who are not in the current login account's contact groups. For example, a subscriber and the current login account are in the same permanent group, but the
 * subscriber is not in any of the current login account's contact group. That is, the subscriber is a stranger to the current login account.
 * @return Indicates whether a contact is a stranger. The value NO indicates that a contact is not a stranger. The value YES indicates that a contact is a stranger.
 */
@property(nonatomic, assign) BOOL isStranger;

/**
 * <b>Description:</b> This property is used to obtain all the contact groups to which a contact belongs.
 * <br><b>Purpose:</b> The UI invokes getGroupList to obtain all the contact groups to which a contact belongs.
 * @return Indicates a list a contact groups. If a contact is not in any contact group, the value nil is returned.
 */
@property(nonatomic, retain) NSMutableArray *groupList;

@end

/**
 * <b>Description:</b> EabContactSummary is an abstract of detailed information about a contact. It includes the fields name, account, and URI. Some fields may be left empty. If a field is left empty, the SDK
 * returns the value nil to the UI.
 * <br><b>Purpose:</b> The UI can invoke methods of the EabApi class to obtain all contacts in a specified contact group or all contacts in all contact groups. The returned value of the EabApi.getContactSummaryList
 * or EabApi.getGroupContactSummaryList method is a list of objects of the EabContactSummary class.
 */
@interface EabContactSummary : NSObject <NSCopying>
{
@private
    int _contactType;
    NSString *_uri;
    NSString *_name;
    NSString *_account;
}

/**
 * <b>Description:</b> This property is used to obtain the contact type.
 * <br><b>Purpose:</b> The UI gets this property to obtain the contact type.
 * @return Indicates the contact type @ref EAB_CONTACT_TYPE.
 */
@property(nonatomic, assign) int contactType;

/**
 * <b>Description:</b> This property is used to obtain a contact's URI.
 * <br><b>Purpose:</b> The UI gets this property to obtain a contact's URI. The server allocates a unique URI to a contact after the contact is created. The UI can obtain a contact's detailed information by its URI.
 * @return Indicates a contact's URI.
 */
@property(nonatomic, retain) NSString *uri;

/**
 * <b>Description:</b> This property is used to obtain a contact's name.
 * <br><b>Purpose:</b> The UI gets this property to obtain a contact's name.
 * @return Indicates a contact's name.
 */
@property(nonatomic, retain) NSString *name;

/**
 * <b>Description:</b> This property is used to obtain a contact's account.
 * <br><b>Purpose:</b> The UI gets this property to obtain a contact's account. Contact accounts may be used for display of contacts in a contact group or for detailed information display.
 * @return Indicates a contact's account.
 */
@property(nonatomic, retain) NSString *account;

@end

/**
 * <b>Description:</b> EabGroup is an abstract of a contact group object. A contact group has a URI, a name, and a contact quantity. After a contact group is created, the UI can add contacts
 * to the contact group, delete contacts from the contact group, or modify the contact group name.
 * <br><b>Purpose:</b> The UI can invoke methods of the EabApi class to create or delete contact groups or obtain all contact group lists. Then the UI can invoke methods of the EabGroup class
 * to obtain information about a contact group or operate contacts in a contact group.
 */
@interface EabGroup : NSObject <NSCopying>
{
@private
    NSString *_groupUri;
    NSString *_groupName;
    int _memberCount;
}

/**
 * <b>Description:</b> This property is used to obtain the URI of a contact group.
 * <br><b>Purpose:</b> The UI gets this property to obtain the URI of a contact group. The server allocates a unique URI to a contact group after the contact group is created.
 * @return Indicates a contact group URI.
 */
@property(nonatomic, retain) NSString *groupUri;

/**
 * <b>Description:</b> This property is used to obtain the name of a contact group.
 * <br><b>Purpose:</b> The UI gets this property to obtain the name of a contact group.
 * @return The value indicates the group name of an EabGroup object
 */
@property(nonatomic, retain) NSString *groupName;

/**
 * <b>Description:</b> This property is used to obtain the quantity of contacts in a contact group.
 * <br><b>Purpose:</b> The UI gets this property to obtain the quantity of contacts in a contact group.
 * @return Indicates the quantity of contacts in a contact group.
 */
@property(nonatomic, assign) int memberCount;

/**
 * <b>Description:</b> This method is used to modify the name of a contact group.
 * <br><b>Purpose:</b> The UI invokes modifyGroupName to modify the name of an existing contact group. The new name must not be the same as the old name or the name of any other existing
 * contact group. The SDK sends EabApi.EVENT_EAB_MOD_GROUP_NAME_RESULT to notify the UI of the modification result.
 * @param [in] newGroupName Specifies the new contact group name.
 * @return 0: Indicates that the UI successfully invokes the method.
 *     <br>1: Indicates that invoking the method fails.
 */
- (int)modifyGroupName:(NSString *)newGroupName;

/**
 * <b>Description:</b> This method is used to add an enterprise contact to a contact group.
 * <br><b>Purpose:</b> The UI invokes addContact to add an enterprise contact to one of its own existing contact group. The UI cannot add the same contact
 * to a group. The SDK sends EabApi.EVENT_EAB_ADD_CONTACT_RESULT to notify the UI of the addition result.
 * @param [in] contactUri Specifies the URI of a contact.
 * @return 0: Indicates that method is successfully invoked.
 *     <br>1: Indicates that invoking the method fails.
 */
- (int)addContact:(NSString *)contactUri;

/**
 * <b>Description:</b> This method is used to delete a contact from a contact group.
 * <br><b>Purpose:</b> The UI invokes deleteContact to delete a contact from one of its own existing contact group. The UI cannot delete a contact from a group to which the contact does not belong.
 * The SDK sends EabApi.EVENT_EAB_DELETE_CONTACT_RESULT notify the UI of the deletion result. Before invoking this method, it is recommanded that the UI should prompt the user with friendly information, 
 * such as a choice box for choosing to continue or cancel. The UI can present different information based on different situations.
 * @param [in] contactUri Specifies the URI of a contact.
 * @return 0: Indicates that the UI successfully invokes the method.
 *     <br>1: Indicates that invoking the method fails.
 */
- (int)deleteContact:(NSString *)contactUri;

/**
 * <b>Description:</b> This method is used to add a custom contact to a contact group.
 * <br><b>Purpose:</b> The UI invokes addCustomContact to add a custom contact to one of its own existing contact group.
 * The SDK sends EabApi.EVENT_EAB_ADD_CUSTOM_CONTACT_RESULT to notify the UI of the addition result.
 * @param [in] eabContact Specifies the added custom contact, the value of eabContact.contactType must be EabApi.CONTACT_TYPE_CUSTOM.
 * @param [in] cookie Identifies a adding operation.
 * @return 0: Indicates that method is successfully invoked.
 *     <br>1: Indicates that invoking the method fails.
 */
- (int)addCustomContact:(EabContact *)eabContact cookie:(int)cookie;

/**
 * <b>Description:</b> This method is used to update a custom contact.
 * <br><b>Purpose:</b> The UI invokes updateCustomContact to update a custom contact.
 * The SDK sends EabApi.EVENT_EAB_UPDATE_CUSTOM_CONTACT_RESULT to notify the UI of the updating result.
 * @param [in] eabContact Specifies the updated custom contact, the value of eabContact.contactType must be EabApi.CONTACT_TYPE_CUSTOM.
 * @return 0: Indicates that method is successfully invoked.
 *     <br>1: Indicates that invoking the method fails.
 */
- (int)updateCustomContact:(EabContact *)eabContact;

/**
 * <b>Description:</b> This method is used to move a contact from one group to another group.
 * <br><b>Purpose:</b> The UI invokes moveContact to move a contact from one contact group to another contact group. The moved contact can be a UC contact or a custom contact.
 * The SDK sends EabApi.EVENT_EAB_MOVE_CONTACT_RESULT to notify the UI of the moving result.
 * @param [in] contactUri Specifies the URI of a contact.
 * @param [in] groupName Specifies the contact group that the contact is moved to.
 * @return 0: Indicates that the UI successfully invokes the method.
 *     <br>1: Indicates that invoking the method fails.
 */
- (int)moveContact:(NSString *)contactUri toGroup:(NSString *)groupName;

@end


/**
 * <b>Description:</b> EabDept is an abstract of detailed information about a enterprise department. It includes the fields name and code.
 * <br><b>Purpose:</b> When the UI invoke EabApi.searchServerEnterpriseStructure method to obtain all department info, it will return a list of department info.
 */
@interface EabDept : NSObject <NSCopying>
{
@private
    NSString *_name;
    NSString *_code;
}

/**
 * <b>Description:</b> This property is used to obtain a department's name.
 * <br><b>Purpose:</b> The UI gets this property to obtain a department's name.
 * @return Indicates a department's name.
 */
@property(nonatomic, retain) NSString *name;

/**
 * <b>Description:</b> This property is used to obtain a department's code.
 * <br><b>Purpose:</b> The UI gets this property to obtain a department's code.
 * @return Indicates a department's code.
 */
@property(nonatomic, retain) NSString *code;


@end

/**
 * <b>Description:</b> EabGroupChangeInfo is an abstract of a changed contact group object.
 * <br><b>Purpose:</b> After receiving the contact group lists from the server, the SDK sends EabApi.EVENT_EAB_GROUP_LIST_CHANGED to notify
 * the UI with the list of objects of the EabGroupChangeInfo class.
 */
@interface EabGroupChangeInfo : NSObject <NSCopying>
{
@private
    NSString *_groupName;
    int _changeType;
}

/**
 * <b>Description:</b> This property is used to obtain the name of the changed contact group.
 * <br><b>Purpose:</b> The UI gets this property to obtain the name of the changed contact group.
 * @return The value indicates the group name of an EabGroup object
 */
@property(nonatomic, retain) NSString *groupName;

/**
 * <b>Description:</b> This property is used to obtain the group change type.
 * <br><b>Purpose:</b> The UI gets this property to obtain the group change type.
 * @return Indicates the group change type @ref EAB_CONTACT_GROUP_CHANGE_TYPE.
 */
@property(nonatomic, assign) int changeType;


@end

/**
 * <b>Description:</b> A class of methods that provides the Enterprise Address Book (EAB) service.
 * <br><b>Purpose:</b> EabApi is an entry to methods that provides the EAB service. The UI invokes the methods provided by this class to access the APIs of the EAB component.
 */
@interface EabApi : NSObject
{

}

/**
 * <b>Description:</b> This method is used to initialize the EAB component.
 * <br><b>Purpose:</b> Before using methods provided by the EAB component, the UI needs to invoke this method to
 * initialize the EAB component. It is recommended that this method be invoked during system initialization.
 */
+ (void)init;

/**
 * <b>Description:</b> This method is used to deregister the EAB component.
 * <br><b>Purpose:</b> This method is used to deregister the EAB component.
 */
+ (void)destroy;

/**
 * <b>Description:</b> This method is used to obtain contact group lists of a subscriber.
 * <br><b>Purpose:</b> The UI invokes EabApi.getGroupList to obtain all contact group lists of the current login account from the local database of the SDK. The SDK obtains
 * the latest contact groups lists of the current login account from the server and sends them to the UI. It is recommended that the UI first obtain the locally stored contact
 * group lists, present them to the subscriber, and refresh the contact page of the client after receiving the latest contact group lists from the SDK. See EabApi.EVENT_EAB_GROUP_LIST_CHANGED.
 * @return The value indicates a list of contact groups. Each element in list is an EabGroup object. See EabGroup. If the local database of the SDK does not store any information about the
 * subscriber's contact group lists, the value nil is returned for this method.
 */
+ (NSMutableArray *)getGroupList;

/**
 * <b>Description:</b> This method is used to obtain details of a contact by the URI.
 * <br><b>Purpose:</b> The UI invokes EabApi.getContactInfo to obtain detailed information about a contact by the URI from the local database of the SDK. When the contact is an enterprise
 * contact, if the local database of the SDK does not store detailed information about this contact, the value nil is returned for this method and the SDK request detailed information about
 * this contact from the server and sends the information in the EabApi.EVENT_EAB_CONTACT_INFO_CHANGED broadcast to the UI. If the local database of the SDK stores detailed information about
 * this contact, and the information has been stored for shorter than 24 hours, the SDK directly sends the information to UI. If the detailed information about this contact has been stored
 * for longer than 24 hours, the SDK requests the latest detailed information about this contact from the server, and sends the information in the EabApi.EVENT_EAB_CONTACT_INFO_CHANGED
 * broadcast to the UI.
 * @param [in] contactUri Specifies a contact's URI.
 * @return The value indicates an object of the EabContact class.
 */
+ (EabContact *)getContactInfo:(NSString *)contactUri;

/**
 * <b>Description:</b> This method is used to obtain the summary information about an enterprise-contact based on the contactUri parameter.
 * <br><b>Purpose:</b> When the UI needs to obtain the summary information about an enterprise-contact specified by
 * the contact-uri, the UI can invoke this method. For details, see EabContactSummary.
 * @param [in] contactUri Specifies the contact-uri of a enterprise-contact
 * @return The value indicates a EabContactSummary object specified by the contact-uri. If the information cannot be found, "nil" is returned.
 */
+ (EabContactSummary *)getContactSummary:(NSString *)contactUri;

/**
 * <b>Description:</b> EabApi.getContactSummaryList is used to obtain all contacts in all contact groups.
 * <br><b>Purpose:</b> The UI invokes EabApi.getContactSummaryList to obtain all contacts in all contact group lists. The SDK obtains the contacts from the local database and send them to the UI.
 * @param [in] listFilter Specifies the type of EabContactSummary to be obtained. 
 * If the value of this parameter is equal to 0, all EabcContactSummary are to be obtained.
 * @return Indicates a list of all contacts. Each element in the list is an EabContactsSummary object. See EabContactsSummary. The contacts in the list are arranged in alphabetical order.
 */
+ (NSMutableArray *)getContactSummaryList:(int)listFilter;

/**
 * <b>Description:</b> EabApi.getGroupContactSummaryList is used to obtain contacts in a specified contact group.
 * <br><b>Purpose:</b> The UI invokes EabApi.getGroupContactSummaryList to obtain brief information about all contacts in a specified contact group from the local database. When the UI needs
 * to display all contacts in a contact group, it can invoke this method. Generally, this method is used with the EabApi. getGroupList method. After the UI obtains the contacts, it can invoke
 * EabApi.getContactInfo to obtain detailed information about these contacts.
 * @param [in] groupName Specifies a contact group
 * @param [in] 	 listFilter Specifies the type of EabContactSummary to be obtained. 
 * If the value of this parameter is equal to 0, all EabContactSummary of the specified group are to be obtained.
 * @return Indicates a list of all contacts in a specified contact group. Each element in the list is an EabContactsSummary object. See EabContactsSummary. The contacts in the list are arranged
 * in reverse alphabetical order.
 */
+ (NSMutableArray *)getGroupContactSummaryList:(NSString *)groupName withFilter:(int)listFilter;

/**
 * <b>Description:</b> EabApi.searchContact is used to search contacts in the local database.
 * <br><b>Purpose:</b> The UI invokes EabApi.searchContact to search contacts by key words from the local database. The SDK search contacts from the contact names and accounts.
 * @param [in] lookupKey Specifies a keyword by which the SDK searches contacts. The SDK does not screen spaces in a keyword.
 * @return Indicates a list of matched contacts. Each element in the list is an EabContactsSummary object that specifies brief information about a contact. See EabContactsSummary. If no matched
 * contact is found, the SDK returns the value nil.
 */
+ (NSMutableArray *)searchContact:(NSString *)lookupKey;

/**
 * <b>Description:</b> EabApi.searchServerContact is used to search enterprise contacts in the EAB in the server. The search results can be paginated.
 * <br><b>Purpose:</b> The UI invokes EabApi.searchServerContact to search enterprise contacts in the EAB in the server by a keyword. The SDK supports only search by name, telephone number, account, or
 * email address. The SDK sends the search results in the EabApi.EVENT_EAB_SEARCH_SERVER_CONTACT_RESULT broadcast to the UI.
 * @param [in] cookie Specifies the search cookie and identifies a search.
 * @param [in] lookupKey Specifies a keyword by which the SDK searches contacts. The SDK does not screen spaces in a keyword.
 * @param [in] startPage Specifies the start page number. The minimum value is 1.
 * @param [in] pageSize Specifies the number of contacts displayed on each page. The value range is 1-100.
 * @return 0: Indicates that the UI successfully invokes the method.
 *     <br>1: Indicates that invoking the method fails.
 */
+ (int)searchServerContact:(int)cookie lookupKey:(NSString *)lookupKey startPage:(int)startPage pageSize:(int)pageSize;

/**
 * <b>Description:</b> EabApi.createGroup is used to create a contact group.
 * <br><b>Purpose:</b> The server places a limit on the number of contact groups for a subscriber. If the number of contact groups for a subscriber has reached the limit, the subscriber will
 * fail to create any new contact group. A contact group name is specified by the UI during creation of the contact group. The name of a contact group cannot be the same as the name of an
 * existing contact group, so that the UI can identify a contact group by the contact group name. The SDK sends EabApi.EVENT_EAB_CREATE_GROUP_RESULT to notify the UI of the creation result.
 * @param [in] groupName Specifies a contact group
 * @return 0: Indicates that the UI successfully invokes the method.
 *     <br>1: Indicates that invoking the method fails.
 */
+ (int)createGroup:(NSString *)groupName;

/**
 * <b>Description:</b> EabApi.deleteGroup is used to delete a contact group.
 * <br><b>Purpose:</b> When the UI invokes EabApi.deleteGroup, the SDK deletes a contact group and all contacts in that contact group. The SDK sends EabApi.EVENT_EAB_DELETE_GROUP_RESULT to
 * notifies the UI of the deletion result. Before invoking this method, it is recommanded that the UI should prompt the user with friendly information, such as a choice box for choosing to continue or cancel. 
 * The UI can present different information based on different situations.
 * @param [in] groupName Specifies a contact group
 * @return 0: Indicates that the UI successfully invokes the method.
 *     <br>1: Indicates that invoking the method fails.
 */
+ (int)deleteGroup:(NSString *)groupName;

/**
 * <b>Description:</b> EabApi.setConfig is used to set parameters for the EAB component.
 * <br><b>Purpose:</b> After a successful login by unified authentication, the UI needs to invoke UportalApi.getParam to obtain the parameters required for the EAB component and then invoke
 * EabApi.setConfig to set parameters for the EAB component. The UI can initiate services provided by the EAB component after the UI sets all required parameters for the component.
 * @param [in] majorType Specifies the type of major parameters.
 * @param [in] minorType Specifies the type of minor parameters.
 * @param [in] configValue Specifies the value of a parameter.
 * @return 0: Indicates that the UI successfully invokes the method.
 *     <br>1: Indicates that invoking the method fails.
 */
+ (int)setConfig:(int)majorType minorType:(int)minorType configValue:(NSString *)configValue;

/**
 * <b>Description:</b> EabApi.getConfig is used to obtain the values of the parameters required for the EAB component of the SDK.
 * <br><b>Purpose:</b> The UI invokes EabApi.getConfig to obtain the values of the parameters required for the EAB component.
 * @param [in] majorType Specifies the type of major parameters.
 * @param [in] minorType Specifies the type of minor parameters.
 * @return Indicates the values of the parameters. If the UI has not set any parameter value, the SDK returns the value nil.
 */
+ (NSString *) getConfig:(int)majorType minorType:(int)minorType;

/**
 * <b>Description:</b> EabApi.searchServerEnterpriseStructure is used to search enterprise organizational structure in the server. The search results can be paginated.
 * <br><b>Purpose:</b> The UI invokes EabApi.searchServerEnterpriseStructure to search contacts in the EAB in the server by a keyword. The SDK sends the search results in the EabApi.EVENT_EAB_SEARCH_SERVER_STRUCTURE_INFO_RESULT broadcast to the UI.
 * @param [in] cookie Specifies the search cookie and identifies a search.
 * @param [in] lookupKey Specifies a keyword by which the SDK searches contacts. The UI can only set it to "ROOT".
 * @param [in] startPage Specifies the start page number. The minimum value is 1.
 * @param [in] pageSize Specifies the number of contacts displayed on each page. The value range is 1-100.
 * @param [in] searchType Specifies the search type. The UI can only set it to 0.
 * @return 0: Indicates that the UI successfully invokes the method.
 *     <br>1: Indicates that invoking the method fails.
 */
+ (int)searchServerEnterpriseStructure:(int)cookie lookupKey:(NSString *)lookupKey startPage:(int)startPage pageSize:(int)pageSize searchType:(int)searchType;

/**
 * <b>Description:</b> EabApi.deleteContactInAllGroups is used to delete a contact in all groups.
 * <br><b>Purpose:</b> When the UI invokes EabApi.deleteContactInAllGroups, the SDK deletes a contact that in all contact groups. The deleted contact can be a UC contact or a custom contact.
 * The SDK sends EabApi.EVENT_EAB_DELETE_CONTACT_IN_ALL_GROUP_RESULT to notifies the UI of the deletion result. Before invoking this method, it is recommanded that the UI should 
 * prompt the user with friendly information, such as a choice box for choosing to continue or cancel. The UI can present different information based on different situations.
 * @param [in] contactUri Specifies a contact's URI.
 * @return 0: Indicates that the UI successfully invokes the method.
 *     <br>1: Indicates that invoking the method fails.
 */
+ (int)deleteContactInAllGroups:(NSString *)contactUri;

@end

#endif
