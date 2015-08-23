//
//  NewPersonController.m
//  transinfo
//
//  Created by Omar Soto Fortuño on 12/15/14.
//  Copyright (c) 2014 University of Puerto Rico Mayagüez Campus. All rights reserved.
//

#import "NewPersonController.h"
#import "UIDatePickerOKView.h"
#import "CollectionManager.h"
#import "Utilities.h"
#import "restComm.h"
#import "Config.h"
#import "CarTableViewCell.h"
#import "Vehicle.h"

@interface NewPersonController ()

@property UINavigationBar *navigationBar;

@end

@implementation NewPersonController

- (IBAction)driverLicenseTouchUpInside:(id)sender {
    NSError *error;
    
    /** 0. Check if scanning is supported */
    if ([PPCoordinator isScanningUnsupported:&error]) {
        NSString *messageString = [error localizedDescription];
        [[[UIAlertView alloc] initWithTitle:@"Warning"
                                    message:messageString
                                   delegate:nil
                          cancelButtonTitle:@"OK"
                          otherButtonTitles:nil, nil] show];
        
        return;
    }
    
    /** 1. Initialize the Scanning settings */
    
    // Initialize the scanner settings object. This initialize settings with all default values.
    PPSettings *settings = [[PPSettings alloc] init];
    
    /** 2. Setup the license key */
    
    // Visit www.microblink.com to get the license key for your app
    settings.licenseSettings.licenseKey = @"XRJASP4E-ZM3A3HUY-DP4LILAE-KVSC4PHH-V5MWVBLF-XHCUNLRF-PFYS3WGQ-H5BWGUCV"; 
    
    /**
     * 3. Set up what is being scanned. See detailed guides for specific use cases.
     * Here's an example for initializing PDF417 scanning
     */
    
    // To specify we want to perform PDF417 recognition, initialize the PDF417 recognizer settings
    PPPdf417RecognizerSettings *pdf417RecognizerSettings = [[PPPdf417RecognizerSettings alloc] init];
    
    // Add PDF417 Recognizer setting to a list of used recognizer settings
    [settings.scanSettings addRecognizerSettings:pdf417RecognizerSettings];
    
    // To specify we want to perform recognition of other barcode formats, initialize the ZXing recognizer settings
    PPZXingRecognizerSettings *zxingRecognizerSettings = [[PPZXingRecognizerSettings alloc] init];
    zxingRecognizerSettings.scanQR = YES; // we use just QR code
    
    // Add ZXingRecognizer setting to a list of used recognizer settings
    [settings.scanSettings addRecognizerSettings:zxingRecognizerSettings];
    
    /** 4. Initialize the Scanning Coordinator object */
    
    PPCoordinator *coordinator = [[PPCoordinator alloc] initWithSettings:settings];
    
    /** Allocate and present the scanning view controller */
    UIViewController<PPScanningViewController>* scanningViewController = [coordinator cameraViewControllerWithDelegate:self];
    
    /** You can use other presentation methods as well */
    [self presentViewController:scanningViewController animated:YES completion:nil];
}

