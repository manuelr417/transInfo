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
    self.courtCitationTimeField.delegate = self;
    
    self.courtCitationDate = [[NSDate alloc] init];
    self.courtCitationTime = [[NSDate alloc] init];
    
    if (self.editingViolation != nil) {
        self.violationCodeField.text = self.editingViolation.violationCode;
        self.lawArticleField.text = self.editingViolation.lawArticle;
        self.courtCitationDate = self.editingViolation.courtCitationDate;
        self.courtCitationTime = self.editingViolation.courtCitationTime;
        
        [self setCourtCitationDateFormat];
        [self setCourtCitationTimeFormat];
        
        self.navigationBar.topItem.title = NSLocalizedString(@"violation.title.edit", nil);
        self.addButton.title = NSLocalizedString(@"violation.button.edit", nil);
    } else {
        self.navigationBar.topItem.title = NSLocalizedString(@"violation.title.add", nil);
        self.addButton.title = NSLocalizedString(@"violation.button.add", nil);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (bool)textFieldShouldBeginEditing:(UITextField *)textField {
    if (textField == self.courtCitationDateField) {
        UIDatePickerOKView *customPicker = [[[NSBundle mainBundle] loadNibNamed:@"UIPickerOKView" owner:self options:nil] objectAtIndex:0];
        
        customPicker.datePicker.date = (self.courtCitationDate == nil) ? [NSDate date] : self.courtCitationDate;
        customPicker.datePicker.datePickerMode = UIDatePickerModeDate;
        [customPicker.datePicker addTarget:self action:@selector(datePickerValueChanged:) forControlEvents:UIControlEventValueChanged];
        
        customPicker.parent = self.courtCitationDateField;
        
        self.courtCitationDateField.inputView = customPicker;
        
        //return NO;
    } else if (textField == self.courtCitationTimeField) {
        UIDatePickerOKView *customPicker = [[[NSBundle mainBundle] loadNibNamed:@"UIPickerOKView" owner:self options:nil] objectAtIndex:0];
        
        customPicker.datePicker.date = (self.courtCitationTime == nil) ? [NSDate date] : self.courtCitationTime;
        customPicker.datePicker.datePickerMode = UIDatePickerModeTime;
        [customPicker.datePicker addTarget:self action:@selector(timePickerValueChanged:) forControlEvents:UIControlEventValueChanged];
        
        customPicker.parent = self.courtCitationTimeField;
        
        self.courtCitationTimeField.inputView = customPicker;
        
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
    self.courtCitationTime = pickerDate;
    
    [self setCourtCitationTimeFormat];
}

- (void)setCourtCitationTimeFormat {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"hh:mm a";
    
    self.courtCitationTimeField.text = [dateFormatter stringFromDate:self.courtCitationTime];
}

- (IBAction)addButtonClicked:(id)sender {
    NSLog(@"Click");
    
    if (self.editingViolation == nil) {
        self.editingViolation = [[Violation alloc] init];
    }
    
    self.editingViolation.violationCode = self.violationCodeField.text;
    self.editingViolation.lawArticle = self.lawArticleField.text;
    self.editingViolation.courtCitationDate = ([self.courtCitationDateField.text isEqualToString:@""]) ? nil : self.courtCitationDate;
    self.editingViolation.courtCitationTime = ([self.courtCitationTimeField.text isEqualToString:@""]) ? nil : self.courtCitationTime;
    
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