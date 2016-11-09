//
//  ContactsEngine.h
//  sa
//
//  Created by huawei2 on 12-7-27.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AddressBook/AddressBook.h>

#ifndef SA_CONTACT_BROADCAST
#define SA_CONTACT_BROADCAST  @"SA_CONTACT_BROADCAST"         // broadcast
#define SA_CONTACT_MODEL_KEY  @"ContactsModel"               //ContactsModel key name, use for the receiver get data
#define SA_ACTION_TYPE_KEY  @"actionType"               //actionType key name(value:see Sa_Contacts_Action_Type), use for the receiver get data
#endif

#ifndef SA_FRIVATE_CHANGE_BROADCAST
#define SA_FRIVATE_CHANGE_BROADCAST  @"SA_FRIVATE_CHANGE_BROADCAST"   //broadcast UI notify add/remove frivate
#define SA_FRIVATE_CHANGE_KEY  @"SA_FRIVATE_CHANGE_KEY"   //frivate key name contactId
#endif

#ifndef SA_CAB_SYNC_CONTACT_CHANGE
#define SA_CAB_SYNC_CONTACT_CHANGE  @"SA_CAB_SYNC_CONTACT_CHANGE"
#endif

typedef enum{
	CONTACTS_ALL = 0,
    CONTACTS_RCS,
    CONTACTS_ONLINE_RCS,
}Sa_ContactsType;

//@在此处定义回调UI的接口
@protocol Sa_ContactsDelegate <NSObject>

@optional

/**
 * @brief sa_contactsUpdateNotify
 * 联系人变更通知
 * @return void
 */
-(void)sa_contactsUpdateNotify;

@end

@class ContactsModel;
@class CapabilityModel;
@class PresenceModel;
@class Contact;

@interface Sa_ContactsEngine : NSObject
{
@private
    NSMutableArray* _contactsArray;
    NSMutableArray* _orgContactsArray;
    NSMutableDictionary* _phoneDictionary;
    NSMutableArray* _modifyArray;
    NSMutableDictionary* _quickSearchPhone;
    NSMutableDictionary* _quickSearchName;
    BOOL _hasFillCapbility;
    id<Sa_ContactsDelegate> _contactsDelegate;
    BOOL _isExternalChange;
    int _defaultIconWidth;
    int _defaultIconHeight;
    NSMutableArray* _iconUpdateBuffArray;
    BOOL _isIdle2WriteIcons;
    BOOL _isExternalChangeInOneMinute;
    BOOL _isFirstLoadContactAll;
}

@property(nonatomic,retain)NSMutableArray* contactsArray; //排序好的联系人队列
@property(nonatomic,retain)NSMutableArray* orgContactsArray; //原始的联系人队列
@property(nonatomic,retain)NSMutableDictionary* phoneDictionary; //电话字典 以电话号码为索引 存号码相关联系人
@property(nonatomic,retain)NSMutableArray* modifyArray;
@property(nonatomic,retain)NSMutableDictionary* quickSearchPhone; //完整的电话字典 以电话号码和相关联系人，实现快速搜索
@property(nonatomic,retain)NSMutableDictionary* quickSearchName;
@property(nonatomic,assign) id<Sa_ContactsDelegate> contactsDelegate; //联系人delegate
@property(nonatomic,assign) BOOL isExternalChange;  //外部地址本变更
@property(nonatomic,assign) BOOL hasFillCapbility;  //已经填充能力
@property(nonatomic,assign) BOOL isSuccessfulLogin; //成功登陆标志 add by hhx 2013-1-10
@property(nonatomic,assign) BOOL isExternalChangeInOneMinute; //1分钟内外部数据改变 标志

//-(void)reInit;
/**
 * @brief sa_loadContacts
 * 加载地址本
 * @return void
 */
+(void)sa_loadContacts;

/**
 * @brief sa_addContacts
 * 添加一个联系人到地址本,并加入缓存列表
 * @param in model: 待加入的联系人数据模型
 * @return void
 */
+(void)sa_addContacts:(ContactsModel*)model;

/**
 * @brief sa_updateContacts
 * 修改一个联系人到地址本,并修改缓存列表
 * @param in model: 待修改的联系人数据模型
 * @param in fromType: see Sa_Contacts_Action_Type
 * @return void
 */
+(void)sa_updateContacts:(ContactsModel*)model fromType:(int)fromType;

/**
 * @brief sa_removeContacts
 * 删除一个联系人(从地址本),并从缓存列表中删除
 * @param in model: 待删除的联系人数据模型
 * @return void
 */
+(void)sa_removeContacts:(ContactsModel*)model;

/**
 * @brief sa_updateIconToAB
 * 更新头像到原生地址本
 * @param in addressBook: 地址本对象
 * @param in ctModel: 待更新头像的联系人数据模型
 * @return void
 */
+ (void)sa_updateIconToAB:(ABAddressBookRef)addressBook withModel:(ContactsModel *)ctModel;

