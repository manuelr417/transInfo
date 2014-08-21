//
//  Config.m
//  transinfo
//
//  Created by Omar Soto Fortuño on 8/20/14.
//  Copyright (c) 2014 University of Puerto Rico Mayagüez Campus. All rights reserved.
//

#import "Config.h"
#import "TargetConditionals.h"

#if !(TARGET_IPHONE_SIMULATOR)
    NSString *const urlAPI = @"http://Omars-MacBook-Pro-Transinfo.local:9000/";
#else
    NSString *const urlAPI = @"http://127.0.0.1:9000/";
#endif

@implementation Config

@end
