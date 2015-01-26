//
//  CrashSummary.h
//  transinfo
//
//  Created by Omar Soto Fortuño on 10/6/14.
//  Copyright (c) 2014 University of Puerto Rico Mayagüez Campus. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CrashSummary : NSObject

@property NSNumber *reportID;
@property NSNumber *reportTypeID;
@property NSString *caseNumber;
@property NSNumber *officerUserID;
@property NSDate *crashDate;
@property NSDate *crashTime;
@property BOOL crashTimeUnknown;
@property NSNumber *latitude;
@property NSNumber *longitude;
@property NSNumber *cityID;
@property NSNumber *countyID;
@property NSString *streetHighway;
@property NSString *distance;
@property NSNumber *measurementID;
@property NSNumber *directionID;
@property NSNumber *nearToID;
@property NSString *intersectingStreet;
@property NSNumber *propertyID;
@property NSNumber *locationID;
@property NSNumber *totalWitnesses;
@property NSNumber *totalMotorizedUnits;
@property NSNumber *totalNonMotorizedUnits;
@property NSNumber *totalMotorists;
@property NSNumber *totalNonMotorists;
@property NSDate *creationDate;

@property NSMutableArray *vehicles;
@property NSMutableArray *pedestrians;

+ (id)sharedCrashSummary;
- (NSMutableDictionary*)getDictionary;

@end
