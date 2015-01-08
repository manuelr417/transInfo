//
//  NewEntryViewController.m
//  transinfo
//
//  Created by Omar Soto Fortuño on 11/6/14.
//  Copyright (c) 2014 University of Puerto Rico Mayagüez Campus. All rights reserved.
//

#import "NewVehicleDriverController.h"
#import "UIDatePickerOKView.h"
#import "CollectionManager.h"
#import "Utilities.h"
#import "restComm.h"
#import "Config.h"

@implementation NewVehicleDriverController


- (IBAction)addButonAction:(id)sender {
    NSLog(@"Add car and person!");
    
    NSDictionary *carDictionary = @{@"vehicleMake" : self.vehicleMakeField.text, @"vehicleModel" : self.vehicleModelField.text, @"vehicleYear" : self.vehicleYearField.text, @"vehicleLicensePlate" : self.vehicleLicensePlateField.text};
    NSDictionary *personDictionary = @{@"vehicleLicensePlate" : self.vehicleLicensePlateField.text, @"personName" : self.personNameField.text, @"licenseNumber" : self.licenseNumberField.text};
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"addCar" object:nil userInfo:carDictionary];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"addPerson" object:nil userInfo:personDictionary];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)searchVehicleInformationButtonTouchUpInside:(id)sender {
    restComm *conn = [[restComm alloc] initWithURL:[NSString stringWithFormat:edmundsVINDecoder, self.vehicleIdentificationNumberField.text, edmundsAPIKey] withMethod:GET];
    
    [conn setDelegate:self];
    
    [conn makeCall];
}

- (void)receivedData:(NSDictionary *)data {
    if (data[@"styleHolder"] != nil) {
        self.vehicleYearField.text = [NSString stringWithFormat:@"%@", data[@"styleHolder"][0][@"year"]];
        self.vehicleMakeField.text = data[@"styleHolder"][0][@"makeName"];
        self.vehicleModelField.text = data[@"styleHolder"][0][@"modelName"];
    } else {
        NSLog(@"(receivedData) Error... %@", data);
        [Utilities displayAlertWithMessage:NSLocalizedString(@"report.third.no-vin.msg", nil) withTitle:NSLocalizedString(@"report.third.no-vin.title", nil)];
    }
}

- (void)receivedError:(NSError *)error {
    NSLog(@"(receivedError) Error... %@", error);
}

- (void)viewDidLoad {
    [(UIScrollView *)self.view setContentSize:CGSizeMake(700,1050)];
    [self registerForKeyboardNotifications];
    [self loadCollections];
    
    // Delegates
    self.personTypeCategoryField.delegate = self;
    self.personTypeField.delegate = self;
    self.genderField.delegate = self;
    self.licenseTypeField.delegate = self;
    self.organDonorField.delegate = self;
    self.licenseExpirationDateField.delegate = self;
    self.vehicleTypeField.delegate = self;
    self.vehicleBuyDateField.delegate = self;
    self.vehicleRegistrationExpirationDateField.delegate = self;
    
    self.vehicleTypeField.enabled = NO;
    
    // For this view, the person will always be the driver.
    self.personTypeField.enabled = NO;
    self.personTypeCategoryField.enabled = NO;
}

- (void)loadCollections {
    self.collections = [[NSMutableDictionary alloc] init];
    
    NSArray *collectionNames = @[@"personTypeCategories", @"personTypes", @"driverLicenseTypes", @"genders", @"organDonor", @"vehicles", @"vehicleTypes"];
    
    NSMutableArray *collectionsManagers = [[NSMutableArray alloc] init];
    int i = 0;
    
    for (NSString *collectionName in collectionNames) {
        [self.collections setObject:[NSDate date] forKey:collectionName];
        [collectionsManagers addObject:[[CollectionManager alloc] init]];
        [collectionsManagers[i] getCollection:collectionName];
        ((CollectionManager*)collectionsManagers[i]).delegate = self;
        
        i++;
    }
}

