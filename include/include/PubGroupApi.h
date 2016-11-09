/**
 * @file PubGroupApi.h
 * @brief Public Group Interface Functions
 */
#ifndef _PUBGROUP_API_H_
#define _PUBGROUP_API_H_
#import <UIKit/UIKit.h>


/**
 * This constant can be a broadcast parameter that specifies the operation result code. See the constants defined in PubGroupApi, for example, {@link PUBGROUP_RESULT_CODE_ERR_NO}.
 * Its value is of unsigned long type.
 * @see tag_PUBGROUP_RESULT_ERR_TYPE
 */
#define PARAM_PUBGROUP_RESULT_CODE              @"PARAM_PUBGROUP_RESULT_CODE"

/**
 * This constant can be a broadcast parameter that uniquely identifies a permanent group.
 */
#define PARAM_PUBGROUP_GROUP_ID                 @"PARAM_PUBGROUP_GROUP_ID"

/**
 * This constant can be a broadcast parameter that specifies a group name.
 */
#define PARAM_PUBGROUP_GROUP_NAME               @"PARAM_PUBGROUP_GROUP_NAME"

/**
 * This constant can be a broadcast parameter that uniquely identifies a UC contact.
 */
#define PARAM_PUBGROUP_MEMBER_URI               @"PARAM_PUBGROUP_MEMBER_URI"

/**
 * This constant can be a broadcast parameter that uniquely identifies a group administrator.
 */
#define PARAM_PUBGROUP_OWNER_URI                @"PARAM_PUBGROUP_OWNER_URI"

/**
 * This constant can be a broadcast parameter that specifies the remarks for an administrator to invite a contact to the group or for a contact to request to join a group.
 */
#define PARAM_PUBGROUP_DETAIL_INFO              @"PARAM_PUBGROUP_DETAIL_INFO"

/**
 * This constant can be a broadcast parameter that specifies the response to a request for joining a group or an invitation to a group.
 * @see tag_PUBGROUP_OPINION_TYPE
 */
#define PARAM_PUBGROUP_OPINION                  @"PARAM_PUBGROUP_OPINION"

/**
 * This constant can be a broadcast parameter that indicates the group information change type.
 * @see tag_PUBGROUP_GROUP_STATE_TYPE
 */
#define PARAM_PUBGROUP_GROUP_STATE              @"PARAM_PUBGROUP_GROUP_STATE"

/**
 * This constant can be a broadcast parameter and has the following values:
 * <ul>
 *      <li><em>{@link PUBGROUP_MEMBER_STATE_ONLINE}</em></li>
 *      <li><em>{@link PUBGROUP_MEMBER_STATE_OFFLINE}</em></li>
 * </ul>

 */
#define PARAM_PUBGROUP_MEMBER_STATE             @"PARAM_PUBGROUP_MEMBER_STATE"

/**
 * This constant can be a broadcast parameter. Its value is the same as that of the cookie parameter set when the UI invokes a method.
 * The UI can determine by the cookie which operation a returned value is for.
 */
#define PARAM_PUBGROUP_COOKIE                   @"PARAM_PUBGROUP_COOKIE"

/**
 * It is a broadcast parameter indicates the array of group information.
 * @see PubGroup
 */
#define PARAM_PUBGROUP_GROUP_INFO_ARRAY         @"PARAM_PUBGROUP_GROUP_INFO_ARRAY"

/**
 * This constant can be a broadcast parameter that specifies the URL of a permanent group.
 */
#define PARAM_PUBGROUP_GROUP_URL                @"PARAM_PUBGROUP_GROUP_URL"

/**
 * This constant can be a broadcast parameter that specifies the added failed members when create group with member.
 */
#define PARAM_PUBGROUP_ADD_MEMBER_FAIL_ARRAY    @"PARAM_PUBGROUP_ADD_MEMBER_FAIL_ARRAY"


/** <b>Description:</b> This broadcast is used to broadcast the result of creating a permanent group. Only a group creator can receive this broadcast.
*  <br><b>Purpose:</b>  After the UI invokes PubGroupApi.create to create a permanent group and the SDK receives the creation result from the server,
* the SDK sends {@link EVENT_PUBGROUP_CREATE_GROUP_RSP} to notify the UI of the creation result. The UI can determine whether the creation
* is successful by the PARAM_PUBGROUP_RESULT_CODE parameter and inform the subscriber of the creation result.
* <p>The broadcast will have the following extra value:
* <ul>
*   <li><em>{@link PARAM_PUBGROUP_RESULT_CODE}</em></li> - [unsigned long]
*   <li><em>{@link PARAM_PUBGROUP_COOKIE}</em></li> - [unsigned long]
*   <li><em>{@link PARAM_PUBGROUP_GROUP_URL}</em></li> - [NSString*]
* </ul>
*/
#define EVENT_PUBGROUP_CREATE_GROUP_RSP         @"EVENT_PUBGROUP_CREATE_GROUP_RSP"

/** <b>Description:</b> This broadcast is used to broadcast the permanent group search result to the UI.
*  <br><b>Purpose:</b>  After the UI invokes PubGroupApi.searchGroup to search the server for permanent groups, the SDK,
* after receiving the search results from the server, sends {@link EVENT_PUBGROUP_SEARCH_GROUP_RSP} to notify the UI of all matched groups in one time.
* The UI needs to determine whether a search is successful by the PARAM_PUBGROUP_RESULT_CODE parameter.
* If a search is successful, the UI obtains the group list from the PARAM_PUBGROUP_GROUP_INFO_ARRAY parameter and displays the groups to the subscriber.
* <p>The broadcast will have the following extra value:
* <ul>
*   <li><em>{@link PARAM_PUBGROUP_RESULT_CODE}</em></li> - [unsigned long]
*   <li><em>{@link PARAM_PUBGROUP_GROUP_INFO_ARRAY}</em></li> - [NSMutableArray *]
*   <li><em>{@link PARAM_PUBGROUP_COOKIE}</em></li> - [unsigned long]
* </ul>
*/
#define EVENT_PUBGROUP_SEARCH_GROUP_RSP         @"EVENT_PUBGROUP_SEARCH_GROUP_RSP"

/** <b>Description:</b> This broadcast is used to broadcast the result of modifying a permanent group name. Only group administrators can receive this broadcast.
*  <br><b>Purpose:</b>  After the UI invokes PubGroup::modifyName to modify a permanent group name, the SDK,
* after receiving a response from the server, sends {@link EVENT_PUBGROUP_MODIFY_GROUP_NAME_RSP} to the UI.
* The UI needs to determine whether the modification is successful by the PARAM_PUBGROUP_RESULT_CODE parameter and notify the subscriber of the modification result.
* <p>The broadcast will have the following extra value:
* <ul>
*   <li><em>{@link PARAM_PUBGROUP_RESULT_CODE}</em></li> - [unsigned long]
*   <li><em>{@link PARAM_PUBGROUP_GROUP_ID}</em></li> - [NSString*]
* </ul>
*/
#define EVENT_PUBGROUP_MODIFY_GROUP_NAME_RSP    @"EVENT_PUBGROUP_MODIFY_GROUP_NAME_RSP"

/** <b>Description:</b> This broadcast is used to broadcast the result of modifying a permanent group introduction. Only group administrators can receive this broadcast.
*  <br><b>Purpose:</b>  After the UI invokes PubGroup::modifyDescription to modify a permanent group introduction, the SDK, after receiving a response from the server,
* sends {@link EVENT_PUBGROUP_MODIFY_GROUP_DESCRIPTION_RSP} to the UI. The UI needs to determine whether the modification is
* successful by the PARAM_PUBGROUP_RESULT_CODE parameter and notify the subscriber of the modification result.
* <p>The broadcast will have the following extra value:
* <ul>
*   <li><em>{@link PARAM_PUBGROUP_RESULT_CODE}</em></li> - [unsigned long]
*   <li><em>{@link PARAM_PUBGROUP_GROUP_ID}</em></li> - [NSString*]
* </ul>
*/
#define EVENT_PUBGROUP_MODIFY_GROUP_DESCRIPTION_RSP   @"EVENT_PUBGROUP_MODIFY_GROUP_DESCRIPTION_RSP"

/** <b>Description:</b> This broadcast is used to broadcast the result of modifying a permanent group bulletin. Only group administrators can receive this broadcast.
*  <br><b>Purpose:</b>  After the UI invokes PubGroup::modifyBulletin to modify a permanent group bulletin, the SDK, after receiving a response from the server,
* sends {@link EVENT_PUBGROUP_MODIFY_GROUP_BULLETIN_RSP} to the UI. The UI needs to determine whether the modification is successful
* by the PARAM_PUBGROUP_RESULT_CODE parameter and notify the subscriber of the modification result.
* <p>The broadcast will have the following extra value:
* <ul>
*   <li><em>{@link PARAM_PUBGROUP_RESULT_CODE}</em></li> - [unsigned long]
*   <li><em>{@link PARAM_PUBGROUP_GROUP_ID}</em></li> - [NSString*]
* </ul>
*/
#define EVENT_PUBGROUP_MODIFY_GROUP_BULLETIN_RSP      @"EVENT_PUBGROUP_MODIFY_GROUP_BULLETIN_RSP"

/** <b>Description:</b> This broadcast is used to broadcast the result of modifying the authentication mode for joining a group. Only group administrators can receive this broadcast.
*  <br><b>Purpose:</b>  After the UI invokes PubGroup::modifyPermit to modify the authentication mode for joining a group,
* the SDK, after receiving a response from the server, sends {@link EVENT_PUBGROUP_MODIFY_GROUP_PERMIT_RSP} to the UI.
* The UI needs to determine whether the modification is successful by the PARAM_PUBGROUP_RESULT_CODE parameter and notify the subscriber of the modification result.
* <p>The broadcast will have the following extra value:
* <ul>
*   <li><em>{@link PARAM_PUBGROUP_RESULT_CODE}</em></li> - [unsigned long]
*   <li><em>{@link PARAM_PUBGROUP_GROUP_ID}</em></li> - [NSString*]
* </ul>
*/
#define EVENT_PUBGROUP_MODIFY_GROUP_PERMIT_RSP        @"EVENT_PUBGROUP_MODIFY_GROUP_PERMIT_RSP"

