//
//  HNAGeneral.h
//  HNAHRMPro
//
//  Created by 海峰 on 14-3-6.
//  Copyright (c) 2014年 海峰. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonCrypto.h>
#import <CommonCrypto/CommonDigest.h>
#import "MBProgressHUD.h"
#import "kqAppDelegate.h"
#import "Reachability.h"

@interface HNAGeneral : NSObject
+(NSString *) getKeychainIdentifier;
+(bool) is_iphone_5;
+(int) getScreenHeight;
+(int) fixIP5:(int)height;
+(void) showAlertViewWithTitle:(NSString *) title andMessage:(NSString *) message;
+(NSString *) stringToHtml:(NSString *) oldStr;
+(NSString *) giveMeATimeWith:(NSDateComponents *) comps andTime:(NSString *) time withIsBegin:(BOOL) begin;
+(NSArray *) giveMeAWeekArrayWithBeginTime:(NSString *) beginTime andEndTime:(NSString *) endTime;
+(NSString *) giveMeTheWeekDayWithDay:(NSString *) day;
+(NSString *) giveMeTheNextDayWithDay:(NSString *)day;
+(NSString *) giveMeThePreviousDayWithDay:(NSString *)day;
+(NSString *) giveMeTheMonthdayWithTheDay:(NSString *) day;
+(NSString *) giveMeTheFraidayWithTheDay:(NSString *) day;
+ (NSInteger)numberOfDaysFromTheDay:(NSString *) beginDay toTheDay:(NSString *) endDay;
+ (void)showOnWindow:(NSString *) text;
+(void) hidenHUD;
+(void) showTipTextOnWindow:(NSString *) text;
+ (NSString *)md5:(NSString *)str;
+(NSString *) getContent:(NSDictionary *) dictionary;
+(NSString *) getContentString:(NSString *) title;
+(BOOL) isConnectionAvailable;
+(CGSize)downloadImageSizeWithURL:(NSString *)imageURL;
+ (UIImage *)fixOrientation:(UIImage *)aImage;
+(void) initChangLiangWithIsSchool:(BOOL) isSchool;
+(void) setLabelTextWithDayLabel:(UILabel *) dayLabel andMonthLabel:(UILabel *) monthLabel andHourLabel:(UILabel *) hourLabel andTimeString:(NSString *) timeString;
@end
