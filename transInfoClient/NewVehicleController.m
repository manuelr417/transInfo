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

@interface NewVehicleController ()

@property UINavigationBar *navigationBar;

@end

@implementation NewVehicleController

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
    self.editingVehicle.passangers = self.vehiclePassengersField.text;
    
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
        self.vehiclePassengersField.text = self.editingVehicle.passangers;
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
    }
    
    return YES;
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

@end
