//
//  ReportFirstStepViewController.m
//  transinfo
//
//  Created by Omar Soto Fortuño on 7/7/14.
//  Copyright (c) 2014 University of Puerto Rico Mayagüez Campus. All rights reserved.
//

#import "ReportFirstStepViewController.h"
#import "MapPopoverViewController.h"
#import <GoogleMaps/GoogleMaps.h>
#import "UIDatePickerOKView.h"
#import "PickerViewController.h"
#import "CollectionManager.h"
#import "SWRevealViewController.h"
#import "Utilities.h"
#import "CrashSummary.h"

@interface ReportFirstStepViewController ()

- (void)setCrashDateFormat;
- (void)setCrashHourFormat;
//- (void)showPickerView:(NSMutableDictionary*)elements withField:(UITextField*)field withLookupButton:(UIButton*)button withOutField:(NSString*)outField;

@property (weak, nonatomic) IBOutlet UITextField *caseIdentifierField;
@property (weak, nonatomic) IBOutlet UITextField *latitudeField;
@property (weak, nonatomic) IBOutlet UITextField *longitudeField;
@property (weak, nonatomic) IBOutlet UITextField *crashDateField;
@property (weak, nonatomic) IBOutlet UITextView *addressField;
@property (weak, nonatomic) IBOutlet UITextField *crashTimeField;
@property (weak, nonatomic) IBOutlet UISwitch *unknownHourSwitch;
@property (weak, nonatomic) IBOutlet UIButton *reportTypeLookupButton;
@property (weak, nonatomic) IBOutlet UITextField *reportTypeField;
@property (weak, nonatomic) IBOutlet UITextField *cityField;
@property (weak, nonatomic) IBOutlet UIButton *cityButton;
@property (weak, nonatomic) IBOutlet UITextField *countyField;
@property (weak, nonatomic) IBOutlet UIButton *countyButton;
@property (weak, nonatomic) IBOutlet UITextField *vehiclesQuantityField;
@property (weak, nonatomic) IBOutlet UITextField *pedestriansQuantityField;
@property (weak, nonatomic) IBOutlet UITextField *injuredQuantityField;
@property (weak, nonatomic) IBOutlet UITextField *fatalitiesQuantityField;
@property (weak, nonatomic) IBOutlet UITextField *nearToLocationField;
@property (weak, nonatomic) IBOutlet UIButton *nearToLocationButton;
@property (weak, nonatomic) IBOutlet UITextField *intersectingStreetField;
@property (weak, nonatomic) IBOutlet UITextField *distanceField;
@property (weak, nonatomic) IBOutlet UITextField *measurementField;
@property (weak, nonatomic) IBOutlet UIButton *measurementButton;
@property (weak, nonatomic) IBOutlet UITextField *directionField;
@property (weak, nonatomic) IBOutlet UIButton *directionButton;
@property (weak, nonatomic) IBOutlet UITextField *propertyField;
@property (weak, nonatomic) IBOutlet UIButton *propertyButton;
@property (weak, nonatomic) IBOutlet UITextField *locationField;
@property (weak, nonatomic) IBOutlet UIButton *locationButton;

@property UIView *activeField;

@property (nonatomic, strong) PickerViewController *pickerView;
@property (nonatomic, strong) UIPopoverController *pickerPopover;

@property NSDate *crashDate;
@property NSDate *crashTime;
@property BOOL crashTimeUnknown;
@property (nonatomic, strong) NSString *reportType;
@property (nonatomic, strong) NSString *city;
@property (nonatomic, strong) NSString *county;

@property NSMutableDictionary *collections;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *sidebarButton;

@end

@implementation ReportFirstStepViewController

