//
//  CurrentLocationPin.m
//  transinfo
//
//  Created by Omar Soto Fortuño on 7/7/14.
//  Copyright (c) 2014 University of Puerto Rico Mayagüez Campus. All rights reserved.
//

#import "CurrentLocationPin.h"

@implementation CurrentLocationPin

@synthesize title, subtitle, coordinate, identifier;

- (id)initWithLocation:(CLLocationCoordinate2D)coords {
    self = [super init];
    
    if (self) {
        self.coordinate = coords;
    }
    
    return self;
}

@end