/** <b>Description:</b> This broadcast is used to notify the UI whether a request that the group administrator sends to invite a UC contact to a group is successfully sent to the server.
* Only group administrators can receive this broadcast.
*  <br><b>Purpose:</b>  After the UI of a group administrator invokes PubGroup::addMember to invite a UC contact to a group, the SDK sends {@link EVENT_PUBGROUP_INVITE_MEMBER_RSP}
* to notify the UI whether the invitation is successfully sent to the server. The UI needs to determine by the PARAM_PUBGROUP_RESULT_CODE parameter whether the invitation is successfully sent.
* <p>The broadcast will have the following extra value:
* <ul>
*   <li><em>{@link PARAM_PUBGROUP_RESULT_CODE}</em></li> - [unsigned long]
*   <li><em>{@link PARAM_PUBGROUP_GROUP_ID}</em></li> - [NSString*]
*   <li><em>{@link PARAM_PUBGROUP_MEMBER_URI}</em></li> - [NSString*]
* </ul>
*/
#define EVENT_PUBGROUP_INVITE_MEMBER_RSP         @"EVENT_PUBGROUP_INVITE_MEMBER_RSP"

/** <b>Description:</b> This broadcast is used to broadcast the result of deleting a group member. Only group administrators can receive this broadcast.
*  <br><b>Purpose:</b>  After the UI of a group administrator invokes PubGroup::deleteMember to delete a group member from a permanent group,
* the SDK sends {@link EVENT_PUBGROUP_DELETE_MEMBER_RSP} to notify the UI of the deletion result.
* The UI needs to determine whether the deletion is successful by the PARAM_PUBGROUP_RESULT_CODE parameter and notify the administrator of the deletion result.
* <p>The broadcast will have the following extra value:
* <ul>
*   <li><em>{@link PARAM_PUBGROUP_RESULT_CODE}</em></li> - [unsigned long]
*   <li><em>{@link PARAM_PUBGROUP_GROUP_ID}</em></li> - [NSString*]
*   <li><em>{@link PARAM_PUBGROUP_MEMBER_URI}</em></li> - [NSString*]
* </ul>
*/
#define EVENT_PUBGROUP_DELETE_MEMBER_RSP         @"EVENT_PUBGROUP_DELETE_MEMBER_RSP"

/** <b>Description:</b> This broadcast is used to broadcast the result of transferring administrator rights. Only group administrators can receive this broadcast.
*  <br><b>Purpose:</b>  A group can have only one group administrator. The UI of a group administrator can invoke PubGroup::transferOwner to transfer administrator
* rights to another group member. The SDK sends {@link EVENT_PUBGROUP_TRANSFER_OWNER_RSP} to notify the UI whether the transfer request is successfully sent to the server.
* The UI needs to determine by the PARAM_PUBGROUP_RESULT_CODE parameter whether the transfer request is successfully sent and notifies the administrator of the transfer result.
* <p>The broadcast will have the following extra value:
* <ul>
*   <li><em>{@link PARAM_PUBGROUP_RESULT_CODE}</em></li> - [unsigned long]
*   <li><em>{@link PARAM_PUBGROUP_GROUP_ID}</em></li> - [NSString*]
* </ul>
*/
#define EVENT_PUBGROUP_TRANSFER_OWNER_RSP        @"EVENT_PUBGROUP_TRANSFER_OWNER_RSP"

/** <b>Description:</b> This broadcast is used to broadcast the result of accepting an invitation to a group.
*  <br><b>Purpose:</b>  When a UI receives an invitation to a group from a group administrator and the UI invokes PubGroupApi::acceptInvitation to accept the invitation,
* the SDK sends {@link EVENT_PUBGROUP_ACCEPT_INVITATION_RSP} to notify the UI of the result of joining the group.
* The UI needs to determine by the PARAM_PUBGROUP_RESULT_CODE parameter whether the subscriber successfully joins the group and notify the subscriber of the joining result.
* <p>The broadcast will have the following extra value:
* <ul>
*   <li><em>{@link PARAM_PUBGROUP_RESULT_CODE}</em></li> - [unsigned long]
*   <li><em>{@link PARAM_PUBGROUP_GROUP_ID}</em></li> - [NSString*]
* </ul>
*/
#define EVENT_PUBGROUP_ACCEPT_INVITATION_RSP     @"EVENT_PUBGROUP_ACCEPT_INVITATION_RSP"

/** <b>Description:</b> This broadcast is used to broadcast the result of rejecting an invitation to a group.
*  <br><b>Purpose:</b>  When the UI receives an invitation from a group administrator and the UI invokes PubGroupApi::rejectInvitation to reject the invitation,
* the SDK sends {@link EVENT_PUBGROUP_REJECT_INVITATION_RSP} to notify the UI of the result of rejecting the invitation.
* The UI needs to determine by the PARAM_PUBGROUP_RESULT_CODE parameter whether the rejection is successful and notify the subscriber of the result.
* <p>The broadcast will have the following extra value:
* <ul>
*   <li><em>{@link PARAM_PUBGROUP_RESULT_CODE}</em></li> - [unsigned long]
*   <li><em>{@link PARAM_PUBGROUP_GROUP_ID}</em></li> - [NSString*]
* </ul>
*/
#define EVENT_PUBGROUP_REJECT_INVITATION_RSP     @"EVENT_PUBGROUP_REJECT_INVITATION_RSP"

/** <b>Description:</b> This broadcast is used to notify the UI whether a request for joining a group is successfully sent to the server.
*  <br><b>Purpose:</b>  After the UI invokes PubGroup::join to request to join a permanent group, the SDK sends {@link EVENT_PUBGROUP_JOIN_GROUP_RSP} to notify the UI
* whether the request is successfully sent to the server. The UI needs to determine by the PARAM_PUBGROUP_RESULT_CODE parameter whether the request is successfully
* sent and notify the subscriber of the sending result.
* <p>The broadcast will have the following extra value:
* <ul>
*   <li><em>{@link PARAM_PUBGROUP_RESULT_CODE}</em></li> - [unsigned long]
*   <li><em>{@link PARAM_PUBGROUP_GROUP_ID}</em></li> - [NSString*]
* </ul>
*/
#define EVENT_PUBGROUP_JOIN_GROUP_RSP            @"EVENT_PUBGROUP_JOIN_GROUP_RSP"

/** <b>Description:</b> This broadcast is used to broadcast the result of accepting a request for joining a group.
*  <br><b>Purpose:</b>  When a group administrator receives a request for joining the group and the UI of the group administrator invokes PubGroupApi::acceptJoinReq to accept the request,
* the SDK sends {@link EVENT_PUBGROUP_ACCEPT_JOIN_REQ_RSP} to notify the UI whether the acceptance response is successfully sent to the server.
* The UI needs to determine by the PARAM_PUBGROUP_RESULT_CODE parameter whether the acceptance response is successfully sent to the server and notify the group administrator of the sending result.
* <p>The broadcast will have the following extra value:
* <ul>
*   <li><em>{@link PARAM_PUBGROUP_RESULT_CODE}</em></li> - [unsigned long]
*   <li><em>{@link PARAM_PUBGROUP_GROUP_ID}</em></li> - [NSString*]
*   <li><em>{@link PARAM_PUBGROUP_MEMBER_URI}</em></li> - [NSString*]
* </ul>
*/
#define EVENT_PUBGROUP_ACCEPT_JOIN_REQ_RSP       @"EVENT_PUBGROUP_ACCEPT_JOIN_REQ_RSP"

/** <b>Description:</b> This broadcast is used to broadcast the result of rejecting a request for joining a group.
*  <br><b>Purpose:</b>  When a group administrator receives a request for joining the group and the UI of the group administrator invokes PubGroupApi::rejectJoinReq
* to reject the request, the SDK sends {@link EVENT_PUBGROUP_REJECT_JOIN_REQ_RSP} to notify the UI whether the rejection response is successfully sent to the server.
* The UI needs to determine by the PARAM_PUBGROUP_RESULT_CODE parameter whether the rejection response is successfully sent to the server
* and notify the group administrator of the sending result.
* <p>The broadcast will have the following extra value:
* <ul>
*   <li><em>{@link PARAM_PUBGROUP_RESULT_CODE}</em></li> - [unsigned long]
*   <li><em>{@link PARAM_PUBGROUP_GROUP_ID}</em></li> - [NSString*]
*   <li><em>{@link PARAM_PUBGROUP_MEMBER_URI}</em></li> - [NSString*]
* </ul>
*/
#define EVENT_PUBGROUP_REJECT_JOIN_REQ_RSP       @"EVENT_PUBGROUP_REJECT_JOIN_REQ_RSP"

/** <b>Description:</b> This broadcast is used to broadcast the result of quitting a group. Only a contact who quits a group can receive this broadcast.
*  <br><b>Purpose:</b>  After the UI invokes PubGroup::exit to quit a permanent group, the SDK sends {@link EVENT_PUBGROUP_EXIT_GROUP_RSP} to notify the UI of result of quitting the group.
* The UI needs to determine by the PARAM_PUBGROUP_RESULT_CODE parameter whether quitting the group is successful and notifies the subscriber of the result.
* If quitting the group is successful, the UI refreshes the group list on the contact page of the client in order not to display the group which the subscriber has quit.
* <p>The broadcast will have the following extra value:
* <ul>
*   <li><em>{@link PARAM_PUBGROUP_RESULT_CODE}</em></li> - [unsigned long]
*   <li><em>{@link PARAM_PUBGROUP_GROUP_ID}</em></li> - [NSString*]
* </ul>
*/
#define EVENT_PUBGROUP_EXIT_GROUP_RSP            @"EVENT_PUBGROUP_EXIT_GROUP_RSP"

/** <b>Description:</b> This broadcast is used to broadcast the result of dismissing a group. Only group administrators can receive this broadcast.
*  <br><b>Purpose:</b>  After the UI of a group administrator invokes PubGroupApi::dismiss to dismiss a permanent group, the SDK sends {@link EVENT_PUBGROUP_DISMISS_GROUP_RSP}
* to notify the UI of the dismissal result. The UI needs to determine by the PARAM_PUBGROUP_RESULT_CODE parameter whether the group is successfully dismissed and notify
* the group administrator of the dismissal result.
* <p>The broadcast will have the following extra value:
* <ul>
*   <li><em>{@link PARAM_PUBGROUP_RESULT_CODE}</em></li> - [unsigned long]
*   <li><em>{@link PARAM_PUBGROUP_GROUP_ID}</em></li> - [NSString*]
* </ul>
*/
#define EVENT_PUBGROUP_DISMISS_GROUP_RSP         @"EVENT_PUBGROUP_DISMISS_GROUP_RSP"

