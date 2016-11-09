/**
 * @file TscStgHelper.h
 * @brief CAAS STG Interface Functions
 */
#ifndef _TSC_STG_HELPER_H_
#define _TSC_STG_HELPER_H_

#import <Foundation/Foundation.h>
#import "SysApi.h"

/**
 * <b>Description:</b> TscStgHelper is a Helper class used to load the STG implementation.
 * <br><b>Purpose:</b> The CAAS_SysLoadStg interface of the caas_sys API needs TscStgHelper to load STG function
 * TSC implementation so as to enable the firewall traversal function.
 */
@interface TscStgHelper : StgHelper

/**
 * <b>Description:</b> It provides initialization for STG during system initialization.
 * UI dosen't need to pay attention to it.
 * @return 0 Indicates initialized successfully
 *     <br>1 Indicates failed
 */
-(int)load;
@end

#endif
