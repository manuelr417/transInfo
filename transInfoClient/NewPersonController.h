//
//  NewPersonController.h
//  transinfo
//
//  Created by Omar Soto Fortuño on 12/15/14.
//  Copyright (c) 2014 University of Puerto Rico Mayagüez Campus. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PickerViewController.h"
#import "Person.h"

@interface NewPersonController : UIViewController <UITextFieldDelegate, UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *personTypeCategoryField;
@property (weak, nonatomic) IBOutlet UITextField *personTypeField;

@property (weak, nonatomic) IBOutlet UITextField *personNameField;
@property (weak, nonatomic) IBOutlet UITextField *genderField;

@property (weak, nonatomic) IBOutlet UITextField *licenseTypeField;
@property (weak, nonatomic) IBOutlet UITextField *licenseNumberField;
@property (weak, nonatomic) IBOutlet UITextField *organDonorField;

@property (weak, nonatomic) IBOutlet UITextField *licenseExpirationDateField;
@property (weak, nonatomic) IBOutlet UISwitch *licenseExpirationDateNASwitch;
@property (weak, nonatomic) IBOutlet UITextField *personStreetAddressField;
@property (weak, nonatomic) IBOutlet UITextField *personNeighbohoodField;
@property (weak, nonatomic) IBOutlet UITextField *personCityField;
@property (weak, nonatomic) IBOutlet UITextField *personStateCountryField;
@property (weak, nonatomic) IBOutlet UITextField *personZipCodeField;
@property (weak, nonatomic) IBOutlet UITextField *personPhoneNumberField;

@property (weak, nonatomic) IBOutlet UISwitch *driverIsOwnerSwitch;
@property (weak, nonatomic) IBOutlet UITextField *vehicleTypeField;

@property (weak, nonatomic) IBOutlet UITableView *vehicleTableView;

@property NSString *personTypeCategoryKey;
@property NSString *personTypeKey;
@property NSString *genderKey;
@property NSString *licenseTypeKey;
@property NSString *organDonorKey;
@property NSDate *licenseExpirationDate;

@property NSString *trash;
@property UIView *activeField;
@property NSMutableDictionary *collections;
@property (nonatomic, strong) PickerViewController *pickerView;
@property (nonatomic, strong) UIPopoverController *pickerPopover;

@property NSMutableArray *vehicles;

@property Person *editingPerson;
@property NSString *editingRegistrationPlate;

- (void)showPickerView:(NSMutableDictionary*)elements withField:(UITextField*)field withIdentifier:(NSString*)identifier;
- (void)setEditingModeFor:(Person*)person forRegistrationPlate:(NSString*)registrationPlate;


@end
