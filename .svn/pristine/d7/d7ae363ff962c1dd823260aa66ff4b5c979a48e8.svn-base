/**
* @file CaasCallCfg.h
* @brief Call Cfg Interface Functions
*/
#ifndef _CALL_CFG_H_
#define _CALL_CFG_H_
#import <Foundation/Foundation.h>


/* 统一配置呼叫控制参数，从51之后开始，51之前的参数预留给 EN_CTS_CFG_MAJOR_TYPE*/
typedef enum tag_CALL_CFG_TYPE 
{
    EN_CALL_CFG_VIDEO_MODE               =   51,  /**< Indicates the video mode. */
    EN_CALL_CFG_MAX                             /**< Indicates the butt. */
} EN_CALL_CFG_TYPE;

/** 
 * <b>Description:</b> It provides an entry to set Call Config. 
 * <br><b>Purpose:</b> The UI accesses CaasCall APIs to implement logining omp.
 */
@interface CaasCallCfg: NSObject
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