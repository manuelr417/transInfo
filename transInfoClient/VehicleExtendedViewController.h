//
//  VehicleExtendedViewController.h
//  transinfo
//
//  Created by Omar Soto Fortuño on 1/26/15.
//  Copyright (c) 2015 University of Puerto Rico Mayagüez Campus. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Vehicle.h"
#import "PickerViewController.h"

@interface VehicleExtendedViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *vehicleLicensePlateField;
@property (weak, nonatomic) IBOutlet UITextField *vehicleYearField;
@property (weak, nonatomic) IBOutlet UITextField *vehicleMakeField;
@property (weak, nonatomic) IBOutlet UITextField *vehicleModelField;

@property (weak, nonatomic) IBOutlet UITextField *bodyTypeField;
@property (weak, nonatomic) IBOutlet UITextField *directionOfTravelField;
@property (weak, nonatomic) IBOutlet UITextField *specialFunctionField;
@property (weak, nonatomic) IBOutlet UITextField *emergencyUseField;
@property (weak, nonatomic) IBOutlet UITextField *statutorySpeedMPHField;
@property (weak, nonatomic) IBOutlet UITextField *statutorySpeedField;
@property (weak, nonatomic) IBOutlet UITextField *postedSpeedMPHField;
@property (weak, nonatomic) IBOutlet UITextField *postedSpeedField;
@property (weak, nonatomic) IBOutlet UITextField *actionField;

@property (weak, nonatomic) IBOutlet UITextField *trafficwayDescriptionField;
@property (weak, nonatomic) IBOutlet UITextField *roadwayHorizontalAlignmentField;
@property (weak, nonatomic) IBOutlet UITextField *roadwayGradeField;
@property (weak, nonatomic) IBOutlet UITextField *totalLanesQuantityField;
@property (weak, nonatomic) IBOutlet UITextField *totalLaneCategoryField;
@property (weak, nonatomic) IBOutlet UITextField *totalLaneField;
@property (weak, nonatomic) IBOutlet UITextField *TCDTypeField;
@property (weak, nonatomic) IBOutlet UITextField *TCDWorkingField;

@property (weak, nonatomic) IBOutlet UITextField *harmfulEventCategory1Field;
@property (weak, nonatomic) IBOutlet UITextField *harmfulEventCategory2Field;
@property (weak, nonatomic) IBOutlet UITextField *harmfulEventCategory3Field;
@property (weak, nonatomic) IBOutlet UITextField *harmfulEventCategory4Field;
@property (weak, nonatomic) IBOutlet UITextField *harmfulEvent1Field;
@property (weak, nonatomic) IBOutlet UITextField *harmfulEvent2Field;
@property (weak, nonatomic) IBOutlet UITextField *harmfulEvent3Field;
@property (weak, nonatomic) IBOutlet UITextField *harmfulEvent4Field;

@property (weak, nonatomic) IBOutlet UITextField *busUseField;
@property (weak, nonatomic) IBOutlet UITextField *hitAndRunField;
@property (weak, nonatomic) IBOutlet UITextField *towedByField;

@property (weak, nonatomic) IBOutlet UITextField *vehicleCircumstance1Field;
@property (weak, nonatomic) IBOutlet UITextField *vehicleCircumstance2Field;

@property (weak, nonatomic) IBOutlet UITextField *initialContactPointField;
@property (weak, nonatomic) IBOutlet UITextField *damagedAreasField;
@property (weak, nonatomic) IBOutlet UITextField *extentOfDamageField;

@property NSString *totalLaneCategoryKey;
@property NSMutableArray *harmfulEventCategoryKeys;

@property UITextField *latestField;

/*
 GET     /bodyTypes                  controllers.Collections.getBodyTypes()
 GET     /specialFunctions           controllers.Collections.getSpecialFunctions()
 GET     /emergencyUses              controllers.Collections.getEmergencyUses()
 GET     /postedSpeeds               controllers.Collections.getPostedSpeeds()
 GET     /directionsOfTravel         controllers.Collections.getDirectionsOfTravel()
 GET     /trafficwayDescriptions     controllers.Collections.getTrafficwayDescriptions()
 GET     /totalLanesCategories       controllers.Collections.getTotalLanesCategories()
 GET     /totalLanes                 controllers.Collections.getTotalLanes()
 GET     /roadwayHorizontalAlignments controllers.Collections.getRoadwayHorizontalAlignments()
 GET     /roadwayGrades              controllers.Collections.getRoadwayGrades()
 GET     /TCDWorking                 controllers.Collections.getTCDWorking()
 GET     /TCDTypes                   controllers.Collections.getTCDTypes()
 GET     /actions                    controllers.Collections.getActions()
 GET     /initialContactPoints       controllers.Collections.getInitialContactPoints()
 GET     /damagedAreas               controllers.Collections.getDamagedAreas()
 GET     /extentOfDamages            controllers.Collections.getExtentOfDamages()
 #GET     /harmfulEvents
 #GET     /harmfulEventCategories
 GET     /hitAndRun                  controllers.Collections.getHitAndRun()
 GET     /towedBy                    controllers.Collections.getTowedBy()
 GET     /vehicleCircumstances       controllers.Collections.getVehicleCircumstances()*/

@property NSString *trash;
@property UIView *activeField;
@property NSMutableDictionary *collections;
@property (nonatomic, strong) PickerViewController *pickerView;
@property (nonatomic, strong) UIPopoverController *pickerPopover;

@property Vehicle *editingVehicle;
@property UINavigationBar *navigationBar;

- (void)setEditingModeFor:(Vehicle*)vehicle;

@end
