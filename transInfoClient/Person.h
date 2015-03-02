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
@property NSInteger typeKey;
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

@end
