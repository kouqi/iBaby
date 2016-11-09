//
//  HNAGeneral.m
//  HNAHRMPro
//
//  Created by 海峰 on 14-3-6.
//  Copyright (c) 2014年 海峰. All rights reserved.
//

#import "HNAGeneral.h"
#import "KeychainItemWrapper.h"
#define IS_IPHONE_5 ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )568 ) < DBL_EPSILON)

@implementation HNAGeneral

+(NSString *) getKeychainIdentifier{
    
    KeychainItemWrapper *wrapper = [[KeychainItemWrapper alloc] initWithIdentifier:@"deviceIdentifier" accessGroup:nil];
    //    NSString *username = [wrapper objectForKey:(id)kSecAttrAccount];
    //    NSString *password = [wrapper objectForKey:(id)kSecValueData];
    NSString *uniqueIdentifier = [wrapper objectForKey:(id)kSecAttrAccount];
    // initially all these are empty
    //    NSLog(@"username - %@", username); // username -
    //    NSLog(@"password - %@", password); // password -
    NSLog(@"device_identifier:%@",uniqueIdentifier);
    if ([uniqueIdentifier isEqualToString:@""]) {
        [wrapper setObject:getuuid() forKey:(id)kSecAttrAccount];
        NSLog(@"set uniqueIdentifier.");
    }
    
    uniqueIdentifier = [wrapper objectForKey:(id)kSecAttrAccount];
    NSLog(@"uniqueIdentifier:%@", uniqueIdentifier);
    return uniqueIdentifier;
    
    //if empty set your credentials
    //    if ( [username isEqualToString:@""] ) {
    //        [wrapper setObject:getuuid() forKey:(id)kSecAttrAccount];
    //    }
    //    if ( [password isEqualToString:@""] ) {
    //        [wrapper setObject:getuuid() forKey:(id)kSecValueData];
    //    }
    
    //get the latest credentials - now you have the set values
    //    username = [wrapper objectForKey:(id)kSecAttrAccount];
    //    password = [wrapper objectForKey:(id)kSecValueData];
    
    //    NSLog(@"username - %@", username); // username - your username here
    //    NSLog(@"password - %@", password); // password - your password here
    
    // reset your keychain items - if  needed
    //[wrapper resetKeychainItem];
    
    
} //getDeviceIdentifier

NSString * getuuid()
{
    CFUUIDRef uuid_ref = CFUUIDCreate(NULL);
    CFStringRef uuid_string_ref= CFUUIDCreateString(NULL, uuid_ref);
    CFRelease(uuid_ref);
    NSString *uuid = [NSString stringWithString:(__bridge NSString*)uuid_string_ref];
    CFRelease(uuid_string_ref);
    return uuid;
}


+(bool) is_iphone_5
{
    static bool first = true;
    static bool res = false;
    if (first) {
        res = IS_IPHONE_5;
        first = false;
    }
    return res;
}

+(int) getScreenHeight
{
    return [self is_iphone_5] ? 568 : 480;
}

+(int) fixIP5:(int)height
{
    return height + ([self getScreenHeight] - 480);
}

//md5 32位 加密 （小写）
+ (NSString *)md5:(NSString *)str {
    const char *cStr = [str UTF8String];//转换成utf-8
    unsigned char result[16];//开辟一个16字节（128位：md5加密出来就是128位/bit）的空间（一个字节=8字位=8个二进制数）
    CC_MD5( cStr, (CC_LONG)strlen(cStr), result);
    /*
     extern unsigned char *CC_MD5(const void *data, CC_LONG len, unsigned char *md)官方封装好的加密方法
     把cStr字符串转换成了32位的16进制数列（这个过程不可逆转） 存储到了result这个空间中
     */
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
    /*
     x表示十六进制，%02X  意思是不足两位将用0补齐，如果多余两位则不影响
     NSLog("%02X", 0x888);  //888
     NSLog("%02X", 0x4); //04
     */
}

/**
 *  弹出警告框
 *
 *  @param title   框标题
 *  @param message 提示内容
 */
+(void) showAlertViewWithTitle:(NSString *) title andMessage:(NSString *) message
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil , nil];
    [alert show];
}

/**
 *  显示提示文字
 *
 *  @param text 提示文字
 */
+(void) showTipTextOnWindow:(NSString *) text
{
    UIApplication *app = [UIApplication sharedApplication];
    kqAppDelegate *appdelegate = (kqAppDelegate *)app.delegate;
    MBProgressHUD *hud = (MBProgressHUD *)[appdelegate.window viewWithTag:10086];
    if (hud == nil) {
        hud = [[MBProgressHUD alloc] initWithView:appdelegate.window];
        hud.tag = 10086;
        [appdelegate.window addSubview:hud];
    }else{
        [hud removeFromSuperview];
        [appdelegate.window addSubview:hud];
    }
    hud.mode = MBProgressHUDModeText;
    hud.labelText = text;
    [hud show:YES];
    [hud hide:YES afterDelay:1];
}

/**
 *  将字符串转换成html标准字符串（部分）
 *
 *  @param oldStr 旧字符串
 *
 *  @return 转换后的字符串
 */
+(NSString *) stringToHtml:(NSString *) oldStr
{
    NSString *str = [NSString stringWithString:oldStr];
    str = [str stringByReplacingOccurrencesOfString:@"u003c" withString:@"<"];
    str = [str stringByReplacingOccurrencesOfString:@"u003e" withString:@">"];
    str = [str stringByReplacingOccurrencesOfString:@"u000a" withString:@"\n"];
    str = [str stringByReplacingOccurrencesOfString:@"u0009" withString:@"\t"];
    str = [str stringByReplacingOccurrencesOfString:@"u0008" withString:@"\b"];
    str = [str stringByReplacingOccurrencesOfString:@"u000d" withString:@"\r"];
    str = [str stringByReplacingOccurrencesOfString:@"@*@" withString:@"\""];
    return str;
}

/**
 *   计算一个月有多少天
 *
 *  @param months 月份
 *  @param years  年份
 *
 *  @return 天数
 */
+(int) daysOftheMonth:(NSString *) months andYear:(NSString *) years
{
    int month = [months intValue];
    int year = [years intValue];
    switch(month)
    {
        case 1:
        case 3:
        case 5:
        case 7:
        case 8:
        case 10:
        case 12:
            return 31;
            break;
        case 4:
        case 6:
        case 9:
        case 11:
            return 30;
            break;
        case 2:
            if(((year%4==0) && (year%100!=0))||(year%400==0))
                return 29;
            else
                return 28;
        default:
            return 0;
    }
}

/**
 *  根据给定的comps返回一个一周开始或结束的时间
 *
 *  @param comps 给定的comps
 *  @param time  给定的时间
 *  @param begin 是开始还是结束
 *
 *  @return 返回一个时间
 */
