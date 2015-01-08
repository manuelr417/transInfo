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

@property NSString *registrationPlate;
@property NSString *registrationState;
@property NSString *vehicleIdentificationNumber;
@property NSString *year;
@property NSString *make;
@property NSString *model;
@property NSString *registrationNumber;
@property NSString *insurance;
@property NSDate *buyDate;
@property NSDate *registrationExpirationDate;
@property NSString *passangers;

@property NSString *uuid;

@property NSMutableArray *persons;

- (void)addPerson:(Person*)person;

@end
