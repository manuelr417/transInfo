//
//  CrashSummary.m
//  transinfo
//
//  Created by Omar Soto Fortuño on 10/6/14.
//  Copyright (c) 2014 University of Puerto Rico Mayagüez Campus. All rights reserved.
//

#import "CrashSummary.h"
#import "AppDelegate.h"

@implementation CrashSummary

@synthesize crashConditions;
@synthesize vehicles;
@synthesize individualPersons;


- (NSMutableArray*)fetchTheData
{
    NSMutableArray *reports = [[NSMutableArray alloc] init];
    
    //  create fetch object, this object fetch’s the objects out of the database
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Report" inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];
    NSError *error;
    NSArray *fetchedObjects = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    if (fetchedObjects != nil)
    {
        reports = [[NSMutableArray alloc]initWithArray:fetchedObjects];
        NSLog(@"%@", reports);
    }
    
    return reports;
}
/** CORE DATA **/

static dispatch_once_t onceToken;

- (id)init {
    self = [super init];
    
    if (self) {
        self.reportID = @"-1";
        self.reportTypeID = @"999";
        self.crashTimeUnknown = NO;
        self.creationDate = [NSDate date];
        
        self.propertyID = @"999";
        self.locationID = @"999";
        self.zoneTypeID = @"999";
        self.locationID = @"999";
        
        self.crashConditions = [[CrashConditions alloc] init];
        self.vehicles = [[NSMutableArray alloc] init];
        self.individualPersons = [[NSMutableArray alloc] init];
        
        self.crashConditions.crashSummary = self;
        
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        NSDictionary *loginInfo = [userDefaults objectForKey:@"login"];
        
        if (loginInfo != nil) {
            self.officerUserID = loginInfo[@"UserID"];
        }
    }
    
    return self;
}

+ (id)sharedCrashSummary {
    static CrashSummary *sharedCrashSummary = nil;
    //static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        
        sharedCrashSummary = [[self alloc] init];
        sharedCrashSummary.managedObjectContext = appDelegate.managedObjectContext;
    });
    return sharedCrashSummary;
}

+ (void)resetSharedCrashSummary {
    onceToken = 0;
}

- (NSMutableDictionary*)getDictionary {
    NSMutableDictionary *postData = [[NSMutableDictionary alloc] init];
    
    //NSLog(@"Crash Date: %@", self.crashDate);
    
    postData[@"ReportID"] = (self.reportID != nil) ? self.reportID : @"";
    postData[@"ReportTypeID"] = (self.reportTypeID != nil) ? self.reportTypeID : @"";
    postData[@"CaseNumber"] = (self.caseNumber != nil) ? self.caseNumber : @"";
    postData[@"OfficerUserID"] = (self.officerUserID != nil) ? self.officerUserID : @"";
    postData[@"CrashDate"] = (self.crashDate != nil) ? self.crashDate : @"";
    postData[@"CrashTime"] = (self.crashTime != nil) ? self.crashTime : @"";
    postData[@"CrashTimeUnknown"] = (self.crashTimeUnknown == YES) ? @1 : @0;
    postData[@"PropertyID"] = (self.propertyID != nil) ? self.propertyID : @"";
    postData[@"LocationID"] = (self.locationID != nil) ? self.locationID : @"";
    postData[@"ZoneTypeID"] = (self.zoneTypeID != nil) ? self.zoneTypeID : @"";
    
    postData[@"VehicleQuantity"] = (self.vehicleQuantity != nil) ? self.vehicleQuantity : @"";
    postData[@"MotoristQuantity"] = (self.motoristsQuantity != nil) ? self.motoristsQuantity : @"";
    postData[@"PedestrianQuantity"] = (self.pedestrianQuantity != nil) ? self.pedestrianQuantity : @"";
    postData[@"InjuredQuantity"] = (self.injuredQuantity != nil) ? self.injuredQuantity : @"";
    postData[@"FatalitiesQuantity"] = (self.fatalitiesQuantity != nil) ? self.fatalitiesQuantity : @"";
    
    postData[@"Latitude"] = (self.latitude != nil) ? self.latitude : @"";
    postData[@"Longitude"] = (self.longitude != nil) ? self.longitude : @"";
    postData[@"CityID"] = (self.cityID != nil) ? self.cityID : @"";
    postData[@"CountyID"] = (self.countyID != nil) ? self.countyID : @"";
    postData[@"StreetHighway"] = (self.streetHighway != nil) ? self.streetHighway : @"";
    postData[@"Distance"] = (self.distance != nil) ? self.distance : @"";
    postData[@"MeasurementID"] = (self.measurementID != nil) ? self.measurementID : @"";
    postData[@"DirectionID"] = (self.directionID != nil) ? self.directionID : @"";
    postData[@"NearToID"] = (self.nearToID != nil) ? self.nearToID : @"";
    postData[@"IntersectingStreet"] = (self.intersectingStreet != nil) ? self.intersectingStreet : @"";
    
    //NSLog(@"%@", postData);
    
    return postData;
}