+(NSString *) giveMeATimeWith:(NSDateComponents *) comps andTime:(NSString *) time withIsBegin:(BOOL) begin
{
    NSString *theTime;
    NSString *year = [time substringWithRange:NSMakeRange(0, 4)];
    NSString *month = [time substringWithRange:NSMakeRange(5, 2)];
    NSString *day = [time substringWithRange:NSMakeRange(8, 2)];
    int yeari = [year intValue];
    int monthi = [month intValue];
    int dayi = [day intValue];
    int mothdays;
    if (!begin) {
        //2016-07-07 改动
//        int previousMonthi = monthi - 1;
        int previousMonthi = monthi;
        if (previousMonthi == 0) {
            mothdays = [self daysOftheMonth:[NSString stringWithFormat:@"12"] andYear:[NSString stringWithFormat:@"%d",yeari - 1]];
        }else{
            mothdays = [self daysOftheMonth:[NSString stringWithFormat:@"%d",previousMonthi] andYear:year];
        }
        NSString *rMonth,*rday;
        switch (comps.weekday - 1) {
            case 1:
            {
                theTime = time;
            }
                break;
            case 2:
            {
                dayi = dayi - 1;
                if (dayi == 0) {
                    monthi = monthi - 1;
                    if (monthi == 0) {
                        yeari --;
                        monthi = 12;
                    }
                    dayi = mothdays;
                }
                if (dayi > 0 && dayi < 10) {
                    rday = [NSString stringWithFormat:@"0%d",dayi];
                }
                if (dayi >= 10) {
                    rday = [NSString stringWithFormat:@"%d",dayi];
                }
                if (monthi > 0 && monthi < 10) {
                    rMonth = [NSString stringWithFormat:@"0%d",monthi];
                }
                if (monthi >= 10) {
                    rMonth = [NSString stringWithFormat:@"%d",monthi];
                }
                theTime = [NSString stringWithFormat:@"%d-%@-%@",yeari,rMonth,rday];
            }
                break;
            case 3:
            {
                dayi = dayi - 2;
                if (dayi == 0) {
                    monthi = monthi - 1;
                    if (monthi == 0) {
                        yeari --;
                        monthi = 12;
                    }
                    dayi = mothdays;
                }
                if (dayi > 0 && dayi < 10) {
                    rday = [NSString stringWithFormat:@"0%d",dayi];
                }
                if (dayi >= 10) {
                    rday = [NSString stringWithFormat:@"%d",dayi];
                }
                if (monthi > 0 && monthi < 10) {
                    rMonth = [NSString stringWithFormat:@"0%d",monthi];
                }
                if (monthi >= 10) {
                    rMonth = [NSString stringWithFormat:@"%d",monthi];
                }
                theTime = [NSString stringWithFormat:@"%d-%@-%@",yeari,rMonth,rday];
            }
                break;
            case 4:
            {
                dayi = dayi - 3;
                if (dayi == 0) {
                    monthi = monthi - 1;
                    if (monthi == 0) {
                        yeari --;
                        monthi = 12;
                    }
                    dayi = mothdays;
                }
                if (dayi > 0 && dayi < 10) {
                    rday = [NSString stringWithFormat:@"0%d",dayi];
                }
                if (dayi >= 10) {
                    rday = [NSString stringWithFormat:@"%d",dayi];
                }
                if (monthi > 0 && monthi < 10) {
                    rMonth = [NSString stringWithFormat:@"0%d",monthi];
                }
                if (monthi >= 10) {
                    rMonth = [NSString stringWithFormat:@"%d",monthi];
                }
                theTime = [NSString stringWithFormat:@"%d-%@-%@",yeari,rMonth,rday];
            }
                break;
            case 5:
            {
                dayi = dayi - 4;
                if (dayi == 0) {
                    monthi = monthi - 1;
                    if (monthi == 0) {
                        yeari --;
                        monthi = 12;
                    }
                    dayi = mothdays;
                }
                if (dayi > 0 && dayi < 10) {
                    rday = [NSString stringWithFormat:@"0%d",dayi];
                }
                if (dayi >= 10) {
                    rday = [NSString stringWithFormat:@"%d",dayi];
                }
                if (monthi > 0 && monthi < 10) {
                    rMonth = [NSString stringWithFormat:@"0%d",monthi];
                }
                if (monthi >= 10) {
                    rMonth = [NSString stringWithFormat:@"%d",monthi];
                }
                theTime = [NSString stringWithFormat:@"%d-%@-%@",yeari,rMonth,rday];
            }
                break;
            case 6:
            {
                dayi = dayi + 2;
                if (dayi > mothdays) {
                    monthi ++;
                    if (monthi >= 13) {
                        yeari ++;
                        monthi = 1;
                    }
                    dayi = 1;
                }
                if (dayi > 0 && dayi < 10) {
                    rday = [NSString stringWithFormat:@"0%d",dayi];
                }
                if (dayi >= 10) {
                    rday = [NSString stringWithFormat:@"%d",dayi];
                }
                if (monthi > 0 && monthi < 10) {
                    rMonth = [NSString stringWithFormat:@"0%d",monthi];
                }
                if (monthi >= 10) {
                    rMonth = [NSString stringWithFormat:@"%d",monthi];
                }
                theTime = [NSString stringWithFormat:@"%d-%@-%@",yeari,rMonth,rday];
            }
                break;
            case 0:
            {
                dayi = dayi + 1;
                if (dayi > mothdays) {
                    monthi ++;
                    if (monthi >= 13) {
                        yeari ++;
                        monthi = 1;
                    }
                    dayi = 1;
                }
                if (dayi > 0 && dayi < 10) {
                    rday = [NSString stringWithFormat:@"0%d",dayi];
                }
                if (dayi >= 10) {
                    rday = [NSString stringWithFormat:@"%d",dayi];
                }
                if (monthi > 0 && monthi < 10) {
                    rMonth = [NSString stringWithFormat:@"0%d",monthi];
                }
                if (monthi >= 10) {
                    rMonth = [NSString stringWithFormat:@"%d",monthi];
                }
                theTime = [NSString stringWithFormat:@"%d-%@-%@",yeari,rMonth,rday];
            }
                break;

            default:
                break;
        }
        return theTime;
    }else{
        //2016-07-07 改动
//        int nextMonthi = monthi + 1;
        int nextMonthi = monthi;
        
        if (nextMonthi >= 13) {
            mothdays = [self daysOftheMonth:[NSString stringWithFormat:@"01"] andYear:[NSString stringWithFormat:@"%d",yeari + 1]];
        }else{
            mothdays = [self daysOftheMonth:[NSString stringWithFormat:@"%d",nextMonthi] andYear:year];
        }
        NSString *rMonth,*rday;
        switch (comps.weekday - 1) {
            case 0:
            {
                dayi = dayi - 2;
                if (dayi == 0) {
                    monthi = monthi - 1;
                    if (monthi == 0) {
                        yeari --;
                        monthi = 12;
                    }
                    dayi = mothdays;
                }
                if (dayi > 0 && dayi < 10) {
                    rday = [NSString stringWithFormat:@"0%d",dayi];
                }
                if (dayi >= 10) {
                    rday = [NSString stringWithFormat:@"%d",dayi];
                }
                if (monthi > 0 && monthi < 10) {
                    rMonth = [NSString stringWithFormat:@"0%d",monthi];
                }
                if (monthi >= 10) {
                    rMonth = [NSString stringWithFormat:@"%d",monthi];
                }
                theTime = [NSString stringWithFormat:@"%d-%@-%@",yeari,rMonth,rday];
            }
                break;
            case 6:
            {
                dayi = dayi - 1;
                if (dayi == 0) {
                    monthi = monthi - 1;
                    if (monthi == 0) {
                        yeari --;
                        monthi = 12;
                    }
                    dayi = mothdays;
                }
                if (dayi > 0 && dayi < 10) {
                    rday = [NSString stringWithFormat:@"0%d",dayi];
                }
                if (dayi >= 10) {
                    rday = [NSString stringWithFormat:@"%d",dayi];
                }
                if (monthi > 0 && monthi < 10) {
                    rMonth = [NSString stringWithFormat:@"0%d",monthi];
                }
                if (monthi >= 10) {
                    rMonth = [NSString stringWithFormat:@"%d",monthi];
                }
                theTime = [NSString stringWithFormat:@"%d-%@-%@",yeari,rMonth,rday];
            }
                break;
            case 5:
            {
                theTime = time;
            }
                break;
            case 4:
            {
                dayi = dayi + 1;
                if (dayi > mothdays) {
                    monthi ++;
                    if (monthi >= 13) {
                        yeari ++;
                        monthi = 1;
                    }
                    dayi = 1;
                }
                if (dayi > 0 && dayi < 10) {
                    rday = [NSString stringWithFormat:@"0%d",dayi];
                }
                if (dayi >= 10) {
                    rday = [NSString stringWithFormat:@"%d",dayi];
                }
                if (monthi > 0 && monthi < 10) {
                    rMonth = [NSString stringWithFormat:@"0%d",monthi];
                }
                if (monthi >= 10) {
                    rMonth = [NSString stringWithFormat:@"%d",monthi];
                }
                theTime = [NSString stringWithFormat:@"%d-%@-%@",yeari,rMonth,rday];
            }
                break;
            case 3:
            {
                dayi = dayi + 2;
                if (dayi > mothdays) {
                    monthi ++;
                    if (monthi >= 13) {
                        yeari ++;
                        monthi = 1;
                    }
                    dayi = 1;
                }
                if (dayi > 0 && dayi < 10) {
                    rday = [NSString stringWithFormat:@"0%d",dayi];
                }
                if (dayi >= 10) {
                    rday = [NSString stringWithFormat:@"%d",dayi];
                }
                if (monthi > 0 && monthi < 10) {
                    rMonth = [NSString stringWithFormat:@"0%d",monthi];
                }
                if (monthi >= 10) {
                    rMonth = [NSString stringWithFormat:@"%d",monthi];
                }
                theTime = [NSString stringWithFormat:@"%d-%@-%@",yeari,rMonth,rday];
            }
                break;
            case 2:
            {
                dayi = dayi + 3;
                if (dayi > mothdays) {
                    monthi ++;
                    if (monthi >= 13) {
                        yeari ++;
                        monthi = 1;
                    }
                    dayi = 1;
                }
                if (dayi > 0 && dayi < 10) {
                    rday = [NSString stringWithFormat:@"0%d",dayi];
                }
                if (dayi >= 10) {
                    rday = [NSString stringWithFormat:@"%d",dayi];
                }
                if (monthi > 0 && monthi < 10) {
                    rMonth = [NSString stringWithFormat:@"0%d",monthi];
                }
                if (monthi >= 10) {
                    rMonth = [NSString stringWithFormat:@"%d",monthi];
                }
                theTime = [NSString stringWithFormat:@"%d-%@-%@",yeari,rMonth,rday];
            }
                break;
            case 1:
            {
                dayi = dayi + 4;
                if (dayi > mothdays) {
                    monthi ++;
                    if (monthi >= 13) {
                        yeari ++;
                        monthi = 1;
                    }
                    dayi = 1;
                }
                if (dayi > 0 && dayi < 10) {
                    rday = [NSString stringWithFormat:@"0%d",dayi];
                }
                if (dayi >= 10) {
                    rday = [NSString stringWithFormat:@"%d",dayi];
                }
                if (monthi > 0 && monthi < 10) {
                    rMonth = [NSString stringWithFormat:@"0%d",monthi];
                }
                if (monthi >= 10) {
                    rMonth = [NSString stringWithFormat:@"%d",monthi];
                }
                theTime = [NSString stringWithFormat:@"%d-%@-%@",yeari,rMonth,rday];
            }
                break;
                
            default:
                break;
        }
        return theTime;
    }
    return nil;
}

