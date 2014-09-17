//
//  UIDatePickerOKView.h
//  transinfo
//
//  Created by Omar Soto Fortuño on 9/10/14.
//  Copyright (c) 2014 University of Puerto Rico Mayagüez Campus. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIDatePickerOKView : UIView
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *okButton;

@property UITextField *parent;

@end
