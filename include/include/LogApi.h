/**
 * @file LogApi.h
 * @brief Log Interface Functions
 */
#ifndef _LOG_API_H
#define _LOG_API_H

#import <Foundation/Foundation.h>

/**
 * Indicates a log uploading result.
 * @see tag_LOG_UPLOAD_RESULT
 */
#define PARAM_LOG_UPLOAD_RESULT @"LOGAPI_PARAM_UPLOAD_RESULT"

/**
 * Indicates the code of error code.
 */
#define PARAM_LOG_ERRORCODE_CODE @"LOGAPI_PARAM_ERRORCODE_CODE"

/**
 * Indicates the time of error code.
 */
#define PARAM_LOG_ERRORCODE_TIME @"LOGAPI_PARAM_ERRORCODE_TIME"

/**
 * Indicates the description of error code.
 */
#define PARAM_LOG_ERRORCODE_DESC @"LOGAPI_PARAM_ERRORCODE_DESC"

/**
 * <b>Description:</b> It is used to broadcast a log uploading request.
 * <br><b>Purpose:</b> The server sends a log uploading request to the UI. The 
 * UI uploads the logs after receiving the broadcast.
 */
#define EVENT_LOG_UPLOAD_REQUEST @"LOGAPI_EVENT_UPLOAD_REQUEST"

/**
 * <b>Description:</b> It is used to broadcast log uploading results.
 * <br><b>Purpose:</b> The SDK uploads logs and broadcasts the log uploading result. 
 * The UI receives the broadcast and performs related operations, such as displaying the result.
 * <p>The broadcast will have the following extra parameter:
 * <ul>
 * <li><em>{@link #PARAM_LOG_UPLOAD_RESULT}</em></li> - Indicates log upload result[int]
 * </ul>
 * </p>
 */
#define EVENT_LOG_UPLOAD_RESULT @"LOGAPI_EVENT_UPLOAD_RESULT"

/**
 * <b>Description:</b> It is used to broadcast error code.
 * <br><b>Purpose:</b> The SDK broadcasts the error code.
 * The UI receives the broadcast and performs related operations, such as displaying the error code.
 * <p>The broadcast will have the following extra parameter:
 * <ul>
 * <li><em>{@link #PARAM_LOG_ERRORCODE_CODE}</em></li> - Indicates log errorcode code[NSString]
 * <li><em>{@link #PARAM_LOG_ERRORCODE_TIME}</em></li> - Indicates log errorcode time[NSString]
 * <li><em>{@link #PARAM_LOG_ERRORCODE_DESC}</em></li> - Indicates log errorcode desc[NSString]
 * </ul>
 * </p>
 */
#define EVENT_UPLOAD_LOG_ERROR_CODE @"LOGAPI_EVENT_UPLOAD_LOG_ERROR_CODE"

 /** 
 * Indicates log upload result
 * It indicates enumeration constants of log uploading results.The UI invokes it to broadcast 
 * log uploading results in {@link #EVENT_LOG_UPLOAD_RESULT}.
 */
typedef enum tag_LOG_UPLOAD_RESULT
{
    LOG_UPLOAD_RESULT_SUCCESS,    /**< @brief Indicates that a log file has been successfully uploaded. */
    LOG_UPLOAD_RESULT_FAILED,    /**< @brief Indicates that a log file fails to be uploaded. */
    LOG_UPLOAD_RESULT_TIMEOUT,    /**< @brief Indicates that the log file uploading times out. */
    LOG_UPLOAD_RESULT_NET_UNAVAILABLE    /**< @brief Indicates that network is unavailable for log file uploading. */
}LOG_UPLOAD_RESULT;

/** 
* <b>Description:</b> LogFileInfo is used to obtain the log file information. 
* <br><b>Purpose:</b> The UI invokes it to obtain the log file information, including
* the number of files, the size of file, file name and file directory in the SD card.
*/
@interface LogFileInfo : NSObject
{
@private
    /**
     * Indicates the number of log files. The value of this parameter must be larger than 1. The default value is 40.
     */
    unsigned long _filecount;
    
    /**
     * Indicates the size of a log file in unit of byte. The default value is 500 * 1024.
     */
    unsigned long _filesize;
    
    /**
     * Indicates the directory of a log file. The default value is the hrcs.
     */
    NSString* _filedir;

    /**
     * Indicates the name of a log file. The default value is hrcs.log.
     */
    NSString* _filename;

