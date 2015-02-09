//
//  VehicleExtendedViewController.m
//  transinfo
//
//  Created by Omar Soto Fortuño on 1/26/15.
//  Copyright (c) 2015 University of Puerto Rico Mayagüez Campus. All rights reserved.
//

#import "VehicleExtendedViewController.h"
#import "CollectionManager.h"
#import "Utilities.h"

@interface VehicleExtendedViewController ()

@property NSArray *harmfulEventCategories;
@property NSArray *harmfulEvents;

@end

@implementation VehicleExtendedViewController

- (void)setEditingModeFor:(Vehicle*)vehicle {
    self.editingVehicle = vehicle;
    
    self.navigationBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 50)];
    
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"OK" style:UIBarButtonItemStyleDone target:nil action:nil];
    // TODO
    UINavigationItem *item = [[UINavigationItem alloc] initWithTitle:NSLocalizedString(@"report.fourth.vehicle-extended", nil)];
    item.rightBarButtonItem = rightButton;
    item.hidesBackButton = YES;
    //[rightButton setAction:@selector(addButonAction:)];
    
    [self.navigationBar pushNavigationItem:item animated:NO];
    
    [self.view addSubview:self.navigationBar];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadCollections];
    
    self.harmfulEventCategories = @[self.harmfulEventCategory1Field, self.harmfulEventCategory2Field, self.harmfulEventCategory3Field, self.harmfulEventCategory4Field];
    self.harmfulEvents = @[self.harmfulEvent1Field, self.harmfulEvent2Field, self.harmfulEvent3Field, self.harmfulEvent4Field];
    self.harmfulEventCategoryKeys = [NSMutableArray arrayWithArray:@[@-1, @-1, @-1, @-1, @-1]];
    
    // Delegates
    self.bodyTypeField.delegate = self;
    self.directionOfTravelField.delegate = self;
    self.specialFunctionField.delegate = self;
    self.emergencyUseField.delegate = self;
    self.statutorySpeedField.delegate = self;
    self.postedSpeedField.delegate = self;
    self.actionField.delegate = self;
    self.trafficwayDescriptionField.delegate = self;
    self.roadwayHorizontalAlignmentField.delegate = self;
    self.roadwayGradeField.delegate = self;
    self.totalLaneCategoryField.delegate = self;
    self.totalLaneField.delegate = self;
    self.TCDTypeField.delegate = self;
    self.TCDWorkingField.delegate = self;
    self.harmfulEventCategory1Field.delegate = self;
    self.harmfulEventCategory2Field.delegate = self;
    self.harmfulEventCategory3Field.delegate = self;
    self.harmfulEventCategory4Field.delegate = self;
    self.harmfulEvent1Field.delegate = self;
    self.harmfulEvent2Field.delegate = self;
    self.harmfulEvent3Field.delegate = self;
    self.harmfulEvent4Field.delegate = self;
    self.busUseField.delegate = self;
    self.hitAndRunField.delegate = self;
    self.towedByField.delegate = self;
    self.vehicleCircumstance1Field.delegate = self;
    self.vehicleCircumstance2Field.delegate = self;
    self.initialContactPointField.delegate = self;
    self.damagedAreasField.delegate = self;
    self.extentOfDamageField.delegate = self;
}

- (void)loadCollections {
    self.collections = [[NSMutableDictionary alloc] init];
    
    NSArray *collectionNames = @[@"bodyTypes", @"specialFunctions", @"emergencyUses", @"postedSpeeds", @"directionsOfTravel", @"trafficwayDescriptions", @"totalLanesCategories", @"totalLanes", @"roadwayHorizontalAlignments", @"roadwayGrades", @"TCDWorking", @"TCDTypes", @"actions", @"initialContactPoints", @"damagedAreas", @"extentOfDamages", @"harmfulEvents", @"harmfulEventCategories", @"hitAndRun", @"towedBy", @"schoolBusRelated", @"vehicleCircumstances"];
    
    NSMutableArray *collectionsManagers = [[NSMutableArray alloc] init];
    int i = 0;
    
    for (NSString *collectionName in collectionNames) {
        [self.collections setObject:[NSDate date] forKey:collectionName];
        [collectionsManagers addObject:[[CollectionManager alloc] init]];
        ((CollectionManager*)collectionsManagers[i]).delegate = self;
        [collectionsManagers[i] getCollection:collectionName];
        
        i++;
    }
}

