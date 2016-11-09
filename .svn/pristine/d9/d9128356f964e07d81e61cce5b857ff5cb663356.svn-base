/**
 * @file CallApi.h
 * @brief Call Interface Functions
 */
#ifndef _CALL_API_H_
#define _CALL_API_H_
#import <Foundation/Foundation.h>
#import "PeerInfo.h"
#import "EAGLExView.h"
#import "ConferenceApi.h"

/** Indicates the type of a call. */
typedef enum tag_CALL_TYPE
{
    TYPE_AUDIO,         /**< Indicates the call is an audio call. */
    TYPE_VIDEO,         /**< Indicates the call is a video call. */
    TYPE_VIDEO_SHARE,   /**< Indicates the call is a video sharing call. */
}CALL_TYPE;

/** Indicates the operation result of holding or unholding a call. */
typedef enum tag_CALL_OPERATE_RESULT
{
    CALL_OPERATE_RESULT_NORMAL,         /**< Indicates holding or unholding a call successfully. */
    CALL_OPERATE_RESULT_BUSY,           /**< Indicates holding or unholding operation is ongoing now.  */
    CALL_OPERATE_RESULT_NOTAVAILABLE    /**< Indicates that holding or unholding a call is not available now. */
}CALL_OPERATE_RESULT;

/** Indicates the status of a call. */
typedef enum tag_CALL_STATUS
{
    CALL_STATUS_IDLE,       /**< Indicates the initial status of an audio or video call. */
    CALL_STATUS_OUTGOING,   /**< Indicates the status of the calling party, from the time the calling party initiates the call to the time the calling party hears the ring back tone. */
    CALL_STATUS_INCOMING,   /**< Indicates the status of the called party, from the time the called party is alerted to the time the called party answers the call. */
    CALL_STATUS_ALERTING,   /**< Indicates the status of the calling party, from the time the calling party hears the ring back tone to the time the calling party answers the call. */
    CALL_STATUS_CONNECTED,  /**< Indicates the status that the audio or video call between the calling and called parties is connected. */
    CALL_STATUS_HOLD,       /**< Indicates the status of a VoIP call after the call Hold service is initiated. */
    CALL_STATUS_HELD,       /**< Indicates the status of a VoIP call after the call is placed on hold. */
    CALL_STATUS_FORWARDED   /**< Indicates the status of a call after the call is forwarded. */
}CALL_STATUS;

/** Indicates call error. */
typedef enum tag_CALL_ERROR
{
    CALL_ERRCODE_OK,                  /**< Indicates that the call is successfully established. */
    CALL_ERRCODE_FAILED,              /**< Indicates that the call fails. */
    CALL_ERRCODE_SERVER_DISCONNECTED, /**< Indicates that the server is disconnected. */
    CALL_ERRCODE_EXIST_CS_CALL        /**< Indicates that the audio or video call cannot be initiated because CS calls exist. */
}CALL_ERROR;

/** Indicates call stat type. */
typedef enum EN_CALL_STAT_TYPE
{
    CALL_STAT_MISSED = 0,   /**< Indicates that the call is a missing call */
    CALL_STAT_RECVED,       /**< Indicates that the call is a received call */
    CALL_STAT_DIALED,       /**< Indicates that the call is a dailed call */
    CALL_STAT_CANCEL        /**< Indicates that the call is a cancel call */
} EN_CALL_STAT_TYPE;

/** Indicates video call size type (video resolution). */
typedef enum tag_CALL_PS_TYPE
{
    CALL_PS_SQCIF = 0,             /**< Indicates the resolution SQCIF 128 x 96. */
    CALL_PS_QCIF,                  /**< Indicates the resolution QCIF 176 x 144. */
    CALL_PS_QVGA,                  /**< Indicates the resolution QVGA 320x240. */
    CALL_PS_525_SIF,               /**< Indicates the resolution SIF 352x240. */
    CALL_PS_CIF,                   /**< Indicates the resolution CIF 352 x 288. */
    CALL_PS_525_HHR = 5,           /**< Indicates the resolution 525_HHR 352x480. */
    CALL_PS_625_HHR,               /**< Indicates the resolution 625_HHR 352x576. */
    CALL_PS_VGA,                   /**< Indicates the resolution VGA 640x480. */
    CALL_PS_525_4SIF,              /**< Indicates the resolution 4SIF 704x480. */
    CALL_PS_525_SD,                /**< Indicates the resolution 525_SD 720x480. */
    CALL_PS_4CIF = 10,             /**< Indicates the resolution 4CIF 704 x 576. */
    CALL_PS_625_SD,                /**< Indicates the resolution 625_SD 720x576, alias CCIR. */
    CALL_PS_SVGA,                  /**< Indicates the resolution SVGA 800x600. */
    CALL_PS_XGA,                   /**< Indicates the resolution XGA 1024x768. */
    CALL_PS_720P_HD,               /**< Indicates the resolution 720P_HD 1280x720. */
    CALL_PS_4VGA = 15,             /**< Indicates the resolution 4VGA 1280x960. */
    CALL_PS_SXGA,                  /**< Indicates the resolution SXGA 1280x1024. */
    CALL_PS_525_16SIF,             /**< Indicates the resolution 16SIF 1408x960. */
    CALL_PS_16CIF,                 /**< Indicates the resolution 16CIF 1408 x 1152. */
    CALL_PS_4SVGA,                 /**< Indicates the resolution 4SVGA 1600x1200. */
    CALL_PS_1080_HD = 20,          /**< Indicates the resolution 1080_HD 1920x1088. */
    CALL_PS_2K_1K,                 /**< Indicates the resolution 2K_1K 2048x1024. */
    CALL_PS_2K_1080,               /**< Indicates the resolution 2K_1080 2048x1088. */
    CALL_PS_4XGA,                  /**< Indicates the resolution 4XGA 2048x1536. */
    CALL_PS_16VGA,                 /**< Indicates the resolution 16VGA 2560x1920. */
    CALL_PS_3616_1536 = 25,        /**< Indicates the resolution 3616_1536 3616x1536. */
    CALL_PS_3672_1536,             /**< Indicates the resolution 3672_1536 3680x1536. */
    CALL_PS_4K_2K,                 /**< Indicates the resolution 4K_2K 4096x2048. */
    CALL_PS_4096_2304,             /**< Indicates the resolution 4094x2304. */
    CALL_PS_CTM = 29,              /**< Indicates the resolution customized specific picture size. */
    CALL_PS_SIZE = CALL_PS_CTM     /**< Indicates the maximum value of this enumeration. */
} CALL_PS_TYPE;

/** Indicates video call codec type. */
typedef enum tag_CALL_CODEC_TYPE
{
    CALL_CODEC_H264 = 0,     /**< Indicates VIDEO H264 CODEC. */
    CALL_CODEC_H263          /**< Indicates VIDEO H263 CODEC. */
} CALL_CODEC_TYPE;

/** Indicates Call Supplementary Service operation type (SSop type). */
typedef enum tag_CALL_SSOP_TYPE
{
    CALL_SSOP_TYPE_ACTIVE_CW      = 0,   /**< Indicates SSOP type for activating call wait (*43#). */
    CALL_SSOP_TYPE_DEACTIVE_CW    = 1,   /**< Indicates SSOP type for deactivating call wait (#43#). */

    CALL_SSOP_TYPE_ACTIVE_CFU     = 2,   /**< Indicates SSOP type for activating unconditional call forwarding (*21*DN#). */
    CALL_SSOP_TYPE_DEACTIVE_CFU   = 3,   /**< Indicates SSOP type for deactivating unconditional call forwarding (#21#). */

    CALL_SSOP_TYPE_ACTIVE_CFB     = 4,   /**< Indicates SSOP type for activating call forwarding busy (*67*DN#). */
    CALL_SSOP_TYPE_DEACTIVE_CFB   = 5,   /**< Indicates SSOP type for deactivating call forwarding busy (#67#). */

    CALL_SSOP_TYPE_ACTIVE_CFNRY   = 6,   /**< Indicates SSOP type for activating call forwarding no reply (*61*DN#). */
    CALL_SSOP_TYPE_DEACTIVE_CFNRY = 7,   /**< Indicates SSOP type for deactivating call forwarding no reply (#61#). */

    CALL_SSOP_TYPE_ACTIVE_CFNRC   = 8,   /**< Indicates SSOP type for activating call forwarding on user not reachable (*47*DN#). */
    CALL_SSOP_TYPE_DEACTIVE_CFNRC = 9,   /**< Indicates SSOP type for deactivating call forwarding on user not reachable (#47#). */

    CALL_SSOP_TYPE_ACTIVE_CFNL    = 10,  /**< Indicates SSOP type for activating call forwarding on user not online (*45*DN#). */
    CALL_SSOP_TYPE_DEACTIVE_CFNL  = 11,  /**< Indicates SSOP type for deactivating call forwarding on user not online (#45#). */

    CALL_SSOP_TYPE_ACTIVE_CFNLVM  = 12,  /**< Indicates SSOP type for activating call forwarding to voice mailbox on user not online (*46#). */
    CALL_SSOP_TYPE_DEACTIVE_CFNLVM= 13,  /**< Indicates SSOP type for deactivating call forwarding to voice mailbox on user not online (#46#). */

    CALL_SSOP_TYPE_ACTIVE_CLIP    = 14,  /**< Indicates SSOP type for activating calling line identification presentation (*234#). */
    CALL_SSOP_TYPE_DEACTIVE_CLIP  = 15,  /**< Indicates SSOP type for deactivating calling line identification presentation(#234#). */

    CALL_SSOP_TYPE_ACTIVE_CLIR    = 16,  /**< Indicates SSOP type for activating calling line identification restriction (*81#). */
    CALL_SSOP_TYPE_DEACTIVE_CLIR  = 17,  /**< Indicates SSOP type for deactivating calling line identification restriction (#81#). */

    CALL_SSOP_TYPE_ACTIVE_CNIR    = 18,  /**< Indicates SSOP type for activating calling name identification restriction (*82#). */
    CALL_SSOP_TYPE_DEACTIVE_CNIR  = 19,  /**< Indicates SSOP type for deactivating calling name identification restriction (#82#). */

    CALL_SSOP_TYPE_ACTIVE_COLP    = 20,  /**< Indicates SSOP type for activating called line identification restriction (*15#). */
    CALL_SSOP_TYPE_DEACTIVE_COLP  = 21,  /**< Indicates SSOP type for deactivating called line identification restriction (#15#). */

    CALL_SSOP_TYPE_ACTIVE_COLR    = 22,  /**< Indicates SSOP type for activating called line identification restriction (*16#). */
    CALL_SSOP_TYPE_DEACTIVE_COLR  = 23,  /**< Indicates SSOP type for deactivating called line identification restriction (#16#). */

    CALL_SSOP_TYPE_SSOP_TYPE_BUTT        /**< Indicates pointless SSOP type (the maximum value of this enumeration). */
} CALL_SSOP_TYPE;

/** Indicates call audio recording source. */
typedef enum tag_CALL_AUDIO_SOURCE
{
    CALL_AUDIO_SOURCE_MIC    = 0,   /**< Indicates audio recording for microphone. */
    CALL_AUDIO_SOURCE_HORN   = 1,   /**< Indicates audio recording for horn. */
    CALL_AUDIO_SOURCE_MIXED  = 2,   /**< Indicates audio recording for mixed. */
    CALL_AUDIO_SOURCE_STEREO = 3    /**< Indicates audio recording for stereo. */
}CALL_AUDIO_SOURCE;

/** Indicates call speaker position. */
typedef enum tag_CALL_SPEAKER_POS
{
    CALL_SPEAKER_EARPHONE, /**< Indicates earphone mode. */
    CALL_SPEAKER_HANDFREE, /**< Indicates hand free mode. */
    CALL_SPEAKER_NOSET     /**< Indicates no set. */
}CALL_SPEAKER_POS;

/** Indicates ring tone of the dial. */
typedef enum tag_CALL_RING_TONE {
    CALL_RING_TONE_0,       /**< Indicates call ring tone 0. */
    CALL_RING_TONE_1,       /**< Indicates call ring tone 1. */
    CALL_RING_TONE_2,       /**< Indicates call ring tone 2. */
    CALL_RING_TONE_3,       /**< Indicates call ring tone 3. */
    CALL_RING_TONE_4,       /**< Indicates call ring tone 4. */
    CALL_RING_TONE_5,       /**< Indicates call ring tone 5. */
    CALL_RING_TONE_6,       /**< Indicates call ring tone 6. */
    CALL_RING_TONE_7,       /**< Indicates call ring tone 7. */
    CALL_RING_TONE_8,       /**< Indicates call ring tone 8. */
    CALL_RING_TONE_9,       /**< Indicates call ring tone 9. */
    CALL_RING_TONE_STAR,    /**< Indicates call ring tone star (*). */
    CALL_RING_TONE_POUND    /**< Indicates call ring tone pound (#). */
}CALL_RING_TONE;

/** Indicates user Status In the Conference. */
typedef enum tag_CALL_CONF_STATUS{
    CALL_CONF_STATUS_INCOMING,     /**< Indicates callee has a new conference call. */
    CALL_CONF_STATUS_ENTERED,      /**< Indicates having entered the conference. */
    CALL_CONF_STATUS_CONNECTED,    /**< Indicates being connected to the conference. */
    CALL_CONF_STATUS_TERMED,        /**< Indicates leaving the conference of one's own accord or being forced to leave the conference. */
    CALL_CONF_STATUS_OUTGOING
}CALL_CONF_STATUS;

/** Indicates video stream types */
typedef enum tag_CALL_VIDEO_STREAM_TYPE{
    CALL_VIDEO_TYPE_MAIN,         /**< Indicates normal video stream (main stream). */
    CALL_VIDEO_TYPE_ASSISTANT     /**< Indicates assistant stream. */
}CALL_VIDEO_STREAM_TYPE;

/** Indicates bit rates for assistant stream */
typedef enum tag_CALL_ASSISTANT_BITRATE{
    CALL_VIDEO_BIT_RATE_128K  = 128000,      /**< Indicates the bit rate 128000. */
    CALL_VIDEO_BIT_RATE_384K    = 384000,    /**< Indicates the bit rate 384000. */
    CALL_VIDEO_BIT_RATE_512K    = 512000,    /**< Indicates the bit rate 512000. */
    CALL_VIDEO_BIT_RATE_768K    = 768000,    /**< Indicates the bit rate 768000. */
    CALL_VIDEO_BIT_RATE_1024K   = 1024000,   /**< Indicates the bit rate 1024000. */
}CALL_ASSISTANT_BITRATE;

/** Indicates video resolution (width and height) */
typedef enum tag_CALL_VIDEO_RESOLUTION{
    CALL_VIDEO_INFO_H264_X_RES = 26,      /**< Indicates H264 resolution width. */
    CALL_VIDEO_INFO_H264_Y_RES = 27       /**< Indicates H264 resolution height. */
 }CALL_VIDEO_RESOLUTION;

 /** Indicates type of sip header from which the content is obtained */
 typedef enum tag_CALL_SIP_CONTENT_TYPE{
    CALL_SIP_CONTENT_FROM_URI,  /**< Indicates uri within sip From header. */
    CALL_SIP_CONTENT_PAI_URI,   /**< @breif Indicates tel uri within sip PAI header. */
    CALL_SIP_CONTENT_CONF_INFO,     /**< @breif Indicates conference info sip header. */
    CALL_SIP_CONTENT_PAI_SIP_URI,   /**< @breif Indicates sip uri within sip PAI header. */
    CALL_SIP_CONTENT_P_ASSERTED_SERVICE,   /**< @breif Indicates P-Asserted-Service header field first service id. */    
}CALL_SIP_CONTENT_TYPE;

/** Indicates media type of the call */
typedef enum tag_CALL_MEDIA_TYPE{
    CALL_MEDIA_TYPE_AUDIO,  /**< Indicates audio media. */
    CALL_MEDIA_TYPE_VIDEO   /**< Indicates video media. */
}CALL_MEDIA_TYPE;

/** Indicates media error type of video */
typedef enum tag_CALL_MEDIA_ERROR_VIDEO_TYPE{
    CALL_MEDIA_ERROR_VIDEO_DEFAULT,  /**< Indicates default error. */
    CALL_MEDIA_ERROR_VIDEO_CAMERA,  /**< Indicates media error of camera. */
}CALL_MEDIA_ERROR_VIDEO_TYPE;

/** Indicates media error type of video */
typedef enum tag_CALL_MEDIA_ERROR_AUDIO_TYPE{
    CALL_MEDIA_ERROR_AUDIO_DEFAULT,  /**< Indicates default error. */
}CALL_MEDIA_ERROR_AUDIO_TYPE;

