//
//  CrashSummary.m
//  transinfo
//
//  Created by Omar Soto Fortuño on 10/6/14.
//  Copyright (c) 2014 University of Puerto Rico Mayagüez Campus. All rights reserved.
//

#import "CrashSummary.h"

@implementation CrashSummary

- (id)init {
    self = [super init];
    
    if (self) {
        self.reportTypeID = @-1;
        self.crashTimeUnknown = NO;
        self.creationDate = [NSDate date];
        
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        NSDictionary *loginInfo = [userDefaults objectForKey:@"login"];
        
        if (loginInfo != nil) {
            self.officerUserID = loginInfo[@"UserID"];
        }
    }
    
    return self;
}

- (NSMutableDictionary*)getDictionary {
    NSMutableDictionary *postData = [[NSMutableDictionary alloc] init];
  /*  [postData setValue:self.username.text forKey:@"username"];
    [postData setValue:self.password.text forKey:@"password"];*/
    /*
     @property NSNumber *reportID;
     @property NSNumber *reportTypeID;
     @property NSString *caseNumber;
     @property NSInteger *officerUserID;
     @property NSDate *crashDate;
     @property NSDate *crashTime;
     @property BOOL crashTimeUnknown;
     @property NSNumber *latitude;
     @property NSNumber *longitude;
     @property NSNumber *cityID;
     @property NSNumber *countyID;
     @property NSString *streetHighway;
     @property NSString *distance;
     @property NSNumber *measurementID;
     @property NSNumber *directionID;
     @property NSNumber *nearToID;
     @property NSString *intersectingStreet;
     @property NSNumber *propertyID;
     @property NSNumber *locationID;
     @property NSNumber *totalWitnesses;
     @property NSNumber *totalMotorizedUnits;
     @property NSNumber *totalNonMotorizedUnits;
     @property NSNumber *totalMotorists;
     @property NSNumber *totalNonMotorists;
     @property NSDate *creationDate;*/
    
    postData[@"ReportID"] = self.reportID;
    postData[@"ReportTypeID"] = self.reportTypeID;
    postData[@"CaseNumber"] = self.caseNumber;
    postData[@"OfficerUserID"] = self.officerUserID;
    postData[@"CrashDate"] = self.crashDate;
    postData[@"CrashTime"] = self.crashTime;
    postData[@"CrashTimeUnknown"] = (self.crashTimeUnknown == YES) ? @1 : @0;
    
    return postData;
}

@end
