//
//  NewVehicleController.m
//  transinfo
//
//  Created by Omar Soto Fortuño on 12/15/14.
//  Copyright (c) 2014 University of Puerto Rico Mayagüez Campus. All rights reserved.
//

#import "NewVehicleController.h"
#import "UIDatePickerOKView.h"
#import "Utilities.h"
#import "restComm.h"
#import "Config.h"
#import "CollectionManager.h"

@interface NewVehicleController ()

@property UINavigationBar *navigationBar;

@end

@implementation NewVehicleController

- (void)loadViewConfiguration {
    self.viewElements = [[NSMutableArray alloc] init];
    
    [self.viewElements addObject:@{
                                   @"restMethod" : @"vehicleTypes",
                                   @"key" : @"VehicleTypeID",
                                   @"field" : self.vehicleTypeField,
                                   @"enabled" : @YES,
                                   @"modelAttr" : @"vehicleTypeKey",
                                   @"multiple" : @NO,
                                   @"multipleLimit" : @0,
                                   }];
    
    [self.viewElements addObject:@{
                                   @"restMethod" : @"vehicleJurisdictions",
                                   @"key" : @"VehicleJurisdictionID",
                                   @"field" : self.vehicleJurisdictionField,
                                   @"enabled" : @YES,
                                   @"modelAttr" : @"vehicleJurisdictionKey",
                                   @"multiple" : @NO,
                                   @"multipleLimit" : @0,
                                   }];
}

- (void)setEditingModeFor:(Vehicle*)vehicle {
    self.editingVehicle = vehicle;
    
    self.navigationBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 50)];
    
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"OK" style:UIBarButtonItemStyleDone target:nil action:nil];
    UINavigationItem *item = [[UINavigationItem alloc] initWithTitle:NSLocalizedString(@"report.third.edit-vehicle", nil)];
    item.rightBarButtonItem = rightButton;
    item.hidesBackButton = YES;
    [rightButton setAction:@selector(addButonAction:)];
    
    [self.navigationBar pushNavigationItem:item animated:NO];
    
    [self.view addSubview:self.navigationBar];
}

- (IBAction)addButonAction:(id)sender {
    if (self.editingVehicle == nil) {
        self.editingVehicle = [[Vehicle alloc] init];
    }
    
    self.editingVehicle.registrationPlate = self.vehicleLicensePlateField.text;
    self.editingVehicle.registrationState = self.vehicleRegistrationStateField.text;
    self.editingVehicle.vehicleIdentificationNumber = self.vehicleIdentificationNumberField.text;
    self.editingVehicle.year = self.vehicleYearField.text;
    self.editingVehicle.make = self.vehicleMakeField.text;
    self.editingVehicle.model = self.vehicleModelField.text;
    self.editingVehicle.registrationNumber = self.vehicleRegistrationNumberField.text;
    self.editingVehicle.insurance = self.vehicleInsuranceField.text;
    self.editingVehicle.buyDate = self.vehicleBuyDate;
    self.editingVehicle.registrationExpirationDate = self.vehicleRegistrationExpirationDate;
    self.editingVehicle.occupants = self.vehicleOccupantsField.text;
    
    NSDictionary *carDictionary = @{@"Vehicle" : self.editingVehicle};
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"addCar" object:nil userInfo:carDictionary];
    
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
    // Delegates
    self.vehicleBuyDateField.delegate = self;
    self.vehicleRegistrationExpirationDateField.delegate = self;
    self.vehicleJurisdictionField.delegate = self;
    self.vehicleTypeField.delegate = self;
    
    self.vehicleIdentificationNumberField.autocapitalizationType = UITextAutocapitalizationTypeAllCharacters;
    self.vehicleLicensePlateField.autocapitalizationType = UITextAutocapitalizationTypeAllCharacters;
    self.vehicleRegistrationStateField.autocapitalizationType = UITextAutocapitalizationTypeAllCharacters;
    
    self.vehicleOccupantsField.keyboardType = UIKeyboardTypeNumberPad;
    
    [self loadViewConfiguration];
    
    for (NSDictionary *elem in self.viewElements) {
        UITextField *field = elem[@"field"];
        BOOL isEnabled = ([elem[@"enabled"]  isEqual: @YES]);
        
        //NSLog(@"Setting Delegate for Element with Key: %@", elem[@"key"]);
        
        field.delegate = self;
        field.enabled = isEnabled;
    }
    
    [self loadCollections];
}