/** Indicates the body type of sip info */
typedef enum tag_CALL_INFO_BODY_TYPE
{
    CALL_INFO_BODY_TYPE_APPLICATION, /**< Indicates the application type. */
    CALL_INFO_BODY_TYPE_BUTT
}CALL_INFO_BODY_TYPE;

/** Indicates the content type of sip info*/
typedef enum tag_CALL_INFO_BODY_MINOR_TYPE
{
    CALL_INFO_BODY_MINOR_TYPE_XML, /**< Indicates the xml type. */
    CALL_INFO_BODY_MINOR_TYPE_BUTT
}CALL_INFO_BODY_MINOR_TYPE;

/** Indicates the caller id type */
typedef enum tag_CALL_CALLER_ID_TYPE
{
    CALL_CALLER_ID_TYPE_DEFAULT = 0,  /**< Indicates the deault caller id type. */
    CALL_CALLER_ID_TYPE_PAI = 1,  /**< Indicates the caller id type of PAI. */
}CALL_CALLER_ID_TYPE;

/** Indicates the phone type */
typedef enum tag_CALL_NUMBER_TYPE
{
    CALL_PHONE_NUMBER_FIXED,         /**< Indicates the fixed phone type. */
    CALL_PHONE_NUMBER_MOBILE,        /**< Indicates the mobile phone type. */
    CALL_PHONE_NUMBER_BUTT
} tag_CALL_PHONE_NUMBER_TYPE;

/**
 * <b>Description:</b> AudioQosInfo describes QOS information about a VoIP call.
 * <br><b>Purpose:</b> During a VoIP call, the UI invokes {@link CallSession.getAudioQos} to obtain the detailed AudioQosInfo and then
 * obtains the QOS delay, jitter, downlink packet loss rate, uplink bit rate, downlink bit rate and uplink packet lost rate through
 * properties of AudioQosInfo.
 */
@interface AudioQosInfo : NSObject
{
@private
    unsigned long _ulDelay;
    unsigned long _ulJitter;
    unsigned long _ulLostRatio;
    unsigned long _ulSendLostRatio;
    unsigned long _ulSendBitRate;
    unsigned long _ulRecvBitRate;
    NSString* _codec;
}

/**
 * <b>Description:</b> It is used to obtain the QOS delay.
 * <br><b>Purpose:</b> During a VoIP call, the UI invokes {@link CallSession.getAudioQos} to obtain the detailed AudioQosInfo and then
 * obtains the QOS delay through this property.
 * <br>The property indicates the QOS delay
 */
@property(nonatomic,assign) unsigned long ulDelay;

/**
 * <b>Description:</b> It is used to obtain the QOS jitter.
 * <br><b>Purpose:</b> During a VoIP call, the UI invokes {@link CallSession.getAudioQos} to obtain the detailed AudioQosInfo and then
 * obtains the QOS jitter through this property.
 * <br>The property indicates the QOS jitter
 */
@property(nonatomic,assign) unsigned long ulJitter;

/**
 * <b>Description:</b> It is used to obtain the downlink packet loss rate.
 * <br><b>Purpose:</b> During a VoIP call, the UI invokes {@link CallSession.getAudioQos} to obtain the detailed AudioQosInfo and then
 * obtains the downlink packet loss rate through this property.
 * <br>The property indicates the downlink packet loss rate
 */
@property(nonatomic,assign) unsigned long ulLostRatio;

/**
 * <b>Description:</b> It is used to obtain the uplink packet lost rate.
 * <br><b>Purpose:</b> During a VoIP call, the UI invokes {@link CallSession.getAudioQos} to obtain the detailed AudioQosInfo and then
 * obtains the uplink packet lost rate through this property.
 * <br>The property indicates the uplink packet lost rate
 */
@property(nonatomic,assign) unsigned long ulSendLostRatio;

/**
 * <b>Description:</b> It is used to obtain the uplink bit rate.
 * <br><b>Purpose:</b> During a VoIP call, the UI invokes {@link CallSession.getAudioQos} to obtain the detailed AudioQosInfo and then
 * obtains the uplink bit rate through this property.
 * <br>The property indicates the uplink bit rate
 */
@property(nonatomic,assign) unsigned long ulSendBitRate;

/**
 * <b>Description:</b> It is used to obtain the downlink bit rate.
 * <br><b>Purpose:</b> During a VoIP call, the UI invokes {@link CallSession.getAudioQos} to obtain the detailed AudioQosInfo and then
 * obtains the downlink bit rate through this property.
 * <br>The property indicates the downlink bit rate
 */
@property(nonatomic,assign) unsigned long ulRecvBitRate;

/**
 * <b>Description:</b> It is used to obtain the codec.
 * <br><b>Purpose:</b> During a VoIP call, the UI invokes {@link CallSession.getAudioQos} to obtain the detailed AudioQosInfo and then
 * obtains codec through this property.
 * <br>The property indicates the codec
 */
@property(nonatomic,retain) NSString* codec;

@end

/**
 * <b>Description:</b> VideoQosInfo describes QOS information about a video call.
 * <br><b>Purpose:</b> During a VoIP call, the UI invokes {@link CallSession.getVideoQos} to obtain the detailed VideoQosInfo and then
 * obtains the QOS delay, jitter, downlink packet loss rate, uplink bit rate, downlink bit rate, uplink packet lost rate,
 * downlink frame rate and uplink frame rate through properties of VideoQosInfo.
 * <br>Please note that VideoQosInfo is a subclass of AudioQosInfo.
 */
@interface VideoQosInfo : AudioQosInfo
{
@private
    unsigned long _ulSendFramRate;
    unsigned long _ulRecvFramRate;
    unsigned long _ulSendResWidth;
    unsigned long _ulSendResHeight;
    unsigned long _ulRecvResWidth;
    unsigned long _ulRecvResHeight;
}

/**
 * <b>Description:</b> It is used to obtain the uplink frame rate.
 * <br><b>Purpose:</b> During a video call, the UI invokes {@link CallSession.getVideoQos} to obtain the detailed VideoQosInfo and then
 * obtains the uplink frame rate through this property.
 * <br>The property indicates the uplink frame rate
 */
@property(nonatomic,assign) unsigned long ulSendFramRate;

/** * <b>Description:</b> It is used to obtain the downlink frame rate.
 * <br><b>Purpose:</b> During a video call, the UI invokes {@link CallSession.getVideoQos} to obtain the detailed VideoQosInfo and then
 * obtains the downlink frame rate through this property.
 * <br>The property indicates the downlink frame rate
 */
@property(nonatomic,assign) unsigned long ulRecvFramRate;

/**
 * <b>Description:</b> It is used to obtain the uplink resolution width.
 * <br><b>Purpose:</b> During a VoIP call, the UI invokes {@link CallSession.getVideoQos} to obtain the detailed AudioQosInfo and then
 * obtains the uplink resolution width through this property.
 * <br>The property indicates the uplink resolution width
 */
@property(nonatomic,assign) unsigned long ulSendResWidth;

/**
 * <b>Description:</b> It is used to obtain the uplink resolution height.
 * <br><b>Purpose:</b> During a VoIP call, the UI invokes {@link CallSession.getVideoQos} to obtain the detailed AudioQosInfo and then
 * obtains the uplink resolution height through this property.
 * <br>The property indicates the uplink resolution height
 */
@property(nonatomic,assign) unsigned long ulSendResHeight;

/**
 * <b>Description:</b> It is used to obtain the downlink resolution width.
 * <br><b>Purpose:</b> During a VoIP call, the UI invokes {@link CallSession.getVideoQos} to obtain the detailed AudioQosInfo and then
 * obtains the downlink resolution width width through this property.
 * <br>The property indicates the downlink resolution width
 */
@property(nonatomic,assign) unsigned long ulRecvResWidth;

/**
 * <b>Description:</b> It is used to obtain the downlink resolution height.
 * <br><b>Purpose:</b> During a VoIP call, the UI invokes {@link CallSession.getVideoQos} to obtain the detailed AudioQosInfo and then
 * obtains the downlink resolution height width through this property.
 * <br>The property indicates the downlink resolution height
 */
@property(nonatomic,assign) unsigned long ulRecvResHeight;

@end


/**
 * <b>Description:</b> CallSession is a virtual version of an audio or video call.
 * <br><b>Purpose:</b> The UI obtains all related parameters of a call through interfaces of this class. The
 * parameters include the ID, peer number and peer name, duration, start time, type,
 * status, error code of the call. The UI invokes interfaces of this class to
 * answer, hold, hang up the call or to perform a switch between audio and video calls.
 * The UI needs to create an instance of CallSession when using parameters or interfaces of this class.
 */
@interface CallSession : NSObject
{

@private

    id _localView;

    id _remoteView;
    id _assistantView;

    CALL_TYPE _type;

    PeerInfo* _peer;

    long _sessionId;

    CALL_STATUS _status;

    int _errCode;

    BOOL _isConf; /** It is used to determine whether the incoming call is a conference invitation */
    
    int _diagnosesResult;
    
    int _diagnosesSrc;

    int _sipCause;

    int _sipStatusCode;

    int _q850Cause;

    NSMutableArray* _historyInfoNumList;
}
/**
 * <b>Description:</b> It is used to store the instance of the local video view.
 * <br><b>Purpose:</b> The UI needs to creates a view to show the video of the local party before or after the following scenarios:
 * <br> 1. Initiating a video call. See {@link CallApi.initiateVideoCall:localView:remoteView:}
 * <br> 2. Initiating a video sharing call. See {@link CallApi.initiateVideoShare:localView:}
 * <br> 3. Accepting a video call. See {@link CallApi.accept:}
 * <br> 4. Accepting a video sharing request. See {@link CallApi.acceptVideoShareReq}
 * <br> 5. Switching to a video call during an audio call. See {@link CallApi.addVideo}
 * <br> 6. Accepting the request from the peer party for switching to a video call during an audio call. See {@link CallApi.acceptAddVideo}
 * <br> Then the UI needs to enter the instance of the local video view to initialize this property before the video call is connected.
 * By default, the value of this property is nil. If the value is nil during a video call,
 * the UI needs to initialize the video view, otherwise the video view cannot be seen.
 */
@property(nonatomic,retain) id localView;
/**
 * <b>Description:</b> It is used to store the instance of the remote video view.
 * <br><b>Purpose:</b> The UI needs to creates a view to show the video of the peer party before or after the following scenarios:
 * <br> 1. Initiating a video call. See {@link CallApi.initiateVideoCall:localView:remoteView:}
 * <br> 2. Initiating a video sharing request. See {@link CallApi.initiateVideoShareReq:remoteView:}
 * <br> 3. Accepting a video call. See {@link CallApi.accept:}
 * <br> 4. Accepting a video sharing call. See {@link CallApi.acceptVideoShare}
 * <br> 5. Switching to a video call during an audio call. See {@link CallApi.addVideo}
 * <br> 6. Accepting the request from the peer party for switching to a video call during an audio call. See {@link CallApi.acceptAddVideo}
 * <br> Then the UI needs to enter the instance of the remote video view to initialize this property before the video call is connected.
 * By default, the value of this property is nil. If the value is nil during a video call,
 * the UI needs to initialize the video view, otherwise the video view cannot be seen.
 */
@property(nonatomic,retain) id remoteView;
/**
 * <b>Description:</b> It is used to store the instance of the assistant stream video view.
 * <br><b>Purpose:</b> During a multimedia video conference, when the UI receives an assistant stream broadcast, it needs
 * to create a view to display the assistant stream. Then the UI needs to enter the instance of the assistant stream video view to
 * initialize this property before accepting the assistant stream. By default, the value of this property is nil. If the value
 * is nil during the conference, the UI needs to initialize the assistant stream video view, otherwise the video view cannot be seen.
 * @see EVENT_CALL_ADDASSISTANT
 */
@property(nonatomic,retain) id assistantView;
/**
 * <b>Description:</b> It is used to obtain the call type.
 * <br><b>Purpose:</b> The UI obtains the call type through this property.
 * <br>For example, when receiving an incoming call, the UI can display different interface based on the call type.
 * <br>The property indicates the call type. See {@link tag_CALL_TYPE}
 */
@property(nonatomic,assign) CALL_TYPE type;
/**
 * <b>Description:</b> It is used to obtain information about the peer.
 * <br><b>Purpose:</b> When receiving a call, the UI obtains information about the peer party through this property for the display
 * of the incoming call. The UI obtains a instance of PeerInfo, and then obtains the peer number through property of PeerInfo.
 * <br>The property indicates peer information of an audio or video call
 */
@property(nonatomic,retain) PeerInfo* peer;
/**
 * <b>Description:</b> It is used to obtain the session ID.
 * <br><b>Purpose:</b> The UI obtains the session ID through this property during a call. The UI can determine whether two calls
 * are the same based on the Session ID and whether a call is valid.
 * <br>The property indicates the session ID
 */
@property(nonatomic,assign) long sessionId;
/**
 * <b>Description:</b> It is used to obtain the call status.
 * <br><b>Purpose:</b> The UI obtains the current status of a call through this property, by which, the UI knows the current call phase.
 * <br>The property indicates the call status. See {@link tag_CALL_STATUS}
 */
@property(nonatomic,assign) CALL_STATUS status;
/**
 * <b>Description:</b> It is used to obtain the error code of a call.
 * <br><b>Purpose:</b> The UI obtains the error code of the call through this property as prompt information on the UI.
 * <br>For example, after initiating a call or before canceling a call, the UI makes decisions based on the error code of a CallSession.
 * If the error code is not {@link CALL_ERRCODE_OK}, the call fails to be initiated. Then the UI displays a corresponding message or processes
 * the call session based on the error code.
 * <br>The property indicates the error code of a call. See {@link tag_CALL_ERROR}
 */
@property(nonatomic,assign) int errCode;
/**
 * <b>Description:</b> It is used to find out whether the incoming call is a conference invitation or not
 * <br><b>Purpose:</b> When a software client receives an incoming call or conference invitation, the SDK reports
 * the broadcast {@link CallApi.EVENT_CALL_INVITATION} to the UI. The parameter {@link CallApi.PARAM_CALL_SESSION}
 * in the broadcast carries the CallSession object of the incoming call. After the UI receives the broadcast,
 * it obtains the CallSession object and invokes this method to find out whether the incoming call is a conference
 * invitation or not.
 * <br>YES Indicates the incoming call is a conference call
 * <br>NO Indicates the incoming call is not a conference call
 */
@property(nonatomic,assign) BOOL isConf;
/**
 * <b>Description:</b> It is used to obtain the diagnoses result of a call.
 * <br><b>Purpose:</b> The UI obtains the diagnoses result of the call through this property as prompt information on the UI.
 * If the diagnoses result is not {@link CALL_DIAGNOSES_RESULT_OK}, the call quality is not good. Then the UI displays a corresponding message or processes
 * <br>The property indicates the diagnoses result of a call. See {@link tag_CALL_DIAGNOSES_RESULT}
 */
@property(nonatomic,assign) int diagnosesResult;
/**
 * <b>Description:</b> It is used to obtain the diagnoses reason of a call.
 * <br><b>Purpose:</b> The UI obtains the diagnoses reason of the call through this property as prompt information on the UI.
 * It notify the reason why diagnoses happened, UI can make different display info due to the reason
 * <br>The property indicates the diagnoses reason of a call. See {@link tag_CALL_DIAGNOSES_SRC}
 */
@property(nonatomic,assign) int diagnosesSrc;
/**
 * <b>Description:</b> It is used to obtain the number list in the History-Info header field of the INVITE message
 * <br><b>Purpose:</b> When receiving an incoming call, the UI obtains the number list in the History-Info
 * header field of the INVITE message through this property. If the number list is not nil, the incoming call is a forwarded call.
 * The number list lists each hop of the forwarded incoming call.
 * <br>The property indicates the number list in the History-Info header field of the INVITE message
 */
@property(nonatomic,retain) NSMutableArray* historyInfoNumList;

/**
 * <b>Description:</b> It is used to find out whether the type of a incoming call can be certified.
 * <br><b>Purpose:</b> When a software client receives an incoming call or conference invitation, the SDK reports
 * the broadcast {@link CallApi.EVENT_CALL_INVITATION} to the UI. The parameter {@link CallApi.PARAM_CALL_SESSION}
 * in the broadcast carries the CallSession object of the incoming call. After the UI receives the broadcast,
 * it obtains the CallSession object and invokes this method to find out whether the type of a incoming call can be certified.
 * <br>YES Indicatesthe the type of a incoming call can be certified
 * <br>NO Indicates the type of a incoming call can not be certified
 */
@property(nonatomic,assign) BOOL isUnknowType;

