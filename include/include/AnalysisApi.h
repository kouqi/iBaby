/**
 * @file LogApi.h
 * @brief Log Interface Functions
 */
#ifndef _ANALYSIS_API_H
#define _ANALYSIS_API_H

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

#define AnalysisOnlineConfigDidFinishedNotification @"OnlineConfigDidFinishedNotification"
#define XcodeAppVersion [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]

//UI first event
#define UILOGINEVENT               @"UI_L"
#define UIAUDIOCALLEVENT           @"UI_ACa"
#define UIVIDEOCALLEVENT           @"UI_VCa"
#define UIIMTEXTEVENT              @"UI_ITe"
#define UIIMPICTUREEVENT           @"UI_IPi"
#define UIIMVCARDEVENT             @"UI_IVC"
#define UIIMPTTEVENT               @"UI_IPT"
#define UIIMLOCATIONEVENT          @"UI_ILo"
#define UIIMVIDEOEVENT             @"UI_IVi"
#define UIIMFILEEVENT              @"UI_IFi"
//UI first param of first event
#define ANALYSISSUCCESSRATE                @"SuccessRate"  
#define ANALYSISSINGLEIMTIME               @"Send_TIME"
#define ANALYSISSINGLEIMFILESPEED          @"Send_KBTIME"
#define ANALYSISRINGTIME                   @"Ring_Time"
#define ANALYSISCALLQOS                    @"QosInfo"
#define ANALYSISAUDIOCALL                  @"AudioCall"
#define ANALYSISVIDEOCALL                  @"VideoCall"
#define ANALYSISSINGLEIMSUCCESSRATE        @"Single_SendSuccessRate"
#define ANALYSISGROUPIMSUCCESSRATE         @"Group_SendSuccessRate"

//UI second Param of first event
#define ANALYSISCALLDELAY                  @"CallQos_Delay"
#define ANALYSISCALLLOSTRATIO              @"CallQos_LostRatio"
#define ANALYSISCALLSENDBITRATE            @"VideoCallQos_SendBirate"
#define ANALYSISCALLRECVBITRATE            @"VideoCallQos_RecvBirate"
#define ANALYSISVIDEOCALLRESOLUTION        @"VideoCallQos_Resolution"
#define ANALYSISVIDEOCALLSENDFRAME         @"VideoCallQos_SendFrame"
#define ANALYSISVIDEOCALLRECVFRAME         @"VideoCallQos_RecvFrame"


typedef enum {
    REALTIME = 0,       //实时发送
    BATCH = 1,          //启动发送
    SENDDAILY = 4,      //每日发送
    SENDWIFIONLY = 5,   //仅在WIFI下启动时发送
    SEND_INTERVAL = 6,   //按最小间隔发送
    SEND_ON_EXIT = 7        //退出或进入后台时发送
} ReportPolicy;

/** 
Analysis支持类型，如果不设置，默认关闭统计.
*/
typedef enum
{
    ANALYSIS_CONFIG_NONE = 0,    //统计方法关闭，即使调用Analysis接口只会直接返回
	ANALYSIS_CONFIG_DOMESTIC_TYPE, //海外模式统计，国外建议使用
    ANALYSIS_CONFIG_AMERICAN_TYPE   //国内模式统计，国内建议使用
}ANALYSIS_SUPPORTED_TYPE;

@class CLLocation;

/** CAASAnalysisApi是统计的核心类，本身不需要实例化，所有方法以类方法的形式提供.
    目前发送策略有REALTIME,BATCH,SENDDAILY,SENDWIFIONLY,SEND_INTERVAL,SEND_ON_EXIT。
    其中REALTIME,SENDWIFIONLY 只在模拟器和DEBUG模式下生效，真机release模式会自动改成BATCH。
    SEND_INTERVAL 为按最小间隔发送,默认为10秒,取值范围为10 到 86400(一天)， 如果不在这个区间的话，会按10设置。
    SEND_ON_EXIT 为退出或进入后台时发送,这种发送策略在App运行过程中不发送，对开发者和用户的影响最小。
    不过这种发送策略只在iOS > 4.0时才会生效, iOS < 4.0 会被自动调整为BATCH。

 */
@interface CAASAnalysisApi : NSObject <UIAlertViewDelegate>

#pragma mark basics

+(void) init;

+(void) releaseApi;

///---------------------------------------------------------------------------------------
/// @name  设置
///---------------------------------------------------------------------------------------

/** 设置AnalysisApi。
 @param type Analysis支持类型，如果不设置，默认采用uMeng平台.
 @param version 版本号，例如设置成`XcodeAppVersion`.
 @param isEnabled 设置成NO,就可以关闭CrashReport收集.
 @return void.
 */
+(void) setConfigValue:(ANALYSIS_SUPPORTED_TYPE)type appVersion:(NSString *)version isCrashReportEnabled:(BOOL)isEnabled;

///---------------------------------------------------------------------------------------
/// @name  开启统计
///---------------------------------------------------------------------------------------

