//
//  ViolationViewController.h
//  transinfo
//
//  Created by Omar Soto Fortuño on 3/16/15.
//  Copyright (c) 2015 University of Puerto Rico Mayagüez Campus. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Violation.h"

@interface ViolationViewController : UIViewController<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *violationCodeField;
@property (weak, nonatomic) IBOutlet UITextField *lawArticleField;
@property (weak, nonatomic) IBOutlet UITextField *courtCitationDateField;
@property (weak, nonatomic) IBOutlet UITextField *courtCitationTimeField;


@property (weak, nonatomic) IBOutlet UINavigationBar *navigationBar;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *addButton;

@property Violation *editingViolation;

@property NSDate *courtCitationDate;
@property NSDate *courtCitationTime;

@end
