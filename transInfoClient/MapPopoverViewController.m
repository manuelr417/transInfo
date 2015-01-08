//
//  MapPopoverViewController.m
//  transinfo
//
//  Created by Omar Soto Fortuño on 7/7/14.
//  Copyright (c) 2014 University of Puerto Rico Mayagüez Campus. All rights reserved.
//

#import "MapPopoverViewController.h"
#import "MapKit/MapKit.h"
#import "CurrentLocationPin.h"

#define METERS_PER_MILE 1609.344

@interface MapPopoverViewController ()

@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UITextField *latitudeOutlet;
@property (weak, nonatomic) IBOutlet UITextField *longitudeOutlet;

@property BOOL firstMapLoad;

@end

@implementation MapPopoverViewController

CurrentLocationPin *pinAnnot;

@synthesize coords;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // Uneditable fields
    [self.latitudeOutlet setUserInteractionEnabled:NO];
    [self.longitudeOutlet setUserInteractionEnabled:NO];
    
    self.mapView.showsUserLocation = NO;
    self.mapView.delegate = self;
    self.mapView.mapType = MKMapTypeHybrid;
    
    if (self.locationManager == nil)
    {
        self.locationManager = [[CLLocationManager alloc] init];
        self.locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters;
        self.locationManager.delegate = self;
    }
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receivedNotification:) name:@"Step1 Coords" object:nil];
}

- (void)mapViewDidFinishLoadingMap:(MKMapView *)mapView {
    if (!self.firstMapLoad) {
        [self updateCurrentLocation:YES];
        self.firstMapLoad = YES;
    }
}

- (void)updateCurrentLocation:(BOOL)firstTime {
    // Update Coordinates on TextViews...
    self.latitudeOutlet.text = [NSString stringWithFormat:@"%f", self.coords.latitude];
    self.longitudeOutlet.text = [NSString stringWithFormat:@"%f", self.coords.longitude];
    
    if (firstTime) {
        // Zoom the map to the coordinates.
        MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(self.coords, 0.001*METERS_PER_MILE, 0.001*METERS_PER_MILE);
        MKCoordinateRegion adjustedRegion = [self.mapView regionThatFits:viewRegion];
        [self.mapView setRegion:adjustedRegion animated:YES];
        
        // Clean annotations
        [self.mapView removeAnnotations:self.mapView.annotations];
        
        pinAnnot = [[CurrentLocationPin alloc] initWithLocation:self.coords];
        pinAnnot.identifier = @"currentLocation";
        pinAnnot.title = @"Current Location";
        pinAnnot.subtitle = [[NSString alloc] initWithFormat:@"Lat: %f Lon: %f", self.coords.latitude, self.coords.longitude];
        
        [self.mapView addAnnotation:pinAnnot];
    } else {
        pinAnnot.coordinate = self.coords;
    }
    
    NSDictionary *dict = @{@"latitude" : [NSNumber numberWithFloat:self.coords.latitude] , @"longitude" : [NSNumber numberWithFloat:self.coords.longitude]};
    [[NSNotificationCenter defaultCenter] postNotificationName:@"popoverUpdatedCoords" object:nil userInfo:dict];
}


- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    CLLocation *loc = [locations lastObject];
    [self.locationManager stopUpdatingLocation];
    
    //NSLog(@" lat: %f", loc.coordinate.latitude);
    //NSLog(@" lon: %f", loc.coordinate.longitude);
    
    self.coords = loc.coordinate;
    [self updateCurrentLocation:NO];
}

- (MKAnnotationView*)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
    MKAnnotationView *annotView = [mapView dequeueReusableAnnotationViewWithIdentifier:@"loc"];
    
    if (annotView == nil) {
        annotView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"loc"];
    }
    
    annotView.draggable = YES;
    annotView.annotation = annotation;
    
    return annotView;
}

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view didChangeDragState:(MKAnnotationViewDragState)newState fromOldState:(MKAnnotationViewDragState)oldState {
    if (newState == MKAnnotationViewDragStateEnding) {
        CLLocationCoordinate2D droppedAt = view.annotation.coordinate;
        
        self.coords = droppedAt;
        [self updateCurrentLocation:NO];
    }
}

- (IBAction)getCurrentLocation:(id)sender {
    if ([sender tag] == 0) {
        [self.locationManager requestAlwaysAuthorization];
        [self.locationManager startUpdatingLocation];
    }
}

- (void)receivedNotification:(NSNotification*)notification {
    if ([[notification name] isEqualToString:@"Step1 Coords"]) {
        //NSLog(@"Received Coords from Step 1");
    }
}

- (void)dealloc {
    //NSLog(@"Bye!");
    //[[NSNotificationCenter defaultCenter] postNotificationName:@"popoverClosed" object:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