/**
* <b>Description:</b> It is used to notify the UI of an invitation to a group. Only a subscriber who is invited can receive this broadcast.
* <br><b>Purpose:</b> After the UI of a group administrator invokes PubGroup::addMember to invite a UC contact to a group, the UC contact receives {@link EVENT_PUBGROUP_INVITE_INCOMING}.
* The UI of the UC contact can invoke PubGroupApi::acceptInvitation to accept the invitation or PubGroupApi::rejectInvitation to reject the invitation.
* <p>The broadcast will have the following extra values:
* <ul>
*   <li><em>{@link PARAM_PUBGROUP_GROUP_ID}</em></li> - [NSString*]
*   <li><em>{@link PARAM_PUBGROUP_GROUP_NAME}</em></li> - [NSString*]
*   <li><em>{@link PARAM_PUBGROUP_DETAIL_INFO}</em></li> - [NSString*]
*   <li><em>{@link PARAM_PUBGROUP_OWNER_URI}</em></li> - [NSString*]
* </ul>
*/
#define EVENT_PUBGROUP_INVITE_INCOMING           @"EVENT_PUBGROUP_INVITE_INCOMING"

/**
* <b>Description:</b> It is used to notify a group administrator of an invitee's reply to an invitation. Only group administrators can receive this broadcast.
* <br><b>Purpose:</b> The UI of a group administrator can invoke PubGroup.addMember to invite a UC contact to a group. After the invitee replies to the invitation,
* the SDK receives a response from the server and sends {@link EVENT_PUBGROUP_INVITE_RESULT} to notify the UI of the invitee's reply.
* <p>The broadcast will have the following extra values:
* <ul>
*   <li><em>{@link PARAM_PUBGROUP_GROUP_ID}</em></li> - [NSString*]
*   <li><em>{@link PARAM_PUBGROUP_GROUP_NAME}</em></li> - [NSString*]
*   <li><em>{@link PARAM_PUBGROUP_OPINION}</em></li> - [int]
*   <li><em>{@link PARAM_PUBGROUP_MEMBER_URI}</em></li>- [NSString*]
* </ul>
*/
#define EVENT_PUBGROUP_INVITE_RESULT             @"EVENT_PUBGROUP_INVITE_RESULT"

/**
* <b>Description:</b> It is used to notify a group administrator of a request for joining the permanent group.
* <br><b>Purpose:</b> The UI of a UC contact can invoke PubGroup.join to request to join a permanent group.
* If the authentication mode for the group is {@link PUBGROUP_PERMIT_TYPE_ADMIN_PERMIT}, the group administrator receives the {@link EVENT_PUBGROUP_JOIN_INCOMING} broadcast.
* The group administrator can invoke PubGroupApi::acceptJoinReq to accept the request or PubGroupApi::rejectJoinReq to reject the request.
* <p>The broadcast will have the following extra values:
* <ul>
*   <li><em>{@link PARAM_PUBGROUP_GROUP_ID}</em></li> - [NSString*]
*   <li><em>{@link PARAM_PUBGROUP_GROUP_NAME}</em></li> - [NSString*]
*   <li><em>{@link PARAM_PUBGROUP_DETAIL_INFO}</em></li> - [NSString*]
*   <li><em>{@link PARAM_PUBGROUP_OWNER_URI}</em></li> - [NSString*]
* </ul>
*/
#define EVENT_PUBGROUP_JOIN_INCOMING             @"EVENT_PUBGROUP_JOIN_INCOMING"

/**
* <b>Description:</b> It is used to notify a contact of the group administrator's reply to a request for joining a group. Only a contact who requests to join a group can receive this broadcast.
* <br><b>Purpose:</b> The UI of a UC contact can invoke PubGroup::join to request to join a permanent group. After the group administrator replies to the request,
* the SDK sends {@link EVENT_PUBGROUP_JOIN_RESULT} to notify the UI of the group administrator's reply.
* <p>The broadcast will have the following extra values:
* <ul>
*   <li><em>{@link PARAM_PUBGROUP_GROUP_ID}</em></li> - [NSString*]
*   <li><em>{@link PARAM_PUBGROUP_GROUP_NAME}</em></li> - [NSString*]
*   <li><em>{@link PARAM_PUBGROUP_OPINION}</em></li> - [int]
* </ul>
*/
#define EVENT_PUBGROUP_JOIN_RESULT               @"EVENT_PUBGROUP_JOIN_RESULT"

/**
* <b>Description:</b> It is used to notify a contact that information about a permanent group that the contact has joined is changed.
* <br><b>Purpose:</b> Each time a contact successfully logs in to the client, the SDK obtains the contact's latest group list from the server.
* If the group list obtained from the server is inconsistent with the locally stored one, the SDK sends {@link EVENT_PUBGROUP_GROUP_INFO_CHANGED} to
* notify the UI of the contact of the group information change. The UI of a subscriber can receive this broadcast after a successful login
* when: 1. A group administrator has changed the group name, introduction, bulletin, or authentication mode. 2. A group administrator has transferred administrator rights to another group member.
* 3. The subscriber has created a group. The subscriber has joined a new group. When the UI receives the PubGroupApi.EVENT_PUBGROUP_GROUP_INFO_CHANGED broadcast,
* it determines the change type by the PARAM_PUBGROUP_GROUP_STATE parameter, invokes PubGroupApi::queryGroupInfo to obtain the latest information, and refreshes the contact page of the client
* <p>The broadcast will have the following extra values:
* <ul>
*   <li><em>{@link PARAM_PUBGROUP_GROUP_STATE}</em></li> - [int]
*   <li><em>{@link PARAM_PUBGROUP_GROUP_ID}</em></li> - [NSString*]
*   <li><em>{@link PARAM_PUBGROUP_GROUP_URL}</em></li> - [NSString*]
* </ul>
*/
#define EVENT_PUBGROUP_GROUP_INFO_CHANGED        @"EVENT_PUBGROUP_GROUP_INFO_CHANGED"

/**
* <b>Description:</b> It is used to notify the UI that a new group member has joined a group.
* <br><b>Purpose:</b> When a UC contact successfully joins a group, the group administrator and the rest of the group members receives the {@link EVENT_PUBGROUP_MEMBER_ENTER} broadcast.
* The new group member will not receive this broadcast. A UC contact can request to join a group or can be invited to a group by the group administrator.
* <p>The broadcast will have the following extra values:
* <ul>
*   <li><em>{@link PARAM_PUBGROUP_GROUP_ID}</em></li> - [NSString*]
*   <li><em>{@link PARAM_PUBGROUP_GROUP_NAME}</em></li> - [NSString*]
*   <li><em>{@link PARAM_PUBGROUP_MEMBER_URI}</em></li> - [NSString*]
* </ul>
*/
#define EVENT_PUBGROUP_MEMBER_ENTER              @"EVENT_PUBGROUP_MEMBER_ENTER"

/**
* <b>Description:</b> It is used to notify the UI that a group member has quit a group.
* <br><b>Purpose:</b> When a group member quits a group or is deleted from a group by the group administrator, the group administrator and the rest of
* the group members receive the {@link EVENT_PUBGROUP_MEMBER_LEAVE} broadcast. The group member who has quit or has been deleted will not receive this broadcast.
* <p>The broadcast will have the following extra values:
* <ul>
*   <li><em>{@link PARAM_PUBGROUP_GROUP_ID}</em></li> - [NSString*]
*   <li><em>{@link PARAM_PUBGROUP_GROUP_NAME}</em></li> - [NSString*]
*   <li><em>{@link PARAM_PUBGROUP_MEMBER_URI}</em></li> - [NSString*]
* </ul>
*/
#define EVENT_PUBGROUP_MEMBER_LEAVE              @"EVENT_PUBGROUP_MEMBER_LEAVE"

/**
* <b>Description:</b> It is used to notify the UI that it has quit a group or is deleted from a group by the group administrator.
* <br><b>Purpose:</b> The UI of a group administrator can invoke PubGroup.deleteMember to delete a group member from a permanent group.
* If the deletion is successful, the group member who is deleted receives the {@link EVENT_PUBGROUP_SELF_DELETED} broadcast.
* The UI of the deleted group member can obtain the group URI from the broadcast parameter, identifies by the URI the group from which it is deleted, and refreshes the group list.
* The UI of a group member receives the {@link EVENT_PUBGROUP_SELF_DELETED} broadcast when the group member quits a group.
* Since the UI already identifies the group that it quits, it does not process the broadcast.
* <p>The broadcast will have the following extra values:
* <ul>
*   <li><em>{@link PARAM_PUBGROUP_GROUP_ID}</em></li> - [NSString*]
*   <li><em>{@link PARAM_PUBGROUP_GROUP_NAME}</em></li> - [NSString*]
* </ul>
*/
#define EVENT_PUBGROUP_SELF_DELETED              @"EVENT_PUBGROUP_SELF_DELETED"

/**
* <b>Description:</b> It is used to notify all members in a group of a group administrator change.
* <br><b>Purpose:</b> After the UI of a group administrator invokes PubGroup::transferOwner to transfer administrator rights to another group member,
* the SDK sends {@link EVENT_PUBGROUP_OWNER_TRANSFERED} to notify all the group members of the administrator change.
* The UI needs to compare its own URI with the new administrator's URI to determine whether the UI itself is the new administrator.
* <p>The broadcast will have the following extra values:
* <ul>
*   <li><em>{@link PARAM_PUBGROUP_GROUP_ID}</em></li> - [NSString*]
*   <li><em>{@link PARAM_PUBGROUP_OWNER_URI}</em></li> - [NSString*]
* </ul>
*/
#define EVENT_PUBGROUP_OWNER_TRANSFERED          @"EVENT_PUBGROUP_OWNER_TRANSFERED"

