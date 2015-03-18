//
//  Violation.m
//  transinfo
//
//  Created by Omar Soto Fortuño on 3/16/15.
//  Copyright (c) 2015 University of Puerto Rico Mayagüez Campus. All rights reserved.
//

#import "Violation.h"

@implementation Violation

@synthesize violationCode;
@synthesize lawArticle;
@synthesize courtCitationDate;
@synthesize courtCitationTime;

@synthesize uuid;

- (id)init {
    self = [super init];
    
    if (self) {
        
    }
    
    return self;
}

@end