    /**
     * Indicates whether to close the cache of log, the default value is false.
     */
    BOOL _closecache;
}

/**
 *  Indicates the number of log files. The value of this parameter must be larger than 1. The default value is 40.
 */
@property(nonatomic, assign) unsigned long filecount;
/**
 * Indicates the size of a log file in unit of byte. The default value is 500 * 1024.
 */
@property(nonatomic,assign) unsigned long filesize;

/**
 * Indicates the directory of a log file. The default value is the hrcs.
 */
@property(nonatomic,retain) NSString*  filedir;

/**
 * Indicates the name of a log file. The default value is hrcs.log.
 */
@property(nonatomic,retain) NSString*  filename;

/**
 * Indicates whether to close the cache of log, the default value is false.
 */
@property(nonatomic,assign) BOOL closecache;

@end

/** 
 * <b>Description:</b> It provides an entry to logs. 
 * <br><b>Purpose:</b> The UI accesses log APIs to implement log services, including 
 * printing and uploading logs.
 */
@interface LogApi : NSObject
{
    
}
/**
 * <b>Description:</b> This method provides initialization for log APIs and must be invoked before log services are used.
 * <br><b>Purpose:</b> It is used to initialize log APIs during system initialization before log services are used. 
 */
+(void) init;

/**
 * <b>Description:</b> This method provides initialization for log APIs and must be invoked before log services are used.
 * <br><b>Purpose:</b> It is used to initialize log APIs during system initialization before log services are used.
 */
+(void) releaseApi;

/**
 * <b>Description:</b> This method is used to print error logs.
 * <br><b>Purpose:</b> When the UI is to print the program running errors, the UI invokes it to print error logs. 
 * Values of variable parameters cannot be printed.
 * @param [in] pcLogName Specifies a log name, a log name varies depending on modules.
 * @param [in] pcFormat Specifies a format string
 */
+ (void) e:(NSString*) pcLogName formatString:(NSString*) pcFormat;

/**
 * <b>Description:</b> This method is used to print information logs.
 * <br><b>Purpose:</b> When the UI is to print the program running information, the UI invokes it to print 
 * information logs. Values of variable parameters cannot be printed.
 * @param [in] pcLogName Specifies a log name, a log name varies depending on modules. 
 * @param [in] pcFormat Specifies a format string
 */
+ (void) i:(NSString*) pcLogName formatString:(NSString*) pcFormat;

/**
 * <b>Description:</b> This method is used to print debug logs.
 * <br><b>Purpose:</b> When the UI is to print the commissioning information, the UI invokes it to print 
 * debug logs. Values of variable parameters cannot be printed.
 * @param [in] pcLogName  Specifies a log name, a log name varies depending on modules.
 * @param [in] pcFormat Specifies a format string
 */
+ (void) d:(NSString*) pcLogName formatString:(NSString*) pcFormat;

/**
 * <b>Description:</b> This method is used to get flush log and save to log file.
 * <br><b>Purpose:</b> When exiting the app, UI can invoke this method to save the
 * logs in memory to the files.
 * @return 0 Indicates it succeeded to save logs to files
 *    <br> 1 Indicates it failed to save logs to files
 */
+(int) getFlushLog;

/**
 * <b>Description:</b> This method is used to upload logs, the File Path is default.
 * <br><b>Purpose:</b> After receiving the {@link #EVENT_LOG_UPLOAD_REQUEST} from the server or when a subscriber 
 * manually uploads logs, the UI invokes it to upload logs.
 * <br><b>Description for Secuity:</b> ERROR level logs don't contain any sensitive information or user privacy.
 * But DEBUG level logs  might contain some private data of users, including communications records, chat records.
 * So recommend the commercial version does not print Debug level logs.
 * <p>
 * <br><b>For attention: Before invoking it, the UI must display a disclaimer to notify subscribers that the 
 * subscriber information may be disclosed.</b>
 *
 */
+ (void) uploadLog;

/**
 * <b>Description:</b> This method is used to compress and upload the log file to server, UI must set the log file path.
 * <br><b>Purpose:</b> After receiving the {@link #EVENT_LOG_UPLOAD_REQUEST} from the server or when a subscriber
 * manually uploads logs, the UI invokes it to upload logs.
 * <p>
 * <br><b>For attention: Before invoking it, the UI must display a disclaimer to notify subscribers that the 
 * subscriber information may be disclosed.</b>
 * @param [in] logsPath  Specifies Compressed File Path
 */
