/**
 * @file CaasCfg.h
 */
#ifndef _CAAS_CFG_H
#define _CAAS_CFG_H

#import <Foundation/Foundation.h>

/** Indicates the query type of the DNS.*/
typedef enum tag_DNS_QUERY_TYPE 
{
    EN_CAAS_UDNS_NAPTR_REQ              = 0,  /**< @brief the NAPTR query. */   
    EN_CAAS_UDNS_SRV_REQ                = 1,  /**< @brief only the SRV query. */
    EN_CAAS_UDNS_A_REQ                  = 2,  /**< @brief only the A query. */
    EN_CAAS_UDNS_SRVA_REQ               = 3,  /**< @brief the SRV query and A query. */
    
    EN_CAAS_UDNS_BUTT                         /**< @brief the butt of query type. */
} EN_DNS_QUERY_TYPE;

/**< @brief the butt of configure name. */
typedef enum tag_EN_CAAS_UCFG_TYPE
{
    EN_CAAS_UCFG_NULL         = 0,  /**< @brief no configure name. */   
    EN_CAAS_UCFG_BASE         = 1,  /**< @brief base configure name. */
    EN_CAAS_UCFG_LOGIN        = 2,  /**< @brief login configure name. */
    EN_CAAS_UCFG_REG          = 3,  /**< @brief register configure name. */

    EN_CAAS_UCFG_BUTT               /**< @brief the butt of configure name. */
} EN_CAAS_UCFG_TYPE;

/** Indicates union config register type*/
typedef enum tag_EN_CAAS_UREG_CFG_TYPE
{
    EN_CAAS_UREG_CFG_DNS_TYPE           = 49, /**< @brief DNS query type, type int @see EN_DNS_QUERY_TYPE. */  

    EN_CAAS_UREG_CFG_MAX     /* for array */
} EN_CAAS_UREG_CFG_TYPE;

/** 
 * <b>Description:</b> It provides an entry to set configure. 
 * <br><b>Purpose:</b> The UI accesses CaasCfg APIs to implement set configure services, including 
 * unsigned int and string and so on.
 */
@interface CaasCfg: NSObject
{
    
}

/**
 * <b>Description:</b> This method is used to set the policy of the configuration item.
 * <br><b>Purpose:</b> UI invokes this method to set the policy of the configuration item.
 *
 * @param [in] cfgId Specifies the configure ID
 * @param [in] cfgName Specifies the configure name
 * @param [in] policy Specifies the policy
 *
 * @return 0 Indicates the setting succeeds
 *    <br> not 0 Indicates the setting fails
 */
+ (int)setPolicy: (unsigned int)cfgId cfgName:(unsigned int)cfgName policy:(unsigned int)policy;

/**
 * <b>Description:</b> This method is used to set a unsigned int value to a configuration item.
 * <br><b>Purpose:</b> UI can invoke this method to set a unsigned int value to a configuration item.
 *
 * @param [in] cfgId Specifies the configure ID
 * @param [in] cfgName Specifies the configure name
 * @param [in] val Specifies the configure value
 *
 * @return 0 Indicates the setting succeeds
 *    <br> not 0 Indicates the setting fails
 */
+ (int)setUint: (unsigned int)cfgId cfgName:(unsigned int)cfgName val:(unsigned int)val;

/**
 * <b>Description:</b> This method is used to set a string value to a configuration item.
 * <br><b>Purpose:</b> UI can invoke this method to set a string value to a configuration item.
 *
 * @param [in] cfgId Specifies the configure ID
 * @param [in] cfgName Specifies the configure name
 * @param [in] val Specifies the configure value
 *
 * @return 0 Indicates the setting succeeds
 *    <br> not 0 Indicates the setting fails
 */
+ (int)setString: (unsigned int)cfgId cfgName:(unsigned int)cfgName val:(NSString *)val;

/**
 * <b>Description:</b> This method is used to get an unsigned int value of a configuration item.
 * <br><b>Purpose:</b> UI invokes this method to get an unsigned int value of a configuration item.
 *
 * @param [in] cfgId Specifies the configure ID
 * @param [in] cfgName Specifies the configure name
 *
 * @return The value indicates the current configure value
 */
+ (unsigned int)getUint: (unsigned int)cfgId cfgName:(unsigned int)cfgName;

/**
 * <b>Description:</b> This method is used to get a string value of a configuration item.
 * <br><b>Purpose:</b> UI invokes this method to get a string value of a configuration item.
 *
 * @param [in] cfgId Specifies the configure ID
 * @param [in] cfgName Specifies the configure name
 *
 * @return The value indicates the current configure value
 */
+ (NSString *)getString: (unsigned int)cfgId cfgName:(unsigned int)cfgName;

/**
 * <b>Description:</b> This method is used to set a unsigned int value to a configuration item.
 * <br><b>Purpose:</b> UI can invoke this method to set a unsigned int value to a configuration item with the index.
 *
 * @param [in] cfgId Specifies the configure ID
 * @param [in] cfgName Specifies the configure name
 * @param [in] idx Specifies the index of configure item
 * @param [in] val Specifies the configure value
 *
 * @return 0 Indicates the setting succeeds
 *    <br> not 0 Indicates the setting fails
 */
+ (int)arraySetUint: (unsigned int)cfgId cfgName:(unsigned int)cfgName idx:(unsigned int)idx
                val:(unsigned int)val;

/**
 * <b>Description:</b> This method is used to set a string value to a configuration item.
 * <br><b>Purpose:</b> UI can invoke this method to set a string value to a configuration item with the index. 
 *
 * @param [in] cfgId Specifies the configure ID
 * @param [in] cfgName Specifies the configure name
 * @param [in] idx Specifies the index of configure item
 * @param [in] val Specifies the configure value
 *
 * @return 0 Indicates the setting succeeds
 *    <br> not 0 Indicates the setting fails
 */
+ (int)arraySetString: (unsigned int)cfgId cfgName:(unsigned int)cfgName idx:(unsigned int)idx
                  val:(NSString *)val;

/**
 * <b>Description:</b> This method is used to get an unsigned int value of a configuration item.
 * <br><b>Purpose:</b> UI invokes this method to get an unsigned int value of a configuration item with the index.
 *
 * @param [in] cfgId Specifies the configure ID
 * @param [in] cfgName Specifies the configure name
 * @param [in] idx Specifies the index of configure item
 *
 * @return The value indicates the current configure value
 */
+ (unsigned int)arrayGetUint: (unsigned int)cfgId cfgName:(unsigned int)cfgName idx:(unsigned int)idx;

/**
 * <b>Description:</b> This method is used to get a string value of a configuration item.
 * <br><b>Purpose:</b> UI invokes this method to get a string value of a configuration item with the index.
 *
 * @param [in] cfgId Specifies the configure ID
 * @param [in] cfgName Specifies the configure name
 * @param [in] idx Specifies the index of configure item
 *
 * @return The value indicates the current configure value
 */
+ (NSString *)arrayGetString: (unsigned int)cfgId cfgName:(unsigned int)cfgName idx:(unsigned int)idx;

@end

#endif