- (void)receivedCollection:(NSArray *)collection withName:(NSString *)collectionName {
    [self.collections setObject:collection forKey:collectionName];
    
    // NSDictionary *personDictionary = @{@"typeCategoryKey" : self.personTypeCategoryKey, @"typeKey" : self.personTypeKey, @"genderKey" : self.genderKey, @"licenseTypeKey" : self.licenseTypeKey, @"organDonorKey" : self.organDonorKey,
    //NSArray *collectionNames = @[@"personTypeCategories", @"personTypes", @"driverLicenseTypes", @"genders", @"organDonor", @"vehicles", @"vehicleTypes"];
    
    //NSLog(@"Received Collection %@ %@", collectionName, collection);
    
    /*if (self.editingPerson != nil) {
        if ([collectionName isEqualToString:@"personTypeCategories"]) {
            [self loadDefaultForCollection:collectionName toField:self.personTypeCategoryField withKey:@"PersonTypeCategoryID" defaultValue:self.editingPerson.typeCategoryKey];
        } else if ([collectionName isEqualToString:@"personTypes"]) {
            //self.personTypeField.text = [collection objectAtIndex:[self.personTypeKey longLongValue]];
            [self loadDefaultForCollection:collectionName toField:self.personTypeField withKey:@"PersonTypeID" defaultValue:[NSString stringWithFormat:@"%ld", (long)self.editingPerson.typeKey]];
        } else if ([collectionName isEqualToString:@"driverLicenseTypes"]) {
            //self.licenseTypeField.text = [collection objectAtIndex:[self.licenseTypeKey longLongValue]];
            [self loadDefaultForCollection:collectionName toField:self.licenseTypeField withKey:@"DriverLicenseTypeID" defaultValue:self.editingPerson.licenseTypeKey];
        } else if ([collectionName isEqualToString:@"genders"]) {
            //self.genderField.text = [collection objectAtIndex:[self.genderKey longLongValue]];
            [self loadDefaultForCollection:collectionName toField:self.genderField withKey:@"GenderID" defaultValue:self.editingPerson.genderKey];
        } else if ([collectionName isEqualToString:@"organDonor"]) {
            //self.organDonorField.text = [collection objectAtIndex:[self.organDonorKey longLongValue]];
            [self loadDefaultForCollection:collectionName toField:self.organDonorField withKey:@"OrganDonorID" defaultValue:self.editingPerson.organDonorKey];
        }
    }*/
    
    NSLog(@"Received Collection: %@ (%lu elements)", collectionName, (unsigned long)[collection count]);
}