/**
* <b>Description:</b> It is used to notify the UI that a group has been dismissed by the group administrator.
* <br><b>Purpose:</b> After the UI of a group administrator invokes PubGroupApi.dismiss to dismiss a group, the SDK sends {@link EVENT_PUBGROUP_GROUP_DISMISSED}
* to notify the rest of the group members that that group has been dismissed. The UI needs to refresh the group list on the contact page of the client in order not to display the dismissed group.
* <p>The broadcast will have the following extra values:
* <ul>
*   <li><em>{@link PARAM_PUBGROUP_GROUP_ID}</em></li> - [NSString*]
*   <li><em>{@link PARAM_PUBGROUP_GROUP_NAME}</em></li> - [NSString*]
* </ul>
*/
#define EVENT_PUBGROUP_GROUP_DISMISSED           @"EVENT_PUBGROUP_GROUP_DISMISSED"

/**
* <b>Description:</b> It is used to broadcast a group member's status change.
* <br><b>Purpose:</b> When the status of member in a group that the local login account has joined changes, the server notifies the SDK of the change,
* and the SDK sends {@link EVENT_PUBGROUP_MEMBER_STATE_CHANGED} to the UI of the current login account.
* The UI needs to refreshes the group member's status based on the broadcast parameter. Currently, the SDK
* supports only two statuses, namely PUBGROUP_MEMBER_STATE_OFFLINE and PUBGROUP_MEMBER_STATE_ONLINE.
* <p>The broadcast will have the following extra values:
* <ul>
*   <li><em>{@link PARAM_PUBGROUP_GROUP_ID}</em></li> - [NSString*]
*   <li><em>{@link PARAM_PUBGROUP_MEMBER_URI}</em></li> - [NSString*]
*   <li><em>{@link PARAM_PUBGROUP_MEMBER_STATE}</em></li> - [int]
* </ul>
*/
#define EVENT_PUBGROUP_MEMBER_STATE_CHANGED      @"EVENT_PUBGROUP_MEMBER_STATE_CHANGED"


/** <b>Description:</b> This broadcast is used to broadcast the result of modifying a permanent group information. Only group administrators can receive this broadcast.
 *  <br><b>Purpose:</b>  After the UI invokes PubGroup::modifyInfo to modify a permanent group information, the SDK, after receiving a response from the server,
 * sends {@link EVENT_PUBGROUP_MODIFY_GROUP_INFO_RSP} to the UI. The UI needs to determine whether the modification is successful
 * by the PARAM_PUBGROUP_RESULT_CODE parameter and notify the subscriber of the modification result.
 * <p>The broadcast will have the following extra value:
 * <ul>
 *   <li><em>{@link PARAM_PUBGROUP_RESULT_CODE}</em></li> - [unsigned long]
 *   <li><em>{@link PARAM_PUBGROUP_GROUP_ID}</em></li> - [NSString*]
 * </ul>
 */
#define EVENT_PUBGROUP_MODIFY_GROUP_INFO_RSP      @"EVENT_PUBGROUP_MODIFY_GROUP_INFO_RSP"


/** <b>Description:</b> This broadcast is used to broadcast the result of creating a permanent group. Only a group creator can receive this broadcast.
 *  <br><b>Purpose:</b>  After the UI invokes PubGroupApi.create to create a permanent group and the SDK receives the creation result from the server,
 * the SDK sends {@link EVENT_PUBGROUP_CREATE_GROUP_RSP} to notify the UI of the creation result. The UI can determine whether the creation
 * is successful by the PARAM_PUBGROUP_RESULT_CODE parameter and inform the subscriber of the creation result.
 * <p>The broadcast will have the following extra value:
 * <ul>
 *   <li><em>{@link PARAM_PUBGROUP_RESULT_CODE}</em></li> - [unsigned long]
 *   <li><em>{@link PARAM_PUBGROUP_COOKIE}</em></li> - [unsigned long]
 *   <li><em>{@link PARAM_PUBGROUP_GROUP_URL}</em></li> - [NSString*]
 *   <li><em>{@link PARAM_PUBGROUP_ADD_MEMBER_FAIL_ARRAY}</em></li> - [NSMutableArray*]
 * </ul>
 */
#define EVENT_PUBGROUP_CREATE_GROUP_WITH_MEMBER_RSP         @"EVENT_PUBGROUP_CREATE_GROUP_WITH_MEMBER_RSP"


/**
 * This enumeration is used to indicates the authentication mode for joining a group.
 */
typedef enum tag_PUBGROUP_PERMIT_TYPE
{
    PUBGROUP_PERMIT_TYPE_ADMIN_PERMIT = 0,    /**< @brief Specifies that a subscriber needs the administrator's approval to join a group. */
    PUBGROUP_PERMIT_TYPE_APPROVE    = 1,    /**< @brief Specifies that a subscriber does not need the administrator's approval to join a group. */
    PUBGROUP_PERMIT_TYPE_FORBIDDEN   = 2     /**< @brief Specifies that subscribers cannot request to join a group. They can join the group only by invitation from the administrator.  */
} PUBGROUP_PERMIT_TYPE;

/**
 * This enumeration is used to indicates the status of group members.
 */
typedef enum tag_PUBGROUP_MEMBER_STATUS_TYPE
{
    PUBGROUP_MEMBER_STATUS_ACTIVE = 0,    /**< @brief Specifies that a subscriber has successfully joined a group.     */
    PUBGROUP_MEMBER_STATUS_PENDING   = 1     /**< @brief Indicates that pending approval to joining a group. If a subscriber requests to join a group, the subscriber will need the group administrator's approval. If the group administrator invites a subscriber to the group, the administrator will need the subscriber's approval.    */
} PUBGROUP_MEMBER_STATUS_TYPE;

/**
 * This enumeration is used to indicates the group information change types.
 */
typedef enum tag_PUBGROUP_GROUP_STATE_TYPE
{
    PUBGROUP_GROUP_STATE_ADD     = 0,        /**< @brief Specifies that a permanent group is added.  */
    PUBGROUP_GROUP_STATE_UPDATE  = 1,    /**< @brief Specifies that information of a permanent group is updated.    */
    PUBGROUP_GROUP_STATE_DELETE  = 2     /**< @brief Specifies that a permanent group is deleted.    */
} PUBGROUP_GROUP_STATE_TYPE;

/**
 * This enumeration is used to indicates the replies to a request for joining a group or an invitation to a group.
 */
typedef enum tag_PUBGROUP_OPINION_TYPE
{
    PUBGROUP_OPINION_NOT_FOUND   = 0,     /**< @brief Specifies that the specified URI is not found.     */
    PUBGROUP_OPINION_AGREE       = 1,         /**< @brief Specifies that the subscriber approves your request.   */
    PUBGROUP_OPINION_NO_AGREE   = 2       /**< @brief Specifies that the subscriber rejects your request.    */
} PUBGROUP_OPINION_TYPE;

/**
 * This enumeration is used to indicates the group search key type.
 */
typedef enum tag_PUBGROUP_SEARCH_KEY_TYPE
{
    PUBGROUP_SEARCH_KEY_BY_NAME = 0,     /**< @brief Specifies that the UI searches a permanent group by group name.    */
    PUBGROUP_SEARCH_KEY_BY_ID   = 1,     /**< @brief Specifies that the UI searches a permanent group by group number.    */
    PUBGROUP_SEARCH_KEY_BY_ALL  = 2      /**< @brief Specifies that the UI searches a permanent group by group name and number.    */
} PUBGROUP_SEARCH_KEY_TYPE;

/**
 * This enumeration is used to specify the statuses of UC contacts.
 */
typedef enum tag_PUBGROUP_MEMBER_STATE_TYPE
{
    PUBGROUP_MEMBER_STATE_ONLINE   = 0,     /**< @brief Specifies that a group member is online.     */
    PUBGROUP_MEMBER_STATE_BUSY     = 1,       /**< @brief Specifies that a group member is busy.     */
    PUBGROUP_MEMBER_STATE_AWAY     = 2,      /**< @brief Specifies that a group member is away.    */
    PUBGROUP_MEMBER_STATE_CALLING = 3,     /**< @brief Specifies that a group member is involved in a call.    */
    PUBGROUP_MEMBER_STATE_OFFLINE = 4      /**< @brief Specifies that a group member is offline.     */
} PUBGROUP_MEMBER_STATE_TYPE;

/**
 * This enumeration is used to indicates the config major type value.
 */
typedef enum tag_PUBGROUP_CFG_MAJOR_TYPE
{
    PUBGROUP_CFG_MAJOR_SERVER_IP      = 0,        /**< @brief Specifies the address of the server for the permanent group service.    */
    PUBGROUP_CFG_MAJOR_SERVER_PORT   = 1,      /**< @brief Specifies the port number of the server for the permanent group service.     */
    PUBGROUP_CFG_MAJOR_URI            = 2,             /**< @brief Specifies the URI of the server for the permanent group service.    */
    PUBGROUP_CFG_MAJOR_HTTP_TYPE      = 3,      /**< @brief Specifies the the type of HTTP that the SDK uses.    */
    PUBGROUP_CFG_MAJOR_ALL            = 4,            /**< @brief Specifies the complete address of the server, including the address, port number, URI, and HTTP type of the server for the permanent group service.    */
    PUBGROUP_CFG_MAJOR_BUTT           = 0x7FFFFFFF  /**< @brief This constant is not in use currently and may be used as an extended major parameter afterwards. */
} PUBGROUP_CFG_MAJOR_TYPE;

/**
 * This enumeration is used to indicates the config minor type value.
 */
typedef enum tag_PUBGROUP_CFG_MINOR_TYPE
{
    PUBGROUP_CFG_MINOR_BUTT           = 0x7FFFFFFF   /**< @brief This constant is the default value for the minor parameter type.*/
} PUBGROUP_CFG_MINOR_TYPE;

/**
 * This enumeration is used to indicates the group operation result codes .
 */
