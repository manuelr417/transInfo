//
//  NewVehicleController.h
//  transinfo
//
//  Created by Omar Soto Fortuño on 12/15/14.
//  Copyright (c) 2014 University of Puerto Rico Mayagüez Campus. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PickerViewController.h"

@interface NewVehicleController : UIViewController <UITextFieldDelegate>

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

@property NSString *trash;
@property NSMutableDictionary *collections;
@property (nonatomic, strong) PickerViewController *pickerView;
@property (nonatomic, strong) UIPopoverController *pickerPopover;

- (void)showPickerView:(NSMutableDictionary*)elements withField:(UITextField*)field withIdentifier:(NSString*)identifier;

@end
