//
//  NewEntryViewController.h
//  transinfo
//
//  Created by Omar Soto Fortuño on 11/6/14.
//  Copyright (c) 2014 University of Puerto Rico Mayagüez Campus. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PickerViewController.h"

@interface NewVehicleDriverController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *personTypeCategoryField;
@property (weak, nonatomic) IBOutlet UITextField *personTypeField;

// Faltan cosas aquí
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

@property (weak, nonatomic) IBOutlet UITextField *vehicleLicensePlateField;
@property (weak, nonatomic) IBOutlet UITextField *vehicleRegistrationStateField;

@property (weak, nonatomic) IBOutlet UITextField *vehicleIdentificationNumberField;
@property (weak, nonatomic) IBOutlet UIButton *searchVehicleInformationButton;
@property (weak, nonatomic) IBOutlet UITextField *vehicleYearField;
@property (weak, nonatomic) IBOutlet UITextField *vehicleMakeField;
@property (weak, nonatomic) IBOutlet UITextField *vehicleModelField;

@property (weak, nonatomic) IBOutlet UITextField *vehicleRegistrationNumberField;
@property (weak, nonatomic) IBOutlet UITextField *vehicleInsuranceField;
@property (weak, nonatomic) IBOutlet UITextField *vehicleBuyDateField;
@property (weak, nonatomic) IBOutlet UITextField *vehicleRegistrationExpirationDateField;
@property (weak, nonatomic) IBOutlet UITextField *vehiclePassengersField;
@property (weak, nonatomic) IBOutlet UISwitch *driverIsOwnerSwitch;
@property (weak, nonatomic) IBOutlet UITextField *vehicleTypeField;



@property NSString *personTypeCategoryKey;
@property NSDate *licenseExpirationDate;

@property NSString *trash;
@property UIView *activeField;
@property NSMutableDictionary *collections;
@property (nonatomic, strong) PickerViewController *pickerView;
@property (nonatomic, strong) UIPopoverController *pickerPopover;



- (void)showPickerView:(NSMutableDictionary*)elements withField:(UITextField*)field withIdentifier:(NSString*)identifier;


@end