typedef enum tag_PUBGROUP_RESULT_ERR_TYPE
{
    PUBGROUP_RESULT_CODE_ERR_NO,                                                        /**< @brief The operation succeeds.*/
    PUBGROUP_RESULT_ERR_CONN_FAIL,                                                    /**< @brief The operation fails because connection to the server fails.*/
    PUBGROUP_RESULT_ERR_CONN_TIMEOUT,                                             /**< @brief The operation fails because connection to the server times out. */
    PUBGROUP_RESULT_ERR_SERV_DISCED,                                                /**< @brief The operation fails due to disconnection from the server. */
    PUBGROUP_RESULT_ERR_SEND_FAIL,                                                    /**< @brief The operation fails because sending the request fails. */
    PUBGROUP_RESULT_ERR_WAIT_RSP_TIMEOUT,                                    /**< @brief The operation fails due to a server response timeout.*/
    PUBGROUP_RESULT_ERR_IN_REQING,                                                   /**< @brief The request is being sent. */
    PUBGROUP_RESULT_ERR_AUTH_FAILED,                                               /**< @brief The operation fails due to an authentication failure. */
    PUBGROUP_RESULT_ERR_SERV_ERR,                                                     /**< @brief The operation fails due to a server error. */
    PUBGROUP_RESULT_ERR_CREATE_GRP_EXCEED_MAX_NUM,                 /**< @brief The operation fails because the number of permanent groups created by the subscriber has reached the limit. */
    PUBGROUP_RESULT_ERR_ADD_GRP_MEMBER_EXCEED_MAX_NUM,       /**< @brief The operation fails because the number of members in the group has reached the limit allowed by the server. */
    PUBGROUP_RESULT_ERR_NO_PERMISSION_TO_MODIFY_GRP_ATTR,   /**< @brief The operation fails because the subscriber has no rights to modify the group attributes. */
    PUBGROUP_RESULT_ERR_MODIFY_NOT_EXIST_GRP_ATTR,                  /**< @brief The operation fails because the subscriber attempts to modify attributes of a group that do not even exist. */
    PUBGROUP_RESULT_ERR_INVITED_USER_IS_NOT_SAME_CORP,          /**< @brief The operation fails because the administrator attempts to invite subscribers from another enterprise to the group. */
    PUBGROUP_RESULT_ERR_JOIN_GRP_MEMBER_EXCEED_MAX,               /**< @brief A subscriber requests to join a group but fails because the number of members in the group has reached the limit allowed by the server. */
    PUBGROUP_RESULT_ERR_NOT_GRP_MEMBER_TO_QUIT_GRP,              /**< @brief Quitting a group fails because a subscriber attempts to quit a group which the subscriber does not even belong to.  */
    PUBGROUP_RESULT_ERR_DELETE_NOT_EXIST_GRP_MEMBER,             /**< @brief The administrator attempts to delete from a group a subscriber who is not in the group but fails. */
    PUBGROUP_RESULT_ERR_DELETE_NOT_EXIST_GRP,                            /**< @brief The operation fails because the administrator attempts to delete a group that does not even exist.  */
    PUBGROUP_RESULT_ERR_INVITE_USER_EXCEED_MAX_NUM,               /**< @brief The administrator attempts to invite a contact to the group but fails because the number of members in the group has reached the limit. */
    PUBGROUP_RESULT_ERR_MEMBER_APPLIED_OR_INVITED_NOT_EXIST, /**< @brief The operation fails because the subscriber who requests to join a group or the subscriber who is to be invited does not exist. */
    PUBGROUP_RESULT_ERR_FORBIDDEN_TO_TANSFER_OWNER_TO_SELF, /**< @brief The operation fails because administrators are not allowed to transfer the administrator rights to themselves.*/
    PUBGROUP_RESULT_ERR_USER_NOT_EXIST,                                           /**< @brief The operation fails because the subscriber does not exist. */
    PUBGROUP_RESULT_ERR_INVALID_PARAMETER,                                     /**< @brief The operation fails because the parameter authentication fails.  */
    PUBGROUP_RESULT_ERR_CREATOR_NOT_EXIST,                                     /**< @brief The operator fails because the group created has not been defined. */
    PUBGROUP_RESULT_ERR_GRP_ATTR_NOT_ALLOWED_TO_MODIFY,        /**< @brief The operation fails because the administrator attempts to modify group attributes that cannot be modified.  */
    PUBGROUP_RESULT_ERR_MODIFY_NOT_EXIST_GRP,                              /**< @brief The operation fails because the subscriber attempts to modify a group that does not even exist. */
    PUBGROUP_RESULT_ERR_NO_PERMISSION_TO_DELETE_GRP,                /**< @brief The operation fails because members other than the group administrator are not allowed to delete the group. */
    PUBGROUP_RESULT_ERR_NO_PERMISSION_TO_QUERY_GRP,                  /**< @brief The operation fails because the subscriber has no permission to obtain information about the group. Some information about a group can be obtained only by group members. */
    PUBGROUP_RESULT_ERR_FORBIDDEN_TO_TANSFER_OWNER_TO_INACTIVE_MEMBER,  /**< @brief The operation fails because the administrator attempts to transfer the administrator rights to a group member whose status is PUBGROUP_MEMBER_STATUS_PENDING. */
    PUBGROUP_RESULT_ERR_GRP_MEMBER_ALREADY_EXIST,                        /**< @brief The operation fails because the subscriber is already a group member. */
    PUBGROUP_RESULT_ERR_GRP_OWNER_NOT_ALLOWED_QUIT_GRP,          /**< @brief The operation fails because the administrator cannot quit the group. */
    PUBGROUP_RESULT_ERR_INVITER_IS_NOT_OWNER,                                 /**< @brief The operation fails because the inviter is not an administrator and is not allowed to invite members. */
    PUBGROUP_RESULT_ERR_NO_PERMISSION_TO_APPLY_JOIN_GRP,           /**< @brief The operation fails because a member instead of the administrator attempts to approve a request for joining the group. */
    PUBGROUP_RESULT_ERR_USR_IS_ACTIVE_MEMBER,                                 /**< @brief The operation fails because a member in a group attempts to join the group again. */
    PUBGROUP_RESULT_ERR_USR_IS_NOT_EXIST_WHEN_ACCEPT_APPLICATION,  /**< @brief The operation fails because the subscriber does not exist in the group when the administrator approves the request from the subscriber.*/
    PUBGROUP_RESULT_ERR_OWNER_NOT_ALLOWED_TO_DELETE_SELF,        /**< @brief The operation fails because administrators are not allowed to delete themselves. */
    PUBGROUP_RESULT_ERR_QUERY_NOT_EXIST_GRP,                                   /**< @brief The operation fails because the subscriber searches a group that does not even exist.*/
    PUBGROUP_RESULT_ERR_JOIN_GRP_SUCCESS,                                           /**< @brief A subscriber requests to join a group and succeeds. */
    PUBGROUP_RESULT_ERR_JOIN_GRP_WAIT_ADMIN_AGREE,                       /**< @brief A subscriber requests to join a group and is awaiting approval from the administrator. */
    PUBGROUP_RESULT_ERR_OTHERS                                                               /**< @brief The operation fails due to an unknown error. */
} PUBGROUP_RESULT_ERR_TYPE;

/**
 * <b>Description:</b> MemberInfo is an abstract of a group member object. In includes the following fields of
 * a group member: URI, status (whether the members has successfully joined the group), and whether the member is the group administrator.
 * A group member must be a UC contact. If the UI needs to obtain detailed information about a group member, it can invoke methods provided by the EAB component. See {@link EabContact}.
 * <br><b>Purpose:</b> The UI can invoke PubGrou::.getMemberList to obtain a group member list. A list of objects of the MemberInfo class is returned for this method.
 */
@interface MemberInfo : NSObject
{
@private
    NSString *_uri;
    BOOL _isOwner;
    int  _status;
}

/**
 * <b>Description:</b> This property is used to obtain the URI of a group member (or the URI of a UC contact).
 * <br><b>Purpose:</b> The server allocates a unique URI to a contact after the contact is created. The UI can identity a contact by its URI.
 * <p>The property indicates a group member's URI.
 */
@property(nonatomic,retain) NSString * uri;

/**
 * <b>Description:</b> This property is used to determine whether a group member is a group administrator
 * <br><b>Purpose:</b> If the UI determines that a group member is a group administrator, the UI can display the group member as the group administrator.
 * <p>The property can be set to any of the following values:
 * <ul>
 *    <li><em>YES</em></li> - Indicates that a group member is a group administrator
 *    <li><em>NO</em></li> - Indicates that a group member is not a group administrator
 * </ul>
 */
@property(nonatomic,assign) BOOL isOwner;

/**
 * <b>Description:</b> This property is used to obtain the status of a group member.
 * <br><b>Purpose:</b> A group member's status specifies whether the member has successfully joined a group.
 * The UI can present the status of group members when displaying group member information.
 * <p>The property indicates member status. See {@link tag_PUBGROUP_MEMBER_STATUS_TYPE}.
 */
@property(nonatomic,assign) int status;

@end


/**
 * <b>Description:</b> MemberAddParam indicates information of adding member to group.
 * <br><b>Purpose:</b> The UI instantiates this class to construct information for adding member to a group when create group.
 */
@interface MemberAddParam : NSObject
{
@private
    NSString *_uri;
    NSString *_info;
}

/**
 * The property indicates a group member's URI.
 */
@property(nonatomic,retain) NSString * uri;

/**
 * The property indicates the information when add member.
 */
@property(nonatomic,retain) NSString * info;

@end


/**
 * <b>Description:</b> MemberAddFailResult indicates fail information of adding member to group.
 * <br><b>Purpose:</b> When add member to a group while create group, the server returns the result of operation. If any member adding failed,
 * it return the array of objects of this class.
 */
@interface MemberAddFailResult : NSObject
{
@private
    NSString *_uri;
    NSString *_failInfo;
}

/**
 * The property indicates a group member's URI.
 */
@property(nonatomic,retain) NSString * uri;

/**
 * The property indicates the fail information for adding member to a group when create group.
 */
@property(nonatomic,retain) NSString * failInfo;

@end

/**
 * <b>Description:</b> PubGroupSummary is an abstract of a permanent group object. In includes the following fields of a permanent
 * group: group Uri, group name, group introduction, group number, and group bulletin.
 * <br><b>Purpose:</b> The UI can invoke PubGroupApi::getGroupList to obtain all permanent groups to which a contact belongs.
 * A list of objects of the PubGroupSummary class is returned for the PubGroupApi::getGroupList method.
 * If the UI needs to obtain detailed information about a specified permanent group, it can invoke PubGroupApi::queryGroupInfo with the URI specified to obtain a PubGroup object.
 */
@interface PubGroupSummary : NSObject
{
@private
    NSString * _groupId;
    NSString * _name;
    NSString * _number;
    NSString * _description;
    NSString * _bulletin;
}

