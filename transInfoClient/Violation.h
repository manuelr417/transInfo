//
//  Violation.h
//  transinfo
//
//  Created by Omar Soto Fortuño on 3/16/15.
//  Copyright (c) 2015 University of Puerto Rico Mayagüez Campus. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Violation : NSObject

@property NSString *violationCodeField;
@property NSString *lawArticleField;
@property NSDate *courtCitationDateField;
@property NSDate *courtCitationHourField;

@end
