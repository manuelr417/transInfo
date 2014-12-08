//
//  Vehicle.m
//  transinfo
//
//  Created by Omar Soto Fortuño on 12/8/14.
//  Copyright (c) 2014 University of Puerto Rico Mayagüez Campus. All rights reserved.
//

#import "Vehicle.h"

@implementation Vehicle

@synthesize make;
@synthesize model;
@synthesize year;
@synthesize registrationPlate;
@synthesize persons;

- (id)init {
    self = [super init];
    
    if (self) {
        self.persons = [[NSMutableArray alloc] init];
    }
    
    return self;
}

- (void)addPerson:(Person*)person {
    [self.persons addObject:person];
}

@end
