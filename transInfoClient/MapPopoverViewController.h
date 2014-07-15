//
//  MapPopoverViewController.h
//  transinfo
//
//  Created by Omar Soto Fortuño on 7/7/14.
//  Copyright (c) 2014 University of Puerto Rico Mayagüez Campus. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MapKit/MapKit.h"
#import <CoreLocation/CoreLocation.h>

@interface MapPopoverViewController : UIViewController <MKMapViewDelegate, CLLocationManagerDelegate>

@property CLLocationManager *locationManager;
@property CLLocationCoordinate2D coords;

@end