/**
 * <b>Description:</b> It is used to find out the Sip cause value of a call termination in the Reason header field.
 * <br><b>Purpose:</b> When a call is terminated, the UI can invokes CallSession.sipCause to obtain the cause value before the CallSession
 * is released. The Reason header field can exist in different sip messages. It describes the cause of a call termination.
 * Generally, the Reason header field carries two types of cause value. One is related to sip protocol and the other is related to
 * Q.850 protocol. If the sip message does not carry the Reason header field, the cause value is 0.
 * <br>Please note that this attribute applies only to special CANCEL messages that carry the Reason header field.
 *
 * @see q850Cause
 */
@property(nonatomic,assign) int sipCause;

/**
* <b>Description:</b> It is used to find out the Q.850 cause value of a call termination in the Reason header field.
* <br><b>Purpose:</b> When a call is terminated, the UI can invokes CallSession.sipCause to obtain the cause value before the CallSession
* is released. The Reason header field can exist in different sip messages. It describes the cause of a call termination.
* Generally, the Reason header field carries two types of cause value. One is related to sip protocol and the other is related to
* Q.850 protocol. If the sip message does not carry the Reason header field, the cause value is 0.
* <br>Please note that this attribute applies only to special CANCEL messages that carry the Reason header field.
* @return The value indicates the Q.850 cause value
* @see sipCause
*/
@property(nonatomic,assign) int q850Cause;

/**
 * <b>Description:</b> It is used to find out the Sip status code value of a call termination.
 * <br><b>Purpose:</b> When a call is terminated, the UI can invokes CallSession.ErrorCode to obtain the sip status code value before the CallSession
 * is released. The Reason header field can exist in different sip messages. It describes the cause of a call termination.
 */
@property(nonatomic,assign) int sipStatusCode;


/**
 * <b>Description:</b> This method is used to obtain the warning text value of a call termination in the Warning header field.
 * <br><b>Purpose:</b> When a call is terminated, the UI can invokes this method to obtain the warning text before the CallSession
 * is released. The Warning header field can exist in different sip messages. It may give some description of the reason why the call 
 * is termed.
 * @return The value indicates the warning text value
 */  
@property(nonatomic,retain) NSString* warningText;

/**
 * Indicates the peer product name in the User-Agent header field. See {@link getPeerUserAgentInfoByParameter:}
 */
#define GET_PEER_USER_AGENT_PRODUCT_NAME    @"productName"
/**
 * Indicates the peer product version in the User-Agent header field. See {@link getPeerUserAgentInfoByParameter:}
 */
#define GET_PEER_USER_AGENT_PRODUCT_VERSION @"productVersion"
/**
 * Indicates the peer product comment in the User-Agent header field. See {@link getPeerUserAgentInfoByParameter:}
 */
#define GET_PEER_USER_AGENT_PRODUCT_COMMENT @"productComment"

/**
 * <b>Description:</b> This method is used to answer an audio or video call.
 * <br><b>Purpose:</b> When receiving an audio or video call, the UI invokes this method to answer the call. The call status
 * changes from {@link CALL_STATUS_INCOMING} to {@link CALL_STATUS_CONNECTED} after the call is connected.
 * @param callType Specifies the call type. If the incoming call is an audio call, {@link TYPE_AUDIO} is used to connect
 * the call. If the incoming call is a video call, {@link TYPE_AUDIO} is used to connect the call, but the call is changed to
 * an audio call after being connected. If the incoming call is a video call, {@link TYPE_VIDEO} is used to connect the video
 * call, and the UI need to create the local video view and the remote video view before invoking this method.
 * @see tag_CALL_TYPE
 * @see CallApi.initiateAudioCall:
 * @see CallApi.initiateVideoCall:localView:remoteView:
 * @see EVENT_CALL_INVITATION
 */
- (void) accept:(CALL_TYPE) callType;

/**
 * <b>Description:</b> This method is used to terminate a call.
 * <br><b>Purpose:</b> The UI invokes this method to terminate a call. The UI can invoke this method to cancel an outgoing call,
 * decline an incoming call or terminate a connected call. The call status changes to {@link CALL_STATUS_IDLE} after the call
 * is terminated.
 * @see CallApi.initiateAudioCall:
 * @see CallApi.initiateVideoCall:localView:remoteView:
 * @see accept:
 * @see EVENT_CALL_INVITATION
 */
- (void) terminate;

/**
 * <b>Description:</b> This method is used to hold an audio call.
 * <br><b>Purpose:</b> The UI invokes this method to hold an audio call. Before this method is invoked, the current call status
 * must be {@link CALL_STATUS_CONNECTED} and the call type must be {@link TYPE_AUDIO}. After this method is invoked, the call status
 * changes to {@link CALL_STATUS_HOLD}; the two parties cannot talk with each other or hear each other, and the one held can
 * hear a tone played by the server.
 * @see unHold
 */
- (void) hold;

/**
 * <b>Description:</b> This method is used to mute an audio or video call.
 * <br><b>Purpose:</b> The UI invokes this method to mute the audio stream, thus the peer party cannot hear the voice from
 * the local end. When this method is invoked, the current call status must be {@link CALL_STATUS_CONNECTED}.
 * @see unMute
 */
- (void) mute;

/**
 * <b>Description:</b> This method is used to unmute an audio or video call.
 * <br><b>Purpose:</b> The UI invokes this method to unmute the voice of the local software client during audio or video calls,
 * thus the peer party can hear the voice from the local end again. When this method is invoked, the current call status must be
 * {@link CALL_STATUS_CONNECTED}.
 * @see mute
 */
- (void) unMute;

/**
 * <b>Description:</b> This method is used to resume the held call.
 * <br><b>Purpose:</b> The UI invokes this method to resume a held audio call. Before this method is invoked, the current call status
 * must be {@link CALL_STATUS_HOLD} and the call type must be {@link TYPE_AUDIO}. After this method is invoked, the call status changes to
 * {@link CALL_STATUS_CONNECTED} and the held call resumes (the two parties can talk with each other).
 * @see hold
 */
- (void) unHold;

/**
 * <b>Description:</b> This method is used to request for switching an audio call to a video call.
 * <br><b>Purpose:</b> During an audio call, the UI invokes this method to request the peer party to switch to a video call.
 * When this method is invoked, the current call status must be {@link CALL_STATUS_CONNECTED} and the call type must be
 * {@link TYPE_AUDIO}. After the peer party accepts this request, the UI needs to create the local video view and the remote
 * video view.
 * @see EVENT_CALL_TYPE_CHANGED_INVITATION
 */
- (void) addVideo;

/**
 * <b>Description:</b> This method is used to accept the request for switching an audio call to a video call.
 * <br><b>Purpose:</b> During an audio call, the UI invokes this method to accept the request for switching an audio call to
 * a video call. Before invoking this method, the UI needs to create the local video view and the remote video view.
 * @see addVideo
 * @see EVENT_CALL_TYPE_CHANGED_INVITATION
 * @see EVENT_CALL_TYPE_CHANGED
 * @see EVENT_CALL_VIDEO_STREAM_ARRIVED
 */
- (void) acceptAddVideo;

/**
 * <b>Description:</b> This method is used to reject the request for switching an audio to a video call.
 * <br><b>Purpose:</b> During an audio call, the UI invokes this method to reject the request
 * for switching an audio call to a video call.
 * @see EVENT_CALL_TYPE_CHANGED_INVITATION
 * @see EVENT_CALL_TYPE_CHANGED_REJECTED
 */
- (void) rejectAddVideo;

/**
 * <b>Description:</b> This method is used to switch a video call to an audio call.
 * <br><b>Purpose:</b> During a video call, the UI invokes this method to switch a video call to an audio call.
 * When this method is invoked, the current call status must be {@link CALL_STATUS_CONNECTED} and the call type must be {@link TYPE_VIDEO};
 * The call type changes to {@link TYPE_AUDIO} after this method is successfully invoked.
 * @see EVENT_CALL_TYPE_CHANGED_INVITATION
 * @see EVENT_CALL_TYPE_CHANGED
 */
- (void) removeVideo;

/**
 * <b>Description:</b> This method is used to send DTMF characters.
 * <br><b>Purpose:</b> When a character is entered on the DTMF keyboard during an audio or video call, the UI invokes this method to
 * send the character to the server. When this method is invoked, the current call status must be {@link CALL_STATUS_CONNECTED}.
 * @param dtmf Specifies the entered DTMF character.
 */
- (void) sendDtmf:(NSString*) dtmf;

/**
 * <b>Description:</b> This method is used to switch front and rear cameras.
 * <br><b>Purpose:</b> The UI invokes this method to switch front and rear camera during a video call. Before invoking this method,
 * the UI needs to determine that the current video call status is {@link CALL_STATUS_CONNECTED} and that more than one camera
 * is available. Camera switchover takes time. Therefore, do not invoke this method repeatedly within a short period of time.
 * @see CallApi.getCameraCount
 * @see switchCameraTo:
 */
- (void) switchCamera;

/**
 * <b>Description:</b> This method is used to specifies the front camera or rear camera to be used.
 * <br><b>Purpose:</b> The UI invokes this method to specify the front camera or rear camera to be used during a video call.
 * Before invoking this method, the UI needs to determine that the current video call status is {@link CALL_STATUS_CONNECTED}
 * and that more than one camera is available.
 * Camera switchover takes time. Therefore, do not invoke this method repeatedly within a short period of time.
 * @param camera Specifies camera. 0 specifies the front camera; 1 specifies the rear camera.
 * @see CallApi.getCameraCount
 * @see switchCamera
 */
- (void) switchCameraTo:(int) camera;

/**
 * <b>Description:</b> This method is used to obtain the camera location of the current call.
 * <br><b>Purpose:</b> The UI invokes this method to obtain the camera location of the current video call. Before invoking this method,
 * the UI needs to confirm that the current video call status is {@link CALL_STATUS_CONNECTED}.
 * @return 0 Indicates the front camera
 *    <br> 1 Indicates the rear camera
 */
- (int) getCamera;

/**
 * <b>Description:</b> This method is used to accept the request for a video sharing call.
 * <br><b>Purpose:</b> The UI invokes this method to accept the request for a video sharing call after it receives the request.
 * Before invoking this method, the UI needs to create the remote video view.
 * @return 0 Indicates operation succeeds
 *     <br>1 Indicates operation fails
 * @see CallApi.initiateVideoShare:localView:
 * @see EVENT_CALL_INVITATION
 * @see EVENT_CALL_VIDEO_STREAM_ARRIVED
 */
- (int) acceptVideoShare;

/**
 * <b>Description:</b> This method is used to reject or terminate a video sharing call.
 * <br><b>Purpose:</b> The UI invokes this method to reject or terminate a video sharing call. The call status of the video sharing call
 * changes to {@link CALL_STATUS_IDLE} after it is terminated and the original audio call is not affected.
 * @return 0 Indicates operation succeeds
 *     <br>1 Indicates operation fails
 * @see CallApi.initiateVideoShare:localView:
 * @see EVENT_CALL_INVITATION
 */
- (int) termVideoShare;

/**
 * <b>Description:</b> This method is used to accept a video sharing request.
 * <br><b>Purpose:</b> When receiving a video sharing request during a voice call, the UI invokes this method to accept the request
 * and shares videos to the peer party. Before invoking this method, the UI needs to create the local video view.
 * @return 0 Indicates the video sharing call is connected
 *     <br>1 indicate that the video sharing call fails to be connected
 * @see CallApi.initiateVideoShareReq:remoteView:
 * @see EVENT_VIDEO_SHARE_REQUEST_INVITATION
 */
- (int) acceptVideoShareReq;

/**
 * <b>Description:</b> This method is used to hang up a video sharing call or reject a video sharing request.
 * <br><b>Purpose:</b> The UI invokes termVideoShareReq to hang up a video sharing call or reject a video sharing
 * request. After the video sharing call is hung up, the call status is changed to {@link STATUS_IDLE},
 * and the original voice call is not affected.
 * @return 0 Specifies operation succeeds
 *     <br>1 Specifies operation fails
 * @see CallApi.initiateVideoShareReq:remoteView:
 * @see EVENT_VIDEO_SHARE_REQUEST_INVITATION
 */
- (int) termVideoShareReq;

/**
 * <b>Description:</b> This method is used to obtain the information in the User-Agent header field of an
 * incoming INVITE message using parameters.
 * <br><b>Purpose:</b> After the UI receives an incoming call or a conference invitation, it
 * invokes this method to obtain the information in the User-Agent header field of the incoming INVITE message.
 * The User-Agent header field contains the peer product name, version, and comments. As for a
 * conference invitation, the conference ID and password are contained in the User-Agent header field.
 * @param parameter Specifies the information contained in the User-Agent header field. See
 *      <ul>
 *         <li><em>{@link GET_PEER_USER_AGENT_PRODUCT_NAME}</em></li>
 *         <li><em>{@link GET_PEER_USER_AGENT_PRODUCT_VERSION}</em></li>
 *         <li><em>{@link GET_PEER_USER_AGENT_PRODUCT_COMMENT}</em></li>
 *      </ul>
 * @return The value indicates the information in the User-Agent header field of the INVITE message
 */
- (NSString*) getPeerUserAgentInfoByParameter:(NSString*) parameter;

/**
 * <b>Description:</b> This method is used to obtain the profile of the current video call.
 * <br><b>Purpose:</b> The UI invokes this method to obtain the profile, either BP or HP (baseline profile or high profile),
 * of the current video call. The obtained result is correct only when the UI invokes this method during a video call.
 * If the UI invokes the method before or after a video call, the obtained result is incorrect.
 * @return BP Indicates current video profile is baseline profile. See {@link CallApi.H264_PROFILE_BASELINE}.
 *     <br>HP Indicates current video profile is high profile. See {@link CallApi.H264_PROFILE_HIGH}.
 *     <br>0xFF Indicates the UI fails to obtain the profile
 */
- (NSString*)getCurrH264Profile;

/**
 * <b>Description:</b> This method is used to get audio call QOS information.
 * <br><b>Purpose:</b> During an audio call, the UI invokes this method to get audio QOS information. Audio QOS information includes
 * delay, jitter, downlink packet loss rate, uplink bit rate, downlink bit rate, uplink packet lost rate.
 * @return 0 Indicates operation succeeds
 *     <br>1 Indicates operation fails
 * @see AudioQosInfo.ulDelay
 * @see AudioQosInfo.ulJitter
 * @see AudioQosInfo.ulLostRatio
 * @see AudioQosInfo.ulSendLostRatio
 * @see AudioQosInfo.ulSendBitRate
 * @see AudioQosInfo.ulRecvBitRate
 */
- (AudioQosInfo *)getAudioQos;

/**
 * <b>Description:</b> This method is used to get video call qos information.
 * <br><b>Purpose:</b> During a video call, the UI invokes this method to get audio QOS. Video QOS information includes
 * delay, jitter, downlink packet loss rate, uplink bit rate, downlink bit rate, uplink packet lost rate, downlink frame rate,
 * uplink frame rate.
 * @return 0 Indicates operation succeeds
 *     <br>1 Indicates operation fails
 * @see AudioQosInfo.ulDelay
 * @see AudioQosInfo.ulJitter
 * @see AudioQosInfo.ulLostRatio
 * @see AudioQosInfo.ulSendLostRatio
 * @see AudioQosInfo.ulSendBitRate
 * @see AudioQosInfo.ulRecvBitRate
 * @see VideoQosInfo.ulSendFramRate
 * @see VideoQosInfo.ulRecvFramRate
 */
- (VideoQosInfo *)getVideoQos;

/**
 * <b>Description:</b> This method is used to obtain the transmission nat type during a call.
 * @return P2P Indicates that transmission type is point to point
 *     <br>P2N Indicates that transmission type is point to network
 *     <br>N2N Indicates that transmission type is network to network
 */
- (NSString* )getCallNatType;

/**
 * <b>Description:</b> This method is used to accept an assistant stream.
 * <br><b>Purpose:</b> During a multimedia conference, when the UI receives the {@link CallApi.EVENT_CALL_ADDASSISTANT} broadcast,
 * it creates a view to display the assistant stream video and then invokes this method to accept the assistant stream.
 * @return 0 Indicates operation succeeds
 *     <br>1 Indicates operation fails
 */
- (int)agreeAddAssistantVideo;

/**
 * <b>Description:</b> This method is used to reject an assistant stream.
 * <br><b>Purpose:</b> During a multimedia video conference, when the UI receives the {@link CallApi.EVENT_CALL_ADDASSISTANT} broadcast,
 * it invokes this method to reject the assistant stream.
 * @return 0 Indicates operation succeeds
 *     <br>1 Indicates operation fails
 */
- (int)disagreeAddAssistantVideo;

/**
 * <b>Description:</b> This method is used to start or stop local video rendering.
 * <br><b>Purpose:</b> During a video call, when the app will enter the background, UI invokes this method to stop the local
 * video rendering, when the app will enter the foreground from background, UI invokes this method to start the local video 
 * rendering.
 * @param [in] bshow YES Indicates that start local video rendering
 *          <br>NO Indicates stop local video rendering
 */
