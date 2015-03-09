//
//  Person.h
//  transinfo
//
//  Created by Omar Soto Fortuño on 12/8/14.
//  Copyright (c) 2014 University of Puerto Rico Mayagüez Campus. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property NSString *typeCategoryKey;
@property NSString *typeKey;
@property NSString *name;
@property NSString *genderKey;
@property NSString *licenseTypeKey;
@property NSString *driverLicense;
@property NSString *organDonorKey;
@property NSDate *licenseExpirationDate;
@property BOOL licenseExpirationNA;
@property NSString *streetAddress;
@property NSString *neighbohood;
@property NSString *city;
@property NSString *stateCountry;
@property NSString *zipCode;
@property NSString *phoneNumber;
@property NSString *uuid;
@property NSString *vehicleUuid;

@property NSString *rowKey;
@property NSString *seatKey;
@property NSString *seatingOtherKey;
@property NSString *restraintSystemKey;
@property NSString *helmetUseKey;

@property NSString *airbagDeployedKey;
@property NSString *ejectionKey;
@property NSString *speedingSuspectedKey;
@property NSString *extricationKey;
@property NSMutableArray *contribActionsCircumstancesKey;
@property NSString *distractedByKey;

@property NSMutableArray *conditions;
@property NSMutableArray *actionsPriorToCrash;
@property NSString *toFromSchool;
@property NSMutableArray *actionsAtTimeOfCrash;
@property NSString *nonMotoristLocation;
@property NSString *vehicleStrikingNonMotorist;

@end