- (void)scanningViewController:(UIViewController<PPScanningViewController> *)scanningViewController
              didOutputResults:(NSArray *)results {
    NSArray *months = @[@"ene", @"feb", @"mar", @"abr", @"may", @"jun", @"jul", @"ago", @"sep", @"oct", @"nov", @"dic"];
    
    // first, pause scanning until we process all the results
    [scanningViewController pauseScanning];
    
    // Collect data from the result
    for (PPRecognizerResult* result in results) {
        
        if ([result isKindOfClass:[PPPdf417RecognizerResult class]]) {
            PPPdf417RecognizerResult *pdf417Result = (PPPdf417RecognizerResult *)result;

            NSString *string = [[NSString alloc] initWithData:[pdf417Result data] encoding:NSASCIIStringEncoding];
            
            NSArray *split = [string componentsSeparatedByString:@"-"];
            
            if ([split count] < 10) {
                NSLog(@"BARCODE: Not enough fields.");
                return;
            }
            
            NSString *driverLicense = split[0];
            NSString *expirationDate = split[1];
            NSString *firstName = [split[2] capitalizedString];
            NSString *middleName = [split[3] capitalizedString];
            NSString *lastName1 = [split[4] capitalizedString];
            NSString *lastName2 = [split[5] capitalizedString];
            NSString *sex = split[9];
            NSString *fullName;
            
            NSString *day = [[expirationDate substringFromIndex:0] substringToIndex:2];
            NSString *month = [[expirationDate substringFromIndex:2] substringToIndex:3];
            NSString *year = [expirationDate substringFromIndex:5];
            
            NSDateComponents *comps = [[NSDateComponents alloc] init];
            [comps setDay:[day integerValue]];
            //[comps setMonth:[month integerValue]];
            [comps setYear:[year integerValue]];
            
            for (int i = 0; i < [months count]; i++) {
                if ([month isEqualToString:months[i]]) {
                    [comps setMonth:(i + 1)];
                    break;
                }
            }
            
            NSLog(@"day= %@, month= %@, year=%@ sex=%@", day, month, year, sex);
            
            if ([middleName isEqualToString:@"Null"]) {
                fullName = [[NSString alloc] initWithFormat:@"%@ %@ %@", firstName, lastName1, lastName2, nil];
            } else {
                fullName = [[NSString alloc] initWithFormat:@"%@ %@ %@ %@", firstName, middleName, lastName1, lastName2, nil];
            }
            
            self.editingPerson.driverLicense = driverLicense;
            self.editingPerson.name = fullName;
            
            self.licenseNumberField.text = driverLicense;
            self.personNameField.text = fullName;
            
            self.licenseExpirationDate = [[NSCalendar currentCalendar] dateFromComponents:comps];
            [self setLicenseExpirationDateFormat];
            
            if ([sex isEqualToString:@"M"]) {
                self.genderKey = @"1";
            } else if ([sex isEqualToString:@"F"]) {
                self.genderKey = @"2";
            } else {
                self.genderKey = @"3";
            }
            
            //NSLog(@"genderKey= %@", self.editingPerson.genderKey);
            
            [self loadDefaultForCollection:@"genders" toField:self.genderField withKey:@"GenderID" defaultValue:self.genderKey];
            
            NSLog(@"%@", string);
        }
    };
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)scanningViewControllerDidClose:(UIViewController<PPScanningViewController> *)scanningViewController {
     [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)setEditingModeFor:(Person*)person forRegistrationPlate:(NSString*)registrationPlate {
    self.editingPerson = person;
    self.editingRegistrationPlate = registrationPlate;
    
    self.navigationBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 50)];
    
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"OK" style:UIBarButtonItemStyleDone target:nil action:nil];
    UINavigationItem *item = [[UINavigationItem alloc] initWithTitle:NSLocalizedString(@"report.third.edit-person", nil)];
    item.rightBarButtonItem = rightButton;
    item.hidesBackButton = YES;
    [rightButton setAction:@selector(addButonAction:)];
    
    self.personTypeCategoryKey = self.editingPerson.typeCategoryKey;
    self.personTypeKey = self.editingPerson.typeKey;
    self.genderKey = self.editingPerson.genderKey;
    self.licenseTypeKey = self.editingPerson.licenseTypeKey;
    self.organDonorKey = self.editingPerson.organDonorKey;
    
    [self.navigationBar pushNavigationItem:item animated:NO];
    
    [self.view addSubview:self.navigationBar];
}