/**
 *  根据给定的起始和结束时间返回一个按周的时间数组
 *
 *  @param beginTime 开始时间
 *  @param endTime   结束时间
 *
 *  @return 时间数组
 */
+(NSArray *) giveMeAWeekArrayWithBeginTime:(NSString *) beginTime andEndTime:(NSString *) endTime
{
    NSString *beginYear = [beginTime substringWithRange:NSMakeRange(0, 4)];
    NSString *beginMonth = [beginTime substringWithRange:NSMakeRange(5, 2)];
    NSString *beginDay = [beginTime substringWithRange:NSMakeRange(8, 2)];
    int beginYeari = [beginYear intValue];
    int beginMonthi = [beginMonth intValue];
    int beginDayi = [beginDay intValue];
    NSString *theDateString;
    int monthDays = [self daysOftheMonth:beginMonth andYear:beginYear];
    NSString *rMonth,*rday;
    NSMutableArray *dateArray = [NSMutableArray array];
    while (![theDateString isEqualToString:endTime]) {
        NSMutableArray *arr = [NSMutableArray array];
        for (int i = 0; i< 5; i++) {
            if (beginDayi > 0 && beginDayi < 10) {
                rday = [NSString stringWithFormat:@"0%d",beginDayi];
            }
            if (beginDayi >= 10) {
                rday = [NSString stringWithFormat:@"%d",beginDayi];
            }
            if (beginMonthi > 0 && beginMonthi < 10) {
                rMonth = [NSString stringWithFormat:@"0%d",beginMonthi];
            }
            if (beginMonthi >= 10) {
                rMonth = [NSString stringWithFormat:@"%d",beginMonthi];
            }
            NSString *dateStr = [NSString stringWithFormat:@"%d-%@-%@",beginYeari,rMonth,rday];
            [arr addObject:dateStr];
            beginDayi++;
            if (beginDayi > monthDays) {
                beginMonthi ++;
                if (beginMonthi >= 13) {
                    beginYeari ++;
                    beginMonthi = 1;
                }
                monthDays = [self daysOftheMonth:[NSString stringWithFormat:@"%d",beginMonthi] andYear:[NSString stringWithFormat:@"%d",beginYeari]];
                beginDayi = 1;
            }
        }
        [dateArray addObject:arr];
        theDateString = [NSString stringWithFormat:@"%@",[arr lastObject]];
        beginDayi = beginDayi + 2;
        if (beginDayi > monthDays) {
            beginMonthi ++;
            if (beginMonthi >= 13) {
                beginYeari ++;
                beginMonthi = 1;
            }
            beginDayi = beginDayi - monthDays;
            monthDays = [self daysOftheMonth:[NSString stringWithFormat:@"%d",beginMonthi] andYear:[NSString stringWithFormat:@"%d",beginYeari]];
        }
    }
    NSMutableArray *reDateArray = [NSMutableArray array];
    for (int i = dateArray.count - 1; i >= 0; i--) {
        [reDateArray addObject:[dateArray objectAtIndex:i]];
    }
    return reDateArray;
}

/**
 *  返回所给日期所在周的周一
 *
 *  @param day 给定的日期
 *
 *  @return 返回周一的日期
 */
