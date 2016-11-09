/**
 * @file SvnStgHelper.h
 * @brief Huawei Symantec SVN STG Interface Functions
 */
#ifndef _SVN_STG_HELPER_H_
#define _SVN_STG_HELPER_H_

#import <Foundation/Foundation.h>
#import "SysApi.h"

/**
 * <b>Description:</b> SvnStgHelper is a Helper class used to load the Huawei Symantec SVN implementation.
 * <br><b>Purpose:</b> The loadStg interface of the SysApi needs SvnStgHelper to load the Huawei Symantec 
 * SVN implementation so as to enable the firewall traversal function of the external SVN.
 */
@interface SvnStgHelper : StgHelper

/**
 * <b>Description:</b> It provides initialization for Huawei Symantec SVN APIs during system initialization.
 * UI dosen't need to pay attention to it.
 * @return 0 Indicates initialized successfully
 *     <br>1 Indicates failed
 */
-(int)load;
@end

#endif
