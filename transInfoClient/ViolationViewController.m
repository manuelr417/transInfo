//
//  ViolationViewController.m
//  transinfo
//
//  Created by Omar Soto Fortuño on 3/16/15.
//  Copyright (c) 2015 University of Puerto Rico Mayagüez Campus. All rights reserved.
//

#import "ViolationViewController.h"
#import "UIDatePickerOKView.h"

@interface ViolationViewController ()

@end

@implementation ViolationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.courtCitationDateField.delegate = self;
    self.courtCitationHourField.delegate = self;
    
    self.courtCitationDate = [NSDate date];
    self.courtCitationHour = [NSDate date];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (bool)textFieldShouldBeginEditing:(UITextField *)textField {
    if (textField == self.courtCitationDateField) {
        UIDatePickerOKView *customPicker = [[[NSBundle mainBundle] loadNibNamed:@"UIPickerOKView" owner:self options:nil] objectAtIndex:0];
        
        customPicker.datePicker.date = self.courtCitationDate;
        customPicker.datePicker.datePickerMode = UIDatePickerModeDate;
        [customPicker.datePicker addTarget:self action:@selector(datePickerValueChanged:) forControlEvents:UIControlEventValueChanged];
        
        customPicker.parent = self.courtCitationDateField;
        
        self.courtCitationDateField.inputView = customPicker;
        
        //return NO;
    } else if (textField == self.courtCitationHourField) {
        UIDatePickerOKView *customPicker = [[[NSBundle mainBundle] loadNibNamed:@"UIPickerOKView" owner:self options:nil] objectAtIndex:0];
        
        customPicker.datePicker.date = self.courtCitationHour;
        customPicker.datePicker.datePickerMode = UIDatePickerModeTime;
        [customPicker.datePicker addTarget:self action:@selector(timePickerValueChanged:) forControlEvents:UIControlEventValueChanged];
        
        customPicker.parent = self.courtCitationHourField;
        
        self.courtCitationHourField.inputView = customPicker;
        
        //return NO;
    }
    
    return YES;
}

- (IBAction)datePickerValueChanged:(id)sender {
    NSDate *pickerDate = [sender date];
    self.courtCitationDate = pickerDate;
    
    [self setCourtCitationDateFormat];
}

- (void)setCourtCitationDateFormat {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"yyyy-MM-dd";
    
    self.courtCitationDateField.text = [dateFormatter stringFromDate:self.courtCitationDate];
}

- (IBAction)timePickerValueChanged:(id)sender {
    NSDate *pickerDate = [sender date];
    self.courtCitationHour = pickerDate;
    
    [self setCourtCitationHourFormat];
}

- (void)setCourtCitationHourFormat {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"hh:mm a";
    
    self.courtCitationHourField.text = [dateFormatter stringFromDate:self.courtCitationHour];
}

- (IBAction)addButtonClicked:(id)sender {
    NSLog(@"Click");
    
    if (self.editingViolation == nil) {
        self.editingViolation = [[Violation alloc] init];
    }
    
    self.editingViolation.violationCodeField = self.violationCodeField.text;
    self.editingViolation.lawArticleField = self.lawArticleField.text;
    self.editingViolation.courtCitationDateField = self.courtCitationDate;
    self.editingViolation.courtCitationHourField = self.courtCitationHour;
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"updateViolation" object:nil userInfo:@{@"violation" : self.editingViolation}];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
