/**
 * @file CaasOmpCfg.h
 */
#ifndef _CAAS_OMP_CFG_H
#define _CAAS_OMP_CFG_H

#import <Foundation/Foundation.h>

typedef enum tag_OMP_CFG_TYPE 
{
    EN_OMP_CFG_SERVER_IP               =   0,  /**< Indicates the server ip [NSString]. */
    EN_OMP_CFG_SERVER_PORT             =   1,  /**< Indicates the server port [int]. */
    EN_OMP_CFG_APP_KEY                 =   2,  /**< Indicates the APP key [NSString]. */
    EN_OMP_CFG_USRNAME                 =   3,  /**< Indicates the user name [NSString]. */
    EN_OMP_CFG_PASSWORD                =   4,  /**< Indicates the password  [NSString]. */
    EN_OMP_CFG_MAX                             /**< Indicates the butt. */
} EN_OMP_CFG_TYPE;

/** 
 * <b>Description:</b> It provides an entry to login omp server. 
 * <br><b>Purpose:</b> The UI accesses CaasOmp APIs to implement logining omp.
 */
@interface CaasOmpCfg: NSObject
{
    
}

/**
 * <b>Description:</b> This method is used to set a unsigned int value to a configuration item.
 * <br><b>Purpose:</b> UI can invoke this method to set a unsigned int value to a configuration item.
 *
 * @param [in] cfgName Specifies the configure name
 * @param [in] val Specifies the configure value
 *
 * @return 0 Indicates the setting succeeds
 *    <br> not 0 Indicates the setting fails
 */
+ (int)setUint: (unsigned int)cfgName val:(unsigned int)val;

/**
 * <b>Description:</b> This method is used to set a string value to a configuration item.
 * <br><b>Purpose:</b> UI can invoke this method to set a string value to a configuration item.
 *
 * @param [in] cfgName Specifies the configure name
 * @param [in] val Specifies the configure value
 *
 * @return 0 Indicates the setting succeeds
 *    <br> not 0 Indicates the setting fails
 */
+ (int)setString: (unsigned int)cfgName val:(NSString *)val;

/**
 * <b>Description:</b> This method is used to get an unsigned int value of a configuration item.
 * <br><b>Purpose:</b> UI invokes this method to get an unsigned int value of a configuration item.
 *
 * @param [in] cfgName Specifies the configure name
 *
 * @return The value indicates the current configure value
 */
+ (unsigned int)getUint: (unsigned int)cfgName;

/**
 * <b>Description:</b> This method is used to get a string value of a configuration item.
 * <br><b>Purpose:</b> UI invokes this method to get a string value of a configuration item.
 *
 * @param [in] cfgName Specifies the configure name
 *
 * @return The value indicates the current configure value
 */
+ (NSString *)getString: (unsigned int)cfgName;

@end

#endif