/*--------------------------------------------------------------------------------------------------------------------------*/
/*!!Warning: This is a key information asset of Huawei Tech Co.,Ltd                                                         */
/*CODEMARK:kOyQZYzjDpyGdBAEC2GaWmZfTxYQ/Kw8rZS6n+Xl5a8Y99A4wNRboDw+Q2eDbcchF3Tru5p3
onyliNhfFWhvrNrqXkM+8ImNYzrnfN7/GtQ2nLehKsVSSm6SBD4QAcQ5s2D0Th6UtmB4qymC
z5GVQD0c2miDrG36TrEfnK5cKsdnthK5M+veK4nbCGBa1qzP+vBPJdu8cCIGdvnH7GXn6yGT
oHOxqESnx1cPRMcNXwmL+9zIIzwprh8Mpzet8nPWQyHzORSaY2SodukXDFigvA==*/
/*--------------------------------------------------------------------------------------------------------------------------*/
//
//  FMDatabaseAdditions.h
//  fmkit
//
//  Created by August Mueller on 10/30/05.
//  Copyright 2005 Flying Meat Inc.. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface FMDatabase (FMDatabaseAdditions)


- (int)intForQuery:(NSString*)objs, ...;
- (long)longForQuery:(NSString*)objs, ...; 
- (BOOL)boolForQuery:(NSString*)objs, ...;
- (double)doubleForQuery:(NSString*)objs, ...;
- (NSString*)stringForQuery:(NSString*)objs, ...; 
- (NSData*)dataForQuery:(NSString*)objs, ...;
- (NSDate*)dateForQuery:(NSString*)objs, ...;

// Notice that there's no dataNoCopyForQuery:.
// That would be a bad idea, because we close out the result set, and then what
// happens to the data that we just didn't copy?  Who knows, not I.


- (BOOL)tableExists:(NSString*)tableName;
- (FMResultSet*)getSchema;
- (FMResultSet*)getTableSchema:(NSString*)tableName;

- (BOOL)columnExists:(NSString*)columnName inTableWithName:(NSString*)tableName;

- (BOOL)validateSQL:(NSString*)sql error:(NSError**)error;

// deprecated - use columnExists:inTableWithName: instead.
//- (BOOL)columnExists:(NSString*)tableName columnName:(NSString*)columnName __attribute__ ((deprecated));

@end
