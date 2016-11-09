//
//  kqPersonalInfoMation.m
//  KindergartenPro
//
//  Created by 海峰 on 14-8-28.
//  Copyright (c) 2014年 海峰. All rights reserved.
//

#import "kqPersonalInfoMation.h"

@implementation kqPersonalInfoMation
static kqPersonalInfoMation *info;
+(kqPersonalInfoMation *)sharedPersonalInfoMation
{
    @synchronized(self)
    {
        if (info == nil) {
            info = [[self alloc] init];
        }
    }
    return info;
}

@end
