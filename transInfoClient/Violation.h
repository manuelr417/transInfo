//
//  Violation.h
//  transinfo
//
//  Created by Omar Soto Fortuño on 3/16/15.
//  Copyright (c) 2015 University of Puerto Rico Mayagüez Campus. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Violation : NSObject

@property NSString *violationCode;
@property NSString *lawArticle;
@property NSDate *courtCitationDate;
@property NSDate *courtCitationTime;

@property NSString *uuid;

@end
