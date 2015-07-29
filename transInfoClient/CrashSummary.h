//
//  CrashSummary.h
//  transinfo
//
//  Created by Omar Soto Fortuño on 10/6/14.
//  Copyright (c) 2014 University of Puerto Rico Mayagüez Campus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Vehicle.h"
#import "restComm.h"
#import "Config.h"
#import "CrashConditions.h"

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
@property NSString *zoneTypeID;
@property NSString *totalWitnesses;
@property NSString *totalMotorizedUnits;
@property NSString *totalNonMotorizedUnits;
@property NSString *totalMotorists;
@property NSString *totalNonMotorists;
@property NSDate *creationDate;

@property NSString *vehicleQuantity;
@property NSString *motoristsQuantity;
@property NSString *pedestrianQuantity;
@property NSString *injuredQuantity;
@property NSString *fatalitiesQuantity;

@property CrashConditions *crashConditions;

@property NSMutableArray *vehicles;
@property NSMutableArray *individualPersons;

+ (id)sharedCrashSummary;
+ (void)resetSharedCrashSummary;
- (NSMutableDictionary*)getDictionary;

- (Vehicle*)getVehicleWithUUID:(NSString*)uuid;

- (void)save;

@end
