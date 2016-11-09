/**
 * @file DefaultTlsHelper.h
 * @brief Default TLS Interface Functions
 */
#ifndef _DEFAULT_TLS_HELPER_H_
#define _DEFAULT_TLS_HELPER_H_

#import <Foundation/Foundation.h>
#import "SysApi.h"

/**
 * <b>Description:</b> It provides initialization for TLS APIs during system initialization.
 * <br><b>Purpose:</b> The loadTls interface of the SysApi needs DefaultTlsHelper to load the 
 * default TLS implementation, so as to enable the security encryption function of the SDK.
 */
@interface DefaultTlsHelper : TlsHelper

/**
 * <b>Description:</b> It provides initialization for TLS APIs during system initialization.
 * UI dosen't need to pay attention to it.
 * @return 0 Indicates initialized successfully
 *     <br>1 Indicates failed
 */
-(int)load;
@end

#endif
