//
//  ReportInvolvedUnit+CoreDataProperties.h
//  transinfo
//
//  Created by Omar G Soto Fortuño on 10/18/15.
//  Copyright © 2015 University of Puerto Rico Mayagüez Campus. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "ReportInvolvedUnit.h"

NS_ASSUME_NONNULL_BEGIN

@interface ReportInvolvedUnit (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *vehicleQuantity;
@property (nullable, nonatomic, retain) NSString *motoristQuantity;
@property (nullable, nonatomic, retain) NSString *pedestrianQuantity;
@property (nullable, nonatomic, retain) NSString *injuredQuantity;
@property (nullable, nonatomic, retain) NSString *fatalitiesQuantity;
@property (nullable, nonatomic, retain) Report *report;

@end

NS_ASSUME_NONNULL_END