- (IBAction)addButonAction:(id)sender {
    if (self.navigationBar != nil) {
        NSLog(@"IsEditing!");
        //return;
    } else {
        NSLog(@"Add person!");
    }
    
    NSIndexPath *indexPath = [self.vehicleTableView indexPathForSelectedRow];
    NSString *vehicleLicensePlate = @"";
    
    //NSLog(@"%@", indexPath);
    
    if ([self.personTypeCategoryKey isEqualToString:@"1"]) {
        if (indexPath == nil) {
            [Utilities displayAlertWithMessage:NSLocalizedString(@"report.third.required-vehicle.msg", nil) withTitle:NSLocalizedString(@"report.third.required-vehicle.title", nil)];
            return;
        } else {
            Vehicle *vehicle = [self.vehicles objectAtIndex:indexPath.row];
            vehicleLicensePlate = vehicle.registrationPlate;
        }
    }
    
    Person *person;
    
    if (self.editingPerson == nil) {
        person = [[Person alloc] init];
    } else {
        person = self.editingPerson;
    }
    
    person.typeCategoryKey = (self.personTypeCategoryKey == nil) ? @"-1" : self.personTypeCategoryKey;
    person.typeKey = (self.personTypeKey == nil) ? @"-1" : self.personTypeKey;
    person.name = self.personNameField.text;
    person.genderKey = (self.genderKey == nil) ? @"-1" : self.genderKey;
    person.licenseTypeKey = (self.licenseTypeKey == nil) ? @"-1" : self.licenseTypeKey;
    person.driverLicense = (self.licenseNumberField.text == nil) ? @"" :self.licenseNumberField.text;
    person.organDonorKey = (self.organDonorKey == nil) ? @"-1" : self.organDonorKey;
    person.licenseExpirationDate = (self.licenseExpirationDate == nil) ? nil : self.licenseExpirationDate;
    person.licenseExpirationNA = @NO;
    person.streetAddress = (self.personStreetAddressField.text == nil) ? @"" : self.personStreetAddressField.text;
    person.neighbohood = (self.personNeighbohoodField.text == nil) ? @"" : self.personNeighbohoodField.text;
    person.city = (self.personCityField.text == nil) ? @"" : self.personCityField.text;
    person.stateCountry = (self.personStateCountryField.text == nil) ? @"" : self.personStateCountryField.text;
    person.zipCode = (self.personZipCodeField.text == nil) ? @"" : self.personZipCodeField.text;
    person.phoneNumber = (self.personPhoneNumberField.text == nil) ? @"" : self.personPhoneNumberField.text;
    person.uuid = (self.editingPerson != nil) ? self.editingPerson.uuid : nil;
    
    if ([person.typeCategoryKey isEqualToString:@"-1"] || [person.typeKey isEqualToString:@"-1"]) {
        [Utilities displayAlertWithMessage:@"Person Type and Person Type Category are required fields." withTitle:@"Missing required fields!"];
        return;
        //return;
    }
    
    NSDictionary *personDictionary = @{@"Person" : person,
                                       @"vehicleLicensePlate" : vehicleLicensePlate};
    
    NSLog(@"Sending %@", personDictionary);
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"addPerson" object:nil userInfo:personDictionary];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewWillAppear:(BOOL)animated {
    if (self.navigationBar != nil) {
        [self.navigationBar setFrame:CGRectMake(0, 0, self.view.frame.size.width, 50)];
        [(UIScrollView *)self.view setContentSize:CGSizeMake(700,800)];
        
        self.personNameField.text = self.editingPerson.name;
        self.licenseNumberField.text = self.editingPerson.driverLicense;
        if (self.editingPerson.licenseExpirationDate != nil) {
            self.licenseExpirationDate = self.editingPerson.licenseExpirationDate;
            [self setLicenseExpirationDateFormat];
        }
        self.personStreetAddressField.text = self.editingPerson.streetAddress;
        self.personNeighbohoodField.text = self.editingPerson.neighbohood;
        self.personCityField.text = self.editingPerson.city;
        self.personStateCountryField.text = self.editingPerson.stateCountry;
        self.personZipCodeField.text = self.editingPerson.zipCode;
        self.personPhoneNumberField.text = self.editingPerson.phoneNumber;
        
        self.personTypeCategoryKey = self.editingPerson.typeCategoryKey;
        self.personTypeKey = self.editingPerson.typeKey;
        self.genderKey = self.editingPerson.genderKey;
        self.licenseTypeKey = self.editingPerson.licenseTypeKey;
        self.organDonorKey = self.editingPerson.organDonorKey;
        
        if ([self.editingPerson.typeKey isEqualToString:@"1"]) {
            [self licenseAreaIsEnabled:YES];
        } else {
            [self licenseAreaIsEnabled:NO];
        }
    }
    
    [self.driverLicenseScanButton setImage:[UIImage imageNamed:@"BarcodeScanner"] forState:UIControlStateNormal];
    
    //NSLog(@"Size 2: %f", self.view.frame.size.width);
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveNotification:) name:@"getVehicles" object:nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"requestVehicles" object:nil userInfo:nil];
}