+(NSString *) giveMeTheMonthdayWithTheDay:(NSString *) day
{
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *td = [formatter dateFromString:day];
    NSString *ys = [day substringToIndex:4];
    NSString *ms = [day substringWithRange:NSMakeRange(5, 2)];
    NSString *ds = [day substringFromIndex:8];
    int days = [self daysOftheMonth:ms andYear:ys];
    int mi = [ms intValue];
    int di = [ds intValue];
    int yi = [ys intValue];
    int lami = mi - 1;
    int ladays;
    if (lami == 0) {
        lami = 12;
        int layi = yi - 1;
        ladays = [self daysOftheMonth:@"12" andYear:[NSString stringWithFormat:@"%d",layi]];
    }else{
        if (lami < 10) {
            ladays = [self daysOftheMonth:[NSString stringWithFormat:@"0%d",lami] andYear:ys];
        }else{
            ladays = [self daysOftheMonth:[NSString stringWithFormat:@"%d",lami] andYear:ys];
        }
    }
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    [calendar setLocale:[NSLocale currentLocale]];
    NSDateComponents *comps = [calendar components:(NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit|NSWeekdayCalendarUnit) fromDate:td];
    NSString *rds,*rms,*rys;
    switch (comps.weekday) {
        case 1:
        {
            di++;
            if (di > days) {
                di = di - days;
                mi++;
                if (mi == 13) {
                    mi = 1;
                    yi++;
                }
            }
            if (di < 10) {
                rds = [NSString stringWithFormat:@"0%d",di];
            }else{
                rds = [NSString stringWithFormat:@"%d",di];
            }
            if (mi < 10) {
                rms = [NSString stringWithFormat:@"0%d",mi];
            }else{
                rms = [NSString stringWithFormat:@"%d",mi];
            }
            rys = [NSString stringWithFormat:@"%d",yi];
            return [NSString stringWithFormat:@"%@-%@-%@",rys,rms,rds];
        }
            break;
        case 2:
            return day;
        case 3:
        {
            di--;
            if (di < 0) {
                di = di + ladays;
                mi--;
                if (mi == 0) {
                    mi = 12;
                    yi--;
                }
            }
            if (di < 10) {
                rds = [NSString stringWithFormat:@"0%d",di];
            }else{
                rds = [NSString stringWithFormat:@"%d",di];
            }
            if (mi < 10) {
                rms = [NSString stringWithFormat:@"0%d",mi];
            }else{
                rms = [NSString stringWithFormat:@"%d",mi];
            }
            rys = [NSString stringWithFormat:@"%d",yi];
            return [NSString stringWithFormat:@"%@-%@-%@",rys,rms,rds];
        }
            break;

        case 4:
        {
            di = di - 2;
            if (di < 0) {
                di = di + ladays;
                mi--;
                if (mi == 0) {
                    mi = 12;
                    yi--;
                }
            }
            if (di < 10) {
                rds = [NSString stringWithFormat:@"0%d",di];
            }else{
                rds = [NSString stringWithFormat:@"%d",di];
            }
            if (mi < 10) {
                rms = [NSString stringWithFormat:@"0%d",mi];
            }else{
                rms = [NSString stringWithFormat:@"%d",mi];
            }
            rys = [NSString stringWithFormat:@"%d",yi];
            return [NSString stringWithFormat:@"%@-%@-%@",rys,rms,rds];
        }
            break;
        case 5:
        {
            di = di - 3;
            if (di < 0) {
                di = di + ladays;
                mi--;
                if (mi == 0) {
                    mi = 12;
                    yi--;
                }
            }
            if (di < 10) {
                rds = [NSString stringWithFormat:@"0%d",di];
            }else{
                rds = [NSString stringWithFormat:@"%d",di];
            }
            if (mi < 10) {
                rms = [NSString stringWithFormat:@"0%d",mi];
            }else{
                rms = [NSString stringWithFormat:@"%d",mi];
            }
            rys = [NSString stringWithFormat:@"%d",yi];
            return [NSString stringWithFormat:@"%@-%@-%@",rys,rms,rds];
        }
            break;
        case 6:
        {
            di = di - 4;
            if (di < 0) {
                di = di + ladays;
                mi--;
                if (mi == 0) {
                    mi = 12;
                    yi--;
                }
            }
            if (di < 10) {
                rds = [NSString stringWithFormat:@"0%d",di];
            }else{
                rds = [NSString stringWithFormat:@"%d",di];
            }
            if (mi < 10) {
                rms = [NSString stringWithFormat:@"0%d",mi];
            }else{
                rms = [NSString stringWithFormat:@"%d",mi];
            }
            rys = [NSString stringWithFormat:@"%d",yi];
            return [NSString stringWithFormat:@"%@-%@-%@",rys,rms,rds];
        }
            break;
        case 7:
        {
            di = di + 2;
            if (di > days) {
                di = di - days;
                mi++;
                if (mi == 13) {
                    mi = 1;
                    yi++;
                }
            }
            if (di < 10) {
                rds = [NSString stringWithFormat:@"0%d",di];
            }else{
                rds = [NSString stringWithFormat:@"%d",di];
            }
            if (mi < 10) {
                rms = [NSString stringWithFormat:@"0%d",mi];
            }else{
                rms = [NSString stringWithFormat:@"%d",mi];
            }
            rys = [NSString stringWithFormat:@"%d",yi];
            return [NSString stringWithFormat:@"%@-%@-%@",rys,rms,rds];
        }
            break;
        default:
            break;
    }
    return day;
}

/**
 *  返回给定日期所在周的周五的日期
 *
 *  @param day 给定的日期
 *
 *  @return 所在周的周五的日期
 */
