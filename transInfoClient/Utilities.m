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
@end