- (void)loadCollections {
    self.collections = [[NSMutableDictionary alloc] init];
    
    NSMutableArray *collectionsNames = [[NSMutableArray alloc] init];
    
    // Dynamically load collections
    for (NSDictionary *elem in self.viewElements) {
        if (![collectionsNames containsObject:elem[@"restMethod"]]) {
            [collectionsNames addObject:elem[@"restMethod"]];
        }
    }
    
    NSMutableArray *collectionsManagers = [[NSMutableArray alloc] init];
    int i = 0;
    
    for (NSString *collectionName in collectionsNames) {
        [self.collections setObject:[NSDate date] forKey:collectionName];
        [collectionsManagers addObject:[[CollectionManager alloc] init]];
        ((CollectionManager*)collectionsManagers[i]).delegate = self;
        [collectionsManagers[i] getCollection:collectionName];
        
        i++;
    }
}

- (void)loadDefaultForCollection:(NSString*)collectionName toField:(UITextField*)field withKey:(NSString*)key defaultValue:(NSString*)value {
    
    if ([value isEqualToString:@"-1"]) {
        //NSLog(@"Ignoring %@, value: %@", key, value);
        return;
    }
    
    NSArray *collection = [self.collections objectForKey:collectionName];
    
    //NSLog(@"Loading default for %@, value: %@", key, value);
    
    for (NSDictionary *dict in collection) {
        if ([[NSString stringWithFormat:@"%@", [dict objectForKey:key]] isEqualToString:value]) {
            field.text = [dict objectForKey:[Utilities collectionColumn]];
            break;
        }
    }
}

- (void)receivedCollection:(NSArray *)collection withName:(NSString *)collectionName {
    [self.collections setObject:collection forKey:collectionName];
    
    if (self.editingVehicle != nil) {
        for (NSDictionary *elem in self.viewElements) {
            if ([collectionName isEqualToString:elem[@"restMethod"]]) {
                if ([elem[@"multiple"]  isEqual: @YES]) {
                    UITextField *field = elem[@"field"];
                    NSMutableArray *array = [self.editingVehicle valueForKey:elem[@"modelAttr"]];
                    
                    field.text = [NSString stringWithFormat:NSLocalizedString(@"multilist.selected", nil), [array count]];
                } else {
                    [self loadDefaultForCollection:elem[@"restMethod"] toField:elem[@"field"] withKey:elem[@"key"] defaultValue:[self.editingVehicle valueForKey:elem[@"modelAttr"]]];
                }
            }
        }
    }
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    [self.view endEditing:YES];
    
    if (textField == self.vehicleBuyDateField || textField == self.vehicleRegistrationExpirationDateField) {
        UIDatePickerOKView *customPicker = [[[NSBundle mainBundle] loadNibNamed:@"UIPickerOKView" owner:self options:nil] objectAtIndex:0];
        customPicker.datePicker.datePickerMode = UIDatePickerModeDate;
        [customPicker.datePicker addTarget:self action:@selector(datePickerValueChanged:) forControlEvents:UIControlEventValueChanged];
        
        customPicker.parent = textField;
        
        textField.inputView = customPicker;
    } else {
        for (NSDictionary *elem in self.viewElements) {
            if (textField == elem[@"field"] && [elem[@"enabled"] isEqual: @YES]) {
                //NSLog(@"Showing collection with ID: %@ (REST: %@)", elem[@"key"], elem[@"restMethod"]);
                [self showCollection:elem[@"restMethod"] withIDColumn:elem[@"key"] withField:textField];
                return NO;
            }
        }
    }
    
    //NSLog(@"%@ NO!", textField);
    
    return YES;
}

- (void)keysSelected:(NSArray *)keys withIdentifier:(NSString *)identifier withOutField:(UITextField *)outField {
    for (NSDictionary *elem in self.viewElements) {
        if (outField == elem[@"field"] && [elem[@"enabled"] isEqual: @YES]) {
            if ([elem[@"multiple"] isEqual:@YES]) {
                [self.editingVehicle setValue:[NSMutableArray arrayWithArray:keys] forKey:elem[@"modelAttr"]];
            } else {
                [self.editingVehicle setValue:(NSString*)keys[0] forKey:elem[@"modelAttr"]];
            }
            
            id onChange = [elem objectForKey:@"onChange"];
            
            if (onChange != nil) {
                SEL selector = NSSelectorFromString(onChange);
                
                [self performSelector:selector withObject:nil afterDelay:0.0];
            }
        }
    }
}

