/*--------------------------------------------------------------------------------------------------------------------------*/
/*!!Warning: This is a key information asset of Huawei Tech Co.,Ltd                                                         */
/*CODEMARK:kOyQZYzjDpyGdBAEC2GaWmZfTxYQ/Kw8rZS6n+Xl5a8Y99A4wNRboDw+Q2eDbcchF3Tru5p3
onyliNhfFWhvrNrqXkM+8ImNYzrnfN7/GtQ2nLehKsVSSm6SBD4QAcQ5s2D0Th6UtmB4qymC
z5GVQI/YmsMwp26M8PfnoXWEFGOi8pcj6O/8l6FQ9SIre/Ae7ObhRwwFFnNhk/kA0OYvuOBf
DDdCXGdheojUP4w0E9dJiFMQCVHtEO03hYG0itCVAgHic/xz2BWHKp+tKB3/XA==*/
/*--------------------------------------------------------------------------------------------------------------------------*/
//
//  FMDatabasePool.h
//  fmdb
//
//  Created by August Mueller on 6/22/11.
//  Copyright 2011 Flying Meat Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "sqlite3.h"

@class FMDatabase;

@interface FMDatabaseQueue : NSObject {
    NSString            *_path;
    dispatch_queue_t    _queue;
    FMDatabase          *_db;
}

@property (atomic, retain) NSString *path;

+ (id)databaseQueueWithPath:(NSString*)aPath;
- (id)initWithPath:(NSString*)aPath;
- (void)close;

- (void)inDatabase:(void (^)(FMDatabase *db))block;

- (void)inTransaction:(void (^)(FMDatabase *db, BOOL *rollback))block;
- (void)inDeferredTransaction:(void (^)(FMDatabase *db, BOOL *rollback))block;

#if SQLITE_VERSION_NUMBER >= 3007000
// NOTE: you can not nest these, since calling it will pull another database out of the pool and you'll get a deadlock.
// If you need to nest, use FMDatabase's startSavePointWithName:error: instead.
- (NSError*)inSavePoint:(void (^)(FMDatabase *db, BOOL *rollback))block;
#endif

@end