+(NSString *) giveMeTheFraidayWithTheDay:(NSString *) day
{
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *td = [formatter dateFromString:day];
    NSString *ys = [day substringToIndex:4];
    NSString *ms = [day substringWithRange:NSMakeRange(5, 2)];
    NSString *ds = [day substringFromIndex:8];
    int days = [self daysOftheMonth:ms andYear:ys];
    int mi = [ms intValue];
    int di = [ds intValue];
    int yi = [ys intValue];
    int lami = mi - 1;
    int ladays;
    if (lami == 0) {
        lami = 12;
        int layi = yi - 1;
        ladays = [self daysOftheMonth:@"12" andYear:[NSString stringWithFormat:@"%d",layi]];
    }else{
        if (lami < 10) {
            ladays = [self daysOftheMonth:[NSString stringWithFormat:@"0%d",lami] andYear:ys];
        }else{
            ladays = [self daysOftheMonth:[NSString stringWithFormat:@"%d",lami] andYear:ys];
        }
    }
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    [calendar setLocale:[NSLocale currentLocale]];
    NSDateComponents *comps = [calendar components:(NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit|NSWeekdayCalendarUnit) fromDate:td];
    NSString *rds,*rms,*rys;
    switch (comps.weekday) {
        case 1:
        {
            di = di + 5;
            if (di > days) {
                di = di - days;
                mi++;
                if (mi == 13) {
                    mi = 1;
                    yi++;
                }
            }
            if (di < 10) {
                rds = [NSString stringWithFormat:@"0%d",di];
            }else{
                rds = [NSString stringWithFormat:@"%d",di];
            }
            if (mi < 10) {
                rms = [NSString stringWithFormat:@"0%d",mi];
            }else{
                rms = [NSString stringWithFormat:@"%d",mi];
            }
            rys = [NSString stringWithFormat:@"%d",yi];
            return [NSString stringWithFormat:@"%@-%@-%@",rys,rms,rds];
        }
            break;
        case 2:
        {
            di = di + 4;
            if (di > days) {
                di = di - days;
                mi++;
                if (mi == 13) {
                    mi = 1;
                    yi++;
                }
            }
            if (di < 10) {
                rds = [NSString stringWithFormat:@"0%d",di];
            }else{
                rds = [NSString stringWithFormat:@"%d",di];
            }
            if (mi < 10) {
                rms = [NSString stringWithFormat:@"0%d",mi];
            }else{
                rms = [NSString stringWithFormat:@"%d",mi];
            }
            rys = [NSString stringWithFormat:@"%d",yi];
            return [NSString stringWithFormat:@"%@-%@-%@",rys,rms,rds];
        }
            break;

        case 3:
        {
            di = di + 3;
            if (di > days) {
                di = di - days;
                mi++;
                if (mi == 13) {
                    mi = 1;
                    yi++;
                }
            }
            if (di < 10) {
                rds = [NSString stringWithFormat:@"0%d",di];
            }else{
                rds = [NSString stringWithFormat:@"%d",di];
            }
            if (mi < 10) {
                rms = [NSString stringWithFormat:@"0%d",mi];
            }else{
                rms = [NSString stringWithFormat:@"%d",mi];
            }
            rys = [NSString stringWithFormat:@"%d",yi];
            return [NSString stringWithFormat:@"%@-%@-%@",rys,rms,rds];
        }
            break;
            
        case 4:
        {
            di = di + 2;
            if (di > days) {
                di = di - days;
                mi++;
                if (mi == 13) {
                    mi = 1;
                    yi++;
                }
            }
            if (di < 10) {
                rds = [NSString stringWithFormat:@"0%d",di];
            }else{
                rds = [NSString stringWithFormat:@"%d",di];
            }
            if (mi < 10) {
                rms = [NSString stringWithFormat:@"0%d",mi];
            }else{
                rms = [NSString stringWithFormat:@"%d",mi];
            }
            rys = [NSString stringWithFormat:@"%d",yi];
            return [NSString stringWithFormat:@"%@-%@-%@",rys,rms,rds];
        }
            break;
        case 5:
        {
            di = di + 1;
            if (di > days) {
                di = di - days;
                mi++;
                if (mi == 13) {
                    mi = 1;
                    yi++;
                }
            }
            if (di < 10) {
                rds = [NSString stringWithFormat:@"0%d",di];
            }else{
                rds = [NSString stringWithFormat:@"%d",di];
            }
            if (mi < 10) {
                rms = [NSString stringWithFormat:@"0%d",mi];
            }else{
                rms = [NSString stringWithFormat:@"%d",mi];
            }
            rys = [NSString stringWithFormat:@"%d",yi];
            return [NSString stringWithFormat:@"%@-%@-%@",rys,rms,rds];
        }
            break;

        case 6:
            return day;
        case 7:
        {
            di = di + 6;
            if (di > days) {
                di = di - days;
                mi++;
                if (mi == 13) {
                    mi = 1;
                    yi++;
                }
            }
            if (di < 10) {
                rds = [NSString stringWithFormat:@"0%d",di];
            }else{
                rds = [NSString stringWithFormat:@"%d",di];
            }
            if (mi < 10) {
                rms = [NSString stringWithFormat:@"0%d",mi];
            }else{
                rms = [NSString stringWithFormat:@"%d",mi];
            }
            rys = [NSString stringWithFormat:@"%d",yi];
            return [NSString stringWithFormat:@"%@-%@-%@",rys,rms,rds];
        }
            break;
        default:
            break;
    }
    return day;
}

/**
 *  返回所对应的周几字符串
 *
 *  @param day 给定的日期
 *
 *  @return 对应的周几
 */
+(NSString *) giveMeTheWeekDayWithDay:(NSString *) day
{
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *td = [formatter dateFromString:day];
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    [calendar setLocale:[NSLocale currentLocale]];
    NSDateComponents *comps = [calendar components:(NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit|NSWeekdayCalendarUnit) fromDate:td];
    switch (comps.weekday) {
        case 1:
            return @"星期日";
        case 2:
            return @"星期一";
        case 3:
            return @"星期二";
        case 4:
            return @"星期三";
        case 5:
            return @"星期四";
        case 6:
            return @"星期五";
        case 7:
            return @"星期六";
        default:
            break;
    }
    return day;
}

/**
 *  返回给定日期的前一天的日期
 *
 *  @param day 给定的日期
 *
 *  @return 前一天的日期
 */
+(NSString *) giveMeThePreviousDayWithDay:(NSString *)day
{
    NSString *year = [day substringWithRange:NSMakeRange(0, 4)];
    NSString *month = [day substringWithRange:NSMakeRange(5, 2)];
    NSString *nday = [day substringWithRange:NSMakeRange(8, 2)];
    int yi = [year intValue];
    int mi = [month intValue];
    int di = [nday intValue];
    di--;
    if (di == 0) {
        mi--;
        if (mi == 0) {
            yi--;
            return [NSString stringWithFormat:@"%d-12-31",yi];
        }
        NSString *ms;
        if (mi > 0 && mi < 10) {
            ms = [NSString stringWithFormat:@"0%d",mi];
        }
        if (mi >= 10) {
            ms = [NSString stringWithFormat:@"%d",mi];
        }
        di = [self daysOftheMonth:ms andYear:year];
        return [NSString stringWithFormat:@"%@-%@-%d",year,ms,di];
    }
    NSString *ds;
    if (di > 0 && di < 10) {
        ds = [NSString stringWithFormat:@"0%d",di];
    }
    if (di >= 10) {
        ds = [NSString stringWithFormat:@"%d",di];
    }
    return [NSString stringWithFormat:@"%@-%@-%@",year,month,ds];
}

/**
 *  返回给定日期的后一天日期
 *
 *  @param day 给定的日期
 *
 *  @return 后一天的日期
 */
+(NSString *) giveMeTheNextDayWithDay:(NSString *)day
{
    NSString *year = [day substringWithRange:NSMakeRange(0, 4)];
    NSString *month = [day substringWithRange:NSMakeRange(5, 2)];
    NSString *nday = [day substringWithRange:NSMakeRange(8, 2)];
    int yi = [year intValue];
    int mi = [month intValue];
    int di = [nday intValue];
    di++;
    int days = [self daysOftheMonth:month andYear:year];
    if (di == days + 1) {
        mi++;
        if (mi == 13) {
            yi++;
            return [NSString stringWithFormat:@"%d-01-01",yi];
        }
        NSString *ms;
        if (mi > 0 && mi < 10) {
            ms = [NSString stringWithFormat:@"0%d",mi];
        }
        if (mi >= 10) {
            ms = [NSString stringWithFormat:@"%d",mi];
        }
        return [NSString stringWithFormat:@"%@-%@-01",year,ms];
    }
    NSString *ds;
    if (di > 0 && di < 10) {
        ds = [NSString stringWithFormat:@"0%d",di];
    }
    if (di >= 10) {
        ds = [NSString stringWithFormat:@"%d",di];
    }
    return [NSString stringWithFormat:@"%@-%@-%@",year,month,ds];
}

/**
 *  返回两个日期之间所差的天数
 *
 *  @param beginDay 开始时间
 *  @param endDay   结束时间
 *
 *  @return 相差天数
 */
+ (NSInteger)numberOfDaysFromTheDay:(NSString *) beginDay toTheDay:(NSString *) endDay
{
    FORMATTER;
    NSDate *bDate = [formatter dateFromString:beginDay];
    NSDate *eDate = [formatter dateFromString:endDay];
    NSTimeInterval bTimeS = [bDate timeIntervalSince1970];//毫秒数要乘以1000
    double bs = bTimeS;
    NSTimeInterval eTimeS = [eDate timeIntervalSince1970];//毫秒数要乘以1000
    double es = eTimeS;
    NSInteger nSecs = (NSInteger)(es - bs);
    NSInteger oneDaySecs = 24*3600;
    NSInteger days = nSecs / oneDaySecs + 1;
    return days;
}