- (void)loadDefaultForCollection:(NSString*)collectionName toField:(UITextField*)field withKey:(NSString*)key defaultValue:(NSString*)value {
    NSArray *collection = [self.collections objectForKey:collectionName];
    
    NSLog(@"Loading default for %@, value: %@", key, value);
    
    for (NSDictionary *dict in collection) {
        if ([[NSString stringWithFormat:@"%@", [dict objectForKey:key]] isEqualToString:value]) {
            field.text = [dict objectForKey:[Utilities collectionColumn]];
            break;
        }
    }
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    [self.view endEditing:YES];
    
    if (textField == self.bodyTypeField) {
        [self showCollection:@"bodyTypes" withIDColumn:@"BodyTypeID" withField:textField];
        return NO;
    } else if (textField == self.directionOfTravelField) {
        [self showCollection:@"directionsOfTravel" withIDColumn:@"DirectionOfTravelID" withField:textField];
        return NO;
    } else if (textField == self.specialFunctionField) {
        [self showCollection:@"specialFunctions" withIDColumn:@"SpecialFunctionID" withField:textField];
        return NO;
    } else if (textField == self.emergencyUseField) {
        [self showCollection:@"emergencyUses" withIDColumn:@"EmergencyUseID" withField:textField];
        return NO;
    } else if (textField == self.statutorySpeedField) {
        [self showCollection:@"postedSpeeds" withIDColumn:@"PostedSpeedID" withField:textField];
        return NO;
    } else if (textField == self.postedSpeedField) {
        [self showCollection:@"postedSpeeds" withIDColumn:@"PostedSpeedID" withField:textField];
        return NO;
    } else if (textField == self.actionField) {
        [self showCollection:@"actions" withIDColumn:@"ActionID" withField:textField];
        return NO;
    } else if (textField == self.trafficwayDescriptionField) {
        [self showCollection:@"trafficwayDescriptions" withIDColumn:@"TrafficwayDescriptionID" withField:textField];
        return NO;
    } else if (textField == self.roadwayHorizontalAlignmentField) {
        [self showCollection:@"roadwayHorizontalAlignments" withIDColumn:@"RoadwayHorizontalAlignmentID" withField:textField];
        return NO;
    } else if (textField == self.roadwayGradeField) {
        [self showCollection:@"roadwayGrades" withIDColumn:@"RoadwayGradeID" withField:textField];
        return NO;
    } else if (textField == self.totalLaneCategoryField) {
        [self showCollection:@"totalLanesCategories" withIDColumn:@"TotalLanesCategoryID" withField:textField];
        return NO;
    } else if (textField == self.totalLaneField) {
        [self showCollection:@"totalLanes" withIDColumn:@"TotalLanesID" withField:textField];
        return NO;
    } else if (textField == self.TCDTypeField) {
        [self showCollection:@"TCDTypes" withIDColumn:@"TCDTypeID" withField:textField];
        return NO;
    } else if (textField == self.TCDWorkingField) {
        [self showCollection:@"TCDWorking" withIDColumn:@"TCDWorkingID" withField:textField];
        return NO;
    } else if ([self.harmfulEventCategories containsObject:textField]) {
        [self showCollection:@"harmfulEventCategories" withIDColumn:@"HarmfulEventCatID" withField:textField];
        return NO;
    } else if ([self.harmfulEvents containsObject:textField]) {
        [self showCollection:@"harmfulEvents" withIDColumn:@"HarmfulEventID" withField:textField];
        return NO;
    } else if (textField == self.busUseField) {
        [self showCollection:@"schoolBusRelated" withIDColumn:@"SchoolBusRelatedID" withField:textField];
        return NO;
    } else if (textField == self.hitAndRunField) {
        [self showCollection:@"hitAndRun" withIDColumn:@"HitAndRunID" withField:textField];
        return NO;
    } else if (textField == self.towedByField) {
        [self showCollection:@"towedBy" withIDColumn:@"TowedByID" withField:textField];
        return NO;
    } else if (textField == self.vehicleCircumstance1Field || textField == self.vehicleCircumstance2Field) {
        [self showCollection:@"vehicleCircumstances" withIDColumn:@"VehicleCircumstanceID" withField:textField];
        return NO;
    } else if (textField == self.initialContactPointField) {
        [self showCollection:@"initialContactPoints" withIDColumn:@"InitialContactPointID" withField:textField];
        return NO;
    } else if (textField == self.damagedAreasField) {
        [self showCollection:@"damagedAreas" withIDColumn:@"DamagedAreaID" withField:textField];
        return NO;
    } else if (textField == self.extentOfDamageField) {
        [self showCollection:@"extentOfDamages" withIDColumn:@"ExtentOfDamageID" withField:textField];
        return NO;
    }
    
    return YES;
}

- (void)keysSelected:(NSArray *)keys withIdentifier:(NSString *)identifier {
    if ([identifier isEqualToString:@"totalLanesCategories"]) {
        self.totalLaneCategoryKey = keys[0];
        self.totalLaneField.text = @"";
    } if ([identifier isEqualToString:@"harmfulEventCategories"]) {
        NSInteger cat = [self getHarmfulEventCategoryKeyFor:self.latestField];
        
        [self.harmfulEventCategoryKeys replaceObjectAtIndex:cat withObject:keys[0]];
        ((UITextField*)[self.harmfulEvents objectAtIndex:cat]).text = @"";
        
        /*self.totalLaneCategoryKey = keys[0];
        self.totalLaneField.text = @"";*/
    }
}

