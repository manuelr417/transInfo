//
//  ReportSecondStepViewController.h
//  transinfo
//
//  Created by Omar Soto Fortuño on 10/20/14.
//  Copyright (c) 2014 University of Puerto Rico Mayagüez Campus. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PickerViewController.h"

@interface ReportSecondStepViewController : UIViewController <UITextFieldDelegate, UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *firstHarmfulEventTypeField;
@property (weak, nonatomic) IBOutlet UITextField *firstHarmfulEventField;
@property (weak, nonatomic) IBOutlet UITextField *relToTrafficwayField;
@property (weak, nonatomic) IBOutlet UITextField *mannerOfCollisionField;
@property (weak, nonatomic) IBOutlet UITextField *weatherCondition1Field;
@property (weak, nonatomic) IBOutlet UITextField *weatherCondition2Field;
@property (weak, nonatomic) IBOutlet UITextField *lightingConditionField;
@property (weak, nonatomic) IBOutlet UITextField *roadSurfaceConditionField;
@property (weak, nonatomic) IBOutlet UITextField *environmentCircumstanceField;
@property (weak, nonatomic) IBOutlet UITextField *roadCircumstanceField;
@property (weak, nonatomic) IBOutlet UITextField *withinInterchangeField;
@property (weak, nonatomic) IBOutlet UITextField *junctionField;
@property (weak, nonatomic) IBOutlet UITextField *intersectionTypeField;
@property (weak, nonatomic) IBOutlet UITextField *schoolBusRelatedField;
@property (weak, nonatomic) IBOutlet UITextField *workZoneRelatedField;
@property (weak, nonatomic) IBOutlet UITextField *workzoneLocationField;
@property (weak, nonatomic) IBOutlet UITextField *workzoneTypeField;
@property (weak, nonatomic) IBOutlet UITextField *workersPresentField;
@property (weak, nonatomic) IBOutlet UITextField *lawEnforcementPresentField;
@property (weak, nonatomic) IBOutlet UITextView *narrativeField;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *sideBarButton;

@property NSString *harmfulEventCategoryKey;

@property NSString *trash;
@property UIView *activeField;
@property NSMutableDictionary *collections;
@property (nonatomic, strong) PickerViewController *pickerView;
@property (nonatomic, strong) UIPopoverController *pickerPopover;

- (void)showPickerView:(NSMutableDictionary*)elements withField:(UITextField*)field withIdentifier:(NSString*)identifier;

@end