- (void)keysSelected:(NSArray *)keys withIdentifier:(NSString *)identifier withOutField:(UITextField *)outField {
    CrashSummary *crashSummary = [CrashSummary sharedCrashSummary];
    
    if ([keys count] == 0) {
        return;
    }
    
    //NSLog(@"%@ = %@", identifier, keys[0]);
    
    if (outField == self.reportTypeField) {
        crashSummary.reportTypeID = keys[0];
    } else if (outField == self.cityField) {
        crashSummary.cityID = keys[0];
    } else if (outField == self.countyField) {
        crashSummary.countyID = keys[0];
    } else if (outField == self.nearToLocationField) {
        crashSummary.nearToID = keys[0];
    } else if (outField == self.measurementField) {
        crashSummary.measurementID = keys[0];
    } else if (outField == self.directionField) {
        crashSummary.directionID = keys[0];
    } else if (outField == self.propertyField) {
        crashSummary.propertyID = keys[0];
    } else if (outField == self.locationField) {
        crashSummary.locationID = keys[0];
    }
    
    [crashSummary save];
}

- (void)viewDidLoad {
    [(UIScrollView *)self.view setContentSize:CGSizeMake(700,700)];
    [self registerForKeyboardNotifications];
    [self loadCollections];
    
    // Set the side bar button action. When it's tapped, it'll show up the sidebar.
    self.sidebarButton.target = self.revealViewController;
    self.sidebarButton.action = @selector(revealToggle:);
    
    // Set the gesture
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    
    // Delegates
    self.caseIdentifierField.delegate = self;
    self.addressField.delegate = self;
    self.vehiclesQuantityField.delegate = self;
    self.pedestriansQuantityField.delegate = self;
    self.injuredQuantityField.delegate = self;
    self.fatalitiesQuantityField.delegate = self;
    self.intersectingStreetField.delegate = self;
    self.distanceField.delegate = self;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    NSString *postText = [textField.text stringByReplacingCharactersInRange:range withString:string];
    
    //NSLog(@"%@", postText);
    
    /*self.pedestriansQuantityField.delegate = self;
    self.injuredQuantityField.delegate = self;
    self.fatalitiesQuantityField.delegate = self;*/
    
    CrashSummary *crashSummary = [CrashSummary sharedCrashSummary];
    
    if (textField == self.caseIdentifierField) {
        crashSummary.caseNumber = postText;
    } else if (textField == self.vehiclesQuantityField) {
        crashSummary.totalMotorizedUnits = postText;
    } else if (textField == self.intersectingStreetField) {
        crashSummary.intersectingStreet = postText;
    } else if (textField == self.distanceField) {
        crashSummary.distance = postText;
    }
    
    return YES;
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    NSString *postText = [textView.text stringByReplacingCharactersInRange:range withString:text];
    
    CrashSummary *crashSummary = [CrashSummary sharedCrashSummary];
    crashSummary.streetHighway = postText;
    
    return YES;
}

- (void)loadCollections {
    self.collections = [[NSMutableDictionary alloc] init];
    
    NSArray *collectionNames = @[@"cities", @"counties", @"directions", @"locations", @"measurements", @"nearTo", @"properties", @"reportTypes"];
    NSMutableArray *collectionsManagers = [[NSMutableArray alloc] init];
    int i = 0;
    
    for (NSString *collectionName in collectionNames) {
        [self.collections setObject:[NSDate date] forKey:collectionName];
        [collectionsManagers addObject:[[CollectionManager alloc] init]];
        ((CollectionManager*)collectionsManagers[i]).delegate = self;
        
        [collectionsManagers[i] getCollection:collectionName];
        
        i++;
    }
}

- (void)receivedCollection:(NSArray *)collection withName:(NSString *)collectionName {
    [self.collections setObject:collection forKey:collectionName];
    
    NSLog(@"Received Collection: %@ (%lu elements)", collectionName, (unsigned long)[collection count]);
    
    /*for (NSDictionary *elem in collection) {
     NSLog(@"%@", elem[@"DescriptionES"]);
     }*/
}

