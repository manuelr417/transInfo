//
//  NarrativeViewController.h
//  transinfo
//
//  Created by Omar Soto Fortuño on 8/24/15.
//  Copyright (c) 2015 University of Puerto Rico Mayagüez Campus. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NarrativeViewController : UIViewController <UITextFieldDelegate, UITextViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *policeNotifiedTimeField;
@property (weak, nonatomic) IBOutlet UITextField *policeArrivalTimeField;

@property (weak, nonatomic) IBOutlet UITextField *EMSNotifiedTimeField;
@property (weak, nonatomic) IBOutlet UITextField *EMSArrivalTimeField;

@property NSDate *policeNotifiedTime;
@property NSDate *policeArrivalTime;

@property NSDate *EMSNotifiedTime;
@property NSDate *EMSArrivalTime;

@property (weak, nonatomic) IBOutlet UITextView *narrativeField;

@end