/**
 * <b>Description:</b> This property is used to obtain the URI of a group.
 * <br><b>Purpose:</b> The server allocates a unique URI to a group after the group is created.
 * The UI can identify a group by its URI. A subscriber can view the URI of a group regardless of whether the subscriber is a member in the group or not.
 * <p>The property indicates a group URI.
 */
@property(nonatomic,retain) NSString * groupId;

/**
 * <b>Description:</b> This property is used to obtain the name of a group.
 * <br><b>Purpose:</b> A group name may be used for display of the permanent group list or display of detailed information about the permanent group.
 * When creating a permanent group, the administrator must specify the group name. Only the administrator can modify the group name.
 * A subscriber can view the name of a group regardless of whether the subscriber is a member in the group or not.
 * <p>The property indicates the name of a permanent group
 */
@property(nonatomic,retain) NSString * name;

/**
 * <b>Description:</b> This property is used to obtain a group number.
 * <br><b>Purpose:</b> The server allocates a number to a group after the group is created. The UI can identify a group by its number.
 * A subscriber can view the number of a group regardless of whether the subscriber is a member in the group or not.
 * <p>The property indicates a group number.
 */
@property(nonatomic,retain) NSString * number;

/**
 * <b>Description:</b> This property is used to obtain the introduction of a group.
 * <br><b>Purpose:</b> A group introduction is used only for detailed information display. Only the group administrator can set the group introduction.
 * A subscriber can view the introduction of a group regardless of whether the subscriber is a member in the group or not.
 * <p>The property indicates a group introduction
 */
@property(nonatomic,retain) NSString * description;

/**
 * <b>Description:</b> This property is used to obtain the bulletin of a group.
 * <br><b>Purpose:</b> A group bulletin is used only for detailed information display.
 * Only a group administrator can set the group bulletin. Only members in a group can view the group bulletin.
 * <p>The property indicates a group bulletin
 */
@property(nonatomic,retain) NSString * bulletin;

@end


/**
 * <b>Description:</b> PubGroup is an abstract of a permanent group object. It includes the following fields of a permanent group: group ID, group name,
 * group introduction, group bulletin, group creation time, group creator, group member list, and authentication mode for contacts joining the group.
 * Some of these fields may be left empty. If a field id left empty, the SDK returns the value null to the UI. A group administrator can perform the following operations:
 * Modify group information, including the group name, group introduction, authentication mode.
 * Invite contacts to the group, delete group members, transfer the administrator rights to another member (a group must have only one administrator).
 * A group member can quit a group. Contacts that are not in a group can request to join the group.
 * <br><b>Purpose:</b> The UI can invoke method of the PubGroupApi class to obtain objects of the PubGroup class and then invoke methods of the PubGroup
 * class to obtain detailed information about a permanent group.
 */
@interface PubGroup : NSObject
{
@private
    NSString * _groupId;
    NSString * _name;
    NSString * _number;
    NSString * _description;
    NSString * _bulletin;
    NSString * _creator;
    NSString * _createTime;
    int _permitType;
    NSMutableArray * _memberArray;
}

/**
 * <b>Description:</b> This property is used to obtain the URI of a group.
 * <br><b>Purpose:</b> The UI gets this property to obtain the URI of a group. The server allocates a unique URI to a group after the group is created.
 * The UI can identify a group by its URI.
 * A subscriber can view the URI of a group regardless of whether the subscriber is a member in the group or not.
 * <p>The property indicates a group URI.
 */
@property(nonatomic,retain) NSString * groupId;

/**
 * <b>Description:</b> This property is used to obtain the name of a group.
 * <br><b>Purpose:</b> The UI gets this property to obtain the name of a group. A group name may be used for display of the permanent group list or
 * display of detailed information about the permanent group.
 * When creating a permanent group, the administrator must specify the group name. Only the administrator can modify the group name.
 * A subscriber can view the name of a group regardless of whether the subscriber is a member in the group or not.
 * <p>The property indicates the name of a permanent group.
 */
@property(nonatomic,retain) NSString * name;

/**
 * <b>Description:</b> This property is used to obtain a group number.
 * <br><b>Purpose:</b> The UI gets this property to obtain a group number. The server allocates a number to a group after the group is created.
 * The UI can identify a group by its number. A subscriber can view the number of a group regardless of whether the subscriber is a member in the group or not.
 * <p>The property indicates a group number.
 */
@property(nonatomic,retain) NSString * number;

/**
 * <b>Description:</b> This property is used to obtain the introduction of a group.
 * <br><b>Purpose:</b> The UI gets this property to obtain the introduction of a group. A group introduction is used only for detailed information display.
 * Only a group administrator can set the group introduction. A subscriber can view the introduction of a group regardless of whether
 * the subscriber is a member in the group or not.
 * <p>The property indicates a group introduction.
 */
@property(nonatomic,retain) NSString * description;

/**
 * <b>Description:</b> This property is used to obtain the bulletin of a group.
 * <br><b>Purpose:</b> The UI gets this property to obtain the bulletin of a group. A group bulletin is used only for detailed information display.
 * Only a group administrator can set the group bulletin. Only members in a group can view the group bulletin.
 * <p>The property indicates a group bulletin.
 */
@property(nonatomic,retain) NSString * bulletin;

/**
 * <b>Description:</b> This property is used to obtain the creator of a group.
 * <br><b>Purpose:</b> The UI gets this property to obtain the creator of a group. A group creator must be a UC contact. After the UI
 * obtains the URI of a group creator, the UI can display the creator on the group member list.
 * <p>The property indicates a group creator.
 */
@property(nonatomic,retain) NSString * creator;

/**
 * <b>Description:</b> This property is used to obtain the time when a group was created.
 * <br><b>Purpose:</b> The UI gets this property to obtain the time when a group was created.
 * The server generates a time when a group is created.
 * <p>The property indicates the time when a group was created. It is in the UTC format.
 */
@property(nonatomic,retain) NSString * createTime;

/**
 * <b>Description:</b> This property is used to obtain the authentication mode for requests for joining a group.
 * <br><b>Purpose:</b> The UI gets this property to obtain the authentication mode. The authentication mode specifies whether
 * contacts outside a group need the group administrator's approval to join the group.
 * <p>The property indicates a authentication mode, it can be one of the following:
 * <ul>
 *    <li><em>{@link PUBGROUP_PERMIT_TYPE_ADMIN_PERMIT}</em></li>
 *    <li><em>{@link PUBGROUP_PERMIT_TYPE_APPROVE}</em></li>
 *    <li><em>{@link PUBGROUP_PERMIT_TYPE_FORBIDDEN}</em></li>
 * </ul>
 */
@property(nonatomic,assign) int permitType;

/**
 * <b>Description:</b> This property is used to obtain a group member list..
 * <br><b>Purpose:</b> The UI invokes getMemberList to obtain the member list of a PubGroup object. When the UI needs to display all the members
 * in a permanent group, it can invoke this method. After the UI obtain a group member list, it can invoke methods of the MemberInfo class to obtain the URI
 * and status of each member or determine which member is the group administrator. Only members in a group can view the group member list.
 * <p>The property indicates a list of group members. See MemberInfo. A group has at least one member, that is, the group administrator.
 */
@property(nonatomic,retain) NSMutableArray * memberArray;

/**
* <b>Description:</b> This method is used to modify the name of a group.
* <br><b>Purpose:</b> After a group administrator invokes PubGroup::modifyName to modify the group name, the SDK sends
* {@link EVENT_PUBGROUP_MODIFY_GROUP_NAME_RSP} broadcast to notify the administrator of the modification result.
* Only group administrators can modify group names.
* @param [in] name Specifies a group name. It can be left empty.
* @return 0 Indicates that the method is successfully invoked
*    <br>1 Indicates that invoking the method fails
*/
- (int) modifyName:(NSString*) name;

/**
* <b>Description:</b> This method is used to modify the introduction of a group.
* <br><b>Purpose:</b> After a group administrator invokes modifyDescription to modify the group introduction, the SDK
* sends {@link EVENT_PUBGROUP_MODIFY_GROUP_DESCRIPTION_RSP} broadcast to notify the administrator of the
* modification result. Only group administrators can modify group introductions.
* @param [in] description Specifies a group introduction. It can be left empty.
* @return 0 Indicates that the method is successfully invoked
*    <br>1 Indicates that invoking the method fails
*/
- (int) modifyDescription:(NSString*) description;

/**
* <b>Description:</b> This method is used to modify the bulletin of a group.
* <br><b>Purpose:</b> After a group administrator invokes modifyBulletin to modify the group bulletin, the SDK
* sends {@link EVENT_PUBGROUP_MODIFY_GROUP_BULLETIN_RSP} broadcast to notify the administrator of the modification result.
* Only group administrators can modify group bulletins.
* @param [in] bulletin Specifies a group bulletin. It can be left empty
* @return 0 Indicates that the method is successfully invoked
*    <br>1 Indicates that invoking the method fails
*/
- (int) modifyBulletin:(NSString*) bulletin;

/**
* <b>Description:</b> This method is used to modify the authentication mode for a group.
* <br><b>Purpose:</b> After a group administrator invokes modifyPermit to modify the authentication mode for the group, the SDK
* sends {@link EVENT_PUBGROUP_MODIFY_GROUP_PERMIT_RSP} broadcast to notify the administrator of the modification result.
* Only group administrators can modify the authentication modes.
* @param [in] permitType Specifies the authentication mode for a group. It can be set to any of the following values:
* <p>The parameter permitType can be set to any one of the {@link tag_PUBGROUP_PERMIT_TYPE} enumeration.
* @return 0 Indicates that the update operation is successful
*    <br>1 Indicates that the update operation fails
*/
- (int) modifyPermit:(int) permitType;

/**
* <b>Description:</b> This method is used to add a contact to a permanent group.
* <br><b>Purpose:</b> Only a group administrator has the permission to add contacts to a group.
* After a group administrator adds a contact to a group, the SDK sends {@link EVENT_PUBGROUP_INVITE_MEMBER_RSP} broadcast
* to notify the administrator whether the request for adding a member has successfully sent to the server, and
* sends {@link EVENT_PUBGROUP_INVITE_INCOMING} broadcast to the contact that is added to the group.
* A contact can reject or approve to be invited to a group. The server places a limit on the number of members in a group.
* When the number of members in a group has reached the limit, adding new members will fail.
* @param [in] name Specifies the name of a contact to be added. Its value must not be left empty and is obtained from the EAB component
* @param [in] uri Specifies the URI of a contact to be added. Its value must not be left empty and is obtained from the EAB component
* @param [in] info Specifies the invitation information. It can be left empty
* @return 0 Indicates that the method is successfully invoked
*    <br>1 Indicates that invoking the method fails
*/
- (int) addMember:(NSString*) name uri:(NSString*) uri info:(NSString*) info;