- (void)viewWillAppear:(BOOL)animated {
    // Things to do BEFORE Loading the VIEW
    
    // Load Location Manager if it hasn't been loaded
    if (self.locationManager == nil) {
        self.locationManager = [[CLLocationManager alloc] init];
        self.locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters;
        self.locationManager.delegate = self;
        
        [self.locationManager requestAlwaysAuthorization];
        [self.locationManager startUpdatingLocation];
    }
    
    // Border for Address Label
    [self.addressField.layer setBorderColor:[[[UIColor grayColor] colorWithAlphaComponent:0.5] CGColor]];
    [self.addressField.layer setBorderWidth:0.50];
    self.addressField.layer.cornerRadius = 5;
    self.addressField.clipsToBounds = YES;
    
    // Default Date and Time for Crash Report
    self.crashDate = [NSDate date];
    self.crashTime = [NSDate date];
    
    [self setCrashDateFormat];
    [self setCrashHourFormat];
    
    self.reportTypeField.delegate = self;
    self.countyField.delegate = self;
    self.cityField.delegate = self;
    self.nearToLocationField.delegate = self;
    self.measurementField.delegate = self;
    self.directionField.delegate = self;
    self.propertyField.delegate = self;
    self.locationField.delegate = self;
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    CLLocation *loc = [locations lastObject];
    [self.locationManager stopUpdatingLocation];
    
    self.coords = loc.coordinate;
    [self updateCoords];
}

- (void)updateCoords {
    //NSLog(@"Get coords!");
    self.latitudeField.text = [NSString stringWithFormat:@"%f", self.coords.latitude];
    self.longitudeField.text = [NSString stringWithFormat:@"%f", self.coords.longitude];
    
    GMSGeocoder *geocoder = [GMSGeocoder geocoder];
    [geocoder reverseGeocodeCoordinate:self.coords
                     completionHandler:^(GMSReverseGeocodeResponse *response, NSError *error) {
                         //NSLog(@"%@", response);
                         self.addressField.text = [response.firstResult.lines componentsJoinedByString:@"\n"];
                     }];
}

- (IBAction)crashDateEditingDidBegin:(id)sender {
    UIDatePickerOKView *customPicker = [[[NSBundle mainBundle] loadNibNamed:@"UIPickerOKView" owner:self options:nil] objectAtIndex:0];
    
    customPicker.datePicker.date = self.crashDate;
    customPicker.datePicker.datePickerMode = UIDatePickerModeDate;
    [customPicker.datePicker addTarget:self action:@selector(datePickerValueChanged:) forControlEvents:UIControlEventValueChanged];
    
    customPicker.parent = self.crashDateField;
    
    self.crashDateField.inputView = customPicker;
}

- (IBAction)datePickerValueChanged:(id)sender {
    NSDate *pickerDate = [sender date];
    self.crashDate = pickerDate;
    
    [self setCrashDateFormat];
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    [self.view endEditing:YES];
    
    if (textField == self.reportTypeField) {
        [self reportTypeButtonTouchUpInside:textField];
        return NO;
    } else if (textField == self.cityField) {
        [self cityButtonTouchUpInside:textField];
        return NO;
    } else if (textField == self.countyField) {
        [self countyButtonTouchUpInside:textField];
        return NO;
    } else if (textField == self.nearToLocationField) {
        [self nearToLocationButtonTouchUpInside:textField];
        return NO;
    } else if (textField == self.measurementField) {
        [self measurementButtonTouchUpInside:textField];
        return NO;
    } else if (textField == self.directionField) {
        [self directionButtonTouchUpInside:textField];
        return NO;
    } else if (textField == self.propertyField) {
        [self propertyButtonTouchUpInside:textField];
        return NO;
    } else if (textField == self.locationField) {
        [self locationButtonTouchUpInside:textField];
        return NO;
    }
    
    return YES;
}

- (IBAction)reportTypeButtonTouchUpInside:(id)sender {
    [self showCollection:@"reportTypes" withIDColumn:@"ReportTypeID" withField:self.reportTypeField];
}

