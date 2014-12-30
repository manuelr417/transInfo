//
//  Utilities.m
//  transinfo
//
//  Created by Omar Soto Fortuño on 8/21/14.
//  Copyright (c) 2014 University of Puerto Rico Mayagüez Campus. All rights reserved.
//

#import "Utilities.h"


@implementation Utilities

+ (void)displayAlertWithMessage:(NSString*)message withTitle:(NSString*)title {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title
                                                    message:message
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
}

+ (NSDate*)NSDateWithMySQLDate:(NSString *)rfc3339DateTimeString {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss.SSS"];
    [formatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
    
    return [formatter dateFromString:rfc3339DateTimeString];
}

+ (NSString*)actualLanguage {
    NSString *lang = [[[NSBundle mainBundle] preferredLocalizations] objectAtIndex:0];
    return lang;
}

+ (NSString*)collectionColumn {
    return ([[self actualLanguage] isEqualToString:@"es"]) ? @"DescriptionES" : @"DescriptionEN";
}

@end