- (void) showLocalVideo:(BOOL)bshow;

/**
 * <b>Description:</b> This method is used to start or stop remote video rendering.
 * <br><b>Purpose:</b> During a video call, when the app will enter the background, UI invokes this method to stop the remote
 * video rendering, when the app will enter the foreground from background, UI invokes this method to start the remote video 
 * rendering.
 * @param [in] bshow YES Indicates that start remote video rendering
 *          <br>NO Indicates stop remote video rendering
 */
- (void) showRemoteVideo:(BOOL)bshow;

/**
 * <b>Description:</b> This method is used to hide video window.
 * <br><b>Purpose:</b> During a video call, when the app will enter the background, UI invokes this method to hide video window and stop capture,encode,decode,render and so on.
 */
- (void) CallVideoWinHide;

/**
 * <b>Description:</b> This method is used to show video window.
 * <br><b>Purpose:</b> During a video call, when the app will enter the frontground, UI invokes this method to shoe video window and start capture,encode,decode,render and so on.
 */
- (void) CallVideoWinShow;

/**
 * <b>Description:</b> This method is used to restart local video render.
 * <br><b>Purpose:</b> During a video call, when the app will change the local video view postion, UI must invokes this method
 * after postion changed.
 */
- (void) restartPreview;

/**
 * <b>Description:</b> This method is used to close local video.
 * <br><b>Purpose:</b> During a video call, the UI invokes this method to stop Send Video.
 *@see openLocalVideo
 */
- (int) closeLocalVideo;


/**
 * <b>Description:</b> This method is used to open local video.
 * <br><b>Purpose:</b> During a video call, the UI invokes this method to restart Send Video.
 *@see closeLocalVideo
 */
- (int) openLocalVideo;

/**
 * <b>Description:</b> This method is used to check whether an assistant stream function is supported.
 * <br><b>Purpose:</b> After a participant enters a multimedia video conference, the UI invokes this method to check whether the local
 * client supports the assistant stream function. If the returned value is false, the local client does not has the assistant stream function.
 * Then the UI cannot send or receive assistant stream. To support the assistant stream function, the UI needs to invoke
 * {@link setAssistVideoEnable:} during system initialization.
 * @param ucSubStrmType Specifies video type. See {@link CallApi.CALL_VIDEO_TYPE_ASSISTANT}.
 * @return 0 Indicates assistant video is not supported
 *     <br>1 Indicates assistant video is supported
 */
- (int)callSupportAssistant:(int)substrmType;

/**
 * <b>Description:</b> This method is used to get video resolution width or height.
 * <br><b>Purpose:</b> The UI invokes this method to get video resolution width or height during a video call.
 * @param iInfoType Indicates resolution width or height. See {@link tag_CALL_VIDEO_RESOLUTION}.
 * @return The value indicates resolution width or height.
 *     <br>1 Specifies operation fails
 */
- (long)getCallvideoInfo:(int)iInfoType;

/**
 * <b>Description:</b> This method is used to get content of sip header.
  * <br><b>Purpose:</b> When receiving an incoming call, the UI invokes this method to get the content of sip header.
  * @param the content type of the sip header. See {@link tag_CALL_SIP_CONTENT_TYPE}.
  * @return The value indicates the content to be got
 */
- (NSString*)getSipContent:(CALL_SIP_CONTENT_TYPE)contentType;

/**
 * <b>Description:</b> This method is used to initiate the blind transfer of the ECT (Explicit Communication Transfer) service.
 * <br><b>Purpose:</b> During a voice call,
 * the UI invokes callUnattendedTransfer to initiate the blind transfer to transfer the call to anther subscriber.
 * Blind transfer is a type of the ECT service and works in the following principle: During a conversation with B,
 * A transfers the call to C. C will talk with B.
 * @param number Specifies the number to which the call is transferred.
 * @return 0 indicates that the blind transfer succeeds
 *     <br>1 indicates that the blind transfer fails
 * @see EVENT_CALL_TRANSFER_RESULT
 * @see EVENT_CALL_TRANSFER_TERMED
 */
- (int)callUnattendedTransfer:(NSString *)number;

/**
 * <b>Description:</b> This method is used to initiate the consultative transfer of the ECT (Explicit Communication Transfer) service.
 * <br><b>Purpose:</b> During a voice call,
 * the UI invokes callAttendedTransfer to initiate the consultative transfer to transfer the call to anther on hold subscriber.
 * Consultative transfer is a type of the ECT service and works in the following principle:
 * A has a conversion with B and places C on hold, then A transfers the call. B will talk with C and A will exist from the call.
 * @param dwTrsfCallId Specifies the call ID of the call to which the current call is transferred. (i.e. the call ID of the call which
 * is placed on hold).
 * @return 0 indicates that the consultative transfer succeeds
 *     <br>1 indicates that the consultative transfer fails
 * @see EVENT_CALL_TRANSFER_RESULT
 * @see EVENT_CALL_TRANSFER_TERMED 
 */
- (int)callAttendedTransfer:(long)dwTrsfCallId;

/**
 * <b>Description:</b> This method is used to set camera disabled and forbid video stream encoding function in a single video call.
 * <br><b>Purpose:</b> After a subscriber initiates or receives a video call,
 * the UI invokes this method before the call is connected to set camera disabled and forbid video stream encoding function.
 * In this way, the UI determines not to send video streams to the peer party but still can receive video streams from
 * the peer party. This method only take effect in a single video call. The camera will work again in the next video call.
 * @return 0 indicates that the setting succeeds
 *     <br>1 indicates that the setting fails
 */
- (int) setVideoCameraDisabled;

/**
 * <b>Description:</b> This method is used to send sip info during a call.
 * <br><b>Purpose:</b> During a call, the UI invokes this method to send sip info to server
 * @param infoBody Specifies the content text of sip info.
 * @param bodyType Specifies the body type of sip info. @see CALL_INFO_BODY_TYPE.
 * @param minorType Specifies the content type of sip info. @see CALL_INFO_BODY_MINOR_TYPE.
 * @return 0 indicates that the setting succeeds
 *     <br>1 indicates that the setting fails
 */
- (int) sendInfo:(NSString*)infoBody bodyType:(CALL_INFO_BODY_TYPE)bodyType minorType:(CALL_INFO_BODY_MINOR_TYPE)minorType;

/**
 * <b>Description:</b> This method is used to prepare video resource.
 * <br><b>Purpose:</b> When receiving an video call, the UI invokes this method to prepare video resource. So the UI can show local preview before the call was connected
 * @return 0 indicates that the setting succeeds
 *     <br>1 indicates that the setting fails
 */
- (void)prepareVideo;

/**
 * <b>Description:</b> This method is used to invite participants to a conference.
 * <br><b>Purpose:</b> During a conference, the UI of the chairman invokes this method to invite participants to the conference.This method can invite more than one participant.This method can only be invoked for the chairman when in conference.
 * @param callSessionArray Specifies the array of the instances of established CallSession.
 * @param peerUriArray Specifies the array of the participants' uri.
 * @param extParas Specifies extended parameters, it is not used.
 * @return 0 indicates that the interface has been invoked successfully.
 *     <br>1 indicates that the interface has been invoked failed.
 */
-(int)inviteParticipant:(NSArray*)callSessionArray uriArray:(NSArray*)peerUriArray extParas:(NSMutableDictionary*)extParas;

/**
 * <b>Description:</b> This method is used to kick participants.
 * <br><b>Purpose:</b> During a conference, the UI of the chairman invokes this method to kick participants that has connected to the conference.This method can kick more than one participant.This method can only be invoked for the chairman when in conference.
 * @param uriArray Specifies the array of the participants' uri.
 * @param extParas Specifies extended parameters, it is not used.
 * @return 0 indicates that the interface has been invoked successfully.
 *     <br>1 indicates that the interface has been invoked failed.
 */
-(int)kickParticipant:(NSArray*)uriArray extParas:(NSMutableDictionary*)extParas;

/**
 * <b>Description:</b> This method is used to get a participant of the conference. This method can only be invoked for the chairman when in conference.
 * <b>Purpose:</b> During a conference, the UI of the chairman invokes this method to get a participant of the conference.
 * @param peerUri Specifies the participant uri.
 * @return The value indicates the ConfParticipant object.Nil indicates that the participant is disconnected to the conference.
 */
-(ConfParticipant*) getParticipant:(NSString*)peerUri;

/**
 * <b>Description:</b> This method is used to get the participants list of the conference. This method can only be invoked for the chairman when in conference.
 * <b>Purpose:</b> During a conference, the UI of the chairman invokes this method to get the participants list of the conference.
 * @return The NSArray of the {@link ConfParticipant} object.
 */
-(NSArray*)getParticipantList;

@end

/** Indicates the unique key for notification about CallSession
 *  @see CallSession
 */
#define PARAM_CALL_SESSION @"CALLAPI_PARAM_SESSION"

/** Indicates the old call state
 *  @see CALL_STATUS
 */
#define PARAM_CALL_OLD_STATUS @"CALLAPI_PARAM_OLD_STATUS"

/** Indicates the new call state
 *  @see CALL_STATUS
 */
#define PARAM_CALL_NEW_STATUS @"CALLAPI_PARAM_NEW_STATUS"

/** Indicates the new call state
 *  @see CALL_STATUS
 */
#define PARAM_CALL_SIP_CAUSE @"CALLAPI_PARAM_SIP_CAUSE"

/** Indicates the sip status code of session
 *  @see SIP_STATUS_CODE
 */
#define PARAM_CALL_SIP_STATUS_CODE @"CALLAPI_PARAM_SIP_STATUS_CODE"

/** Indicates the operation result of holding or unholding a call
 *  @see CALL_OPERATE_RESULT
 */
#define PARAM_CALL_OPERATE_RESULT @"CALLAPI_PARAM_OPERATE_RESULT"

/** Indicates the old call type
 *  @see CALL_TYPE
 */
#define PARAM_CALL_OLD_TYPE @"CALLAPI_PARAM_OLD_TYPE"

/** Indicates the new call type
 *  @see CALL_TYPE
 */
#define PARAM_CALL_NEW_TYPE @"CALLAPI_PARAM_NEW_TYPE"

/** Indicates the quality of server
 *  @see CALL_QOS
 */
#define PARAM_CALL_QOS @"CALLAPI_PARAM_QOS"


/** Indicates the system interrupt status
 *  <br> 0 indicates the system interrput has recover
 *  <br> 1 indicates the system is interrupted 
 */
#define PARAM_SYSTEN_STATUS @"CALLAPI_PARAM_SYSTEN_STATUS"

/** Indicates the unique object key for setting nsmutabledictionary. It is used to choose uri format for an audio call.
 * <br> 0 indicates using default format
 * <br> 1 indicates using sip format
 * <br> 2 indicates using tel format
 */
#define PARAM_CALL_AUDIO_URI_FORMAT @"PARAM_CALL_AUDIO_URI_FORMAT"

/** Indicates user status in the conference */
#define PARAM_CALL_CONF_STATUS @"CALLAPI_PARAM_CONF_STATUS"

/** Indicates media error code. It is used to inform what error occured when call failed because of media error. */
#define PARAM_MEDIA_ERROR_CODE @"CALLAPI_PARAM_MEDIA_ERROR_CODE"

/** Indicates media type
 *  @see CALL_MEDIA_TYPE
 */
#define PARAM_MEDIA_TYPE @"CALLAPI_PARAM_MEDIA_TYPE"

/** Indicates media type
 *  @see CALL_MEDIA_TYPE
 */
#define PARAM_MEDIA_ERROR_TYPE @"CALLAPI_PARAM_MEDIA_ERROR_TYPE"

/**Indicates the ECT service processing result.
 */
#define PARAM_CALL_TRANSFER_RESULT @"CALLAPI_PARAM_CALL_TRANSFER_RESULT"

/**Indicates the content text of sip info.
 */
#define PARAM_CALL_INFO_BODY @"CALLAPI_PARA_CALL_INFO_BODY"

/**Indicates the body type of sip info.
 * @see CALL_INFO_BODY_TYPE
 */
#define PARAM_CALL_INFO_BODY_TYPE @"CALLAPI_PARA_CALL_INFO_BODY_TYPE"

/**Indicates the content type of sip info.
 * @see CALL_INFO_BODY_MINOR_TYPE
 */
#define PARAM_CALL_INFO_BODY_MINOR_TYPE @"CALLAPI_PARA_CALL_INFO_BODY_MINOR_TYPE"

/** Indicates call STAT type
 * @see EN_CALL_STAT_TYPE
 */
#define PARAM_CALL_STAT_TYPE @"PARAM_CALL_STAT_TYPE"

/**Indicates the call duration.
 */
#define PARAM_CALL_DURATION @"PARAM_CALL_DURATION"

/**Indicates the call/conf diagnoses result.
 */
#define PARAM_CALL_DIAGNOSES_RESULT @"CALLAPI_PARAM_DIAGNOSES_RESULT"

/**Indicates the call/conf dtmf result.
 */
#define PARAM_CALL_DTMF_TYPE_RESULT @"CALLAPI_PARAM_DTMF_TYPE_RESULT"

/**Indicates the call/conf diagnoses reason.
 */
#define PARAM_CALL_DIAGNOSES_SRC    @"CALLAPI_PARAM_DIAGNOSES_SRC"

/**
 * <b>Description:</b> It is used to notify that there is an incoming audio or video call.
 * <br><b>Purpose:</b> When receiving an audio or video call, the SDK sends this notification to the UI.
 * The UI updates the displayed information upon receiving the notification.
 * <p>The notification will have the following object key:
 * <ul>
 *   <li><em>{@link PARAM_CALL_SESSION}</em></li>
 * </ul>
 * </p>
 * @see CallApi.initiateAudioCall:
 * @see CallApi.initiateVideoCall:localView:remoteView:
 * @see CallApi.initiateVideoShare:localView:
 */
#define EVENT_CALL_INVITATION @"CALLAPI_EVENT_INVITATION"

/**
 * <b>Description:</b> It is used to notify a received video sharing request.
 * <br><b>Purpose:</b> During a voice call, when the terminal receives a video sharing request,
 * the SDK sends this notification to the UI. Then, the UI displays a message to the subscriber
 * asking whether to accept the request.
 * <p>The notification will have the following object key:
 * <ul>
 *   <li><em>{@link PARAM_CALL_SESSION}</em></li>
 * </ul>
 * <p>
 * @see CallApi.initiateVideoShareReq:remoteView:
 */
#define EVENT_VIDEO_SHARE_REQUEST_INVITATION @"CALLAPI_EVENT_VIDEO_SHARE_REQUEST_INVITATION"

/**
 * <b>Description:</b> It is used to notify the state change of an audio or video call.
 * <br><b>Purpose:</b> When the state of an audio or video call changes, the SDK sends this notification.
 * For example, when an outgoing call is connected, the call changes from the alerting
 * state to the connected state. The UI updates the displayed information upon receiving
 * the notification.
 * <p>The notification will have the following object keys:
 * <ul>
 *   <li><em>{@link PARAM_CALL_SESSION}</em></li>
 *   <li><em>{@link PARAM_CALL_OLD_STATUS}</em></li>
 *   <li><em>{@link PARAM_CALL_NEW_STATUS}</em></li>
 * </ul>
 * </p>
 */
#define EVENT_CALL_STATUS_CHANGED @"CALLAPI_EVENT_STATUS_CHANGED"

/**
 * <b>Description:</b> It is used to notify that the call is held by the peer.
 * <br><b>Purpose:</b> When receiving this notification, the user can hear a tone played by the server and
 * cannot hear the voice from the peer party, i.e. the two parties cannot talk with each other or hear each other.
 * <p>The notification will have the following object key:
 * <ul>
 *   <li><em>{@link PARAM_CALL_SESSION}</em></li>
 * </ul>
 * <p>
 * @see CallSession.hold
 */
#define EVENT_CALL_HELD @"CALLAPI_EVENT_HELD"

/**
 * <b>Description:</b> It is used to notify that the call is unheld by the peer.
 * <br><b>Purpose:</b> When receiving this notification, the user can hear the voice from the peer party again,
 * i.e. the two parties can talk with each other or hear each other again.
 * <p>The notification will have the following object key:
 * <ul>
 *   <li><em>{@link PARAM_CALL_SESSION}</em></li>
 * </ul>
 * <p>
 * @see EVENT_CALL_HELD
 * @see CallSession.unHold
 */
#define EVENT_CALL_UNHELD @"CALLAPI_EVENT_UNHELD"