- (IBAction)showCollection:(NSString*)collectionName withIDColumn:(NSString*)IDColumn withField:(id)field {
    if ([self.collections[collectionName] isKindOfClass:[NSArray class]]) {
        //self.latestField = field;
        
        NSMutableDictionary *collection = [[NSMutableDictionary alloc] init];
        
        //NSLog(@"Displaying Collection: %@", self.collections[collectionName]);
        
        for (NSDictionary *elem in self.collections[collectionName]) {
            [collection setObject:(NSString*)[elem objectForKey:[Utilities collectionColumn]] forKey:[NSString stringWithFormat:@"%@", [elem objectForKey:IDColumn]]];
            
            //NSLog(@"%@ = %@", [NSString stringWithFormat:@"%@", [elem objectForKey:IDColumn]], (NSString*)[elem objectForKey:[Utilities collectionColumn]]);
        }
        
        NSDictionary *actualElement;
        
        for (NSDictionary *elem in self.viewElements) {
            if ([elem[@"restMethod"] isEqualToString:collectionName]) {
                actualElement = elem;
                break;
            }
        }
        
        //NSLog(@"%@ %@ %@", collection, field, collectionName);
        
        if (actualElement != nil && [actualElement[@"multiple"] isEqual:@YES]) {
            NSMutableArray *array = [self.editingVehicle valueForKey:actualElement[@"modelAttr"]];
            [self showPickerView:collection withField:field withIdentifier:collectionName withMultipleChoice:YES withSelectedElements:array withSelectedLimit:actualElement[@"multipleLimit"]];
        } else {
            [self showPickerView:collection withField:field withIdentifier:collectionName withMultipleChoice:NO withSelectedElements:nil withSelectedLimit:nil];
        }
    } else {
        NSLog(@"No collection yet... %@", collectionName);
        CollectionManager *collManager = [[CollectionManager alloc] init];
        [collManager getCollection:collectionName];
        collManager.delegate = self;
    }
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

- (void)viewWillAppear:(BOOL)animated {
    [self.searchVehicleInformationButton setImage:[UIImage imageNamed:@"DownloadFromCloud"] forState:UIControlStateNormal];
    
    if (self.editingVehicle != nil) {
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.dateFormat = @"yyyy-MM-dd";
        
        [self.navigationBar setFrame:CGRectMake(0, 0, self.view.frame.size.width, 50)];
        [(UIScrollView *)self.view setContentSize:CGSizeMake(700,550)];
        
        self.vehicleLicensePlateField.text = self.editingVehicle.registrationPlate;
        self.vehicleRegistrationStateField.text = self.editingVehicle.registrationState;
        self.vehicleIdentificationNumberField.text = self.editingVehicle.vehicleIdentificationNumber;
        self.vehicleYearField.text = self.editingVehicle.year;
        self.vehicleMakeField.text = self.editingVehicle.make;
        self.vehicleModelField.text = self.editingVehicle.model;
        self.vehicleRegistrationNumberField.text = self.editingVehicle.registrationNumber;
        self.vehicleInsuranceField.text = self.editingVehicle.insurance;
        if (self.editingVehicle.buyDate != nil) {
            self.vehicleBuyDateField.text = [dateFormatter stringFromDate:self.editingVehicle.buyDate];
            self.vehicleBuyDate = self.editingVehicle.buyDate;
        }
        if (self.editingVehicle.registrationExpirationDate != nil) {
            self.vehicleRegistrationExpirationDateField.text = [dateFormatter stringFromDate:self.editingVehicle.registrationExpirationDate];
            self.vehicleRegistrationExpirationDate = self.editingVehicle.registrationExpirationDate;
        }
        self.vehicleOccupantsField.text = self.editingVehicle.occupants;
    } else {
        self.editingVehicle = [[Vehicle alloc] init];
    }
    
    self.parentViewController.popoverPresentationController.delegate = self;
}

- (IBAction)datePickerValueChanged:(id)sender {
    NSDate *pickerDate = [sender date];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"yyyy-MM-dd";
    
    if ([self.vehicleBuyDateField isFirstResponder]) {
        self.vehicleBuyDateField.text = [dateFormatter stringFromDate:pickerDate];
        self.vehicleBuyDate = pickerDate;
    } else if ([self.vehicleRegistrationExpirationDateField isFirstResponder]) {
        self.vehicleRegistrationExpirationDateField.text = [dateFormatter stringFromDate:pickerDate];
        self.vehicleRegistrationExpirationDate = pickerDate;
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

- (BOOL)popoverPresentationControllerShouldDismissPopover:(UIPopoverPresentationController *)popoverPresentationController {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"popover.unsaved.title", nil)
                                                    message:NSLocalizedString(@"popover.unsaved.msg", nil)
                                                   delegate:self
                                          cancelButtonTitle:@"No"
                                          otherButtonTitles:@"Yes", nil];
    
    [alert show];
    
    return NO;
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 1) { // Close
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

@end
