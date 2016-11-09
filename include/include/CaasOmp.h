/**
 * @file CaasCfg.h
 */
#ifndef _CAAS_OMP_H
#define _CAAS_OMP_H

#import <Foundation/Foundation.h>

/**< Indicates the default priority of omp component. */
#define    OMP_DFT_PRIORITY           110

/** 
 * <b>Description:</b> It provides an entry to login omp server. 
 * <br><b>Purpose:</b> The UI accesses CaasOmp APIs to implement logining omp.
 */
@interface CaasOmp: NSObject
{
    
}

/** 
* <b>Description:</b> This method provides initialization for login APIs and must be invoked before login. 
* <br><b>Purpose:</b> The UI invokes it to initialize login APIs during system initialization before login.
* @return 0 Indicates it succeed to initialize
*    <br> not 0 Indicates it failed to initialize
*/
+ (int)init;

/** 
* <b>Description:</b> This method is used to release login APIs before logging out of the RCS client.
* <br><b>Purpose:</b> The UI invokes it to release login APIs before logging out of the RCS client.
* @return 0 Indicates it succeed to destroy
*    <br> not 0 Indicates it failed to destroy
*/
+ (int)destroy;


/**
 * <b>Description:</b> This method is used to add the omp component to login. 
 * <br><b>Purpose:</b> The UI invokes it to initialize omp component during system initialization before login.
 * @param [in] uiPriority Indicates the priority of omp component, the default value is OMP_DFT_PRIORITY
 * @return 0 Indicates it succeed to add the omp component
 *    <br> not 0 Indicates it failed to add the omp component
 */
+ (int)addPlugin: (unsigned int)uiPriority;

@end

#endif