/**
 * <b>Description:</b> It is used to notify the final result of holding a call.
 * <br><b>Purpose:</b> When receiving this notification, if the result is {@link CALL_OPERATE_RESULT_NORMAL}, the user
 * cannot hear the voice from the peer party and the one held can hear a tone played by the server.
 * <p>The notification will have the following object keys:
 * <ul>
 *   <li><em>{@link PARAM_CALL_SESSION}</em></li>
 *   <li><em>{@link PARAM_CALL_OPERATE_RESULT}</em></li>
 * </ul>
 * <p>
 * @see CallSession.hold
 */
#define EVENT_CALL_HOLD_RESULT @"CALLAPI_ENVENT_HOLD_RESULT"

/**
 * <b>Description:</b> It is used to notify the final result of unholding a call.
 * <br><b>Purpose:</b> When receiving this notification, if the result is {@link CALL_OPERATE_RESULT_NORMAL}, the user
 * can hear the voice from the peer party again, i.e. the two parties can talk with each other or hear each other again.
 * <p>The notification will have the following object keys:
 * <ul>
 *   <li><em>{@link PARAM_CALL_SESSION}</em></li>
 *   <li><em>{@link PARAM_CALL_OPERATE_RESULT}</em></li>
 * </ul>
 * <p>
 * @see EVENT_CALL_HELD
 * @see CallSession.unHold
 */
#define EVENT_CALL_UNHOLD_RESULT @"CALLAPI_ENVENT_UNHOLD_RESULT"

/**
 * <b>Description:</b> It is used to notify the request for switching an audio call to a video call.
 * <br><b>Purpose:</b> When the peer party requests to switch to a video call during an audio call,
 * the SDK sends this notification after the software client receives the request.
 * Then, the UI updates the displayed information upon receiving this notification.
 * <p>The notification will have the following object keys:
 * <ul>
 *   <li><em>{@link PARAM_CALL_SESSION}</em></li>
 *   <li><em>{@link PARAM_CALL_OLD_TYPE}</em></li>
 *   <li><em>{@link PARAM_CALL_NEW_TYPE}</em></li>
 * </ul>
 * </p>
 * @see CallSession.addVideo
 * @see CallSession.acceptAddVideo
 * @see CallSession.rejectAddVideo
 */
#define EVENT_CALL_TYPE_CHANGED_INVITATION @"CALLAPI_EVENT_TYPE_CHANGE_INVITATION"

/**
 * <b>Description:</b> It is used to notify that the request for switching an audio call to a video call is rejected.
 * <br><b>Purpose:</b> When a party requests to switch to a video call during an audio call,
 * the SDK sends this broadcast after the other party rejects the request.
 * Then, the UI updates the displayed information upon receiving the notification.
 * <p>The notification will have the following object key:
 * <ul>
 *   <li><em>{@link PARAM_CALL_SESSION}</em></li>
 * </ul>
 * </p>
 * @see CallSession.addVideo
 * @see EVENT_CALL_TYPE_CHANGED_INVITATION
 * @see CallSession.rejectAddVideo
 */
#define EVENT_CALL_TYPE_CHANGED_REJECTED @"CALLAPI_EVENT_TYPE_CHANGE_REJECTED"

/**
 * <b>Description:</b> It is used to notify that the request for switching an audio call to a video call is canceled.
 * <br><b>Purpose:</b> When a party requests to switch to a video call during an audio call,
 * the SDK sends this broadcast after the other party cancels the request.
 * Then, the UI updates the displayed information upon receiving the notification.
 * <p>The notification will have the following object key:
 * <ul>
 *   <li><em>{@link PARAM_CALL_SESSION}</em></li>
 * </ul>
 * </p>
 * @see CallSession.addVideo
 * @see EVENT_CALL_TYPE_CHANGED_INVITATION
 */
#define EVENT_CALL_TYPE_CHANGED_CANCELED @"CALLAPI_EVENT_TYPE_CHANGE_CANCELED"

/**
 * <b>Description:</b> It is used to notify that the switch between audio and video calls is successful.
 * <br><b>Purpose:</b> 1. When a party requests to switch to a video call during an audio call,
 * the SDKs of both parties send this notification after another party accepts the request.
 * Then, the UI updates the displayed information upon receiving the notification.
 * <br>2. During a video call, when a party switches the video call to an audio call,
 * the SDKs of both parties send this notification. Then, the UI updates the displayed
 * information upon receiving the notification.
 * <p>The notification will have the following object keys:
 * <ul>
 *   <li><em>{@link PARAM_CALL_SESSION}</em></li>
 *   <li><em>{@link PARAM_CALL_OLD_TYPE}</em></li>
 *   <li><em>{@link PARAM_CALL_NEW_TYPE}</em></li>
 * </ul>
 * </p>
 * @see CallSession.addVideo
 * @see EVENT_CALL_TYPE_CHANGED_INVITATION
 * @see CallSession.acceptAddVideo
 */
#define EVENT_CALL_TYPE_CHANGED @"CALLAPI_EVENT_TYPE_CHANGED"

/**
 * <b>Description:</b> It is used to broadcast that the camera is started.
 * <br><b>Purpose:</b> When the camera is successfully started for the local party during a video call,
 * the SDK sends this broadcast. Then, the UI displays the video of the local party
 * upon receiving the notification.
 * <p>The notification will have the following object key:
 * <ul>
 *   <li><em>{@link PARAM_CALL_SESSION}</em></li>
 * </ul>
 * </p>
 */
#define EVENT_CALL_CAMERA_STARTED @"CALLAPI_EVENT_VIDEO_CAMERA_STARTED"

/**
 * <b>Description:</b> It is used to notify the arrival of video stream after a video call is established.
 * <br><b>Purpose:</b> When a video call is connected and the software client receives video package,
 * the SDK sends this broadcast, UI can reference another broadcast @ref EVENT_CALL_VIDEO_FIRST_FRAME_ARRIVED.
 * upon receiving the notification.
 * <p>The notification will have the following object key:
 * <ul>
 *   <li><em>{@link PARAM_CALL_SESSION}</em></li>
 * </ul>
 * </p>
 */
#define EVENT_CALL_VIDEO_STREAM_ARRIVED @"CALLAPI_EVENT_VIDEO_STREAM_ARRIVED"


/**
 * <b>Description:</b> It is used to notify the system interrupt event about audio devices.
 * <br><b>Purpose:</b> When the system was interrupted by event like cs call, alarm clock,
 * the SDK sends this broadcast, then, the UI can get the status about the interrupt event.
 * <p>The notification will have the following object key:
 * <ul>
 *   <li><em>{@link PARAM_SYSTEN_STATUS}</em></li>
 * </ul>
 * </p>
 */
#define EVENT_CALL_SYSTEM_INTERRUPT @"CALLAPI_EVENT_SYSTEM_INTERRUPT"

/**
 * <b>Description:</b> It is used to notify the arrival of video stream after a video call is established.
 * <br><b>Purpose:</b> When a video call is connected and the software client receives video frame,
 * the SDK sends this broadcast. Then, the UI displays the video of the peer party, different with
 * @ref EVENT_CALL_VIDEO_STREAM_ARRIVED, frame arrival means that the user can see the full image, video package
 * arrival just means that software client begin to receive network packet, which may not be complete for view images.
 * upon receiving the notification.
 * <p>The notification will have the following object key:
 * <ul>
 *   <li><em>{@link PARAM_CALL_SESSION}</em></li>
 * </ul>
 * </p>
 */
#define EVENT_CALL_VIDEO_FIRST_FRAME_ARRIVED @"EVENT_CALL_VIDEO_FIRST_FRAME_ARRIVED"

/**
 * <b>Description:</b> It is used to notify the network QoS report.
 * <br><b>Purpose:</b> The network QoS is calculated based on the network delay, jitter, and packet loss rate. The SDK periodically
 * (generally 5 seconds) sends this notification during a call. However, this notification contains only the QoS quality and does not contain
 * specific data. The UI can invoke {@link CallSession.getAudioQos} and {@link CallSession.getVideoQos} to obtain detailed information.
 * <p>The notification will have the following object keys:
 * <ul>
 *   <li><em>{@link PARAM_CALL_SESSION}</em></li>
 *   <li><em>{@link PARAM_CALL_QOS}</em></li>
 * </ul>
 * </p>
 */
#define EVENT_CALL_QOS_REPORT @"CALLAPI_EVENT_QOS_REPORT"

/**
 * <b>Description:</b> It is used to notify the status of a 3PTY conference.
 * <br><b>Purpose:</b> When the state of a 3PTY call changes, the SDK sends this notification.
 * The UI updates the displayed information upon receiving the notification.
 * <p>The intent will have the following extra values:
 * <ul>
 *   <li><em>{@link PARAM_CALL_SESSION}</em></li>
 *   <li><em>{@link PARAM_CALL_CONF_STATUS}</em></li>
 *   <li><em>{@link PARAM_CALL_CONF_ERR_CODE}</em></li>
 * </ul>
 * </p>
 */
#define EVENT_CALL_CONF_STATUS_CHANGED @"CALLAPI_EVENT_CONF_STATUS_CHANGED"

/**
 * <b>Description:</b> It is used to notify the status of headset.
 * <br><b>Purpose:</b> When the state of headset changes, the SDK sends this notification.
 */
#define EVENT_CALL_HEADSET_CHANGED @"CALLAPI_EVENT_CALL_HEADSET_CHANGED"

/**
 * <b>Description:</b> It is used to notify the status of speaker.
 * <br><b>Purpose:</b> It is used to notify turning speaker on when headset is unplugged with the premise
 * that the speaker was turned on before the headset plugged.
 */
#define EVENT_CALL_TURN_SPEAKER_ON_FOR_HEADSET_OUT @"CALLAPI_TURN_SPEAKER_ON_FOR_HEADSET_OUT"

/**
 * <b>Description:</b> It is used to notify of a missed call.
 * <br><b>Purpose:</b> When the SDK detects that an online subscriber has a missed call, it sends the this notification to notify
 * the UI of the missed call. After receiving the notification, the UI can notifies the subscriber of the missed call.
 * <p>The notification will have the following object keys:
 * <ul>
 *   <li><em>{@link PARAM_MISS_CALL_CALLER}</em></li>
 *   <li><em>{@link PARAM_MISS_CALL_TIME}</em></li>
 * </ul>
 * </p>
 */
#define EVENT_MISS_CALL @"CALLAPI_EVENT_MISS_CALL"

/**
 * <b>Description:</b> It is used to notify media error when a voice or video call failed because of media error.
 * <br><b>Purpose:</b> When the UI initiates a call and the call failed because of media error, the UI will receive this notification.
 * <p>The notification will have the following object keys:
 * <ul>
 *   <li><em>{@link PARAM_MEDIA_ERROR_CODE}</em></li>
 *   <li><em>{@link PARAM_MEDIA_TYPE}</em></li>
 * </ul>
 * <p>
 */
#define EVENT_MEDIA_ERROR @"CALLAPI_EVENT_MEDIA_ERROR"

/**
 * @brief Indicates the caller of the missed call.
 */
#define PARAM_MISS_CALL_CALLER @"CALLAPI_PARAM_MISS_CALL_CALLER"

/**
 * @brief Indicates the time of the missed call.
 */
#define PARAM_MISS_CALL_TIME @"CALLAPI_PARAM_MISS_CALL_TIME"

/**
 * <b>Description:</b> It is used to notify the arrival of an assistant stream.
 * <br><b>Purpose:</b> Assistant video is now used to sharing one's desktop to other participants in the multimedia conference.
 * During a multimedia video conference, if a participant initiates an assistant stream, the UI will receive this notification.
 * After receiving this notification, the UI invokes {@link CallSession.agreeAddAssistantVideo} or
 * {@link CallSession.disagreeAddAssistantVideo} to receive or reject the assistant stream.
 * <p>The notification will have the following object key:
 * <ul>
 *   <li><em>{@link PARAM_CALL_SESSION}</em></li>
 * </ul>
 * </p>
 * @see EVENT_CALL_RMVASSISTANT
 */
#define EVENT_CALL_ADDASSISTANT @"EVENT_CALL_ADDASSISTANT"

/**
 * <b>Description:</b> It is used to notify the end of an assistant video stream.
 * <br><b>Purpose:</b> During a multimedia video conference, if the participant who initiates an assistant video stream ends
 * the assistant video stream, the UI will receive this notification. After receiving this notification, the UI can hide or
 * delete the assistant stream video view.
 * <P>The notification will have the following object key:
 * <ul>
 *   <li><em>{@link PARAM_CALL_SESSION}</em></li>
 * </ul>
 * </p>
 * @see EVENT_CALL_ADDASSISTANT
 */
#define EVENT_CALL_RMVASSISTANT @"EVENT_CALL_RMVASSISTANT"

/**
 * <b>Description:</b> It is used to notify of the result of the Explicit Communication Transfer (ECT) initiation.
 * <br><b>Purpose:</b> If a subscriber initiates the ECT service during a audio call,
 * the SDK sends this notification to the UI and the UI displays a message based on the notification,
 * indicating whether the ECT service is processed by the server.
 * As for the processing result, the UI need to wait for another notification named {@link EVENT_CALL_TRANSFER_TERMED}.
 * <P>The notification will have the following object key:
 * <ul>
 *   <li><em>{@link PARAM_CALL_SESSION}</em></li>
 *   <li><em>{@link PARAM_CALL_TRANSFER_RESULT}</em></li>
 * </ul>
 * </p>
 * <p>The object related to {@link PARAM_CALL_TRANSFER_RESULT} will have the following values:
 * <ul>
 *   <li><em>0 indicates that the ECT service is processed. The obtained value is a long integer number.</em></li>
 *   <li><em>1 indicates that the ECT service fails to be processed. The obtained value is a long integer number.</em></li>
 * </ul>
 * </p>
 * @see CallSession.callUnattendedTransfer:
 * @see CallSession.callAttendedTransfer:
 */
#define EVENT_CALL_TRANSFER_RESULT @"CALLAPI_EVENT_CALL_TRANSFER_RESULT"

/**
 * <b>Description:</b> It is used to broadcast the result of the ECT service processing.
 * <br><b>Purpose:</b> If a subscriber initiates the ECT service during an audio call and the ECT service is processed by the server,
 * the SDK sends CallApi. EVENT_CALL_TRANSFER_TERMED to the UI.
 * The UI displays a message based on the broadcast to notify the subscriber whether the ECT service is successful.
 * If yes, the original call is terminated. If no, the original call is not affected.
 * <P>The notification will have the following object key:
 * <ul>
 *   <li><em>{@link PARAM_CALL_SESSION}</em></li>
 *   <li><em>{@link PARAM_CALL_TRANSFER_RESULT}</em></li>
 * </ul>
 * <p>The object related to {@link PARAM_CALL_TRANSFER_RESULT} will have the following values:
 * <ul>
 *   <li><em>0 indicates that the call is succefully transferred.</em></li>
 *   <li><em>1 indicates a call transfer failure due to the incorrect number.</em></li>
 *   <li><em>2 indicates a call transfer failure due to the poor network.</em></li>
 *   <li><em>3 indicates a call transfer failure due to other errors.</em></li>
 * </ul>
 * </p>
 * @see CallSession.callUnattendedTransfer:
 * @see CallSession.callAttendedTransfer:
 */

#define EVENT_CALL_TRANSFER_TERMED @"CALLAPI_EVENT_CALL_TRANSFER_TERMED"

/**
 * <b>Description:</b> It is used to notify the arrival of sip info from server during a call.
 * <br><b>Purpose:</b> When the server send infomation to client via sip info, the UI can get it from this broadcast.
 * <P>The notification will have the following object key:
 * <ul>
 *   <li><em>{@link PARAM_CALL_INFO_BODY}</em></li>
 *   <li><em>{@link PARAM_CALL_INFO_BODY_TYPE}</em></li>
 *   <li><em>{@link PARAM_CALL_INFO_BODY_MINOR_TYPE}</em></li>
 * </ul>
 * </p>
 */
#define EVENT_CALL_CONN_INFO_REPORT @"CALLAPI_EVENT_CALL_CONN_INFO_REPORT"

/**
 * <b>Description:</b> It is used to notify that the call or conf diagnoses report.
 * <br><b>Purpose:</b> If Diagnoses is occurred during a call or a conference, SDK will report
 * UI the result and reason. Only result or reason is changed, this broadcast will be reported to UI.
 * <p>The notification will carry the following parameters:
 * <ul>
 *   <li><em>@ref PARAM_CALL_SESSION</em></li>
 *   <li><em>@ref PARAM_CALL_DIAGNOSES_RESULT</em></li>
 *   <li><em>@ref PARAM_CALL_DIAGNOSES_SRC</em></li>
 * </ul>
 * </p>
 */
#define EVENT_CALL_DIAGNOSES_REPORT @"CALLAPI_EVENT_CALL_DIAGNOSES_REPORT"

