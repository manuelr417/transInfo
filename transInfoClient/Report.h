//
//  Report.h
//  transinfo
//
//  Created by Omar Soto Fortuño on 8/17/15.
//  Copyright (c) 2015 University of Puerto Rico Mayagüez Campus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Report : NSManagedObject

@property (nonatomic, retain) NSString * caseNumber;
@property (nonatomic, retain) NSDate * crashDate;
@property (nonatomic, retain) NSDate * crashTime;
@property (nonatomic, retain) NSDate * createdOn;
@property (nonatomic, retain) NSNumber * locationID;
@property (nonatomic, retain) NSNumber * officerUserID;
@property (nonatomic, retain) NSNumber * propertyID;
@property (nonatomic, retain) NSNumber * reportID;
@property (nonatomic, retain) NSNumber * reportTypeID;
@property (nonatomic, retain) NSNumber * zoneTypeID;

@end
