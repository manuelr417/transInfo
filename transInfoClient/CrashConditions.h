//
//  CrashConditions.h
//  transinfo
//
//  Created by Omar Soto Fortuño on 5/11/15.
//  Copyright (c) 2015 University of Puerto Rico Mayagüez Campus. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CrashConditions : NSObject

@property id crashSummary; // Parent Crash Summary (in case there are various)

@property NSString *reportConditionsID;
@property NSString *firstHarmfulEventTypeKey;
@property NSString *firstHarmfulEventKey;
@property NSString *relToTrafficwayKey;
@property NSString *mannerOfCollisionKey;
@property NSString *weatherCondition1Key; // TODO: Remove when upgrading 2nd Tab (and Change to Array)
@property NSString *weatherCondition2Key; // TODO: Remove when upgrading 2nd Tab (and Change to Array)
@property NSString *lightingConditionKey;
@property NSString *roadSurfaceConditionKey;
@property NSString *environmentCircumstanceKey;
@property NSString *roadCircumstanceKey;
@property NSString *withinInterchangeKey;
@property NSString *junctionKey;
@property NSString *intersectionTypeKey;
@property NSString *schoolBusRelatedKey;
@property NSString *workzoneRelatedKey;
@property NSString *workzoneLocationKey;
@property NSString *workzoneTypeKey;
@property NSString *workersPresentKey;
@property NSString *lawEnforcementPresentKey;
@property NSString *narrative;

- (NSMutableDictionary*)getDictionary;

- (void)save;

@end
