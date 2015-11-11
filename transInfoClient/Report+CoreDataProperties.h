//
//  Report+CoreDataProperties.h
//  transinfo
//
//  Created by Omar G Soto Fortuño on 10/18/15.
//  Copyright © 2015 University of Puerto Rico Mayagüez Campus. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Report.h"

NS_ASSUME_NONNULL_BEGIN

@interface Report (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *caseNumber;
@property (nullable, nonatomic, retain) NSDate *crashDate;
@property (nullable, nonatomic, retain) NSDate *crashTime;
@property (nullable, nonatomic, retain) NSDate *createdOn;
@property (nullable, nonatomic, retain) NSString *locationID;
@property (nullable, nonatomic, retain) NSString *officerUserID;
@property (nullable, nonatomic, retain) NSString *propertyID;
@property (nullable, nonatomic, retain) NSString *reportID;
@property (nullable, nonatomic, retain) NSString *reportTypeID;
@property (nullable, nonatomic, retain) NSString *zoneTypeID;
@property (nullable, nonatomic, retain) ReportInvolvedUnit *reportInvolvedUnit;

@end

NS_ASSUME_NONNULL_END
