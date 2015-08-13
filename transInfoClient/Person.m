//
//  Person.m
//  transinfo
//
//  Created by Omar Soto Fortuño on 12/8/14.
//  Copyright (c) 2014 University of Puerto Rico Mayagüez Campus. All rights reserved.
//

#import "Person.h"

@implementation Person

@synthesize typeCategoryKey;
@synthesize typeKey;
@synthesize name;
@synthesize genderKey;
@synthesize licenseTypeKey;
@synthesize driverLicense;
@synthesize organDonorKey;
@synthesize licenseExpirationDate;
@synthesize licenseExpirationNA;
@synthesize streetAddress;
@synthesize neighbohood;
@synthesize city;
@synthesize stateCountry;
@synthesize zipCode;
@synthesize phoneNumber;
@synthesize uuid;
@synthesize EMSNeededKey;
@synthesize EMSTransportedTo;
@synthesize EMSTransportedByKey;
@synthesize EMSResponseNumber;
@synthesize EMSAmbulanceCSP;
@synthesize vehicleUuid;

@synthesize rowKey;
@synthesize seatKey;
@synthesize seatingOtherKey;
@synthesize restraintSystemKey;
@synthesize helmetUseKey;

@synthesize airbagDeployedKey;
@synthesize ejectionKey;
@synthesize speedingSuspectedKey;
@synthesize extricationKey;
@synthesize contribActionsCircumstancesKey;
@synthesize distractedByKey;

@synthesize conditions;
@synthesize actionsPriorToCrash;
@synthesize toFromSchool;
@synthesize actionsAtTimeOfCrash;
@synthesize nonMotoristLocation;
@synthesize vehicleStrikingNonMotorist;

@synthesize safetyEquipments;
@synthesize alcoholSuspectedKey;
@synthesize alcoholTestStatusKey;
@synthesize alcoholTestTypeKey;
@synthesize alcoholResult;
@synthesize alcoholResultTypeKey;

@synthesize drugSuspectedKey;
@synthesize drugTestStatusKey;
@synthesize drugTestTypeKey;
@synthesize drugResultKey;

@synthesize violations;

- (id)init {
    self = [super init];
    
    if (self) {
        self.contribActionsCircumstancesKey = [[NSMutableArray alloc] init];
        self.conditions = [[NSMutableArray alloc] init];
        self.actionsPriorToCrash = [[NSMutableArray alloc] init];
        self.actionsAtTimeOfCrash = [[NSMutableArray alloc] init];
        self.safetyEquipments = [[NSMutableArray alloc] init];
        self.violations = [[NSMutableArray alloc] init];
    }
    
    return self;
}

@end