+ (void) uploadLog:(NSString*)logsPath;

/**
 * <b>Description:</b> This method is used to cancel log uploading.
 * <br><b>Purpose:</b> When a subscriber manually cancle uploading logs, the UI 
 * invokes it to stop uploading.
 */
+ (void) uploadLogsCancel;

/**
 * <b>Description:</b> This method is used to query log file directory.
 * <br><b>Purpose:</b> UI invokes it to get the directory of a log file. The default 
 * value is the "hrslog" directory in the SD card.
 * @return The value indicates the log file directory relative to Documents directory
 */ 
+ (NSString *) getLogFileDir;

/**
 * <b>Description:</b> This method is used to set the log file information and must be invoked before the system initialization.
 * <br><b>Purpose:</b> The UI invokes this method to set log file information before all initialization.
 * Including the number of files, the size of file, file name and file directory in the SD card.
 * @param [in] info Specifies the log file information. For details, see {@link #LogFileInfo}.
 * @return YES Indicates that the setting succeeds
 *     <br>NO Indicates that the setting fails
 */ 
+ (BOOL) setLogFileInfo:(LogFileInfo*) info;

/**
 * <b>Description:</b> This method is used to obtain the log file information.
 * <br><b>Purpose:</b> The UI inovkes it to obtain the log file information.
 * Including the number of files, the size of file, file name and file directory in the SD card.
 * @return The value indicates the log file information. For details, see {@link #LogFileInfo}.
 */ 
+ (LogFileInfo *) getLogFileInfo;

/**
 * <b>Description:</b> This method is used to set whether to enable log QoE or not.
 * <br><b>Purpose:</b> When UI wants to log QoE, it can invoke this method to set, default is enable.
 * @param bEnable
 *            Specifies enable log QoE
 * @return 0 Indicates that the setting succeeds
 *     <br>1 Indicates that the setting fails
 */
+(int) setLogQoeEnable:(BOOL)bEnable;

/**
 * <b>Description:</b> This method is used to upload files of QoE, the File Path is default.
 * <br><b>Purpose:</b> when a subscriber manually uploads files of QoE, the UI invokes it to upload the files. 
 */
+ (void)uploadLogQoe;

/**
 * <b>Description:</b> This method is used to set whether to enable log error code or not.
 * <br><b>Purpose:</b> When UI wants to log error code, it can invoke this method to set, default is enable.
 * @param bEnable
 *            Specifies enable log error code
 * @return 0 Indicates that the setting succeeds
 *     <br>1 Indicates that the setting fails
 */
+(int) setLogNtyErrCode:(BOOL)bEnable;


@end

/**
 * <b>Description:</b> This method is a C language function and used to print error logs.
 * <br><b>Purpose:</b> When the UI is to print the program running errors, the UI invokes it
 * to print error logs, values of variable parameters can be printed.
 * @param [in] pcLogName Specifies a log name, a log name varies depending on modules.
 * @param [in] pcFormat Specifies a format string
 * @deprecated The purpose of this method is just compatible with the old version of UI, we do not recommend the new version of UI invokes this method. Use LogApi::e instead of this method.
 */
void e(char *pcLogName, char *pcFormat, ...);

/**
 * <b>Description:</b> This method is a C language function and used to print information logs.
 * <br><b>Purpose:</b> When the UI is to print the program running information, the UI invokes it
 * to print information logs. Values of variable parameters can be printed.
 * @param [in] pcLogName Specifies a log name, a log name varies depending on modules.
 * @param [in] pcFormat Specifies a format string
 * @deprecated The purpose of this method is just compatible with the old version of UI, we do not recommend the new version of UI invokes this method. Use LogApi::i instead of this method.
 */
void i(char *pcLogName, char *pcFormat, ...);

/**
 * <b>Description:</b> This method is a C language function and used to print debug logs.
 * <br><b>Purpose:</b> When the UI is to print the commissioning information,
 * to print debug logs. Values of variable parameters can be printed.
 * @param [in] pcLogName Specifies a log name, a log name varies depending on modules.
 * @param [in] pcFormat Specifies a format string
 * @deprecated The purpose of this method is just compatible with the old version of UI, we do not recommend the new version of UI invokes this method. Use LogApi::d instead of this method.
 */
void d(char *pcLogName, char *pcFormat, ...);
#endif