/**
 * <b>Description:</b> It is used to notify that the dtmf event report.
 * <br><b>Purpose:</b> If peer occurred dtmf event during a call or a conference, SDK will report
 * the dtmf type to UI.
 * <p>The notification will carry the following parameters:
 * <ul>
 *   <li><em>@ref PARAM_CALL_SESSION</em></li>
 *   <li><em>@ref PARAM_CALL_DTMF_TYPE_RESULT</em></li>
 * </ul>
 * </p>
 */
#define EVENT_CALL_DTMF_EVENT_REPORT @"CALLAPI_EVENT_CALL_DTMF_EVENT_REPORT"

/** Indicates VQM diagnoses result type */
typedef enum tag_CALL_DIAGNOSES_RESULT
{
    CALL_DIAGNOSES_RESULT_OK             = 0x00, /** Indicates that call diagnoses result is OK. */
	CALL_DIAGNOSES_RESULT_INACTIVE       = 0x01, /** Indicates that call diagnoses result is voice single-pass. */
	CALL_DIAGNOSES_RESULT_INTERMITTENCE  = 0x02, /** Indicates that call diagnoses result is voice-intermittent. */
	CALL_DIAGNOSES_RESULT_LOW_VOLUME     = 0x03, /** Indicates that call diagnoses result is low volume. */
	CALL_DIAGNOSES_RESULT_WITH_ECHO      = 0x04, /** Indicates that call diagnoses result is voice with echo. */
	CALL_DIAGNOSES_RESULT_WITH_NOISE     = 0x05, /** Indicates that call diagnoses result is voice with big noise. */

    CALL_DIAGNOSES_RESULT_BULT           = 0xFF  /** Illegal diagnoses result */

}CALL_DIAGNOSES_RESULT;

/** Indicates VQM diagnoses reason type */
typedef enum tag_CALL_DIAGNOSES_SRC
{
	CALL_DIAGNOSES_INACTIVE_SRC_CAPTURE_NO_RUNNING         = 0x00, /** Indicates that Due to reasons of the system, HME capture thread is running abnormal. (For CALL_DIAGNOSES_RESULT_INACTIVE)*/
	CALL_DIAGNOSES_INACTIVE_SRC_RENDER_NO_RUNNING          = 0x01, /** Indicates that Due to reasons of the system, HME play thread is running abnormal. (For CALL_DIAGNOSES_RESULT_INACTIVE) */
	CALL_DIAGNOSES_INACTIVE_SRC_NO_PACKET_RX               = 0x02, /** Indicates that Downlink does not receive network packets. (For CALL_DIAGNOSES_RESULT_INACTIVE)*/
	CALL_DIAGNOSES_INACTIVE_SRC_MASS_LOSS                  = 0x03, /** Indicates that package mass loss of downlink(packet loss rate above 30%). (For CALL_DIAGNOSES_RESULT_INACTIVE)*/
	CALL_DIAGNOSES_INACTIVE_SRC_SRTP_UNPACK                = 0x04, /** Indicates that Mismatch of Key leads to SRTP(Secure Real-time Transport Protocol)data stream decode failed. (For CALL_DIAGNOSES_RESULT_INACTIVE)*/
	CALL_DIAGNOSES_INACTIVE_SRC_MULTI_STREAM               = 0x05, /** Indicates that Downlink receiver received more than one RTP(Real-time Transport Protocol) data stream. (For CALL_DIAGNOSES_RESULT_INACTIVE)*/
	CALL_DIAGNOSES_INACTIVE_SRC_PT_NOT_SUPPORT             = 0x06, /** Indicates that Decoder does not support this playload type. (For CALL_DIAGNOSES_RESULT_INACTIVE)*/
	CALL_DIAGNOSES_INACTIVE_SRC_DECODE_EXCEPTION           = 0x07, /** Indicates that Encoded stream abnormal leads to decode failed (For CALL_DIAGNOSES_RESULT_INACTIVE)*/
	CALL_DIAGNOSES_INACTIVE_SRC_PACKET_EXCEPTION           = 0x08, /** Indicates that Analysis failure of data packet format length leads to packet analysis failed. (For CALL_DIAGNOSES_RESULT_INACTIVE)*/
	CALL_DIAGNOSES_INACTIVE_SRC_JB_DISCARD                 = 0x09, /** Indicates that Network Jitter leads to active Jitter Buffer packet loss. (For CALL_DIAGNOSES_RESULT_INACTIVE)*/
	CALL_DIAGNOSES_INACTIVE_SRC_SIGNAL_MUTE                = 0x0A, /** Indicates that No exception, but PCM(Pulse Code Modulation) signal analysis result is none speech activity. (For CALL_DIAGNOSES_RESULT_INACTIVE)*/

	CALL_DIAGNOSES_INTERMITTENCE_SRC_LOSS_PACKET           = 0x0B, /** Indicates that package loss of downlink. (For CALL_DIAGNOSES_RESULT_INTERMITTENCE)*/
	CALL_DIAGNOSES_INTERMITTENCE_SRC_DISCARD_PACKET        = 0x0C, /** Indicates that Network Jitter leads to active Jitter Buffer packet loss. (For CALL_DIAGNOSES_RESULT_INTERMITTENCE)*/
	CALL_DIAGNOSES_INTERMITTENCE_SRC_RENDER_BLOCK          = 0x0D, /** Indicates that play device is blocked. (For CALL_DIAGNOSES_RESULT_INTERMITTENCE)*/
	CALL_DIAGNOSES_INTERMITTENCE_SRC_SIGNAL_INTERMITTENCE  = 0x0E, /** Indicates that signal is interrupted. (For CALL_DIAGNOSES_RESULT_INTERMITTENCE)*/

	CALL_DIAGNOSES_SRC_NONE                                = 0x0F, /** Indicates no need reason for diagnoses result*/

    CALL_DIAGNOSES_SRC_BULT                                = 0xFF  /** Illegal diagnoses reason */

}CALL_DIAGNOSES_SRC;

/** Indicates the quality of server of a call */
typedef enum tag_CALL_QOS
{
    QOS_QUALITY_BAD,     /**< Indicates QOS is bad */
    QOS_QUALITY_NORMAL,  /**< Indicates QOS is normal */
    QOS_QUALITY_GOOD     /**< Indicates QOS is good */
}CALL_QOS;

/**
 * Indicates the name of a configuration item.
 * <br>It is used to configure the SDK to send a 486 message (Busy Here) instead of a 603 message (Declined) to the server when an incoming call is rejected.
 */
#define CFG_REJECT_WITH_486 @"RejectWith486"

/**
 * Indicates the name of a configuration item.
 * <br>It is used to customize the content in the Warning header field of the 486 message.
 */
#define CFG_486_WARNING_CONTENT @"486Warning"

/**
 * Indicates the name of a configuration item
 * <br>It is used to set or get the version of "486Warning"
 */
#define CFG_WARNING_VERSION @"WarningVersion"

/**
 * Indicates the name of a configuration item
 * <br>It is used to set or get the warning code of "486Warning"
 */
#define CFG_486_WARN_CODE @"486WarnCode"

/**
 * Indicates the name of a configuration item.
 * <br>It is used to customize whether a call record is written into the call record database.
 */
#define CFG_CALLLOG_INSERT_SYS_DB @"CallLogInsertSysDB"

/**
 * Indicates the value of a configuration item.
 * <br>It is used to enable the function of a configuration item.
 */
#define CFG_VALUE_YES @"yes"

/**
 * Indicates the value of a configuration item.
 * <br>It is used to disable the function of a configuration item.
 */
#define CFG_VALUE_NO @"no"

/** Indicates the configuration value for the High H.264 Profile. It is used to set H.264 Profile for High profile. */
#define H264_PROFILE_HIGH @"100"

/** Indicates the configuration value for the baseline H.264 Profile. It is used to set H.264 Profile for BaseLine profile. */
#define H264_PROFILE_BASELINE @"66"

/** Indicates SRTP is disabled. It is used to disable srtp. */
#define CALL_DISABLE_SRTP @"0"

/** Indicates SRTP is enabled. It is used to enable srtp. */
#define CALL_ENABLE_SRTP  @"1"

/** Indicates the default caller id type. It is used to indicate the caller type when join conference. */
#define CFG_CALLER_ID_TYPE_DEFAULT  @"0"

/** Indicates the caller id type of PAI. It is used to indicate the caller type when join conference. */
#define CFG_CALLER_ID_TYPE_PAI  @"1"

/**
 * Indicates default or pointless type in the minor configuration tpye.
 * @see CALL_CFG_MINOR_BUTT
 */
#define CALL_ZMAXINT 0x7FFFFFFF

/** Indicates major type for call configuration */
typedef enum tag_CALL_CFG_MAJOR_TYPE
{
    CALL_CFG_MPTY_FACTORY = 0, /**< Indicates multi party call factory uri (IP address of 3PTY conference server). */

    CALL_CFG_MIC_VOL      = 1, /**< Indicates microphone volumn. */
    CALL_CFG_SPK_VOL      = 2, /**< Indicates speaker volumn. */

    CALL_CFG_MIC_MUTE     = 3, /**< Indicates microphone is mute. */
    CALL_CFG_SPK_MUTE     = 4, /**< Indicates speaker is mute. */

    CALL_CFG_CUR_MIC      = 5, /**< Indicates current microphone. */
    CALL_CFG_CUR_SPK      = 6, /**< Indicates current speaker. */
    CALL_CFG_CUR_CAM      = 7, /**< Indicates current camera. */

    CALL_CFG_H264         = 8, /**< Indicates H264 configuration. See {@link CALL_CFG_MINOR_PROFILE}, {@link CALL_CFG_MINOR_CONSTRAINT}, {@link CALL_CFG_MINOR_LEVEL} */

    CALL_CFG_SUPT_AUDIO_CODEC  = 11, /**< Indicates audio codec configuration. See {@link CALL_CFG_MINOR_AUDIO_CODEC_OPUS} etc. */

    CALL_CFG_SUPT_SRTP    = 12,      /**< Indicates SRTP configuration. See {@link CALL_CFG_MINOR_SUPPORT_SRTP_AUDIO}, {@link CALL_CFG_MINOR_SUPPORT_SRTP_VIDEO}, {@link CALL_CFG_MINOR_SUPPORT_SRTP_ALL} */

    CALL_CFG_SUPT_VIDEO_CODEC  = 13, /**< Indicates video codec configuration. See {@link CALL_CFG_MINOR_VIDEO_CODEC_H264} etc. */

    CALL_CFG_PREFIXNUM_FOR_SSOP = 16,/**< Indicates sec prefix number for ssop. See {@link CALL_CFG_MINOR_SSOP_ACTIVE_CW} etc. */

    CALL_CFG_DTMF_TYPE = 17,      /**< Indicates DTMF method type. */

    CALL_CFG_REINVITETIME = 18,   /**< Indicates T1 in RFC3261. */

    CALL_CFG_SIPPAIPREFERRED = 19,/**< Indicates number display priority (using PAI or FROM domain). 0:PAI priority, 1:FROM priority. */

    CALL_CFG_LOCAL_RING_DELAY_TIME = 20, /**< Indicates the local ringback delay time when the UI initiates a call. The delay time here is measured in milliseconds. */

    CALL_CFG_ICE = 21,   /**< Indicates ice configuration. See {@link CALL_CFG_MINOR_ICE_SERVER_ADDR}, {@link CALL_CFG_MINOR_ICE_SERVER_PORT}, {@link CALL_CFG_MINOR_ICE_FOR_CALL}, {@link CALL_CFG_MINOR_ICE_CALL_TYPE} */

    CALL_CFG_DISPLAY_INCOMING_TIP = 22, /**< Indicates display incoming tip or not when application is run on background. */

    CALL_CFG_VIDEO_DISPLAY_TYPE = 25,     /* Indicates major configuration type of video display type."0" for display with black edge;"1" for display with clipping; <br>"2" for display without black edge and clipping */

    CALL_CFG_AUDIO_CODEC_PRIORITY  = 32 , /**< Indicates audio codec priority. See {@link CALL_CFG_MINOR_AUDIO_CODEC_OPUS} etc. */

    CALL_CFG_VIDEO_QUALITY          = 34, /**< Indicates video quality level. */

    CALL_CFG_VIDEO_CODEC_PRIORITY  = 43,  /**< Indicates video codec priority. See {@link CALL_CFG_MINOR_VIDEO_CODEC_H264} etc. */

    CALL_CFG_PREVIEW_BEFORE_CONNED = 44, /**< Indicates whether preview of the local video is supported before video call connection.*/
    
    CALL_CFG_PLAY_INCOMING_RING = 45, /**< Indicates whether whether playing ring for a incoming call. See {@link CFG_VALUE_YES}, {@link CFG_VALUE_NO}.*/

    CALL_CFG_AUDIO_CODEC_REDTIMES  = 46,    /**< Indicates configuration type of configure audio codec redundant times.*/
    
    CALL_CFG_PLAY_TONE = 48,   /**< Indicates whether playing ring for a incoming call, a terminating call or a alerting call. See {@link CFG_VALUE_YES}, {@link CFG_VALUE_NO}.*/

    CALL_CFG_ASSIST_VIDEO = 54,   /**< Indicates assist video.*/

    CALL_CFG_CALLER_ID_TYPE = 55,   /**< Indicates the caller id type. See {@link CFG_CALLER_ID_TYPE_DEFAULT}, {@link CFG_CALLER_ID_TYPE_PAI}.*/
    
    CALL_CFG_CALLLOG_USE_URI = 56,   /**< Indicates that whether use uri in calllog or not, 
                                      CFG_VALUE_NO:not use uri CFG_VALUE_YES:use uri. default: CFG_VALUE_NO.*/
    
    CALL_CFG_CALLLOG_IS_AGGREGATED_BY_URI = 57,   /**< Indicates that whether aggregate calllogs by uri or not,
                                      CFG_VALUE_NO:not use uri CFG_VALUE_YES:use uri. default: CFG_VALUE_YES.*/

    CALL_CFG_MAJOR_BUTT           /**< Indicates pointless major type (the maximum value of this enumeration). */

}CALL_CFG_MAJOR_TYPE;


