/**
 * @file CaasImbsCfg.h
 * @brief imbs configuration Interface Functions
 */
#ifndef _CAAS_IMBS_CFG_H_
#define _CAAS_IMBS_CFG_H_

#import <Foundation/Foundation.h>

/** It indicates enumeration constants of configuration type */
typedef enum tag_IMBS_CFG_TYPE
{
    IMBS_CFG_SERVER_ADDR      = 0,  /**< @brief Indicates that the configuration type of message backup server address. */
    IMBS_CFG_SERVER_PORT      = 1,  /**< @brief Indicates that the configuration type of message backup server port. */
    IMBS_CFG_TRANSTYPE        = 2   /**< @brief Indicates that the configuration type of message backup transfer type. */
} IMBS_CFG_TYPE;

typedef enum tag_IMBS_TRANSTYPE
{
    IMBS_TRANSTYPE_HTTP      = 0,  /**< @brief Indicates that the type of message backup is tcp. */
    IMBS_TRANSTYPE_HTTPS     = 1   /**< @brief Indicates that the type of message backup is tls. */
} IMBS_TRANSTYPE;

/**
 * <b>Description:</b> CaasImbsCfg provides an entry to set and query message backup configuration.
 * <br><b>Purpose:</b> It provides the entry to set and query message backup configuration.
 */
@interface CaasImbsCfg : NSObject
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
