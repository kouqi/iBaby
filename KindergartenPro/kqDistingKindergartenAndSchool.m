//
//  kqDistingKindergartenAndSchool.m
//  KindergartenPro
//
//  Created by 海峰 on 15/3/24.
//  Copyright (c) 2015年 海峰. All rights reserved.
//

#import "kqDistingKindergartenAndSchool.h"

@implementation kqDistingKindergartenAndSchool
static kqDistingKindergartenAndSchool *dkas;
+(kqDistingKindergartenAndSchool *)sharedDistingKindergartenAndSchool
{
    @synchronized(self)
    {
        if (dkas == nil) {
            dkas = [[self alloc] init];
        }
    }
    return dkas;
}
@end