/**
 * @brief sa_getContactIconByContactId
 * 获取联系人头象
 * @param in contactId: 待删除的联系人contactId
 * @return 头象数据
 */
+(NSData*)sa_getContactIconByContactId:(unsigned int)contactId;

/**
 * @brief sa_searchContactsByKey
 * 联系人模糊检索
 * @param in serchKey: 待检索的联系人检索内容
 * @return 联系人队列(ContactsModel数组);nil:不存在
 */
+(NSArray*)sa_searchContactsByKey:(NSString*)serchKey;

/**
 * @brief sa_superDialSearchByKey
 * 拨号盘智能检索
 * @param in serchKey: 待检索的联系人检索内容
 * @param in isNumKeyBoard: 是否数字键盘
 * @param in rcsOnly: 是否只查询RCS用户
 * @return 联系人队列(ContactsModel数组);nil:不存在
 */
+(NSArray*)sa_superDialSearchByKey:(NSString*)serchKey isNumKeyBoard:(BOOL)isNumKeyBoard contactsType:(Sa_ContactsType)contactsType;

+ (NSArray *) sa_quickSearchPhone:(NSString *)searchKey isNumKeyBoard:(BOOL)isNumKeyBoard withoutName:(BOOL) bWithoutName;
+ (NSArray *) sa_quickSearchName:(NSString *)searchKey isNumKeyBoard:(BOOL)isNumKeyBoard;
/**
 * @brief sa_searchRcsFriendByKey
 * Rcs好友模糊检索
 * @param in friendArray: 被检索的RCS好友列表
 * @param in serchKey: 待检索的联系人检索内容
 * @return RCS好友队列(ContactsModel数组);nil:不存在
 */
+(NSArray*)sa_searchRcsFriendByKey:(NSArray*)friendArray searchKey:(NSString*)serchKey;

/**
 * @brief sa_searchContacts
 * 根据联系人ID检索一个联系人
 * @param in contactId: 待检索的联系人ID
 * @return 联系人数据模型ContactsModel;nil:不存在
 */
//+(id)sa_searchContacts:(unsigned int)contactId;

/**
 * @brief sa_searchContactsByUri
 * 根据联系人uri检索一个联系人
 * @param in uri: 待检索的联系人uri
 * @return 联系人数据模型ContactsModel;nil:不存在
 */
//+(id)sa_searchContactsByUri:(NSString*)uri;


/**
 * @brief sa_moveContactToHead
 * 根据索引移动一个联系人元素到数字最前面
 * @param in contactArray: 联系人数组
 * @param in index: 待获取的联系人索引
 * @return 联系人数据模型ContactsModel;nil:不存在
 */
+(void)sa_moveContactToHead:(NSMutableArray*)contactArray moveItemIndex:(int)index;

/**
 * @brief sa_getSessionAndRowByContactId
 * 根据联系人ID 直接获取一个联系人所在的session和row的索引
 * @param in contactId: 待获取的联系人ID
 * @param in session: 待获取的联系人session索引
 * @param in row: 待获取的联系人row索引
 * @return 联系人数据模型ContactsModel;nil:不存在
 */
+(BOOL)sa_getSessionAndRowByContactId:(unsigned int)contactId session:(int*)session row:(int*)row;

/**
 * @brief sa_getFavorite
 * 获取全部常用联系人
 * @return 常用联系人队列(ContactsModel数组);nil:不存在
 */
+ (NSArray *)sa_getFavorite;

/**
 * @brief sa_getFavorite
 * 获取指定最大数目的常用联系人
 * @param in maxNum:限制最大数目
 * @return 常用联系人队列(ContactsModel数组);nil:不存在
 */
+ (NSArray *)sa_getFavorite:(unsigned int)maxNum;

/**
 * @brief sa_addFavorite
 * 添加一个常用联系人
 * @param in contactId:联系人的ID
 * @return YES 执行成功 : NO 执行失败
 */
+(BOOL)sa_addFavorite:(unsigned int)contactId;

/**
 * @brief sa_removeFavorite
 * 删除一个常用联系人
 * @param in contactId:联系人的ID
 * @return YES 执行成功 : NO 执行失败
 */
+(BOOL)sa_removeFavorite:(unsigned int)contactId;

/**
 * @brief sa_getRcsFriends
 * 获取全部Rcs/RcsE 好友
 * @return 好友队列(ContactsModel数组);nil:不存在
 */
+(NSArray*)sa_getRcsFriends;

/**
 * @brief sa_getRcsFriendsOfOnline
 * 获取在线的Rcs/RcsE 好友
 * @return 好友队列(ContactsModel数组);nil:不存在
 */
+(NSArray*)sa_getRcsFriendsOfOnline;//add by yxx 2013-03-27

/**
 * @brief sa_loadAllRcsFriendsByRcsNum
 * 获取全部Rcs/RcsE 好友 包括多号码
 * @return 好友队列(ContactsModel数组);nil:不存在
 */