/** Indicates minor type for call configuration. */
typedef enum tag_CALL_CFG_MINOR_TYPE
{
    CALL_CFG_MINOR_PROFILE    = 0, /**< Indicates H264 profile level (related to video quality and clarity). See {@link H264_PROFILE_HIGH}, {@link H264_PROFILE_BASELINE} */
    CALL_CFG_MINOR_CONSTRAINT = 1, /**< Indicates constraint. */
    CALL_CFG_MINOR_LEVEL      = 2, /**< Indicates video level. */
    CALL_CFG_MINOR_MAXBR      = 3, /**< Indicates maximum bit rate. [bps] */

    CALL_CFG_MINOR_MAX_RECV_BIT_RATE   = 4,  /**< Indicates maximum receive bit rate. [bps] */
    CALL_CFG_MINOR_MAX_SEND_BIT_RATE   = 5,  /**< Indicates maximum send bit rate. [bps] */
    CALL_CFG_MINOR_MAX_RECV_SIZE       = 6,  /**< Indicates maximum receive size. */
    CALL_CFG_MINOR_MAX_SEND_SIZE       = 7,  /**< Indicates maximum send size. */
    CALL_CFG_MINOR_MAX_RECV_FRAME_RATE = 8,  /**< Indicates maximum receive frame rate. [fps] */
    CALL_CFG_MINOR_MAX_SEND_FRAME_RATE = 9,  /**< Indicates maximum send frame rate. [fps] */
    CALL_CFG_MINOR_AUDIO_CODEC_OPUS    = 14, /**< Indicates audio codec opus. */
    CALL_CFG_MINOR_AUDIO_CODEC_ILBC    = 15, /**< Indicates audio codec iLBC. */
    CALL_CFG_MINOR_AUDIO_CODEC_PCMU    = 16, /**< Indicates audio codec PCMU. */
    CALL_CFG_MINOR_AUDIO_CODEC_PCMA    = 17, /**< Indicates audio codec PCMA. */
    CALL_CFG_MINOR_AUDIO_CODEC_G729    = 18, /**< Indicates audio codec G729. */
    CALL_CFG_MINOR_AUDIO_CODEC_AMR     = 19, /**< Indicates audio codec AMR. */
    CALL_CFG_MINOR_AUDIO_CODEC_AMR_WB  = 20, /**< Indicates audio codec AMR-WB. */

    CALL_CFG_MINOR_SUPPORT_SRTP_AUDIO  = 21, /**< Indicates audio minor type srtp. See {@link CALL_DISABLE_SRTP}, {@link CALL_ENABLE_SRTP} */
    CALL_CFG_MINOR_SUPPORT_SRTP_VIDEO  = 22, /**< Indicates video minor type srtp. See {@link CALL_DISABLE_SRTP}, {@link CALL_ENABLE_SRTP} */
    CALL_CFG_MINOR_SUPPORT_SRTP_ALL    = 23, /**< Indicates All srtp (audio and video srtp). See {@link CALL_DISABLE_SRTP}, {@link CALL_ENABLE_SRTP} */

    CALL_CFG_MINOR_VIDEO_CODEC_H263    = 24, /**< Indicates video codec H263. */
    CALL_CFG_MINOR_VIDEO_CODEC_H264    = 25, /**< Indicates video codec H264. */

    CALL_CFG_MINOR_SSOP_ACTIVE_CW = 27,         /**< Indicates prefix for ssop minor type active call wait. */
    CALL_CFG_MINOR_SSOP_DEACTIVATE_CW = 28,     /**< Indicates prefix for ssop minor type deactive call wait. */
    CALL_CFG_MINOR_SSOP_ACTIVE_CFU = 29,        /**< Indicates prefix for ssop minor type active call forwarding unconditional. */
    CALL_CFG_MINOR_SSOP_DEACTIVATE_CFU = 30,    /**< Indicates prefix for ssop minor type deactive call forwarding unconditional. */
    CALL_CFG_MINOR_SSOP_ACTIVE_CFB = 31,        /**< Indicates prefix for ssop minor type active call forwarding busy. */
    CALL_CFG_MINOR_SSOP_DEACTIVATE_CFB = 32,    /**< Indicates prefix for ssop minor type deactive call forwarding busy. */
    CALL_CFG_MINOR_SSOP_ACTIVE_CFNRY = 33,      /**< Indicates prefix for ssop minor type active call forwarding no reply. */
    CALL_CFG_MINOR_SSOP_DEACTIVATE_CFNRY = 34,  /**< Indicates prefix for ssop minor type deactive call forwarding no reply. */
    CALL_CFG_MINOR_SSOP_ACTIVE_CFNRC = 35,      /**< Indicates prefix for ssop minor type active call forwarding on user not reachable. */
    CALL_CFG_MINOR_SSOP_DEACTIVATE_CFNRC = 36,  /**< Indicates prefix for ssop minor type deactive call forwarding on user not reachable. */
    CALL_CFG_MINOR_SSOP_ACTIVE_CLIP = 37,       /**< Indicates prefix for ssop minor type active calling line identification presentation. */
    CALL_CFG_MINOR_SSOP_DEACTIVATE_CLIP = 38,   /**< Indicates prefix for ssop minor type deactive calling line identification presentation. */
    CALL_CFG_MINOR_SSOP_ACTIVE_CLIR = 39,       /**< Indicates prefix for ssop minor type active calling line identification restriction. */
    CALL_CFG_MINOR_SSOP_DEACTIVATE_CLIR = 40,   /**< Indicates prefix for ssop minor type deactive calling line identification restriction. */
    CALL_CFG_MINOR_SSOP_ACTIVE_CFNL = 41,       /**< Indicates prefix for ssop minor type active call forwarding on user not online. */
    CALL_CFG_MINOR_SSOP_DEACTIVATE_CFNL = 42,   /**< Indicates prefix for ssop minor type deactive call forwarding on user not online. */
    CALL_CFG_MINOR_SSOP_ACTIVE_CFNLVM = 43,     /**< Indicates prefix for ssop minor type active call forwarding to voice mailbox on user not online. */
    CALL_CFG_MINOR_SSOP_DEACTIVATE_CFNLVM = 44, /**< Indicates prefix for ssop minor type deactive call forwarding to voice mailbox on user not online. */
    CALL_CFG_MINOR_SSOP_ACTIVE_CNIR = 45,       /**< Indicates prefix for ssop minor type active calling name identification restriction. */
    CALL_CFG_MINOR_SSOP_DEACTIVATE_CNIR = 46,   /**< Indicates prefix for ssop minor type deactive calling name identification restriction. */
    CALL_CFG_MINOR_SSOP_ACTIVE_COLP = 47,       /**< Indicates prefix for ssop minor type active called line identification restriction. */
    CALL_CFG_MINOR_SSOP_DEACTIVATE_COLP = 48,   /**< Indicates prefix for ssop minor type deactive called line identification restriction. */
    CALL_CFG_MINOR_SSOP_ACTIVE_COLR = 49,       /**< Indicates prefix for ssop minor type active called line identification restriction. */
    CALL_CFG_MINOR_SSOP_DEACTIVATE_COLR = 50,   /**< Indicates prefix for ssop minor type deactive called line identification restriction. */
    CALL_CFG_MINOR_SSOP_VOICE_MAIL = 51,        /**< Indicates prefix for ssop minor type voice mail. */


    CALL_CFG_MINOR_ICE_SERVER_ADDR = 52,  /**< Indicates ice minor type (server ip address). */
    CALL_CFG_MINOR_ICE_SERVER_PORT = 53,  /**< Indicates ice minor type (server port). */
    CALL_CFG_MINOR_ICE_FOR_CALL = 54,     /**< Indicates ice minor type (use ICE for a call to tansfer media in p2p mode). */
    CALL_CFG_MINOR_ICE_CALL_TYPE = 55,    /**< Indicates ice minor type (call type). */
    CALL_CFG_MINOR_CALL_ASSIST_VIDEO_ENABLE = 95,    /**< Indicates call assist video is enabled or not. */
    CALL_CFG_MINOR_CONF_ASSIST_VIDEO_ENABLE = 96,    /**< Indicates conf assist video is enabled or not. */

    CALL_CFG_MINOR_BUTT = CALL_ZMAXINT    /**< Indicates default or pointless minor type (the maximum value of this enumeration). See {@link CALL_ZMAXINT}. */

}CALL_CFG_MINOR_TYPE;


/**
 * <b>Description:</b> CallApi provides various interfaces for audio and video call services.
 * <br><b>Purpose:</b> The UI invokes methods of this class to implement audio and video call services, such as initiating an audio
 * or video call, setting or getting call configuration parameters, activating call waiting or call forwarding services etc.
 */
@interface CallApi : NSObject
{

}

/**
 * <b>Description:</b> This method is used to initialize audio and video calls.
 * <br><b>Purpose:</b> This method is invoked to initialize interfaces of CallApi before an audio or video call service is used.
 * Generally, it is invoked during system initialization.
 */
+ (void) init;

/**
 * <b>Description:</b> This method is used to initiate a VoIP call.
 * <br><b>Purpose:</b> The UI invokes this method when initiating a VoIP call. For example, when a user initiates a VoIP call
 * on the dialing page, the UI invokes this method and then switches the dialing page to the calling page.
 * @param number Specifies the callee number
 * @return The value indicates CallSession of the call
 * @see EVENT_CALL_INVITATION
 * @see CallSession.accept:
 * @see CallSession.terminate
 */
+ (CallSession*) initiateAudioCall:(NSString*) number;

/**
 * <b>Description:</b> his method is used to do a special adjust of callee number, and then initiate a VoIP call.
 * <br><b>Purpose:</b> The UI invokes this method when initiating a VoIP call. For example, when a user initiates a VoIP call
 * on the dialing page, the UI invokes this method and then switches the dialing page to the calling page.
 * @param pcAreaCode Specifies the area code of callee number
 * @param number Specifies the callee number
 * @param numType Specifies the phone type of callee
 * @return The value indicates CallSession of the call
 * @see EVENT_CALL_INVITATION
 * @see CallSession.accept:
 * @see CallSession.terminate
 */
+ (CallSession*) initiateAudioCallForSpecAdjust:(NSString*) areaCode phoneNumber:(NSString*)number phonetype:(unsigned long)numType;

/**
 * <b>Description:</b> This method is used to initiate a VoIP call.
 * <br><b>Purpose:</b> The UI invokes this method when initiating a VoIP call with extended parameters. For example, when a user
 * initiates a VoIP call on the dialing page, the UI invokes this method and then switches the dialing page to the calling page.
 * The extended parameters is used to bring about special functions:
 * 1. The UI can specify the uri to be SIP format or TEL format in the INVITE massage when making an audio call. See
 *         {@link PARAM_CALL_AUDIO_URI_FORMAT}
 * @param number Specifies the callee number.
 * @param audioExtParas Specifies extended parameters.
 * @return The value indicates CallSession of the call
 * @see EVENT_CALL_INVITATION
 * @see CallApi.initiateAudioCall:
 */
+ (CallSession*) initiateAudioCallWithExtParas:(NSString*) number extParas:(NSMutableDictionary*)audioExtParas;

/**
 * <b>Description:</b> This method is used to initiate a video call.
 * <br><b>Purpose:</b> The UI invokes this method when initiating a video call. For example, when a user initiates a video call
 * on the dialing page, the UI invokes this method and then switches the dialing page to the calling page. Before invoking this method,
 * the UI needs to create the local video view and the remote video view.
 * @param number Specifies the called number
 * @param localView Specifies the local video view
 * @param remoteView Specifies the remote video view
 * @return The value indicates CallSession of the call
 * @see EVENT_CALL_INVITATION
 * @see CallSession.accept:
 * @see CallSession.terminate
 */
+ (CallSession*) initiateVideoCall:(NSString*) number localView:(EAGLExView*) localView remoteView:(EAGLExView*) remoteView;

/**
 * <b>Description:</b> This method is used to do a special adjust of callee number, and then initiate a video call.
 * <br><b>Purpose:</b> The UI invokes this method when initiating a video call. For example, when a user initiates a video call
 * on the dialing page, the UI invokes this method and then switches the dialing page to the calling page. Before invoking this method,
 * the UI needs to create the local video view and the remote video view.
 * @param areaCode Specifies the area code of callee number
 * @param number Specifies the called number
 * @param numType Specifies the phone type of callee
 * @param localView Specifies the local video view
 * @param remoteView Specifies the remote video view
 * @return The value indicates CallSession of the call
 * @see EVENT_CALL_INVITATION
 * @see CallSession.accept:
 * @see CallSession.terminate
 */
+ (CallSession*) initiateVideoCallForSpecAdjust:(NSString*) areaCode phoneNumber:(NSString*)number phonetype:(unsigned long)numType
        localView:(EAGLExView*) localView remoteView:(EAGLExView*) remoteView;

/**
 * <b>Description:</b> This method is used to initiate a video sharing call.
 * <br><b>Purpose:</b> During a VoIP call, the UI invokes this method to initiate a video sharing call. A video sharing call is
 * a one-way video call. It is suggested that the UI should invoke this method during a connected VoIP call. After the peer party
 * accepts the call, the UI needs to create the local video view.
 * @param number Specifies the peer number of a video sharing call
 * @param localView Specifies the local video view
 * @return The value indicates CallSession of the call
 * @see EVENT_CALL_INVITATION
 * @see CallSession.acceptVideoShare
 * @see CallSession.termVideoShare
 */
+ (CallSession*) initiateVideoShare:(NSString*) number localView:(EAGLExView*) localView;

/**
 * <b>Description:</b> This method is used to initiate a video sharing request.
 * <br><b>Purpose:</b> During a voice call, the UI invokes this method to initiate a video sharing
 * request for sharing the video of the peer party. After the peer party accepts this request, the UI needs to
 * create the remote video view.
 * @param number Specifies the number of the peer party which receives the video sharing request.
 * @param remoteView Specifies the remote video view
 * @return The value indicates CallSession of the call
 * @see EVENT_VIDEO_SHARE_REQUEST_INVITATION
 * @see CallSession.acceptVideoShareReq
 * @see CallSession.termVideoShareReq
 */
+ (CallSession*) initiateVideoShareReq:(NSString*) number remoteView:(EAGLExView*) remoteView;

/**
 * <b>Description:</b> This method is used to initiate Supplementary Service operation call.
 * <br><b>Purpose:</b> SSop is short for Supplementary Service operation. There are various Supplementary Services such as
 * Call Waiting, Call Forwarding Unconditional, Calling Line Identity Restriction etc. The UI invokes this method to activate
 * or deactivate these services. Please note that the UI activates or deactivates Supplementary Service by making a SSop Call to
 * the server, and the service is activated or deactivated once the server receives the SSop call. Usually the user can hear
 * a tone played by the server.
 * @param number Specifies the call forwarding number for Call Forwarding function. The UI can enter a "nil" for other functions.
 * @param type Specifies the Supplementary Service operation type. See {@link tag_CALL_SSOP_TYPE}.
 * @return The value indicates CallSession of the SSOP call
 */
+ (CallSession*)initiateSsopCall:(NSString*)number type:(CALL_SSOP_TYPE)type;

/**
 * <b>Description:</b> This method is used to merge two phone calls to a tripartite call
 * <br><b>Purpose:</b> e.g. If a user, say User A, has two VOIP calls with User B and User C (one call is in status
 * {@link CallSession.CALL_STATUS_CONNECTED}, the other call is in status {@link CallSession.CALL_STATUS_HOLD}), User A can merger the
 * two phone calls to a tripartite call. Then the three users can talk with each other.
 * @param callSessions Specifies callSessions of the two phone calls to be merged
 * @return The value indicates CallSession of the tripartite call
 */
+ (CallSession*)mergeTwoCallsToConf:(NSArray*)callSessions;


/**
 * <b>Description:</b> This method is used to obtain the amount of cameras.
 * <br><b>Purpose:</b> The UI invokes this method to obtain the amount of cameras on the current device during a video call.
 * The camera-switching function cannot be used if less than two cameras are configured.
 * @return The value indicates the number of cameras on the device
 * @see CallSession.switchCamera
 * @see CallSession.switchCameraTo:
 */
+ (int) getCameraCount;


/**
 * <b>Description:</b> This method is used to switch over between the loudspeaker and the receiver.
 * <br><b>Purpose:</b> The UI invokes this method to switch loudspeaker during a call. By default, the receiver is used.
 * @param spkPos Specifies the speaker position. See {@link tag_CALL_SPEAKER_POS}
 * @return YES Indicates that operation succeeds
 *     <br>NO Indicates that operation fails
 */
+ (BOOL)switchSpk:(CALL_SPEAKER_POS)spkPos;

/**
 * <b>Description:</b> This method is used to set the maximum downlink bit rate.
 * <br><b>Purpose:</b> The UI invokes this method to set the maximum downlink bit rate before initiating a video call.
 * In addition, maximum downlink bit rate ({@link callSetVideoMaxRecvBitRate:withVideoMaxBr:}), maximum downlink frame rate
 * ({@link callSetVideoMaxRecvFrameRate:withVideoFrameRate:}), and maximum downlink resolution ({@link callSetVideoMaxRecvSize:withVideoSize:})
 * must be set at the same time.
 * @param codec Specifies the video codec of the session. At present, this method applies only to {@link CALL_CODEC_H264}. See
 *      <ul>
 *         <li><em>{@link CALL_CODEC_H264}</em></li>
 *         <li><em>{@link CALL_CODEC_H263}</em></li>
 *      </ul>
 * @param bitRate Specifies the maximum downlink bit rate of the session. This parameter is in units of bps.
 * @return 0 Indicates that operation succeeds
 *     <br>1 Indicates that operation fails
 * @see callGetVideoMaxRecvBitRate
 */
+ (int)callSetVideoMaxRecvBitRate:(char)codec withVideoMaxBr:(unsigned int)bitRate;

/**
 * <b>Description:</b> This method is used to set the maximum uplink bit rate.
 * <br><b>Purpose:</b> The UI invokes this method to set the maximum uplink bit rate based on the UI capability before initiating a video call.
 * The SDK uses the maximum uplink bit rate set by the UI only when the maximum uplink bit rate is within the capability of the SDK.
 * Otherwise, the SDK uses the default bit rate value. In addition, maximum uplink bit rate ({@link callSetVideoMaxSendBitRate:withVideoMaxBr:}),
 * maximum uplink frame rate ({@link callSetVideoMaxSendFrameRate:withVideoFrameRate:}), and maximum uplink resolution
 * ({@link callSetVideoMaxSendSize:withVideoSize:}) must be set at the same time.
 * @param codec Specifies the video codec of the session. At present, this method applies only to {@link CALL_CODEC_H264}. See
 *      <ul>
 *         <li><em>{@link CALL_CODEC_H264}</em></li>
 *         <li><em>{@link CALL_CODEC_H263}</em></li>
 *      </ul>
 * @param bitRate Specifies the maximum uplink bit rate of the session. This parameter is in units of bps.
 * @return 0 Indicates that operation succeeds
 *     <br>1 Indicates that operation fails
 * @see callGetVideoMaxSendBitRate
 */
+ (int)callSetVideoMaxSendBitRate:(char)codec withVideoMaxBr:(unsigned int)bitRate;

/**
 * <b>Description:</b> This method is used to obtain the maximum downlink bit rate.
 * <br><b>Purpose:</b> The UI obtains the maximum downlink bit rate set by the UI based on requirements.
 * The maximum downlink bit rate is set in {@link callSetVideoMaxRecvBitRate:withVideoMaxBr:}.
 * @return 0 Indicates that operation succeeds
 *     <br>1 Indicates that operation fails
 * @see callSetVideoMaxRecvBitRate:withVideoMaxBr:
 */