- (IBAction)showCollection:(NSString*)collectionName withIDColumn:(NSString*)IDColumn withField:(id)field {
    if ([self.collections[collectionName] isKindOfClass:[NSArray class]]) {
        NSMutableDictionary *collection = [[NSMutableDictionary alloc] init];
        
        for (NSDictionary *elem in self.collections[collectionName]) {
            [collection setObject:(NSString*)[elem objectForKey:[Utilities collectionColumn]] forKey:[NSString stringWithFormat:@"%@", [elem objectForKey:IDColumn]]];
        }
        
        //NSLog(@"%@", reportTypes);
        
        //[self showPickerView:collection withField:field withLookupButton:self.reportTypeLookupButton withOutField:field];
        
        [self showPickerView:collection withField:field withIdentifier:collectionName withMultipleChoice:NO withSelectedElements:[[NSMutableArray alloc] init] withSelectedLimit:@0];
    } else {
        NSLog(@"No collection yet... %@ ... %@ ...", collectionName, self.collections[collectionName]);
        CollectionManager *collManager = [[CollectionManager alloc] init];
        [collManager getCollection:collectionName];
        collManager.delegate = self;
    }
}

- (IBAction)cityButtonTouchUpInside:(id)sender {
    [self showCollection:@"cities" withIDColumn:@"CityID" withField:self.cityField];
}

- (IBAction)countyButtonTouchUpInside:(id)sender {
    [self showCollection:@"counties" withIDColumn:@"CountyID" withField:self.countyField];
}

- (IBAction)nearToLocationButtonTouchUpInside:(id)sender {
    [self showCollection:@"nearTo" withIDColumn:@"NearToID" withField:self.nearToLocationField];
}
- (IBAction)measurementButtonTouchUpInside:(id)sender {
    [self showCollection:@"measurements" withIDColumn:@"MeasurementID" withField:self.measurementField];
}
- (IBAction)directionButtonTouchUpInside:(id)sender {
    [self showCollection:@"directions" withIDColumn:@"DirectionID" withField:self.directionField];
}
- (IBAction)propertyButtonTouchUpInside:(id)sender {
    [self showCollection:@"properties" withIDColumn:@"PropertyID" withField:self.propertyField];
}
- (IBAction)locationButtonTouchUpInside:(id)sender {
    [self showCollection:@"locations" withIDColumn:@"LocationID" withField:self.locationField];
}

- (void)showPickerView:(NSMutableDictionary*)elements withField:(UITextField*)field withIdentifier:(NSString*)identifier withMultipleChoice:(BOOL)isMultipleChoice withSelectedElements:(NSMutableArray*)selectedElements withSelectedLimit:(NSNumber*)selectedLimit {
    self.pickerView = [[PickerViewController alloc] initWithStyle:UITableViewStylePlain withElementsDictionary:elements withMultipleChoice:isMultipleChoice];
    self.pickerPopover = [[UIPopoverController alloc] initWithContentViewController:self.pickerView];
    
    self.pickerView.delegate = self;
    self.pickerView.outField = field;
    self.pickerView.popover = self.pickerPopover;
    [self.pickerView setIdentifier:identifier];
    if (selectedLimit != nil) {
        [self.pickerView setSelectedLimit:selectedLimit];
    }
    
    if (selectedElements != nil) {
        [self.pickerView setSelectedElements:selectedElements];
    }
    
    [self.pickerPopover presentPopoverFromRect:field.bounds inView:field permittedArrowDirections:UIPopoverArrowDirectionUnknown animated:YES];
}


- (IBAction)crashTimeEditingDidBegin:(id)sender {
    UIDatePickerOKView *customPicker = [[[NSBundle mainBundle] loadNibNamed:@"UIPickerOKView" owner:self options:nil] objectAtIndex:0];
    
    customPicker.datePicker.date = self.crashTime;
    customPicker.datePicker.datePickerMode = UIDatePickerModeTime;
    [customPicker.datePicker addTarget:self action:@selector(timePickerValueChanged:) forControlEvents:UIControlEventValueChanged];
    
    customPicker.parent = self.crashTimeField;
    
    self.crashTimeField.inputView = customPicker;
}

