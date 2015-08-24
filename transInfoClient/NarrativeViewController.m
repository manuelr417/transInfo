//
//  NarrativeViewController.m
//  transinfo
//
//  Created by Omar Soto Fortuño on 8/24/15.
//  Copyright (c) 2015 University of Puerto Rico Mayagüez Campus. All rights reserved.
//

#import "NarrativeViewController.h"
#import "CrashSummary.h"

@implementation NarrativeViewController

- (void)viewWillAppear:(BOOL)animated {
    self.narrativeField.delegate = self;
    
    // Border for Narrative Label
    [self.narrativeField.layer setBorderColor:[[[UIColor grayColor] colorWithAlphaComponent:0.5] CGColor]];
    [self.narrativeField.layer setBorderWidth:0.50];
    self.narrativeField.layer.cornerRadius = 5;
    self.narrativeField.clipsToBounds = YES;
    
    UIDatePicker *datePicker = [[UIDatePicker alloc]init];
    [datePicker setDatePickerMode:UIDatePickerModeTime];
    [datePicker addTarget:self action:@selector(policeNotifiedChanged:) forControlEvents:UIControlEventValueChanged];
    self.policeNotifiedTimeField.inputView = datePicker;
    
    datePicker = [[UIDatePicker alloc]init];
    [datePicker setDatePickerMode:UIDatePickerModeTime];
    [datePicker addTarget:self action:@selector(policeArrivalChanged:) forControlEvents:UIControlEventValueChanged];
    self.policeArrivalTimeField.inputView = datePicker;
    
    datePicker = [[UIDatePicker alloc]init];
    [datePicker setDatePickerMode:UIDatePickerModeTime];
    [datePicker addTarget:self action:@selector(EMSNotifiedChanged:) forControlEvents:UIControlEventValueChanged];
    self.EMSNotifiedTimeField.inputView = datePicker;
    
    datePicker = [[UIDatePicker alloc]init];
    [datePicker setDatePickerMode:UIDatePickerModeTime];
    [datePicker addTarget:self action:@selector(EMSArrivalChanged:) forControlEvents:UIControlEventValueChanged];
    self.EMSArrivalTimeField.inputView = datePicker;
}

- (void)changedDate:(UITextField*)field {
    UIDatePicker *picker = (UIDatePicker*)field.inputView;
    [picker setMaximumDate:[NSDate date]];
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    NSDate *eventDate = picker.date;
    [dateFormat setDateFormat:@"hh:mm a"];
    
    NSString *dateString = [dateFormat stringFromDate:eventDate];
    field.text = [NSString stringWithFormat:@"%@", dateString];
}

- (void)policeNotifiedChanged:(id)sender
{
    [self changedDate:self.policeNotifiedTimeField];
}

- (void)policeArrivalChanged:(id)sender
{
    [self changedDate:self.policeArrivalTimeField];
}

- (void)EMSNotifiedChanged:(id)sender
{
    [self changedDate:self.EMSNotifiedTimeField];
}

- (void)EMSArrivalChanged:(id)sender
{
    [self changedDate:self.EMSArrivalTimeField];
}

- (void)textViewDidChange:(UITextView *)textView {
    if (textView == self.narrativeField) {
        CrashSummary *crashSummary = [CrashSummary sharedCrashSummary];
        crashSummary.crashConditions.narrative = self.narrativeField.text;
        [crashSummary.crashConditions save];
    }
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    CrashSummary *crashSummary = [CrashSummary sharedCrashSummary];
    crashSummary.policeNotifiedTime = self.policeNotifiedTimeField.text;
    crashSummary.policeArrivalTime = self.policeArrivalTimeField.text;
    crashSummary.EMSNotifiedTime = self.EMSNotifiedTimeField.text;
    crashSummary.EMSArrivalTime = self.EMSArrivalTimeField.text;
    
    [crashSummary save];
}

@end