/**
 *  进度菊花圈
 *
 *  @param text 显示的文字
 */
+ (void)showOnWindow:(NSString *) text
{
    // The hud will dispable all input on the window
    UIApplication *app = [UIApplication sharedApplication];
    kqAppDelegate *appdelegate = (kqAppDelegate *)app.delegate;
    MBProgressHUD *hud = (MBProgressHUD *)[appdelegate.window viewWithTag:10086];
    if (hud == nil) {
        hud = [[MBProgressHUD alloc] initWithView:appdelegate.window];
        hud.tag = 10086;
        [appdelegate.window addSubview:hud];
    }else{
        [hud removeFromSuperview];
        [appdelegate.window addSubview:hud];
    }
    hud.labelText = text;
    [hud show:YES];
}

/**
 *  隐藏菊花圈
 */
+(void) hidenHUD
{
    UIApplication *app = [UIApplication sharedApplication];
    kqAppDelegate *appdelegate = (kqAppDelegate *)app.delegate;
    MBProgressHUD *hud = (MBProgressHUD *)[appdelegate.window viewWithTag:10086];
    [hud hide:YES];
}

/**
 *  设置时间label文字
 *
 *  @param dayLabel   天label
 *  @param monthLabel 月label
 *  @param hourLabel  时label
 *  @param timeString 时间字符串
 */
+(void) setLabelTextWithDayLabel:(UILabel *) dayLabel andMonthLabel:(UILabel *) monthLabel andHourLabel:(UILabel *) hourLabel andTimeString:(NSString *) timeString
{
    dayLabel.text = [timeString substringWithRange:NSMakeRange(8, 2)];
    hourLabel.text = [timeString substringWithRange:NSMakeRange(11, 5)];
    int month = [[timeString substringWithRange:NSMakeRange(5, 2)] intValue];
    switch (month) {
        case 1:
            monthLabel.text = @"一月";
            break;
        case 2:
            monthLabel.text = @"二月";
            break;
        case 3:
            monthLabel.text = @"三月";
            break;
        case 4:
            monthLabel.text = @"四月";
            break;
        case 5:
            monthLabel.text = @"五月";
            break;
        case 6:
            monthLabel.text = @"六月";
            break;
        case 7:
            monthLabel.text = @"七月";
            break;
        case 8:
            monthLabel.text = @"八月";
            break;
        case 9:
            monthLabel.text = @"九月";
            break;
        case 10:
            monthLabel.text = @"十月";
            break;
        case 11:
            monthLabel.text = @"十一月";
            break;
        case 12:
            monthLabel.text = @"十二月";
            break;
            
        default:
            break;
    }
}

/**
 *  根据字典拼接特定字符串
 *
 *  @param dictionary 给定的字典
 *
 *  @return 拼接后的字符串
 */
