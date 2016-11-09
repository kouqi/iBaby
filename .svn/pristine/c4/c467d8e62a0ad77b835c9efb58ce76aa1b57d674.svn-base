/**
 * @file SipApi.h
 * @brief SIP Interface Functions
 */
#ifndef _SIP_API_H_
#define _SIP_API_H_

#import <Foundation/Foundation.h>

/**
 * <b>Description:</b> SipApi provides the entry of Sip interfaces.
 * <br><b>Purpose:</b> The UI invokes methods in this class to access APIs to operate sip header so that the UI can display related information and make some operations.
 */
@interface SipApi : NSObject
{

}

/**
 * <b>Description:</b> This is a reserved interface.
 */
+ (int)sipSetSupSipOpen:(bool)bEnabled;
/**
 * <b>Description:</b> This is a reserved interface.
 */
+ (int)sipSetSendCb:(void *)pfnSendSipCb;
/**
 * <b>Description:</b> This is a reserved interface.
 */
+ (int)sipSetRecvCb:(void *)pfnSendSipCb;
/**
 * <b>Description:</b> This is a reserved interface.
 */
+ (int)sipAddHeader:(void *)pMsg headerName:(NSString *)headerName headerValue:(NSString *)headerValue;
/**
 * <b>Description:</b> This is a reserved interface.
 */
+ (int)sipModHeader:(void *)pMsg headerName:(NSString *)headerName headerValue:(NSString *)headerValue; 
/**
 * <b>Description:</b> This is a reserved interface.
 */
+ (int)sipRmvHeader:(void *)pMsg headerName:(NSString *)headerName; 
/**
 * <b>Description:</b> This is a reserved interface.
 */
+ (NSString *)sipGetHeader:(void *)pMsg headerName:(NSString *)headerName;
/**
 * <b>Description:</b> This is a reserved interface.
 */
+ (NSString *)sipGetMethod:(void *)pMsg; 


@end

#endif