/** 开启统计,默认以BATCH方式发送log.
 @param appKey AnalysisappKey.
 @param reportPolicy 发送策略.
 @param channelId 渠道名称,为nil或@""时,默认会被被当作@"App Store"渠道
 @return void
*/
+ (void)startAnalysisWithAppkey:(NSString *)appKey;
+ (void)startAnalysisWithAppkey:(NSString *)appKey reportPolicy:(ReportPolicy)rp channelId:(NSString *)cid;


///---------------------------------------------------------------------------------------
/// @name  页面计时
///---------------------------------------------------------------------------------------

/** 页面时长统计,记录某个view被打开多长时间,可以自己计时也可以调用beginLogPageView,endLogPageView自动计时
 @param pageName 需要记录时长的view名称.
 @param seconds 秒数，int型.
 @return void.
*/

+ (void)logAppPageView:(NSString *)pageName seconds:(int)seconds;
+ (void)beginAppLogPageView:(NSString *)pageName;
+ (void)endAppLogPageView:(NSString *)pageName;

#pragma mark event logs


///---------------------------------------------------------------------------------------
/// @name  事件统计
///---------------------------------------------------------------------------------------

/** 自定义事件,数量统计.
 @param  eventId 网站上注册的事件Id.
 @param  label 分类标签。不同的标签会分别进行统计，方便同一事件的不同标签的对比,为nil或空字符串时后台会生成和eventId同名的标签.
 @param  accumulation 累加值。为减少网络交互，可以自行对某一事件ID的某一分类标签进行累加，再传入次数作为参数。
 @return void.
 */
+ (void)sendAppEvent:(NSString *)eventId; //等同于 event:eventId label:eventId;

/** 自定义事件,数量统计.
 */
+ (void)sendAppEvent:(NSString *)eventId label:(NSString *)label; // label为nil或@""时，等同于 event:eventId label:eventId;

+ (void)sendAppEvent:(NSString *)eventId attributes:(NSDictionary *)attributes;

/** 自定义事件,时长统计.在工程中传入相应的事件ID.
    beginEvent,endEvent要配对使用,也可以自己计时后通过durations参数传递进来
 
 @param  eventId 网站上注册的事件Id.
 @param  label 分类标签。不同的标签会分别进行统计，方便同一事件的不同标签的对比,为nil或空字符串时后台会生成和eventId同名的标签.
 @param  primarykey 这个参数用于和event_id一起标示一个唯一事件，并不会被统计；对于同一个事件在beginEvent和endEvent 中要传递相同的eventId 和 primarykey
 @param millisecond 自己计时需要的话需要传毫秒进来
 @return void.
 
 
 @warning 每个event的attributes不能超过10个
    eventId、attributes中key和value都不能使用空格和特殊字符，eventId、attributes的key最大为128个bytes(128个英文及数字或42个左右汉字)。label、attributes的value最大为256个bytes(256个英文及数字或84个左右汉字),
       超过后将被截短。其中eventId超过的将抛弃不再发送。
    id， ts， du是保留字段，不能作为eventId及key的名称

*/
+ (void)beginAppEvent:(NSString *)eventId;

/** 自定义事件,时长统计.
 */
+ (void)endAppEvent:(NSString *)eventId;

/** 自定义事件,时长统计.
 */
+ (void)beginAppEvent:(NSString *)eventId label:(NSString *)label;

/** 自定义事件,时长统计.
 */
+ (void)endAppEvent:(NSString *)eventId label:(NSString *)label;

/** 自定义事件,时长统计.
 */
+ (void)beginAppEvent:(NSString *)eventId primarykey :(NSString *)keyName attributes:(NSDictionary *)attributes;
/** 自定义事件,时长统计.
 */

+ (void)endAppEvent:(NSString *)eventId primarykey:(NSString *)keyName;
/** 自定义事件,时长统计.
 */

+ (void)sendAppEvent:(NSString *)eventId duration:(int)millisecond;

/** 自定义事件,时长统计.
 */
+ (void)sendAppEvent:(NSString *)eventId label:(NSString *)label duration:(int)millisecond;

/** 自定义事件,时长统计.
 */
+ (void)sendAppEvent:(NSString *)eventId attribute:(NSDictionary *)attribute duration:(int)millisecond;
/*用于统计数字分布*/
+ (void)sendAppEventbyNumber:(NSString *)eventId attribute:(NSDictionary *)attribute number:(NSNumber *)number;

///---------------------------------------------------------------------------------------
/// @name 地理位置设置
///---------------------------------------------------------------------------------------
/** 为了更精确的统计用户地理位置，可以调用此方法传入经纬度信息
    需要链接 CoreLocation.framework 并且 #import <CoreLocation/CoreLocation.h>
 @param latitude 纬度.
 @param longitude 经度.
 @param location CLLocation *型的地理信息
 @return void
 */

+ (void)setAppLatitude:(double)latitude longitude:(double)longitude;
/** 为了更精确的统计用户地理位置，可以调用此方法传入经纬度信息
 */
+ (void)setAppLocation:(CLLocation *)location;


///---------------------------------------------------------------------------------------
/// @name helper方法
///---------------------------------------------------------------------------------------
/** 判断设备是否越狱，判断方法根据 apt和Cydia.app的path来判断
 */
+ (BOOL)isDeviceJailbroken;
/** 判断你的App是否被破解
 */
+ (BOOL)isAppPirated;
@end
#endif