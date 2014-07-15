//
//  ReportFirstStepViewController.m
//  transinfo
//
//  Created by Omar Soto Fortuño on 7/7/14.
//  Copyright (c) 2014 University of Puerto Rico Mayagüez Campus. All rights reserved.
//

#import "ReportFirstStepViewController.h"
#import "MapPopoverViewController.h"

@interface ReportFirstStepViewController ()
@property (weak, nonatomic) IBOutlet UITextField *latitudeOutlet;
@property (weak, nonatomic) IBOutlet UITextField *longitudeOutlet;

@end

@implementation ReportFirstStepViewController

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
    
    // Uneditable Fields...
    [self.latitudeOutlet setUserInteractionEnabled:NO];
    [self.longitudeOutlet setUserInteractionEnabled:NO];
    
    // Hardcoded values of Hospedaje Mayaguez
    self.coords = CLLocationCoordinate2DMake(18.205290, -67.136427);
    [self updateCoords];
}

- (void)viewDidAppear:(BOOL)animated {
    NSLog(@"jksjks");
}

- (void)viewWillAppear:(BOOL)animated {
    NSLog(@"Aparece!");
}

- (void)updateCoords {
    self.latitudeOutlet.text = [NSString stringWithFormat:@"%f", self.coords.latitude];
    self.longitudeOutlet.text = [NSString stringWithFormat:@"%f", self.coords.longitude];
    
    NSLog(@" lat: %f, %@", self.coords.latitude, self.latitudeOutlet.text);
    NSLog(@" lon: %f, %@", self.coords.longitude, self.longitudeOutlet.text);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)receiveNotification:(NSNotification*)notification {
    if ([[notification name] isEqualToString:@"popoverUpdatedCoords"]) {
        NSLog(@"Recibiendo nuevas coords!");
        
        self.coords = CLLocationCoordinate2DMake([(NSNumber*)[[notification userInfo] objectForKey:@"latitude"] doubleValue], [(NSNumber*)[[notification userInfo] objectForKey:@"longitude"] doubleValue]);
        [self updateCoords];
        
        NSLog(@"Se recibió...");
        NSLog(@" lat: %f", self.coords.latitude);
        NSLog(@" lon: %f", self.coords.longitude);
        
        //[self setCoords:CLLocationCoordinate2DMake((NSNumber*)[[notification userInfo] objectForKey:@"latitude"], [[notification userInfo] objectForKey:@"longitude"])]
    } else if ([[notification name] isEqualToString:@"popoverClosed"]) {
        NSLog(@"se cerro!");
        [self updateCoords];
    }
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if ([[segue identifier]  isEqualToString: @"locationPopover"]) {
        //NSLog(@"Opening pop");
        //[[NSNotificationCenter defaultCenter] postNotificationName:@"Step1 Coords" object:self];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveNotification:) name:@"popoverUpdatedCoords" object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveNotification:) name:@"popoverClosed" object:nil];
        
        MapPopoverViewController *destinationController = [segue destinationViewController];
        destinationController.coords = self.coords;
        
        //destinationController.coords
    }
}

@end