- (void)viewDidLoad {
    //NSLog(@"Size 3: %f", self.view.frame.size.width);
    [self loadCollections];
    
    // Delegates
    self.personTypeCategoryField.delegate = self;
    self.personTypeField.delegate = self;
    self.genderField.delegate = self;
    self.licenseTypeField.delegate = self;
    self.organDonorField.delegate = self;
    self.licenseExpirationDateField.delegate = self;
    self.EMSNeededField.delegate = self;
    
    self.vehicleTableView.delegate = self;
    self.vehicleTableView.dataSource = self;
    
    if (self.navigationBar == nil && ![self.editingRegistrationPlate isEqualToString: @""]) {
        self.vehicleTableView.userInteractionEnabled = YES;
    } else {
        self.vehicleTableView.userInteractionEnabled = NO;
    }
    
    //self.vehicleTypeField.enabled = NO;
}

- (void)receiveNotification:(NSNotification*)notification {
    NSDictionary *dict = [notification userInfo];
    
    if ([[notification name] isEqualToString:@"getVehicles"]) {
        self.vehicles = [dict objectForKey:@"vehicles"];
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.vehicles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"CarCell";
    
    CarTableViewCell *cell = (CarTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"CarViewCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    Vehicle *vehicle = [self.vehicles objectAtIndex:indexPath.row];
    
    cell.carMake = vehicle.make;
    cell.carModel = vehicle.model;
    cell.carYear = vehicle.year;
    cell.registrationPlate = vehicle.registrationPlate;
    
    if ([vehicle.registrationPlate isEqualToString:self.editingRegistrationPlate]) {
        //[cell setSelected:YES];
        [self.vehicleTableView selectRowAtIndexPath:indexPath animated:YES scrollPosition:UITableViewScrollPositionTop];
    }
    
    return cell;
}

- (void)loadCollections {
    self.collections = [[NSMutableDictionary alloc] init];
    
    NSArray *collectionNames = @[@"personTypeCategories", @"personTypes", @"driverLicenseTypes", @"genders", @"organDonor", @"vehicleTypes", @"workzoneRelated"];
    
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
    
    //NSLog(@"Received Collection %@ %@", collectionName, collection);
    
    if (self.editingPerson != nil) {
        if ([collectionName isEqualToString:@"personTypeCategories"]) {
            [self loadDefaultForCollection:collectionName toField:self.personTypeCategoryField withKey:@"PersonTypeCategoryID" defaultValue:self.editingPerson.typeCategoryKey];
        } else if ([collectionName isEqualToString:@"personTypes"]) {
            //self.personTypeField.text = [collection objectAtIndex:[self.personTypeKey longLongValue]];
            [self loadDefaultForCollection:collectionName toField:self.personTypeField withKey:@"PersonTypeID" defaultValue:self.editingPerson.typeKey];
        } else if ([collectionName isEqualToString:@"driverLicenseTypes"]) {
            //self.licenseTypeField.text = [collection objectAtIndex:[self.licenseTypeKey longLongValue]];
            [self loadDefaultForCollection:collectionName toField:self.licenseTypeField withKey:@"DriverLicenseTypeID" defaultValue:self.editingPerson.licenseTypeKey];
        } else if ([collectionName isEqualToString:@"genders"]) {
            //self.genderField.text = [collection objectAtIndex:[self.genderKey longLongValue]];
            [self loadDefaultForCollection:collectionName toField:self.genderField withKey:@"GenderID" defaultValue:self.editingPerson.genderKey];
        } else if ([collectionName isEqualToString:@"organDonor"]) {
            //self.organDonorField.text = [collection objectAtIndex:[self.organDonorKey longLongValue]];
            [self loadDefaultForCollection:collectionName toField:self.organDonorField withKey:@"OrganDonorID" defaultValue:self.editingPerson.organDonorKey];
        } else if ([collectionName isEqualToString:@"workzoneRelated"]) {
            [self loadDefaultForCollection:collectionName toField:self.EMSNeededField withKey:@"WorkzoneRelatedID" defaultValue:self.editingPerson.EMSNeededKey];
        }
    }
    
    NSLog(@"Received Collection: %@ (%lu elements)", collectionName, (unsigned long)[collection count]);
}

- (void)loadDefaultForCollection:(NSString*)collectionName toField:(UITextField*)field withKey:(NSString*)key defaultValue:(NSString*)value {
    NSArray *collection = [self.collections objectForKey:collectionName];
    
    NSLog(@"Loading default for %@, value: %@", key, value);
    
    for (NSDictionary *dict in collection) {
        if ([[NSString stringWithFormat:@"%@", [dict objectForKey:key]] isEqualToString:value]) {
            field.text = [dict objectForKey:[Utilities collectionColumn]];
            break;
        }
    }
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
    } else if (textField == self.licenseExpirationDateField) {
        UIDatePickerOKView *customPicker = [[[NSBundle mainBundle] loadNibNamed:@"UIPickerOKView" owner:self options:nil] objectAtIndex:0];
        
        if (self.licenseExpirationDate != nil) {
            customPicker.datePicker.date = self.licenseExpirationDate;
        }
        
        customPicker.datePicker.datePickerMode = UIDatePickerModeDate;
        [customPicker.datePicker addTarget:self action:@selector(datePickerValueChanged:) forControlEvents:UIControlEventValueChanged];
        
        customPicker.parent = textField;
        
        textField.inputView = customPicker;
    } else if (textField == self.vehicleTypeField) {
        [self showCollection:@"vehicleTypes" withIDColumn:@"VehicleTypeID" withField:textField];
        return NO;
    } else if (textField == self.EMSNeededField) {
        [self showCollection:@"workzoneRelated" withIDColumn:@"WorkzoneRelatedID" withField:textField];
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

- (void)keysSelected:(NSArray *)keys withIdentifier:(NSString *)identifier withOutField:(UITextField *)outField {
    //NSLog(@"Recibiendo... %@ (%@)", identifier, keys);
    if ([identifier isEqualToString:@"personTypeCategories"]) {
        self.personTypeCategoryKey = keys[0];
        self.personTypeField.text = @"";
        
        self.vehicleTableView.userInteractionEnabled = [self.personTypeCategoryKey isEqualToString:@"1"];
        if ([self.personTypeCategoryKey isEqualToString:@"1"] == NO) {
            [self.vehicleTableView deselectRowAtIndexPath:[self.vehicleTableView indexPathForSelectedRow] animated:YES];
        }
    } else if ([identifier isEqualToString:@"personTypes"]) {
        self.personTypeKey = keys[0];
        if ([keys[0] isEqualToString:@"1"]) {
            // Is Driver
            [self licenseAreaIsEnabled:YES];
        } else {
            // It's not driver
            
            [self licenseAreaIsEnabled:NO];
        }
    } else if ([identifier isEqualToString:@"driverLicenseTypes"]) {
        self.licenseTypeKey = keys[0];
    } else if ([identifier isEqualToString:@"genders"]) {
        self.genderKey = keys[0];
    } else if ([identifier isEqualToString:@"organDonor"]) {
        self.organDonorKey = keys[0];
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
            
            //NSLog(@"%@", elem);
            
            if ([elem objectForKey:[Utilities collectionColumn]] == [NSNull null]) {
                [collection setObject:(NSString*)[elem objectForKey:@"DescriptionES"] forKey:[NSString stringWithFormat:@"%@", [elem objectForKey:IDColumn]]];
            } else {
                [collection setObject:(NSString*)[elem objectForKey:[Utilities collectionColumn]] forKey:[NSString stringWithFormat:@"%@", [elem objectForKey:IDColumn]]];
            }
        }
        
        //NSLog(@"%@ %@ %@", collection, field, collectionName);
        
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

@end