+(NSMutableArray*)sa_loadAllRcsFriendsByRcsNum;

//获取RCS好友电话个数
+ (int)sa_getRcsFriendsNumCount:(NSArray*)arr isSearch:(BOOL)isSearch;

+ (int)sa_getRcsFriendsNumCountX:(NSArray*)arr isSearch:(BOOL)isSearch;

//获取RCS好友电话的联系人模型
+ (id)sa_getRcsFriendsNumModel:(NSArray*)arr index:(int)index matchPhoneIndex:(int*)matchPhoneIndex isSearch:(BOOL)isSearch;

+ (id)sa_getRcsFriendsNumModelX:(NSArray*)arr index:(int)index matchPhoneIndex:(int*)matchPhoneIndex isSearch:(BOOL)isSearch;

/**
 * @brief sa_searchCustomContactByUri
 * 获取联系人
 * @return 联系人;nil:不存在
 */
+(id)sa_searchCustomContactByUri:(NSString*)uri;

/**
 * @brief sa_getAllNumberCount
 * 获取全部联系人个数
 * @return 联系人个数
 */
+(int)sa_getAllNumberCount;


/**
 * @brief sa_loadCaps
 * 加载外部系统新倒入联系人的能力信息
 * @return void
 */
+(void)sa_loadCapsForNewContact;

/**
 * @brief sa_loadCapabilityByContactModel
 * 加载全部联系人的能力信息
 * @param in/out model:联系人的数据模型
 * @return void
 */
+(void)sa_loadCapabilityByContactModel:(ContactsModel*)model;

/**
 * @brief sa_getCapabilityByPhoneNumber
 * 根据号码去取能力模型
 * @param in phoneNumber:号码
 * @return CapabilityModel数据模型
 */
+(CapabilityModel*)sa_getCapabilityByPhoneNumber:(NSString*)phoneNumber;

/**
 * @brief sa_getPresenceByPhoneNumber
 * 根据号码去取presence模型
 * @param in phoneNumber:号码
 * @return PresenceModel数据模型
 */
+(PresenceModel*)sa_getPresenceByPhoneNumber:(NSString*)phoneNumber;


/**
 * @brief sa_getStatusbyContactModel
 * 根据联系人model去取在线状态（非im使用）
 * @return void
 */
+(int)sa_getStatusbyContactModel:(ContactsModel*)model;

/**
 * @brief sa_getStatusbyCapabilityModel
 * 根据能力model去取在线状态（非im使用）
 * @return void
 */
+(int)sa_getStatusbyCapabilityModel:(CapabilityModel*)model;

// add by myz
/**
 * @brief sa_getSocialNetWorkPluginByContactModel
 * 根据联系人model获取个人绑定插件
 * @return 联系人所绑定插件的json字符串信息
 */
+(NSString *)sa_getSocialNetWorkPluginByContactModel:(ContactsModel*)model;
// add by myz
/**
 * @brief sa_getSocialNetWorkPluginArrayByContactModel
 * 根据联系人model获取个人绑定插件
 * @return 联系人所绑定插件的数组信息
 */
+(NSArray *)sa_getSocialNetWorkPluginArrayByContactModel:(ContactsModel*)model;
// add by myz
/**
 * @brief sa_getSocialNetWorkPluginDicByContactModel
 * 根据联系人model获取个人绑定插件
 * @return 联系人所绑定插件的字典信息
 */
+(NSDictionary *)sa_getSocialNetWorkPluginDicByContactModel:(Contact*)contact;
/**
 * @brief sa_getSelfNoteByContactModel
 * 根据联系人model去取个人签名
 * @return void
 */
+(NSString*)sa_getSelfNoteByContactModel:(ContactsModel*)model;
/**
 * @brief sa_getIconPathByContactModel
 * 根据联系人model去取头像路径
 * @return void
 */
+(NSString*)sa_getIconPathByContactModel:(ContactsModel*)model;
/**
 * @brief get ContactsEngine Instance
 * 获取ContactsEngine实例
 * @return ContactsEngine实例
 */
+ (id)getEngine;

/**
 * @brief release ContactsEngine Instance
 * 释放ContactsEngine实例
 */
+ (void)releaseEngine;

/**
 * @brief sa_getContactFullName
 * 根据联系人的firstName、middleName和lastName和company得到联系人的全称
 * @return 联系人的全称
 */
+ (NSString *)sa_getContactFullName:(NSString *)firstName midName:(NSString *)middleName lastName:(NSString *)lastName company:(NSString *)company;

+ (void)sa_ABExternalChange;

+ (id)sa_getIconByPhoneNum:(NSString*)phoneNum;

-(void)initWithDefaultIconSize:(int)width defaultIconHeight:(int)height;

+(void)sa_refreshConversationsByContacts;

+(void)sa_resetExternalChangeFlag;

+(void)sa_addressDataPrivacy;;

+(void)sa_updateContactIcon:(ContactsModel*)model;
@end
