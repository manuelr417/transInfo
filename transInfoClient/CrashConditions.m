//
//  CrashConditions.m
//  transinfo
//
//  Created by Omar Soto Fortuño on 5/11/15.
//  Copyright (c) 2015 University of Puerto Rico Mayagüez Campus. All rights reserved.
//

#import "CrashConditions.h"
#import "restComm.h"
#import "CrashSummary.h"

@implementation CrashConditions

- (id)init {
    self = [super init];
    
    if (self) {
        self.reportConditionsID = @"-1";
    }
    
    return self;
}

- (NSMutableDictionary*)getDictionary {
    NSMutableDictionary *postData = [[NSMutableDictionary alloc] init];
    
    NSString *reportID = ((CrashSummary*)self.crashSummary).reportID;
    NSMutableArray *weatherConditions = [[NSMutableArray alloc] init];
    
    // TODO: Remove when upgrading 2nd Tab (and Change to Array)
    if (self.weatherCondition1Key != nil)
        [weatherConditions addObject:self.weatherCondition1Key];
    if (self.weatherCondition2Key != nil)
        [weatherConditions addObject:self.weatherCondition2Key];
   
    postData[@"ReportID"] = reportID;
    
    postData[@"ReportConditionID"] = (self.reportConditionsID != nil) ? self.reportConditionsID : @"";
    postData[@"FirstHarmfulEventTypeID"] = (self.firstHarmfulEventTypeKey != nil) ? self.firstHarmfulEventTypeKey : @"";
    postData[@"FirstHarmfulEventID"] = (self.firstHarmfulEventKey != nil) ? self.firstHarmfulEventKey : @"";
    postData[@"RelToTrafficwayID"] = (self.relToTrafficwayKey != nil) ? self.relToTrafficwayKey : @"";
    postData[@"MannerOfCollisionID"] = (self.mannerOfCollisionKey != nil) ? self.mannerOfCollisionKey : @"";
    
    postData[@"WeatherConditions"] = weatherConditions;
    postData[@"LightingConditionID"] = (self.lightingConditionKey != nil) ? self.lightingConditionKey : @"";
    postData[@"RoadSurfaceConditionID"] = (self.roadSurfaceConditionKey != nil) ? self.roadSurfaceConditionKey : @"";
    postData[@"EnvironmentCircumstanceID"] = (self.environmentCircumstanceKey != nil) ? self.environmentCircumstanceKey : @"";
    postData[@"RoadCircumstanceID"] = (self.roadCircumstanceKey != nil) ? self.roadCircumstanceKey : @"";
    
    postData[@"WithinInterchangeID"] = (self.withinInterchangeKey != nil) ? self.withinInterchangeKey : @"";
    postData[@"JunctionID"] = (self.junctionKey != nil) ? self.junctionKey : @"";
    postData[@"IntersectionTypeID"] = (self.intersectionTypeKey != nil) ? self.intersectionTypeKey : @"";
    postData[@"SchoolBusRelatedID"] = (self.schoolBusRelatedKey != nil) ? self.schoolBusRelatedKey : @"";
    
    postData[@"WorkzoneRelatedID"] = (self.workzoneRelatedKey != nil) ? self.workzoneRelatedKey : @"";
    postData[@"WorkzoneLocationID"] = (self.workzoneLocationKey != nil) ? self.workzoneLocationKey : @"";
    postData[@"WorkzoneTypeID"] = (self.workzoneTypeKey != nil) ? self.workzoneTypeKey : @"";
    postData[@"WorkersPresentID"] = (self.workersPresentKey != nil) ? self.workersPresentKey : @"";
    postData[@"LawEnforcementPresentID"] = (self.lawEnforcementPresentKey != nil) ? self.lawEnforcementPresentKey : @"";
    
    postData[@"Narrative"] = (self.narrative != nil) ? self.narrative : @"";
    
    return postData;
}

- (void)save {
    restComm *conn;
    
    NSString *reportID = ((CrashSummary*)self.crashSummary).reportID;
    
    if ([reportID isEqualToString:@"-1"]) {
        return;
    }
    
    if ([self.reportConditionsID isEqualToString:@"-1"]) {
        conn = [[restComm alloc] initWithURL:[NSString stringWithFormat:@"%@%@", urlAPI, @"reportConditions"] withMethod:POST];
    } else {
        conn = [[restComm alloc] initWithURL:[NSString stringWithFormat:@"%@%@/%@", urlAPI, @"reportConditions", self.reportConditionsID] withMethod:PUT];
    }
    
    [conn setDataToRequest:[self getDictionary]];
    [conn setDelegate:self];
    
    [conn makeCall];
}

- (void)receivedData:(NSDictionary *)data {
    NSLog(@"%@", data);
    if (data[@"success"]) {
        if ([self.reportConditionsID isEqualToString:@"-1"])
            self.reportConditionsID = [NSString stringWithFormat:@"%@", data[@"payload"]];
        NSLog(@"Saving Report Condition ID: %@", self.reportConditionsID);
    }
}

- (void)receivedError:(NSError *)error {
    
}

@end
