/**
 * @file NatStgHelper.h
 * @brief Nat STG Interface Functions
 */
#ifndef _STG_NAT_HELPER_H_
#define _STG_NAT_HELPER_H_

#import <Foundation/Foundation.h>
#import "SysApi.h"

/**
 * <b>Description:</b> NatStgHelper is a Helper class used to load the integrated SVN implementation.
 * <br><b>Purpose:</b> The loadStg interface of the SysApi needs NatStgHelper to load the integrated SVN implementation 
 * so as to enable the firewall traversal function of the integrated SVN.
 */
@interface NatStgHelper : StgHelper

/**
 * <b>Description:</b> It provides initialization for NAT STG APIs during system initialization.
 * UI dosen't need to pay attention to it.
 * @return 0 Indicates initialized successfully 
 *     <br>1 Indicates failed
 */
-(int)load;
@end

#endif
