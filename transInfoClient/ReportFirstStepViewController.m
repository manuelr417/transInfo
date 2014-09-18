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

@interface ReportFirstStepViewController ()

- (void)setCrashDateFormat;
- (void)setCrashHourFormat;
- (void)showPickerView:(NSMutableDictionary*)elements withField:(UITextField*)field withLookupButton:(UIButton*)button withOutField:(NSString*)outField;

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
@property (weak, nonatomic) IBOutlet UITextField *locationField;
@property (weak, nonatomic) IBOutlet UIButton *locationButton;
@property (weak, nonatomic) IBOutlet UITextField *intersectingStreetField;
@property (weak, nonatomic) IBOutlet UITextField *distanceField;
@property (weak, nonatomic) IBOutlet UITextField *measurementField;
@property (weak, nonatomic) IBOutlet UIButton *measurementButton;
@property (weak, nonatomic) IBOutlet UITextField *directionField;
@property (weak, nonatomic) IBOutlet UIButton *directionButton;


@property UIView *activeField;

@property (nonatomic, strong) PickerViewController *pickerView;
@property (nonatomic, strong) UIPopoverController *pickerPopover;

@property NSDate *crashDate;
@property NSDate *crashTime;
@property BOOL crashTimeUnknown;
@property (nonatomic, strong) NSString *reportType;
@property (nonatomic, strong) NSString *city;
@property (nonatomic, strong) NSString *county;

@end

@implementation ReportFirstStepViewController

- (void)viewDidLoad {
    [(UIScrollView *)self.view setContentSize:CGSizeMake(700,700)];
    [self registerForKeyboardNotifications];
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
    
    // Buttons with Lookup Icon ( Lookup Icon by taken from https://github.com/alexharris/blue-blog-theme/tree/master/img )
    [self.reportTypeLookupButton setImage:[UIImage imageNamed:@"LookupIcon"] forState:UIControlStateNormal];
    [self.countyButton setImage:[UIImage imageNamed:@"LookupIcon"] forState:UIControlStateNormal];
    [self.cityButton setImage:[UIImage imageNamed:@"LookupIcon"] forState:UIControlStateNormal];
    [self.locationButton setImage:[UIImage imageNamed:@"LookupIcon"] forState:UIControlStateNormal];
    [self.measurementButton setImage:[UIImage imageNamed:@"LookupIcon"] forState:UIControlStateNormal];
    [self.directionButton setImage:[UIImage imageNamed:@"LookupIcon"] forState:UIControlStateNormal];
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
                         NSLog(@"%@", response);
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

- (IBAction)reportTypeButtonTouchUpInside:(id)sender {
    NSMutableDictionary *reportTypes = [[NSMutableDictionary alloc] init];
    
    [reportTypes setObject:@"Daño a la Propiedad" forKey:@"1"];
    [reportTypes setObject:@"Fatal" forKey:@"2"];
    [reportTypes setObject:@"Herido Grave" forKey:@"3"];
    [reportTypes setObject:@"Herido Leve" forKey:@"4"];
    [reportTypes setObject:@"Posible Herido" forKey:@"5"];
    
    [self showPickerView:reportTypes withField:self.reportTypeField withLookupButton:self.reportTypeLookupButton withOutField:self.reportType];
}

- (IBAction)cityButtonTouchUpInside:(id)sender {
    NSMutableDictionary *cities = [[NSMutableDictionary alloc] init];
    
    [cities setObject:@"Puerto Rico" forKey:@"72"];
    
    [self showPickerView:cities withField:self.cityField withLookupButton:self.cityButton withOutField:self.city];
}

- (IBAction)countyButtonTouchUpInside:(id)sender {
    NSMutableDictionary *counties = [[NSMutableDictionary alloc] init];
    
    // Orden alfabético
    
    [counties setObject:@"Hormigueros" forKey:@"67"];
    [counties setObject:@"Lajas" forKey:@"79"];
    [counties setObject:@"Mayagüez" forKey:@"97"];
    [counties setObject:@"San German" forKey:@"125"];
    
    [self showPickerView:counties withField:self.countyField withLookupButton:self.countyButton withOutField:self.county];
}

- (IBAction)locationButtonTouchUpInside:(id)sender {
    NSMutableDictionary *locations = [[NSMutableDictionary alloc] init];
    
    // Orden alfabético
    
    [locations setObject:@"Intersección" forKey:@"67"];
    [locations setObject:@"Calle" forKey:@"79"];
    [locations setObject:@"Puente" forKey:@"97"];
    [locations setObject:@"Otro" forKey:@"125"];
    
    [self showPickerView:locations withField:self.locationField withLookupButton:self.locationButton withOutField:self.county];
}
- (IBAction)measurementButtonTouchUpInside:(id)sender {
    NSMutableDictionary *measurements = [[NSMutableDictionary alloc] init];
    
    // Orden alfabético
    
    [measurements setObject:@"Pies" forKey:@"67"];
    [measurements setObject:@"Metros" forKey:@"79"];
    [measurements setObject:@"En Intersección" forKey:@"97"];
    
    [self showPickerView:measurements withField:self.measurementField withLookupButton:self.measurementButton withOutField:self.county];
}
- (IBAction)directionButtonTouchUpInside:(id)sender {
    NSMutableDictionary *directions = [[NSMutableDictionary alloc] init];
    
    // Orden alfabético

    [directions setObject:@"Norte" forKey:@"N"];
    [directions setObject:@"Sur" forKey:@"S"];
    [directions setObject:@"Este" forKey:@"E"];
    [directions setObject:@"Oeste" forKey:@"W"];
    [directions setObject:@"Noreste" forKey:@"NE"];
    [directions setObject:@"Noroeste" forKey:@"NW"];
    [directions setObject:@"Sureste" forKey:@"SE"];
    [directions setObject:@"Suroeste" forKey:@"SW"];
    
    [self showPickerView:directions withField:self.directionField withLookupButton:self.directionButton withOutField:self.county];
}

- (void)showPickerView:(NSMutableDictionary*)elements withField:(UITextField*)field withLookupButton:(UIButton*)button withOutField:(NSString*)outField {
    self.pickerView = [[PickerViewController alloc] initWithStyle:UITableViewStylePlain withElementsDictionary:elements withMultipleChoice:NO];
    self.pickerPopover = [[UIPopoverController alloc] initWithContentViewController:self.pickerView];
    
    self.pickerView.outField = field;
    self.pickerView.popover = self.pickerPopover;
    self.pickerView.selectedKey = self.reportType;
    
    [self.pickerPopover presentPopoverFromRect:button.bounds inView:button permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
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