/**
* <b>Description:</b> This method is used to delete a member from a permanent group.
* <br><b>Purpose:</b> Only group administrators have the permission to delete members from group,
* and group administrators cannot delete themselves. Each group has at least one member, that is, the group administrator.
* After a group administrator deletes a member, the SDK sends {@link EVENT_PUBGROUP_DELETE_MEMBER_RSP} broadcast to
* notify the administrator of the deletion result and sends {@link EVENT_PUBGROUP_SELF_DELETED} broadcast to the deleted member.
* Before invoking this method, it is recommanded that the UI should prompt the user with friendly information, such as a choice box for 
* choosing to continue or cancel. The UI can present different information based on different situations.
* @param [in] uri Specifies the URI of a member to be deleted
* @return 0 Indicates  the method is successfully invoked
*    <br>1 Indicates that invoking the method fails
*/
- (int) deleteMember:(NSString*) uri;

/**
* <b>Description:</b> This method is used to transfer the administrator rights.
* <br><b>Purpose:</b> After the UI invokes transferOwner to transfers the administrator rights to another member,
* the SDK sends {@link EVENT_PUBGROUP_TRANSFER_OWNER_RSP} broadcast to the UI, and all members in the group
* receives {@link EVENT_PUBGROUP_OWNER_TRANSFERED} and {@link EVENT_PUBGROUP_GROUP_INFO_CHANGED} broadcasts.
* Each group can have only one administrator. Group administrators cannot transfer the administrator rights to themselves.
* @param [in] uri Specifies the member uri value
* @return 0 Indicates that the method is successfully invoked
*    <br>1 Indicates that invoking the method fails
*/
- (int) transferOwner:(NSString*) uri;

/**
* <b>Description:</b> This method is used to join a permanent group.
* <br><b>Purpose:</b>  Generally, the UI first invokes PubGroupApi::searchGroup to search a permanent group and then
* invokes this method to join the group. After the UI invokes join to join a permanent group, the SDK sends {@link EVENT_PUBGROUP_JOIN_GROUP_RSP}
* broadcast to the UI. If a group requires authentication, the group administrator receives the {@link EVENT_PUBGROUP_JOIN_INCOMING} broadcast when a contact requests to join the group.
* @param [in] info Specifies the remarks
* @return 0 Indicates that the method is successfully invoked
*    <br>1 Indicates that invoking the method fails
*/
- (int) join:(NSString*) info;

/**
* <b>Description:</b> This method is used to quit a group.
* <br><b>Purpose:</b> The UI can invoke this method to quit a permanent group. After the UI invokes this method, the UI receives
* the {@link EVENT_PUBGROUP_EXIT_GROUP_RSP} broadcast and the other members in the group receives the {@link EVENT_PUBGROUP_MEMBER_LEAVE} broadcast.
* A member does not need the group administrator's approval to quit a group. Group administrators cannot invoke this method because each group must have an administrator.
* After a member quits a group, the rest of the members need to refresh the group member list in order not to display the member who has quit.
* @return 0 Indicates that the method is successfully invoked
*    <br>1 Indicates that invoking the method fails
*/
- (int) exit;

/**
 * <b>Description:</b> This method is used to modify the information of a group.
 * <br><b>Purpose:</b> After a group administrator invokes this method to modify the group name, description, bulletin and permit type, the SDK sends
 * {@link EVENT_PUBGROUP_MODIFY_GROUP_INFO_RSP} broadcast to notify the administrator of the modification result.
 * Only group administrators can modify group information.
 * @param [in] name Specifies a group name.
 * @param [in] description Specifies a group introduction.
 * @param [in] bulletin Specifies a group bulletin.
 * @param [in] permitType Specifies the authentication mode for a group. It can be set to any of the following values:
 * <p>The parameter permitType can be set to any one of the {@link tag_PUBGROUP_PERMIT_TYPE} enumeration.
 * @return 0 Indicates that the method is successfully invoked
 *    <br>1 Indicates that invoking the method fails
 */
- (int) modifyInfo:(NSString*) name description:(NSString*) description bulletin:(NSString*) bulletin permit:(int) permitType;

@end


/**
 * <b>Description:</b> PubGroupApi is a class that provides methods used for the permanent group service.
 * <br><b>Purpose:</b> PubGroupApi provides an entry to methods of the PubGroup component. The UI invokes methods of this class to access APIs of the permanent group service.
 */
@interface PubGroupApi : NSObject
{

}

/**
* <b>Description:</b> This method is used to initialize the PubGroup component.
* <br><b>Purpose:</b> Before using methods provided by the PubGroup component, the UI must invoke this method to initialize the PubGroup component.
* It is recommended that the UI invoke this method during system initialization.
*/
+ (void) init;

/**
 * <b>Description:</b> This method is used to deregister the PubGroup component and release all resources of the component.
 * <br><b>Purpose:</b> The UI can invoke this method to deregister the PubGroup component if it does not need to use the permanent group service any more.
 * The UI needs to invoke this method before the program exits.
 */
+ (void) destroy;

/**
 * <b>Description:</b> This method is used to set parameters required for the PubGroup component of the SDK.
 * <br><b>Purpose:</b> After a successful login by unified authentication, the UI needs to invoke UportalApi::getParam to obtain the parameters
 * required for the PubGroup component of the SDK and then invoke PubGroupApi.setConfig to set parameters for the PubGroup component of the SDK.
 * The UI can initiate services provided by the PubGroup component after the UI sets all required parameters for the component.
 * @param [in] majorType Specifies the type of major parameters. It can be set to any one of the {@link tag_PUBGROUP_CFG_MAJOR_TYPE} enumeration.
 * @param [in] minorType Specifies the type of minor parameters. It can be set to any one of the {@link tag_PUBGROUP_CFG_MINOR_TYPE} enumeration.
 * @param [in] configValue Specifies the config value
 * @return 0 Indicates that the setting is successful
 *     <br>1 Indicates that the setting fails
 */
+ (int) setConfig:(int)majorType minortype:(int)minorType configvalue:(NSString*)configValue;

/**
 * <b>Description:</b> This method is used to obtain the values of the parameters required for the PubGroup component of the SDK.
 * <br><b>Purpose:</b> The UI invokes this method to obtain the values of the parameters required for the permanent group component of the SDK.
 * @param [in] iMajorType Specifies the major type, @ref PUBGROUP_CFG_MAJOR_TYPE.
 * @param [in] iMinorType Specifies the minor type, @ref PUBGROUP_CFG_MINOR_TYPE.
 *
 * @return The value indicates the user configure information
 */
+ (NSString *) getConfig:(int)majorType minorType:(int)minorType;

/**
 * <b>Description:</b> This method is used to create a permanent group.
 * <br><b>Purpose:</b> Only UC contacts can create permanent groups. The result of creating a permanent group is broadcast to the UI
 * by {@link EVENT_PUBGROUP_CREATE_GROUP_RSP}. If the creation of a permanent group is successful, the UI also receives
 * the {@link EVENT_PUBGROUP_GROUP_INFO_CHANGED} broadcast. Then the UI refreshes the group list on the contact page of the client.
 * When creating a group, the UI must specify a group name, authentication mode. However, a group bulletin or group introduction is optional.
 * The server places a limit on the number of groups that an enterprise is allowed to be created. If the number of groups created by
 * a contact has reached the limit, the contact will fail to create any new group.
 * @param [in] name Specifies a group name. It must not be left empty.
 * @param [in] description Specifies a group introduction. It can be left empty.
 * @param [in] bulletin Specifies a group bulletin. It can be left empty.
 * @param [in] permitType Specifies the authentication type for contacts requesting to join a group. It can be set to any one of the {@link tag_PUBGROUP_PERMIT_TYPE} enumeration.
 * @param [in] cookie Identifies an operation of creating a permanent group.
 * @return 0 Indicates that the method is successfully invoked.
 *     <br>1 Indicates that invoking the method fails.
 */
+ (int) create:(NSString*) name description:(NSString*) description bulletin:(NSString *) bulletin permit:(int) permitType cookie:(unsigned long) cookie;

/**
 * <b>Description:</b> This method is used to dismiss a permanent group.
 * <br><b>Purpose:</b> After a group is created, the group administrator can invoke this method to dismiss the group
 * if the group is no longer needed. Only group administrators have the permission to dismiss groups. After the group administrator dismisses a group,
 * the SDK sends {@link EVENT_PUBGROUP_DISMISS_GROUP_RSP} to notify the group administrator of the dismissal result.
 * After a group is successfully dismissed, all group members, including the group administrator, receive the {@link EVENT_PUBGROUP_GROUP_DISMISSED} broadcast
 * and the UI needs to refreshes the group list on the contact page of the client. The dismissed group is no longer displayed.
 * @param [in] groupId Specifies a group
 * @return 0 Indicates that the method is successfully invoked
 *     <br>1 Ipecifies that invoking the method fails
 */
+ (int) dismiss:(NSString*) groupId;

/**
 * <b>Description:</b> This method is used to search the local database for detailed information about a permanent group.
 * <br><b>Purpose:</b> The UI can invoke this method to obtain detailed information about a group from the local database.
 * The information returned may not be the latest. The local database stores only information about permanent groups to which a contact belongs.
 * When the information about a group on the server is updated, the SDK sends {@link EVENT_PUBGROUP_GROUP_INFO_CHANGED} to notify the UI of the update.
 * After receiving this broadcast, the UI needs to invoke PubGroupApi.queryGroupInfo again to obtain the latest information about a group, and refreshes the contact page.
 * @param [in] groupId Specifies a group
 * @return Indicates a PubGroup object. If the SDK finds information about the group that the UI specifies, it returns a PubGroup object to the UI.
 * If the SDK does not find information about the specified group, it returns the value null.
 */
+ (PubGroup*) queryGroupInfo:(NSString*) groupId;

