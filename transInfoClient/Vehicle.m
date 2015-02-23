//
//  Vehicle.m
//  transinfo
//
//  Created by Omar Soto Fortuño on 12/8/14.
//  Copyright (c) 2014 University of Puerto Rico Mayagüez Campus. All rights reserved.
//

#import "Vehicle.h"

@implementation Vehicle

@synthesize registrationPlate;
@synthesize registrationState;
@synthesize vehicleIdentificationNumber;
@synthesize year;
@synthesize make;
@synthesize model;
@synthesize registrationNumber;
@synthesize insurance;
@synthesize buyDate;
@synthesize registrationExpirationDate;
@synthesize passangers;
@synthesize persons;
@synthesize uuid;
@synthesize damagedAreas;

- (id)init {
    self = [super init];
    
    if (self) {
        self.persons = [[NSMutableArray alloc] init];
        self.damagedAreas = [[NSMutableArray alloc] init];
        
        self.harmfulEventCategory1Key = @"-1";
        self.harmfulEventCategory2Key = @"-1";
        self.harmfulEventCategory3Key = @"-1";
        self.harmfulEventCategory4Key = @"-1";
        
        self.harmfulEvent1Key = @"-1";
        self.harmfulEvent2Key = @"-1";
        self.harmfulEvent3Key = @"-1";
        self.harmfulEvent4Key = @"-1";
    }
    
    return self;
}

- (void)addPerson:(Person*)person {
    [self.persons addObject:person];
}

@end
