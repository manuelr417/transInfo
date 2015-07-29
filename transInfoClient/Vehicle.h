//
//  Vehicle.h
//  transinfo
//
//  Created by Omar Soto Fortuño on 12/8/14.
//  Copyright (c) 2014 University of Puerto Rico Mayagüez Campus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

@interface Vehicle : NSObject

@property NSString *vehicleTypeKey;
@property NSString *occupants;
@property NSString *registrationPlate;
@property NSString *vehicleJurisdictionKey;
@property NSString *registrationState;
@property NSString *vehicleIdentificationNumber;
@property NSString *year;
@property NSString *make;
@property NSString *model;
@property NSString *registrationNumber;
@property NSString *insurance;
@property NSDate *buyDate;
@property NSDate *registrationExpirationDate;

@property NSString *bodyTypeKey;
@property NSString *directionOfTravelKey;
@property NSString *specialFunctionKey;
@property NSString *emergencyUseKey;
@property NSString *statutorySpeedMPH;
@property NSString *statutorySpeedKey;
@property NSString *postedSpeedMPH;
@property NSString *postedSpeedKey;
@property NSString *actionKey;

@property NSString *trafficwayDescriptionKey;
@property NSString *roadwayHorizontalAlignmentKey;
@property NSString *roadwayGradeKey;
@property NSString *totalLanesQuantity;
@property NSString *totalLaneCategoryKey;
@property NSString *totalLaneKey;
@property NSMutableArray *TCDTypes;
@property NSString *TCDWorkingKey;

@property NSString *harmfulEventCategory1Key;
@property NSString *harmfulEventCategory2Key;
@property NSString *harmfulEventCategory3Key;
@property NSString *harmfulEventCategory4Key;
@property NSString *harmfulEvent1Key;
@property NSString *harmfulEvent2Key;
@property NSString *harmfulEvent3Key;
@property NSString *harmfulEvent4Key;

@property NSString *busUseKey;
@property NSString *hitAndRunKey;
@property NSString *towedByKey;

@property NSString *vehicleCircumstance1Key;
@property NSString *vehicleCircumstance2Key;

@property NSString *initialContactPointKey;
@property NSMutableArray *damagedAreas;
@property NSString *extentOfDamageKey;

@property NSString *motorCarrierTypeKey;
@property NSString *vehicleMovementKey;
@property NSString *driverIsAuthorizedKey;

@property NSString *inspectionUpToDateKey;
@property NSString *specialPermitKey;
@property NSString *GVWRGCWRKey;

@property NSString *totalAxles;
@property NSString *configurationKey;
@property NSString *cargoBodyTypeKey;
@property NSString *hazMatInvolvedKey;
@property NSString *placardDisplayedKey;
@property NSString *hazMatReleasedKey;

@property NSString *uuid;

@property NSMutableArray *persons;

- (void)addPerson:(Person*)person;

@end
