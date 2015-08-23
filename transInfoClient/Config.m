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
//NSString *const urlAPI = @"http://10.10.30.9:9000/";
NSString *const urlAPI = @"http://136.145.216.130:80/";
#else
//NSString *const urlAPI = @"http://127.0.0.1:9000/";
NSString *const urlAPI = @"http://136.145.216.130:80/";
#endif

NSString *const edmundsAPIKey = @"qfqgf76tf8qbpxdtce36gm2z";
NSString *const edmundsVINDecoder = @"https://api.edmunds.com/v1/api/toolsrepository/vindecoder?vin=%@&fmt=json&api_key=%@";

@implementation Config

@end
