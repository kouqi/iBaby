//
//  HmeVideo.h
//  sa
//
//  Created  on 13-07-27.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HmeVideo : NSObject

+ (int)setup;

/**
 * <b>Description:</b> This method is used to query the SDK video engine version number.
 * <br><b>Purpose:</b> The UI invokes it to query the SDK video engine version number after 
 *  call module and hme video module Initialization.
 * @return The value indicates the SDK video engine version number
 */
+ (NSString*)getVersion;


@end
    
