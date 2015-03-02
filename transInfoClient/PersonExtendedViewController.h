//
//  PersonExtendedViewController.h
//  transinfo
//
//  Created by Omar Soto Fortuño on 3/2/15.
//  Copyright (c) 2015 University of Puerto Rico Mayagüez Campus. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PickerViewController.h"
#import "Person.h"

@interface PersonExtendedViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *personTypeCategoryField;
@property (weak, nonatomic) IBOutlet UITextField *personTypeField;

@property (weak, nonatomic) IBOutlet UITextField *personNameField;
@property (weak, nonatomic) IBOutlet UITextField *genderField;

@property (weak, nonatomic) IBOutlet UITextField *rowField;
@property (weak, nonatomic) IBOutlet UITextField *seatField;
@property (weak, nonatomic) IBOutlet UITextField *seatingOtherField;

@property UITextField *latestField;

@property NSString *trash;
@property UIView *activeField;
@property NSMutableDictionary *collections;
@property (nonatomic, strong) PickerViewController *pickerView;
@property (nonatomic, strong) UIPopoverController *pickerPopover;

@property Person *editingPerson;

- (void)setEditingModeFor:(Person*)person;

@end
