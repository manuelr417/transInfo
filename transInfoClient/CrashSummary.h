//
//  CrashSummary.h
//  transinfo
//
//  Created by Omar Soto Fortuño on 10/6/14.
//  Copyright (c) 2014 University of Puerto Rico Mayagüez Campus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Vehicle.h"

@interface CrashSummary : NSObject

@property NSString *reportID;
@property NSString *reportTypeID;
@property NSString *caseNumber;
@property NSString *officerUserID;
@property NSDate *crashDate;
@property NSDate *crashTime;
@property BOOL crashTimeUnknown;
@property NSString *latitude;
@property NSString *longitude;
@property NSString *cityID;
@property NSString *countyID;
@property NSString *streetHighway;
@property NSString *distance;
@property NSString *measurementID;
@property NSString *directionID;
@property NSString *nearToID;
@property NSString *intersectingStreet;
@property NSString *propertyID;
@property NSString *locationID;
@property NSString *totalWitnesses;
@property NSString *totalMotorizedUnits;
@property NSString *totalNonMotorizedUnits;
@property NSString *totalMotorists;
@property NSString *totalNonMotorists;
@property NSDate *creationDate;

@property NSMutableArray *vehicles;
@property NSMutableArray *individualPersons;

+ (id)sharedCrashSummary;
- (NSMutableDictionary*)getDictionary;

- (Vehicle*)getVehicleWithUUID:(NSString*)uuid;

@end