- (void)viewWillAppear:(BOOL)animated {
    if (self.navigationBar != nil) {
        [self.navigationBar setFrame:CGRectMake(0, 0, self.view.frame.size.width, 50)];
        [(UIScrollView *)self.view setContentSize:CGSizeMake(700,1200)];
    }
    
    if (self.editingVehicle != nil) {
        self.vehicleLicensePlateField.text = self.editingVehicle.registrationPlate;
        self.vehicleYearField.text = self.editingVehicle.year;
        self.vehicleMakeField.text = self.editingVehicle.make;
        self.vehicleModelField.text = self.editingVehicle.model;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showCollection:(NSString*)collectionName withIDColumn:(NSString*)IDColumn withField:(id)field {
    if ([self.collections[collectionName] isKindOfClass:[NSArray class]]) {
        self.latestField = field;
        
        NSMutableDictionary *collection = [[NSMutableDictionary alloc] init];
        
        NSInteger harmfulEventCategory = 0;
        BOOL isTotalLane = [collectionName isEqualToString:@"totalLanes"];
        BOOL isHarmfulEvent = [self.harmfulEvents containsObject:field];
        
        if (isTotalLane && self.totalLaneCategoryKey == nil) {
            [Utilities displayAlertWithMessage:NSLocalizedString(@"report.fourth.no-total-lanes-category.msg", nil) withTitle:NSLocalizedString(@"report.fourth.no-total-lanes-category.title", nil) ];
            return;
        }
        
        if (isHarmfulEvent) {
            harmfulEventCategory = [self getHarmfulEventKeyFor:field];
            NSLog(@"Cat Key: %ld Actual Key: %@", (long)harmfulEventCategory, [self.harmfulEventCategoryKeys objectAtIndex:harmfulEventCategory]);
            if ([[self.harmfulEventCategoryKeys objectAtIndex:harmfulEventCategory]  isEqual:@-1]) {
                [Utilities displayAlertWithMessage:NSLocalizedString(@"report.fourth.no-total-lanes-category.msg", nil) withTitle:NSLocalizedString(@"report.fourth.no-total-lanes-category.title", nil) ];
                return;
            }
        }
        
        for (NSDictionary *elem in self.collections[collectionName]) {
            if (isTotalLane) {
                if (![self.totalLaneCategoryKey isEqualToString:[NSString stringWithFormat:@"%@", [elem objectForKey:@"TotalLanesCategoryID"]]]) {
                    continue;
                }
            } else if (isHarmfulEvent) {
                NSLog(@"Cat: %@ Elem Cat: %@", [[self.harmfulEventCategoryKeys objectAtIndex:harmfulEventCategory] class], [[elem objectForKey:@"HarmfulEventCatID"] class]);
                if (![[self.harmfulEventCategoryKeys objectAtIndex:harmfulEventCategory] isEqualToString:[NSString stringWithFormat:@"%@", [elem objectForKey:@"HarmfulEventCatID"]]]) {
                    continue;
                }
            }
            
            [collection setObject:(NSString*)[elem objectForKey:[Utilities collectionColumn]] forKey:[NSString stringWithFormat:@"%@", [elem objectForKey:IDColumn]]];
        }
        
        //NSLog(@"%@ %@ %@", collection, field, collectionName);
        
        [self showPickerView:collection withField:field withIdentifier:collectionName];
    } else {
        NSLog(@"No collection yet... %@", collectionName);
        CollectionManager *collManager = [[CollectionManager alloc] init];
        [collManager getCollection:collectionName];
        collManager.delegate = self;
    }
}

- (NSInteger)getHarmfulEventKeyFor:(UITextField*)field {
    NSInteger i = 0;
    
    for (UITextField *tf in self.harmfulEvents) {
        if (tf == field) {
            break;
        }
        
        i++;
    }
    
    return i;
}

- (NSInteger)getHarmfulEventCategoryKeyFor:(UITextField*)field {
    NSInteger i = 0;
    
    for (UITextField *tf in self.harmfulEventCategories) {
        if (tf == field) {
            break;
        }
        
        i++;
    }
    
    return i;
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