- (void)receivedCollection:(NSArray *)collection withName:(NSString *)collectionName {
    [self.collections setObject:collection forKey:collectionName];
    
    if ([collectionName isEqualToString:@"personTypeCategories"]) {
        //NSLog(@"%@", collection);
        for (NSDictionary *dict in collection) {
            if ([[NSString stringWithFormat:@"%@", [dict objectForKey:@"PersonTypeCategoryID"]] isEqualToString:@"1"]) {
                self.personTypeCategoryField.text = [dict objectForKey:[Utilities collectionColumn]];
                break;
            }
        }
    } else if ([collectionName isEqualToString:@"personTypes"]) {
        for (NSDictionary *dict in collection) {
            if ([[NSString stringWithFormat:@"%@", [dict objectForKey:@"PersonTypeID"]] isEqualToString:@"1"]) {
                self.personTypeField.text = [dict objectForKey:[Utilities collectionColumn]];
                break;
            }
        }
    }
    
    //self.personTypeCategoryField.text = [collection objectAtIndex:@"1"];
    //self.personTypeField.text = [collection objectAtIndex:@"1"];
    
    NSLog(@"Received Collection: %@ (%lu elements)", collectionName, (unsigned long)[collection count]);
}

- (void)viewWillAppear:(BOOL)animated {
    [self.searchVehicleInformationButton setImage:[UIImage imageNamed:@"DownloadFromCloud"] forState:UIControlStateNormal];
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    [self.view endEditing:YES];
    
    if (textField == self.personTypeCategoryField) {
        [self showCollection:@"personTypeCategories" withIDColumn:@"PersonTypeCategoryID" withField:textField];
        return NO;
    } else if (textField == self.personTypeField) {
        [self showCollection:@"personTypes" withIDColumn:@"PersonTypeID" withField:textField];
        return NO;
    } else if (textField == self.genderField) {
        [self showCollection:@"genders" withIDColumn:@"GenderID" withField:textField];
        return NO;
    } else if (textField == self.licenseTypeField) {
        [self showCollection:@"driverLicenseTypes" withIDColumn:@"DriverLicenseTypeID" withField:textField];
        return NO;
    } else if (textField == self.organDonorField) {
        [self showCollection:@"organDonor" withIDColumn:@"OrganDonorID" withField:textField];
        return NO;
    } else if (textField == self.licenseExpirationDateField || textField == self.vehicleBuyDateField || textField == self.vehicleRegistrationExpirationDateField) {
        UIDatePickerOKView *customPicker = [[[NSBundle mainBundle] loadNibNamed:@"UIPickerOKView" owner:self options:nil] objectAtIndex:0];
        
        /*if (self.licenseExpirationDate != nil) {
         customPicker.datePicker.date = self.licenseExpirationDate;
         }*/
        
        customPicker.datePicker.datePickerMode = UIDatePickerModeDate;
        [customPicker.datePicker addTarget:self action:@selector(datePickerValueChanged:) forControlEvents:UIControlEventValueChanged];
        
        customPicker.parent = textField;
        
        textField.inputView = customPicker;
    } else if (textField == self.vehicleTypeField) {
        [self showCollection:@"vehicleTypes" withIDColumn:@"VehicleTypeID" withField:textField];
        return NO;
    }
    
    return YES;
}

- (IBAction)datePickerValueChanged:(id)sender {
    NSDate *pickerDate = [sender date];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"yyyy-MM-dd";
    
    if ([self.licenseExpirationDateField isFirstResponder]) {
        self.licenseExpirationDate = pickerDate;
        self.licenseExpirationDateField.text = [dateFormatter stringFromDate:self.licenseExpirationDate];
    } else if ([self.vehicleBuyDateField isFirstResponder]) {
        self.vehicleBuyDateField.text = [dateFormatter stringFromDate:pickerDate];
    } else if ([self.vehicleRegistrationExpirationDateField isFirstResponder]) {
        self.vehicleRegistrationExpirationDateField.text = [dateFormatter stringFromDate:pickerDate];
    }
    
    [self setLicenseExpirationDateFormat];
    
}

- (IBAction)driverIsOwnerSwitchValueChanged:(id)sender {
    if (self.driverIsOwnerSwitch.on) {
        self.vehicleTypeField.enabled = NO;
    } else {
        self.vehicleTypeField.enabled = YES;
    }
}


- (void)setLicenseExpirationDateFormat {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"yyyy-MM-dd";
    
    self.licenseExpirationDateField.text = [dateFormatter stringFromDate:self.licenseExpirationDate];
}