- (void)coreDataSave {
    NSMutableDictionary *dict = [self getDictionary];
    
    NSError *error;
    NSManagedObject	*report;
    NSManagedObject *reportInvolvedUnit;
    
    if (self.coreDataObjectID != nil) {
        NSLog(@"Trying to load ObjectID: %@", self.coreDataObjectID);
        report = [self.managedObjectContext existingObjectWithID:[self coreDataObjectID] error:&error];
        
        reportInvolvedUnit = [report valueForKey:@"reportInvolvedUnit"];
       
        //reportInvolvedUnit = [self.managedObjectContext existingObjectWithID:[self coreDataObjectID] error:&error]
    } else {
        report = [NSEntityDescription insertNewObjectForEntityForName:@"Report" inManagedObjectContext:self.managedObjectContext];
        
        NSEntityDescription *entity = [NSEntityDescription entityForName:@"ReportInvolvedUnit" inManagedObjectContext:self.managedObjectContext];
        reportInvolvedUnit = [[NSManagedObject alloc] initWithEntity:entity insertIntoManagedObjectContext:self.managedObjectContext];
        
        //reportInvolvedUnit = [NSEntityDescription insertNewObjectForEntityForName:@"ReportInvolvedUnit" inManagedObjectContext:self.managedObjectContext];
    }
    
    [report setValue:dict[@"ReportID"] forKey:@"reportID"];
    [report setValue:dict[@"CaseNumber"] forKey:@"caseNumber"];
    [report setValue:dict[@"CrashDate"] forKey:@"crashDate"];
    [report setValue:dict[@"CrashTime"] forKey:@"crashTime"];
    [report setValue:[[NSDate alloc] init] forKey:@"createdOn"];
    [report setValue:dict[@"LocationID"] forKey:@"locationID"];
    [report setValue:[[NSString alloc] initWithFormat:@"%@", dict[@"OfficerUserID"]] forKey:@"officerUserID"];
    [report setValue:dict[@"PropertyID"] forKey:@"propertyID"];
    [report setValue:dict[@"ReportTypeID"] forKey:@"reportTypeID"];
    [report setValue:dict[@"ZoneTypeID"] forKey:@"zoneTypeID"];
    
    if (reportInvolvedUnit != nil) {
        [reportInvolvedUnit setValue:dict[@"VehicleQuantity"] forKey:@"vehicleQuantity"];
        [reportInvolvedUnit setValue:dict[@"MotoristQuantity"] forKey:@"motoristQuantity"];
        [reportInvolvedUnit setValue:dict[@"PedestrianQuantity"] forKey:@"pedestrianQuantity"];
        [reportInvolvedUnit setValue:dict[@"InjuredQuantity"] forKey:@"injuredQuantity"];
        [reportInvolvedUnit setValue:dict[@"FatalitiesQuantity"] forKey:@"fatalitiesQuantity"];
        
        [report setValue:reportInvolvedUnit forKey:@"reportInvolvedUnit"];
    }
    
    // here’s where the actual save happens, and if it doesn’t we print something out to the console
    if (![self.managedObjectContext save:&error]) {
        NSLog(@"Problem saving: %@", [error localizedDescription]);
    } else {
        self.coreDataObjectID = [report objectID];
        NSLog(@"Saved %@", [report objectID]);
    }
}

- (void)save {
    NSMutableDictionary *dict = [self getDictionary];

    [self coreDataSave];
    
    restComm *conn;
    
    if ([self.reportID isEqualToString:@"-1"]) {
        conn = [[restComm alloc] initWithURL:[NSString stringWithFormat:@"%@%@", urlAPI, @"reports"] withMethod:POST];
    } else {
        conn = [[restComm alloc] initWithURL:[NSString stringWithFormat:@"%@%@/%@", urlAPI, @"reports", self.reportID] withMethod:PUT];
    }
    
    [conn setDataToRequest:dict];
    [conn setDelegate:self];
    
    [conn makeCall];
}

- (void)receivedData:(NSDictionary *)data {
    //NSLog(@"%@", data);
    if (data[@"success"]) {
        if ([self.reportID isEqualToString:@"-1"])
            self.reportID = [NSString stringWithFormat:@"%@", data[@"payload"]];
        
        //NSLog(@"Saving Report ID: %@", self.reportID);
    }
}

- (void)receivedError:(NSError *)error {
    
}

- (Vehicle *)getVehicleWithUUID:(NSString *)uuid {
    for (Vehicle *v in self.vehicles) {
        if ([v.uuid isEqualToString:uuid]) {
            return v;
        }
    }
    
    return nil;
}

@end