+(int)callGetVideoMaxRecvBitRate;

/**
 * <b>Description:</b> This method is used to obtain the maximum uplink bit rate.
 * <br><b>Purpose:</b> The UI obtains the maximum uplink bit rate set by the UI based on requirements.
 * The maximum uplink bit rate is set in {@link callSetVideoMaxSendBitRate:withVideoMaxBr:}.
 * @return 0 Indicates that operation succeeds
 *     <br>1 Indicates that operation fails
 * @see callSetVideoMaxSendBitRate:withVideoMaxBr:
 */
+(int)callGetVideoMaxSendBitRate;

/**
 * <b>Description:</b> This method is used to set the maximum downlink resolution.
 * <br><b>Purpose:</b> The UI invokes this method to set the maximum downlink resolution before initiating a video call.
 * In addition, maximum downlink bit rate ({@link callSetVideoMaxRecvBitRate:withVideoMaxBr:}), maximum downlink frame rate
 * ({@link callSetVideoMaxRecvFrameRate:withVideoFrameRate:}), and maximum downlink resolution ({@link callSetVideoMaxRecvSize:withVideoSize:})
 * must be set at the same time.
 * @param codec Specifies the video codec of the session. At present, this method applies only to {@link CALL_CODEC_H264}. See
 *      <ul>
 *         <li><em>{@link CALL_CODEC_H264}</em></li>
 *         <li><em>{@link CALL_CODEC_H263}</em></li>
 *      </ul>
 * @param size Specifies the receiving size of the session. See {@link tag_CALL_PS_TYPE}
 * @return 0 Indicates that operation succeeds
 *     <br>1 Indicates that operation fails
 * @see callGetVideoMaxRecvSize
 */
+ (int)callSetVideoMaxRecvSize:(char)codec withVideoSize:(unsigned int)size;

/**
 * <b>Description:</b> This method is used to set the maximum uplink resolution.
 * <br><b>Purpose:</b> The UI invokes this method to set the maximum uplink resolution based on the UI capability before initiating a video call.
 * The SDK uses the maximum uplink resolution set by the UI only when the maximum uplink resolution is within the capability of the SDK.
 * Otherwise, the SDK uses the default bit rate value. In addition, maximum uplink bit rate ({@link callSetVideoMaxSendBitRate:withVideoMaxBr:}),
 * maximum uplink frame rate ({@link callSetVideoMaxSendFrameRate:withVideoFrameRate:}), and maximum uplink resolution
 * ({@link callSetVideoMaxSendSize:withVideoSize:}) must be set at the same time.
 * @param codec Specifies the video codec of the session. At present, this method applies only to {@link CALL_CODEC_H264}. See
 *      <ul>
 *         <li><em>{@link CALL_CODEC_H264}</em></li>
 *         <li><em>{@link CALL_CODEC_H263}</em></li>
 *      </ul>
 * @param size Specifies the sending size of the session. See {@link tag_CALL_PS_TYPE}
 * @return 0 Indicates that operation succeeds
 *     <br>1 Indicates that operation fails
 * @see callGetVideoMaxSendSize
 */
+ (int)callSetVideoMaxSendSize:(char)codec withVideoSize:(unsigned int)size;

/**
 * <b>Description:</b> This method is used to obtain the maximum downlink resolution.
 * <br><b>Purpose:</b> The UI obtains the maximum downlink resolution set by the UI based on requirements.
 * The maximum downlink resolution is set in {@link callSetVideoMaxRecvSize:withVideoSize:}.
 * @return 0 Indicates that operation succeeds
 *     <br>1 Indicates that operation fails
 * @see callSetVideoMaxRecvSize:withVideoSize:
 */
+(int)callGetVideoMaxRecvSize;

/**
 * <b>Description:</b> This method is used to obtain the maximum uplink resolution.
 * <br><b>Purpose:</b> The UI obtains the maximum uplink resolution set by the UI based on requirements.
 * The maximum uplink resolution is set in {@link callSetVideoMaxSendSize:withVideoSize:}.
 * @return 0 Indicates that operation succeeds
 *     <br>1 Indicates that operation fails
 * @see callSetVideoMaxSendSize:withVideoSize:
 */
+(int)callGetVideoMaxSendSize;

/**
 * <b>Description:</b> This method is used to set the maximum downlink frame rate.
 * <br><b>Purpose:</b> The UI invokes this method to set the maximum uplink frame rate based on the UI capability before initiating a video call.
 * The SDK uses the maximum uplink frame rate set by the UI only when the maximum uplink frame rate is within the capability of the SDK.
 * Otherwise, the SDK uses the default bit rate value. In addition, maximum uplink bit rate ({@link callSetVideoMaxSendBitRate:withVideoMaxBr:}),
 * maximum uplink frame rate ({@link callSetVideoMaxSendFrameRate:withVideoFrameRate:}), and maximum uplink resolution
 * ({@link callSetVideoMaxSendSize:withVideoSize:}) must be set at the same time.
 * @param codec Specifies the video codec of the session. At present, this method applies only to {@link CALL_CODEC_H264}. See
 *      <ul>
 *         <li><em>{@link CALL_CODEC_H264}</em></li>
 *         <li><em>{@link CALL_CODEC_H263}</em></li>
 *      </ul>
 * @param frameRate Specifies the receiving frame rate of the session. This parameter is in units of fps.
 * @return 0 Indicates that operation succeeds
 *     <br>1 Indicates that operation fails
 * @see callGetVideoMaxRecvFrameRate
 */
+ (int)callSetVideoMaxRecvFrameRate:(char)codec withVideoFrameRate:(unsigned int)frameRate;

/**
 * <b>Description:</b> This method is used to set the maximum uplink frame rate.
 * <br><b>Purpose:</b> The UI invokes this method to set the maximum uplink frame rate before a video call is initiated.
 * @param codec Specifies the video codec of the session. At present, this method applies only to {@link CALL_CODEC_H264}. See
 *      <ul>
 *         <li><em>{@link CALL_CODEC_H264}</em></li>
 *         <li><em>{@link CALL_CODEC_H263}</em></li>
 *      </ul>
 * @param frameRate Specifies the sending frame rate of the session. This parameter is in units of fps.
 * @return 0 Indicates that operation succeeds
 *     <br>1 Indicates that operation fails
 * @see callGetVideoMaxSendFrameRate
 */
+ (int)callSetVideoMaxSendFrameRate:(char)codec withVideoFrameRate:(unsigned int)frameRate;

/**
 * <b>Description:</b> This method is used to obtain the maximum downlink frame.
 * <br><b>Purpose:</b> The UI obtains the maximum downlink frame rate set by the UI based on requirements.
 * The maximum downlink frame rate is set in {@link callSetVideoMaxRecvFrameRate:withVideoFrameRate:}.
 * @return 0 Indicates that operation succeeds
 *     <br>1 Indicates that operation fails
 * @see callSetVideoMaxRecvFrameRate:withVideoFrameRate:
 */
+(int)callGetVideoMaxRecvFrameRate;

/**
 * <b>Description:</b> This method is used to obtain the maximum uplink frame rate.
 * <br><b>Purpose:</b> The UI obtains the maximum uplink frame rate set by the UI based on requirements.
 * The maximum uplink frame rate is set in {@link callSetVideoMaxSendFrameRate:withVideoFrameRate:}.
 * @return 0 Indicates that operation succeeds
 *     <br>1 Indicates that operation fails
 * @see callSetVideoMaxSendFrameRate:withVideoFrameRate:
 */
+(int)callGetVideoMaxSendFrameRate;

/**
 * <b>Description:</b> This method is used to get the Supplementary Service operation call number type.
 * @param ssopType Specifies the Supplementary Service operation type. See {@link tag_CALL_SSOP_TYPE}
 * @return The value indicates the number which represents the ssop type
 */
+(NSString*)callGetSsopNumberByType:(CALL_SSOP_TYPE) ssopType;

/**
 * <b>Description:</b> This method is used to set the configuration customized by the subscriber
 * <br><b>Purpose:</b> The UI can invoke this method to enable or disable a customized function
 * and configure related parameters.
 * At present, the SDK supports the following custom configuration:
 * <br>1.Configuring whether the SDK sends a 486 message (Busy Here) instead of a 603 message (Declined) to the server
 * when an incoming call is rejected.
 * <br>2.Customizing the content in the Warning header field of the 486 message.
 * <br>3.Configuring whether a call record is written into the call record database.
 * @param strName Specifies the name of a configuration item. See macro definitions whose names begin with "CFG_", such as
 *      <ul>
 *         <li><em>{@link CFG_CALLLOG_INSERT_SYS_DB}</em></li>
 *         <li><em>{@link CFG_REJECT_WITH_486}</em></li>
 *         <li><em>{@link CFG_486_WARNING_CONTENT}</em></li>
 *         <li><em>{@link CFG_PLAYING_INCOMING_RING}</em></li>
 *      </ul>
 * @param strValue Specifies the value of a configuration item
 * @return 0 Indicates that operation succeeds
 *     <br>1 Indicates that operation fails
 * @see getCustomCfg:
 */
+(int) setCustomCfg:(NSString*)strName strValue: (NSString*)strValue;

/**
 * <b>Description:</b> This method is used to obtain the configuration customized by the subscriber
 * <br><b>Purpose:</b> The UI invokes this method to obtain the configuration customized by the subscriber
 * @param strName Specifies the name of a configuration item. See
 *      <ul>
 *         <li><em>{@link CFG_REJECT_WITH_486}</em></li>
 *         <li><em>{@link CFG_486_WARNING_CONTENT}</em></li>
 *         <li><em>{@link CFG_CALLLOG_INSERT_SYS_DB}</em></li>
 *         <li><em>{@link CFG_PLAYING_INCOMING_RING}</em></li>
 *      </ul>
 * @return The value indicates the value of the configuration item to be obtained
 * @see setCustomCfg:strValue:
 */
+(NSString*) getCustomCfg:(NSString*)strName;

/**
 * <b>Description:</b> This method is used to set the video quality level.
 * <br><b>Purpose:</b> The UI invokes this method to set the video quality level before a video call is initiated.
 * If the UI invokes this method during a video call, the setting takes effect in the next video call.
 * Video quality includes video resolution and maximum bit rate of a video call. Please note that this is a beta interface.
 * @param iVideoLevel Specifies the quality level of the video. The value ranges from 0 to 10. A larger value indicates a higher quality level.
 */
+ (int)setVideoLevel:(unsigned int)level;

/**
 * <b>Description:</b> This method is used to find out if headset is in use or not.
 * @return YES Indicates headset is in use
 *     <br>NO Indicates headset is not in use
 */
+ (BOOL)ifHasHeadSet;

/**
 * <b>Description:</b> This method is used to obtain the speaker position.
 * @return The value indicates the speaker position. See {@link tag_CALL_SPEAKER_POS}
 */
+ (CALL_SPEAKER_POS)getSpkPos;

/**
 * <b>Description:</b> This method is used to play the specified tone related to the button on the number pad during a call
 * @param ring Specifies the specified tone to be played. See {@link tag_CALL_RING_TONE}
 */
+ (void)setNumpadRing:(CALL_RING_TONE)ring;

/**
 * <b>Description:</b> This method is used to set video resolution priority.
 * @param preferSize Specifies a certain ratio (range:1~2. 1 stands for the resolution CIF 352:288;
 * 2 stands for the resolution QVGA 320:240.)
 */
+ (void)setVideoPreferSize:(unsigned long)preferSize;

/**
 * <b>Description:</b> This method is used to set video quality level.
 * @param quality Specifies a certain quality level (range:0~5. 0 stands for the best video quality;
 * 5 stands for the lowest video quality level.)
 */
+ (void)setVideoQuality:(unsigned long)quality;

/**
 * <b>Description:</b> This method is used to get video quality level.
 * @param quality Specifies a certain quality level (range:0~5. 0 stands for the best video quality;
 * 5 stands for the lowest video quality level.)
 */
+ (void)getVideoQuality:(unsigned long *)quality;

/**
 * <b>Description:</b> This method is used to set AVAudioSesison to AVAudioSessionCategoryPlayback category
 */
+ (void)setAudioSessionCategoryToPlayBack;

/**
 * <b>Description:</b> This method is used to set video display type when the video size is different from the view size.
 * @param iDispayType Specifies the display type(range:0/1/2)
 * <br>"0" indicates displaying video images with black edge;
 * <br>"1" indicates displaying video images after clipping;
 * <br>"2" indicates displaying video images without black edge and clipping.
 */
+ (void)setVideoDisplayType:(int)iDispayType;

/**
 * <b>Description:</b> This method is used to obtain the amount of current call(s)
 * @return The value indicates the amount of current call(s)
 */
+ (int)getCurrentCallCount;

/**
 * <b>Description:</b> This method is used to release resoureces in Call Section
 */
+ (void)close;

/**
 * <b>Description:</b> This method is used to get the configuration value.
 * @param majorType Specifies the major type of the configuration. See {@link tag_CALL_CFG_MAJOR_TYPE}
 * @param minorType Specifies the minor type of the configuration. {@link CALL_ZMAXINT} is used here by default if minor type
 * is not needed. See {@link tag_CALL_CFG_MINOR_TYPE}
 * @return The value indicates the value of the configuration item to be obtained
 * @see setConfigValue:minortype:configvalue:
 */
+(NSString*) cfgGetValue:(int)majorType minortype:(int)minorType;

/**
 * <b>Description:</b> This method is used to set configuration information.
 * <br><b>Purpose:</b> The UI invokes this method to set configuration information based on different parameters. The configuration
 * takes effect on subsequent calls. At present, the following items can be configured:
 *     <br>1.ARS (Auto Rate Selection)
 *     <br>2.IP address of 3PTY conference server
 *     <br>3.H.264 codec level (related to video quality and clarity)
 *     <br>4.Content of the User-Agent header
 *     <br>5.Video display mode (black edge mode or clipping mode)
 *     <br>6.Video resolution priority
 *     <br>7.Audio and video encryption (SRTP)
 * @param majorType Specifies the major type of the configuration. See {@link tag_CALL_CFG_MAJOR_TYPE}
 * @param minorType Specifies the minor type of the configuration. {@link CALL_ZMAXINT} is used here by default if minor type
 * is not needed. See {@link tag_CALL_CFG_MINOR_TYPE}
 * @param value Specifies the value of the configuration.When majorType is priority, the value "0" is the highest priority.
 * @see cfgGetValue:minortype:
 */
+(void) setConfigValue:(int)majorType minortype:(int)minorType configvalue:(NSString*)configValue;

/**
 * <b>Description:</b> This method is used to stop alerting during an audio or video call
 * <br><b>Purpose:</b> When receiving an audio or video call, the UI invokes this method to stop alerting.
 * Before this method is invoked, the current call status must be {@link CallSession.CALL_STATUS_INCOMING}.
 */
+(void) stopAlerting;

/**
 * <b>Description:</b> This method is used to set call log peer number to call engine
 * This method is not in use now!
 */
+(void) setCallLogPeerNumber:(NSString*)number;

/**
 * <b>Description:</b> This method is used to enable ARS (Automatic Rate Selection)
 * @param bArs Specifies enable ARS or not
 * @return YES Indicates that operation succeeds
 *     <br>NO Indicates that operation fails
 */
+(BOOL) setArsEnable:(BOOL)bArs;

/**
 * <b>Description:</b> This method is used to enable assistant
 * @param isEnable Indicates enable assistant or not
 * @return 0 Specifies that operation succeeds
 *     <br>1 Specifies that operation fails
 */
+(int) setAssistVideoEnable:(BOOL)isEnable;

/**
 * <b>Description:</b> This method is used to set assistant capacility
 * @param resolution Indicatees resolution x and y
 * @param frameRate Specifies the video frame rate (range:1-15). The recommended value is 5.
 * @param bitRate Indicatees bit rate. This parameter is in units of bps.
 * @return 0 Specifies that operation succeeds
 *     <br>1 Specifies that operation fails
 */
+(int) setAssistantVideoPara:(int)resolution frameRate:(long)frameRate bitRate:(long)bitRate;

/**
 * <b>Description:</b> This method is used to set camera rotation
 * @param rotate Specifies the rotation angle
 * @return YES Indicates that operation succeeds
 *     <br>NO Indicates that operation fails
 */
+(BOOL) setCameraRotate:(int)rotate;

/**
 * <b>Description:</b> This method is used to set render rotation
 * @param rotate Specifies the rotation angle
 * @return YES Indicates that operation succeeds
 *     <br>NO Indicates that operation fails
 */
+(BOOL) setRenderRotate:(int)rotate;
@end

#endif