- (void)keysSelected:(NSArray *)keys withIdentifier:(NSString *)identifier {
    NSLog(@"Recibiendo... %@ (%@)", identifier, keys);
    if ([identifier isEqualToString:@"personTypeCategories"]) {
        self.personTypeCategoryKey = keys[0];
        self.personTypeField.text = @"";
    } else if ([identifier isEqualToString:@"personTypes"]) {
        if ([keys[0] isEqualToString:@"1"]) {
            // Is Driver
            [self licenseAreaIsEnabled:YES];
        } else {
            // It's not driver
            
            [self licenseAreaIsEnabled:NO];
        }
    }
}

- (void)licenseAreaIsEnabled:(BOOL)isEnabled {
    self.licenseTypeField.enabled = isEnabled;
    self.licenseNumberField.enabled = isEnabled;
    self.organDonorField.enabled = isEnabled;
    self.licenseExpirationDateField.enabled = isEnabled;
}

- (IBAction)showCollection:(NSString*)collectionName withIDColumn:(NSString*)IDColumn withField:(id)field {
    if ([self.collections[collectionName] isKindOfClass:[NSArray class]]) {
        NSMutableDictionary *collection = [[NSMutableDictionary alloc] init];
        
        BOOL isPersonTypes = [collectionName isEqualToString:@"personTypes"];
        
        if (isPersonTypes && self.personTypeCategoryKey == nil) {
            [Utilities displayAlertWithMessage:NSLocalizedString(@"report.third.no-person-type-category.msg", nil) withTitle:NSLocalizedString(@"report.third.no-person-type-category.title", nil) ];
            return;
        }
        
        for (NSDictionary *elem in self.collections[collectionName]) {
            if (isPersonTypes) {
                if (![self.personTypeCategoryKey isEqualToString:[NSString stringWithFormat:@"%@", [elem objectForKey:@"PersonTypeCategoryID"]]]) {
                    continue;
                }
            }
            
            [collection setObject:(NSString*)[elem objectForKey:[Utilities collectionColumn]] forKey:[NSString stringWithFormat:@"%@", [elem objectForKey:IDColumn]]];
        }
        
        [self showPickerView:collection withField:field withIdentifier:collectionName];
    } else {
        NSLog(@"No collection yet... %@", collectionName);
        CollectionManager *collManager = [[CollectionManager alloc] init];
        [collManager getCollection:collectionName];
        collManager.delegate = self;
    }
}

- (void)showPickerView:(NSMutableDictionary*)elements withField:(UITextField*)field withIdentifier:(NSString*)identifier {
    self.pickerView = [[PickerViewController alloc] initWithStyle:UITableViewStylePlain withElementsDictionary:elements withMultipleChoice:NO];
    self.pickerPopover = [[UIPopoverController alloc] initWithContentViewController:self.pickerView];
    
    self.pickerView.delegate = self;
    self.pickerView.outField = field;
    self.pickerView.popover = self.pickerPopover;
    [self.pickerView setIdentifier:identifier];
    
    [self.pickerPopover presentPopoverFromRect:field.bounds inView:field permittedArrowDirections:UIPopoverArrowDirectionUnknown animated:YES];
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
    if ([self.licenseExpirationDateField isFirstResponder]) {
        self.activeField = self.licenseExpirationDateField;
    } else if ([self.personStreetAddressField isFirstResponder]) {
        self.activeField = self.personStreetAddressField;
    } else if ([self.personNeighbohoodField isFirstResponder]) {
        self.activeField = self.personNeighbohoodField;
    } else if ([self.personCityField isFirstResponder]) {
        self.activeField = self.personCityField;
    } else if ([self.personStateCountryField isFirstResponder]) {
        self.activeField = self.personStateCountryField;
    } else if ([self.personZipCodeField isFirstResponder]) {
        self.activeField = self.personZipCodeField;
    } else if ([self.personPhoneNumberField isFirstResponder]) {
        self.activeField = self.personPhoneNumberField;
    } else if ([self.vehicleIdentificationNumberField isFirstResponder]) {
        self.activeField = self.vehicleIdentificationNumberField;
    } else if ([self.vehicleYearField isFirstResponder]) {
        self.activeField = self.vehicleYearField;
    } else if ([self.vehicleMakeField isFirstResponder]) {
        self.activeField = self.vehicleMakeField;
    } else if ([self.vehicleModelField isFirstResponder]) {
        self.activeField = self.vehicleModelField;
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