/**
 * <b>Description:</b> This method is used to obtain the list of permanent groups to which a contact belongs.
 * <br><b>Purpose:</b> After the UI invokes this method, the SDK directly obtains the list of permanent groups to
 * which the current login account belongs and returns the list to the UI. Then the SDK obtains the latest list of the permanent groups
 * to which the current login account belongs from the server. If the list obtained from the server is different from the list stored locally,
 * the SDK sends {@link EVENT_PUBGROUP_GROUP_INFO_CHANGED} to the UI.
 * @return Indicates a list of PubGroupSummary objects stored in the SDK's local database
 */
+ (NSMutableArray*) getGroupList;

/**
 * <b>Description:</b> This method is used to search the server for matched permanent groups.
 * <br><b>Purpose:</b> After the UI invokes this method, the UI can specify search criteria. Exact match by group number and fuzzy match
 * by group name are supported. If exact match by group number is specified, a group that has the exact specified group number is returned as the search result.
 * If fuzzy match by group name is specified, groups whose names contain the specified name are returned as the search result.
 * The SDK sends all matched groups in the {@link EVENT_PUBGROUP_SEARCH_GROUP_RSP} broadcast to the UI in one time.
 * After the UI receive this broadcast, it displays the search results on the contact page of the client.
 * @param [in] startPage Specifies the start page number. The minimum value is 1.
 * @param [in] pageSize Specifies the number of groups displayed on each page. The minimum value is 1.
 * @param [in] searchType Specifies the search type. It can be set to any one of the {@link tag_PUBGROUP_SEARCH_KEY_TYPE} enumeration.
 * @param [in] value Specifies the search keyword.
 * @param [in] cookie Identifies a search operation.
 * @return 0 Indicates that the method is successfully invoked
 *     <br>1 Indicates that invoking the method fails
 */
+ (int) searchGroup:(int) startPage pageSize:(int) pageSize searchType:(int) searchType value:(NSString*) value cookie:(unsigned long) cookie;

/**
 * <b>Description:</b> This method is used to to accept an invitation to a group.
 * <br><b>Purpose:</b> When a group administrator invites a subscriber to a group, the UI of the subscriber
 * receives the {@link EVENT_PUBGROUP_INVITE_INCOMING} broadcast. The UI can invoke PubGroupApi.acceptInvitation to
 * accept the invitation. The SDK sends {@link EVENT_PUBGROUP_ACCEPT_INVITATION_RSP} to notify the UI of the result of joining the group.
 * If the UI successfully joins the group, the UI also receives the {@link EVENT_PUBGROUP_GROUP_INFO_CHANGED} broadcast.
 * Then the UI needs to refresh the group list to display the new group on the contact page of the client.
 * @param [in] groupId Identifies a group
 * @return 0 Indicates that the method is successfully invoked
 *     <br>1 Indicates that invoking the method fails
 */
+ (int) acceptInvitation:(NSString*) groupId;

/**
 * <b>Description:</b> This method is used to reject an invitation to a group.
 * <br><b>Purpose:</b> When a group administrator invites a subscriber to a group, the UI of the subscriber receives
 * the {@link EVENT_PUBGROUP_INVITE_INCOMING} broadcast. The UI can invoke this method to reject the invitation.
 * Then the SDK sends {@link EVENT_PUBGROUP_REJECT_INVITATION_RSP} to notify the UI that the subscriber has rejected the invitation.
 * @param [in] uri Specifies the subscriber uri value
 * @param [in] groupId Identifies a group
 * @return 0 Indicates that the method is successfully invoked
 *     <br>1 Indicates that invoking the method fails
 */
+ (int) rejectInvitation:(NSString*) groupId;

/**
 * <b>Description:</b> This method is used to accept a request for joining a group.
 * <br><b>Purpose:</b> When a subscriber requests to join a group, the group administrator receives
 * the {@link EVENT_PUBGROUP_JOIN_INCOMING} broadcast. The UI of the administrator can invoke this method to accept the request.
 * If the invocation is successful, the UI receives the {@link EVENT_PUBGROUP_ACCEPT_JOIN_REQ_RSP} broadcast.
 * @param [in] uri Specifies the URI of the subscriber who requests to join a group.
 * @param [in] groupId Identifies a group
 * @return 0 Indicates that the method is successfully invoked
 *     <br>1 Indicates that invoking the method fails
 */
+ (int) acceptJoinReq:(NSString*) uri groupId:(NSString*) groupId;

/**
 * <b>Description:</b> This method is used to reject a request for joining a group.
 * <br><b>Purpose:</b> When a subscriber requests to join a group, the group administrator receives the {@link EVENT_PUBGROUP_JOIN_INCOMING} broadcast.
 * The UI of the administrator can invoke this method to reject the request. If the invocation is successful, the UI receives the {@link EVENT_PUBGROUP_REJECT_JOIN_REQ_RSP} broadcast.
 * @param [in] uri Identifies a UC contact who requests to join a group.
 * @param [in] groupId Identifies a group
 * @return 0 Indicates that the method is successfully invoked
 *     <br>1 Indicates that invoking the method fails
 */
+ (int) rejectJoinReq:(NSString*) uri groupId:(NSString*) groupId;

/**
 * <b>Description:</b> This method is used to to accept an invitation to a group.
 * <br><b>Purpose:</b> When a group administrator invites a subscriber to a group, the UI of the subscriber
 * receives the {@link EVENT_PUBGROUP_INVITE_INCOMING} broadcast. The UI can invoke PubGroupApi.acceptInvitation to
 * accept the invitation. The SDK sends {@link EVENT_PUBGROUP_ACCEPT_INVITATION_RSP} to notify the UI of the result of joining the group.
 * If the UI successfully joins the group, the UI also receives the {@link EVENT_PUBGROUP_GROUP_INFO_CHANGED} broadcast.
 * Then the UI needs to refresh the group list to display the new group on the contact page of the client.
 * @param [in] groupId Identifies a group
 * @param [in] groupUrl Indicates a group URL
 * @return 0 Indicates that the method is successfully invoked
 *     <br>1 Indicates that invoking the method fails
 */
+ (int) acceptInvitation:(NSString*) groupId groupUrl:(NSString*) groupUrl;

/**
 * <b>Description:</b> This method is used to reject an invitation to a group.
 * <br><b>Purpose:</b> When a group administrator invites a subscriber to a group, the UI of the subscriber receives
 * the {@link EVENT_PUBGROUP_INVITE_INCOMING} broadcast. The UI can invoke this method to reject the invitation.
 * Then the SDK sends {@link EVENT_PUBGROUP_REJECT_INVITATION_RSP} to notify the UI that the subscriber has rejected the invitation.
 * @param [in] groupId Identifies a group
 * @param [in] groupUrl Indicates a group URL
 * @return 0 Indicates that the method is successfully invoked
 *     <br>1 Indicates that invoking the method fails
 */
+ (int) rejectInvitation:(NSString*) groupId groupUrl:(NSString*) groupUrl;

/**
 * <b>Description:</b> This method is used to accept a request for joining a group.
 * <br><b>Purpose:</b> When a subscriber requests to join a group, the group administrator receives
 * the {@link EVENT_PUBGROUP_JOIN_INCOMING} broadcast. The UI of the administrator can invoke this method to accept the request.
 * If the invocation is successful, the UI receives the {@link EVENT_PUBGROUP_ACCEPT_JOIN_REQ_RSP} broadcast.
 * @param [in] uri Specifies the URI of the subscriber who requests to join a group.
 * @param [in] groupId Identifies a group
 * @param [in] groupUrl Indicates a group URL
 * @return 0 Indicates that the method is successfully invoked
 *     <br>1 Indicates that invoking the method fails
 */
+ (int) acceptJoinReq:(NSString*) uri groupId:(NSString*) groupId groupUrl:(NSString*) groupUrl;

/**
 * <b>Description:</b> This method is used to reject a request for joining a group.
 * <br><b>Purpose:</b> When a subscriber requests to join a group, the group administrator receives the {@link EVENT_PUBGROUP_JOIN_INCOMING} broadcast.
 * The UI of the administrator can invoke this method to reject the request. If the invocation is successful, the UI receives the {@link EVENT_PUBGROUP_REJECT_JOIN_REQ_RSP} broadcast.
 * @param [in] uri Identifies a UC contact who requests to join a group.
 * @param [in] groupId Identifies a group
 * @param [in] groupUrl Indicates a group URL
 * @return 0 Indicates that the method is successfully invoked
 *     <br>1 Indicates that invoking the method fails
 */
+ (int) rejectJoinReq:(NSString*) uri groupId:(NSString*) groupId groupUrl:(NSString*) groupUrl;

/**
 * <b>Description:</b> This method is used to create a permanent group.
 * <br><b>Purpose:</b> Only UC contacts can create permanent groups. The result of creating a permanent group is broadcast to the UI
 * by {@link EVENT_PUBGROUP_CREATE_GROUP_WITH_MEMBER_RSP}. If the creation of a permanent group is successful, the UI also receives
 * the {@link EVENT_PUBGROUP_GROUP_INFO_CHANGED} broadcast. Then the UI refreshes the group list on the contact page of the client.
 * When creating a group, the UI must specify a group name, authentication mode. However, a group bulletin or group introduction is optional.
 * The server places a limit on the number of groups that an enterprise is allowed to be created. If the number of groups created by
 * a contact has reached the limit, the contact will fail to create any new group.
 * @param [in] name Specifies a group name. It must not be left empty.
 * @param [in] description Specifies a group introduction. It can be left empty.
 * @param [in] bulletin Specifies a group bulletin. It can be left empty.
 * @param [in] permitType Specifies the authentication type for contacts requesting to join a group. It can be set to any one of the {@link tag_PUBGROUP_PERMIT_TYPE} enumeration.
 * @param [in] memberAddArray Specifies the members to be added. It is the array of objects of {@link MemberAddParam} class.
 * @param [in] cookie Identifies an operation of creating a permanent group.
 * @return 0 Indicates that the method is successfully invoked.
 *     <br>1 Indicates that invoking the method fails
 */
+ (int) create:(NSString*) name description:(NSString*) description bulletin:(NSString *) bulletin permit:(int) permitType memberAddArray:(NSArray*) memberAddArray cookie:(unsigned long) cookie;


@end

#endif