+(NSString *) getContent:(NSDictionary *) dictionary
{
    NSString *jsonStr = [dictionary valueForKey:@"bookContent"];
    NSData *jsonData = [jsonStr dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error = nil;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
    NSDictionary *bookContent = [dic valueForKey:@"bookContent"];
    NSMutableString *contentStr = [NSMutableString string];
    [contentStr appendString:@"饮食："];
    int fd = [[bookContent valueForKey:@"food"] intValue];
    switch (fd) {
        case 0:
        {
            [contentStr appendString:@"胃口很好；"];
        }
            break;
        case 1:
        {
            [contentStr appendString:@"正常饮食；"];
        }
            break;
        case 2:
        {
            [contentStr appendString:@"饮食不佳；"];
        }
            break;
        default:
            break;
    }
    [contentStr appendString:@"饮水："];
    int dk = [[bookContent valueForKey:@"drink"] intValue];
    switch (dk) {
        case 0:
        {
            [contentStr appendString:@"没喝；"];
        }
            break;
        case 1:
        {
            [contentStr appendString:@"1-2杯；"];
        }
            break;
        case 2:
        {
            [contentStr appendString:@"3-4杯；"];
        }
            break;
        case 3:
        {
            [contentStr appendString:@"5杯以上；"];
        }
            break;
        default:
            break;
    }
    [contentStr appendString:@"睡眠："];
    int sp = [[bookContent valueForKey:@"sleep"] intValue];
    switch (sp) {
        case 0:
        {
            [contentStr appendString:@"没睡；"];
        }
            break;
        case 1:
        {
            [contentStr appendString:@"1小时以下；"];
        }
            break;
        case 2:
        {
            [contentStr appendString:@"1-2小时；"];
        }
            break;
        case 3:
        {
            [contentStr appendString:@"2小时以上；"];
        }
            break;
        default:
            break;
    }
    [contentStr appendString:@"大便："];
    int sl = [[bookContent valueForKey:@"stool"] intValue];
    switch (sl) {
        case 0:
        {
            [contentStr appendString:@"0次；"];
        }
            break;
        case 1:
        {
            [contentStr appendString:@"1-2次；"];
        }
            break;
        case 2:
        {
            [contentStr appendString:@"拉肚子；"];
        }
            break;
        default:
            break;
    }
    [contentStr appendString:@"情绪："];
    int em = [[bookContent valueForKey:@"emotion"] intValue];
    switch (em) {
        case 0:
        {
            [contentStr appendString:@"开心；"];
        }
            break;
        case 1:
        {
            [contentStr appendString:@"低落；"];
        }
            break;
        case 2:
        {
            [contentStr appendString:@"烦躁；"];
        }
            break;
        case 3:
        {
            [contentStr appendString:@"哭鼻子；"];
        }
            break;
        default:
            break;
    }
    
    NSString *str = [bookContent valueForKey:@"info"];
    if ([str isEqualToString:@""] || str == nil) {
    }else{
        [contentStr appendFormat:@"备注：%@；",str];
    }
    NSArray *arr = [bookContent valueForKey:@"Abnormal"];
    if (arr.count != 0) {
        [contentStr appendString:@"异常："];
        for (NSNumber *num in arr) {
            int ab = [num intValue];
            switch (ab) {
                case 0:
                {
                    [contentStr appendString:@"咳嗽、"];
                }
                    break;
                case 1:
                {
                    [contentStr appendString:@"流鼻涕、"];
                }
                    break;
                case 2:
                {
                    [contentStr appendString:@"呕吐、"];
                }
                    break;
                case 3:
                {
                    [contentStr appendString:@"发烧、"];
                }
                    break;
                case 4:
                {
                    [contentStr appendString:@"流鼻血、"];
                }
                    break;
                case 5:
                {
                    [contentStr appendString:@"烫伤、"];
                }
                    break;
                case 6:
                {
                    [contentStr appendString:@"摔伤、"];
                }
                    break;
                case 7:
                {
                    [contentStr appendString:@"磕碰、"];
                }
                    break;
                case 8:
                {
                    [contentStr appendString:@"抓伤、"];
                }
                    break;
                default:
                    break;
            }
        }
        contentStr = [NSMutableString stringWithString:[contentStr substringToIndex:contentStr.length - 1]];
    }
    return contentStr;
}

/**
 *  根据json字符串拼接特定字符串
 *
 *  @param title 给定的json子付出啊
 *
 *  @return 拼接后的字符串
 */
+(NSString *) getContentString:(NSString *) title
{
    NSData *jsonData = [title dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error = nil;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
    NSDictionary *bookContent = [dic valueForKey:@"bookContent"];
    NSMutableString *contentStr = [NSMutableString string];
    [contentStr appendString:@"饮食："];
    int fd = [[bookContent valueForKey:@"food"] intValue];
    switch (fd) {
        case 0:
        {
            [contentStr appendString:@"胃口很好；"];
        }
            break;
        case 1:
        {
            [contentStr appendString:@"正常饮食；"];
        }
            break;
        case 2:
        {
            [contentStr appendString:@"饮食不佳；"];
        }
            break;
        default:
            break;
    }
    [contentStr appendString:@"饮水："];
    int dk = [[bookContent valueForKey:@"drink"] intValue];
    switch (dk) {
        case 0:
        {
            [contentStr appendString:@"没喝；"];
        }
            break;
        case 1:
        {
            [contentStr appendString:@"1-2杯；"];
        }
            break;
        case 2:
        {
            [contentStr appendString:@"3-4杯；"];
        }
            break;
        case 3:
        {
            [contentStr appendString:@"5杯以上；"];
        }
            break;
        default:
            break;
    }
    [contentStr appendString:@"睡眠："];
    int sp = [[bookContent valueForKey:@"sleep"] intValue];
    switch (sp) {
        case 0:
        {
            [contentStr appendString:@"没睡；"];
        }
            break;
        case 1:
        {
            [contentStr appendString:@"1小时以下；"];
        }
            break;
        case 2:
        {
            [contentStr appendString:@"1-2小时；"];
        }
            break;
        case 3:
        {
            [contentStr appendString:@"2小时以上；"];
        }
            break;
        default:
            break;
    }
    [contentStr appendString:@"大便："];
    int sl = [[bookContent valueForKey:@"stool"] intValue];
    switch (sl) {
        case 0:
        {
            [contentStr appendString:@"0次；"];
        }
            break;
        case 1:
        {
            [contentStr appendString:@"1-2次；"];
        }
            break;
        case 2:
        {
            [contentStr appendString:@"拉肚子；"];
        }
            break;
        default:
            break;
    }
    [contentStr appendString:@"情绪："];
    int em = [[bookContent valueForKey:@"emotion"] intValue];
    switch (em) {
        case 0:
        {
            [contentStr appendString:@"开心；"];
        }
            break;
        case 1:
        {
            [contentStr appendString:@"低落；"];
        }
            break;
        case 2:
        {
            [contentStr appendString:@"烦躁；"];
        }
            break;
        case 3:
        {
            [contentStr appendString:@"哭鼻子；"];
        }
            break;
        default:
            break;
    }
    
    NSString *str = [bookContent valueForKey:@"info"];
    if ([str isEqualToString:@""] || str == nil) {
    }else{
        [contentStr appendFormat:@"备注：%@",str];
    }
    NSArray *arr = [bookContent valueForKey:@"Abnormal"];
    if (arr.count != 0) {
        [contentStr appendString:@"异常："];
        for (NSNumber *num in arr) {
            int ab = [num intValue];
            switch (ab) {
                case 0:
                {
                    [contentStr appendString:@"咳嗽、"];
                }
                    break;
                case 1:
                {
                    [contentStr appendString:@"流鼻涕、"];
                }
                    break;
                case 2:
                {
                    [contentStr appendString:@"呕吐、"];
                }
                    break;
                case 3:
                {
                    [contentStr appendString:@"发烧、"];
                }
                    break;
                case 4:
                {
                    [contentStr appendString:@"流鼻血、"];
                }
                    break;
                case 5:
                {
                    [contentStr appendString:@"烫伤、"];
                }
                    break;
                case 6:
                {
                    [contentStr appendString:@"摔伤、"];
                }
                    break;
                case 7:
                {
                    [contentStr appendString:@"磕碰、"];
                }
                    break;
                case 8:
                {
                    [contentStr appendString:@"抓伤、"];
                }
                    break;
                default:
                    break;
            }
        }
        contentStr = [NSMutableString stringWithString:[contentStr substringToIndex:contentStr.length - 1]];
    }
    return contentStr;
}

/**
 *  检测设备是否连接网络
 *
 *  @return 返回判断结果
 */
+(BOOL) isConnectionAvailable{
    
    BOOL isExistenceNetwork = YES;
    Reachability *reach = [Reachability reachabilityWithHostName:@"www.baidu.com"];
    switch ([reach currentReachabilityStatus]) {
        case NotReachable:
            isExistenceNetwork = NO;
            //NSLog(@"notReachable");
            break;
        case ReachableViaWiFi:
            isExistenceNetwork = YES;
            //NSLog(@"WIFI");
            break;
        case ReachableViaWWAN:
            isExistenceNetwork = YES;
            //NSLog(@"3G");
            break;
    }
    
    if (!isExistenceNetwork) {
//        [HNAGeneral showAlertViewWithTitle:nil andMessage:@"设备没有网络，请检查设备后再操作！"];
        [HNAGeneral showTipTextOnWindow:@"设备没有网络，请检查设备后再操作！"];
        return NO;
    }
    
    return isExistenceNetwork;
}

+(CGSize)downloadImageSizeWithURL:(NSString *)imageURL
{
    NSURL* URL = nil;
    if([imageURL isKindOfClass:[NSString class]]){
        URL = [NSURL URLWithString:imageURL];
    }
    if(URL == nil)
        return CGSizeZero;
    NSString* absoluteString = URL.absoluteString;
#ifdef dispatch_main_sync_safe
    if([[SDImageCache sharedImageCache] diskImageExistsWithKey:absoluteString])
    {
        UIImage* image = [[SDImageCache sharedImageCache] imageFromMemoryCacheForKey:absoluteString];
        if(!image)
        {
            NSData* data = [[SDImageCache sharedImageCache] performSelector:@selector(diskImageDataBySearchingAllPathsForKey:) withObject:URL.absoluteString];
            image = [UIImage imageWithData:data];
        }
        if(!image)
        {
            return image.size;
        }
    }
#endif
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:URL];
    NSString* pathExtendsion = [URL.pathExtension lowercaseString];
    CGSize size = CGSizeZero;
    if([pathExtendsion isEqualToString:@"png"]){
        size =  [self downloadPNGImageSizeWithRequest:request];
    }
    else if([pathExtendsion isEqual:@"gif"])
    {
        size =  [self downloadGIFImageSizeWithRequest:request];
    }
    else{
        size = [self downloadJPGImageSizeWithRequest:request];
    }
    if(CGSizeEqualToSize(CGSizeZero, size))
    {
        NSData* data = [NSURLConnection sendSynchronousRequest:[NSURLRequest requestWithURL:URL] returningResponse:nil error:nil];
        UIImage* image = [UIImage imageWithData:data];
        if(image)
        {
#ifdef dispatch_main_sync_safe
            [[SDImageCache sharedImageCache] storeImage:image recalculateFromImage:YES imageData:data forKey:URL.absoluteString toDisk:YES];
#endif
            size = image.size;
        }
    }
    return size;
}

+(CGSize)downloadPNGImageSizeWithRequest:(NSMutableURLRequest*)request
{
    [request setValue:@"bytes=16-23" forHTTPHeaderField:@"Range"];
    NSData* data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    if(data.length == 8)
    {
        int w1 = 0, w2 = 0, w3 = 0, w4 = 0;
        [data getBytes:&w1 range:NSMakeRange(0, 1)];
        [data getBytes:&w2 range:NSMakeRange(1, 1)];
        [data getBytes:&w3 range:NSMakeRange(2, 1)];
        [data getBytes:&w4 range:NSMakeRange(3, 1)];
        int w = (w1 << 24) + (w2 << 16) + (w3 << 8) + w4;
        int h1 = 0, h2 = 0, h3 = 0, h4 = 0;
        [data getBytes:&h1 range:NSMakeRange(4, 1)];
        [data getBytes:&h2 range:NSMakeRange(5, 1)];
        [data getBytes:&h3 range:NSMakeRange(6, 1)];
        [data getBytes:&h4 range:NSMakeRange(7, 1)];
        int h = (h1 << 24) + (h2 << 16) + (h3 << 8) + h4;
        return CGSizeMake(w, h);
    }
    return CGSizeZero;
}

+(CGSize)downloadGIFImageSizeWithRequest:(NSMutableURLRequest*)request
{
    [request setValue:@"bytes=6-9" forHTTPHeaderField:@"Range"];
    NSData* data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    if(data.length == 4)
    {
        short w1 = 0, w2 = 0;
        [data getBytes:&w1 range:NSMakeRange(0, 1)];
        [data getBytes:&w2 range:NSMakeRange(1, 1)];
        short w = w1 + (w2 << 8);
        short h1 = 0, h2 = 0;
        [data getBytes:&h1 range:NSMakeRange(2, 1)];
        [data getBytes:&h2 range:NSMakeRange(3, 1)];
        short h = h1 + (h2 << 8);
        return CGSizeMake(w, h);
    }
    return CGSizeZero;
}

+(CGSize)downloadJPGImageSizeWithRequest:(NSMutableURLRequest*)request
{
    [request setValue:@"bytes=0-209" forHTTPHeaderField:@"Range"];
    NSData* data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    if ([data length] <= 0x58) {
        return CGSizeZero;
    }
    if ([data length] <= 210) {// 肯定只有一个DQT字段
        short w1 = 0, w2 = 0;
        [data getBytes:&w1 range:NSMakeRange(0x60, 0x1)];
        [data getBytes:&w2 range:NSMakeRange(0x61, 0x1)];
        short w = (w1 << 8) + w2;
        short h1 = 0, h2 = 0;
        [data getBytes:&h1 range:NSMakeRange(0x5e, 0x1)];
        [data getBytes:&h2 range:NSMakeRange(0x5f, 0x1)];
        short h = (h1 << 8) + h2;
        return CGSizeMake(w, h);
    } else {
        short word = 0x0;
        [data getBytes:&word range:NSMakeRange(0x15, 0x1)];
        if (word == 0xdb) {
            [data getBytes:&word range:NSMakeRange(0x5a, 0x1)];
            if (word == 0xdb) {// 两个DQT字段
                short w1 = 0, w2 = 0;
                [data getBytes:&w1 range:NSMakeRange(0xa5, 0x1)];
                [data getBytes:&w2 range:NSMakeRange(0xa6, 0x1)];
                short w = (w1 << 8) + w2;
                short h1 = 0, h2 = 0;
                [data getBytes:&h1 range:NSMakeRange(0xa3, 0x1)];
                [data getBytes:&h2 range:NSMakeRange(0xa4, 0x1)];
                short h = (h1 << 8) + h2;
                return CGSizeMake(w, h);
            } else {// 一个DQT字段
                short w1 = 0, w2 = 0;
                [data getBytes:&w1 range:NSMakeRange(0x60, 0x1)];
                [data getBytes:&w2 range:NSMakeRange(0x61, 0x1)];
                short w = (w1 << 8) + w2;
                short h1 = 0, h2 = 0;
                [data getBytes:&h1 range:NSMakeRange(0x5e, 0x1)];
                [data getBytes:&h2 range:NSMakeRange(0x5f, 0x1)];
                short h = (h1 << 8) + h2;
                return CGSizeMake(w, h);
            }
        } else {
            return CGSizeZero;
        }
    }
}

/**
 *  矫正相册拍摄的照片保存读取后发生旋转90度
 *
 *  @param aImage 拍摄的照片
 *
 *  @return 处理后的照片
 */
+ (UIImage *)fixOrientation:(UIImage *)aImage
{      // No-op if the orientation is already correct
    if (aImage.imageOrientation == UIImageOrientationUp)
        return aImage;       // We need to calculate the proper transformation to make the image upright.     // We do it in 2 steps: Rotate if Left/Right/Down, and then flip if Mirrored.
    CGAffineTransform transform = CGAffineTransformIdentity;
    switch (aImage.imageOrientation) {
        case UIImageOrientationDown:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, aImage.size.width, aImage.size.height);
            transform = CGAffineTransformRotate(transform, M_PI);
            break;
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
            transform = CGAffineTransformTranslate(transform, aImage.size.width, 0);
            transform = CGAffineTransformRotate(transform, M_PI_2);
            break;
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, 0, aImage.size.height);
            transform = CGAffineTransformRotate(transform, -M_PI_2);
            break;
        default:
            break;
    }
    switch (aImage.imageOrientation) {
        case UIImageOrientationUpMirrored:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, aImage.size.width, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, aImage.size.height, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
        default:
            break;
    }       // Now we draw the underlying CGImage into a new context, applying the transform     // calculated above.
    CGContextRef ctx = CGBitmapContextCreate(NULL, aImage.size.width, aImage.size.height,                                               CGImageGetBitsPerComponent(aImage.CGImage), 0,                                               CGImageGetColorSpace(aImage.CGImage),                                               CGImageGetBitmapInfo(aImage.CGImage));
    CGContextConcatCTM(ctx, transform);
    switch (aImage.imageOrientation) {
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:              // Grr...
            CGContextDrawImage(ctx,CGRectMake(0,0,aImage.size.height,aImage.size.width), aImage.CGImage);
            break;
        default:
            CGContextDrawImage(ctx, CGRectMake(0,0,aImage.size.width,aImage.size.height), aImage.CGImage);
            break;
    }       // And now we just create a new UIImage from the drawing context
    CGImageRef cgimg = CGBitmapContextCreateImage(ctx);
    UIImage *img = [UIImage imageWithCGImage:cgimg];
    CGContextRelease(ctx);
    CGImageRelease(cgimg);
    return img;
}

+(void) initChangLiangWithIsSchool:(BOOL) isSchool
{
    kqDistingKindergartenAndSchool *dkas = [kqDistingKindergartenAndSchool sharedDistingKindergartenAndSchool];
    if (isSchool) {
        dkas.signIn = @"入校";
        dkas.signOut = @"离校";
        dkas.schoolPhotograph = @"校内相册";
        dkas.schoolNotice = @"校内通知";
        dkas.schoolProclamation = @"学校公告";
        dkas.schoolActive = @"校内活动";
        dkas.lookBaby = @"看孩子";
        dkas.babyInfomation = @"孩子信息手册";
        dkas.throughLeader = @"直通校长";
        dkas.babySign = @"孩子签到";
    }else{
        dkas.signIn = @"入园";
        dkas.signOut = @"离园";
        dkas.schoolPhotograph = @"园内相册";
        dkas.schoolNotice = @"园内通知";
        dkas.schoolProclamation = @"幼儿园公告";
        dkas.schoolActive = @"园内活动";
        dkas.lookBaby = @"看宝宝";
        dkas.babyInfomation = @"宝宝信息手册";
        dkas.throughLeader = @"直通园长";
        dkas.babySign = @"宝宝签到";
    }
}

@end