- (IBAction)timePickerValueChanged:(id)sender {
    NSDate *pickerDate = [sender date];
    self.crashTime = pickerDate;
    
    [self setCrashHourFormat];
}

- (void)setCrashDateFormat {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"yyyy-MM-dd";
    
    self.crashDateField.text = [dateFormatter stringFromDate:self.crashDate];
}

- (void)setCrashHourFormat {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"hh:mm a";
    
    self.crashTimeField.text = [dateFormatter stringFromDate:self.crashTime];
}

- (IBAction)unknownHourSwitchValueChanged:(id)sender {
    if ([self.unknownHourSwitch isOn]) {
        self.crashTimeField.text = @"";
        self.crashTimeField.enabled = NO;
        
        self.crashTimeUnknown = YES;
    } else {
        [self setCrashHourFormat];
        self.crashTimeField.enabled = YES;
        
        self.crashTimeUnknown = NO;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)receiveNotification:(NSNotification*)notification {
    if ([[notification name] isEqualToString:@"popoverUpdatedCoords"]) {
        self.coords = CLLocationCoordinate2DMake([(NSNumber*)[[notification userInfo] objectForKey:@"latitude"] doubleValue], [(NSNumber*)[[notification userInfo] objectForKey:@"longitude"] doubleValue]);
        
        [self updateCoords];
    } else if ([[notification name] isEqualToString:@"popoverClosed"]) {
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
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveNotification:) name:@"popoverUpdatedCoords" object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveNotification:) name:@"popoverClosed" object:nil];
        
        MapPopoverViewController *destinationController = [segue destinationViewController];
        destinationController.coords = self.coords;
    }
    
}

- (void)registerForKeyboardNotifications
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillBeHidden:)
                                                 name:UIKeyboardWillHideNotification object:nil];
}

// Called when the UIKeyboardWillShowNotification is sent.
- (void)keyboardWillShow:(NSNotification*)aNotification
{
    if ([self.vehiclesQuantityField isFirstResponder]) {
        self.activeField = self.vehiclesQuantityField;
    } else if ([self.pedestriansQuantityField isFirstResponder]) {
        self.activeField = self.pedestriansQuantityField;
    } else if ([self.injuredQuantityField isFirstResponder]) {
        self.activeField = self.injuredQuantityField;
    } else if ([self.fatalitiesQuantityField isFirstResponder]) {
        self.activeField = self.fatalitiesQuantityField;
    } else if ([self.addressField isFirstResponder]) {
        self.activeField = self.addressField;
    } else if ([self.intersectingStreetField isFirstResponder]) {
        self.activeField = self.intersectingStreetField;
    } else if ([self.distanceField isFirstResponder]) {
        self.activeField = self.distanceField;
    } else {
        return;
    }
    
    UIScrollView *scrollView = (UIScrollView*)self.view;
    NSDictionary* info = [aNotification userInfo];
    CGSize kbSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    
    UIEdgeInsets contentInsets = UIEdgeInsetsMake(0.0, 0.0, kbSize.height, 0.0);
    scrollView.contentInset = contentInsets;
    scrollView.scrollIndicatorInsets = contentInsets;
    
    // If active text field is hidden by keyboard, scroll it so it's visible
    // Your app might not need or want this behavior.
    CGRect aRect = self.view.frame;
    aRect.size.height -= kbSize.height;
    if (!CGRectContainsPoint(aRect, self.activeField.frame.origin) ) {
        [scrollView scrollRectToVisible:self.activeField.frame animated:YES];
    }
}

// Called when the UIKeyboardWillHideNotification is sent
- (void)keyboardWillBeHidden:(NSNotification*)aNotification
{
    UIScrollView* scrollView = (UIScrollView*)self.view;
    
    UIEdgeInsets contentInsets = UIEdgeInsetsZero;
    scrollView.contentInset = contentInsets;
    scrollView.scrollIndicatorInsets = contentInsets;
    
    self.activeField = nil;
}

@end
