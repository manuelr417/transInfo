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
#import "CrashSummary.h"

@interface VehicleExtendedViewController ()

@property NSArray *harmfulEventCategories;
@property NSArray *harmfulEvents;

@end

@implementation VehicleExtendedViewController

- (void)setEditingModeFor:(Vehicle*)vehicle {
    self.editingVehicle = vehicle;
    
    /*self.navigationBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 50)];
    
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"OK" style:UIBarButtonItemStyleDone target:nil action:nil];
    
    UINavigationItem *item = [[UINavigationItem alloc] initWithTitle:NSLocalizedString(@"report.fourth.vehicle-extended", nil)];
    item.rightBarButtonItem = rightButton;
    item.hidesBackButton = YES;
    [rightButton setAction:@selector(addButonAction:)];
    
    [self.navigationBar pushNavigationItem:item animated:NO];
    
    [self.view addSubview:self.navigationBar];*/
}

- (void)viewWillDisappear:(BOOL)animated {
    NSLog(@"Pa fuera!");
    [self saveChanges];
}

//- (IBAction)addButonAction:(id)sender {
- (void)saveChanges {
    self.editingVehicle.statutorySpeedMPH = self.statutorySpeedMPHField.text;
    self.editingVehicle.postedSpeedMPH = self.postedSpeedMPHField.text;
    self.editingVehicle.totalLanesQuantity = self.totalLanesQuantityField.text;
    self.editingVehicle.totalAxles = self.totalAxlesField.text;
    
    self.editingVehicle.harmfulEventCategory1Key = self.harmfulEventCategoryKeys[0];
    self.editingVehicle.harmfulEventCategory2Key = self.harmfulEventCategoryKeys[1];
    self.editingVehicle.harmfulEventCategory3Key = self.harmfulEventCategoryKeys[2];
    self.editingVehicle.harmfulEventCategory4Key = self.harmfulEventCategoryKeys[3];
    
    self.editingVehicle.harmfulEvent1Key = self.harmfulEventKeys[0];
    self.editingVehicle.harmfulEvent2Key = self.harmfulEventKeys[1];
    self.editingVehicle.harmfulEvent3Key = self.harmfulEventKeys[2];
    self.editingVehicle.harmfulEvent4Key = self.harmfulEventKeys[3];
    
    CrashSummary *crashSummary = [CrashSummary sharedCrashSummary];
    
    NSString *vehicleUUID = self.editingVehicle.uuid;
    
    if (vehicleUUID != nil) {
        NSLog(@"Updating UUID: %@", vehicleUUID);
        
        for (Vehicle *v in crashSummary.vehicles) {
            if ([v.uuid isEqualToString:vehicleUUID]) {
                NSUInteger index = [crashSummary.vehicles indexOfObject:v];
                
                NSLog(@"Found at %lu, replacing!", (unsigned long)index);
                
                [crashSummary.vehicles replaceObjectAtIndex:index withObject:self.editingVehicle];
                
                break;
            }
        }
    }
    
    //[self dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadCollections];
    
    self.harmfulEventCategories = @[self.harmfulEventCategory1Field, self.harmfulEventCategory2Field, self.harmfulEventCategory3Field, self.harmfulEventCategory4Field];
    self.harmfulEvents = @[self.harmfulEvent1Field, self.harmfulEvent2Field, self.harmfulEvent3Field, self.harmfulEvent4Field];
    self.harmfulEventCategoryKeys = [NSMutableArray arrayWithArray:@[@-1, @-1, @-1, @-1, @-1]];
    self.harmfulEventKeys = [NSMutableArray arrayWithArray:@[@-1, @-1, @-1, @-1, @-1]];
    
    if (self.editingVehicle != nil) {
        self.harmfulEventCategoryKeys = [NSMutableArray arrayWithArray:@[self.editingVehicle.harmfulEventCategory1Key, self.editingVehicle.harmfulEventCategory2Key, self.editingVehicle.harmfulEventCategory3Key,self.editingVehicle.harmfulEventCategory4Key, @-1]];
        self.harmfulEventKeys = [NSMutableArray arrayWithArray:@[self.editingVehicle.harmfulEvent1Key, self.editingVehicle.harmfulEvent2Key, self.editingVehicle.harmfulEvent3Key, self.editingVehicle.harmfulEvent4Key, @-1]];
    }
    
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
    self.TCDTypesField.delegate = self;
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
    self.motorCarrierTypeField.delegate = self;
    self.vehicleMovementField.delegate = self;
    self.driverIsAuthorizedField.delegate = self;
    self.inspectionUpToDateField.delegate = self;
    self.specialPermitField.delegate = self;
    self.GVWRGCWRField.delegate = self;
    self.configurationField.delegate = self;
    self.cargoBodyTypeField.delegate = self;
    self.hazMatInvolvedField.delegate = self;
    self.placardDisplayedField.delegate = self;
    self.hazMatReleasedField.delegate = self;
}

- (void)loadCollections {
    self.collections = [[NSMutableDictionary alloc] init];
    
    NSArray *collectionNames = @[@"bodyTypes", @"specialFunctions", @"emergencyUses", @"postedSpeeds", @"directionsOfTravel", @"trafficwayDescriptions", @"totalLanesCategories", @"totalLanes", @"roadwayHorizontalAlignments", @"roadwayGrades", @"TCDWorking", @"TCDTypes", @"actions", @"initialContactPoints", @"damagedAreas", @"extentOfDamages", @"harmfulEvents", @"harmfulEventCategories", @"hitAndRun", @"towedBy", @"schoolBusRelated", @"vehicleCircumstances", @"motorCarrierTypes", @"vehicleMovements", @"driverIsAuthorized", @"inspectionUpToDate", @"specialPermits", @"GVWRGCWR", @"configurations", @"cargoBodyTypes", @"hazMatInvolved", @"placardDisplayed", @"hazMatReleased"];
    
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
    
    NSLog(@"Received Collection: %@ (%lu elements)", collectionName, (unsigned long)[collection count]);
    
    if (self.editingVehicle != nil) {
        if ([collectionName isEqualToString:@"bodyTypes"]) {
            [self loadDefaultForCollection:collectionName toField:self.bodyTypeField withKey:@"BodyTypeID" defaultValue:self.editingVehicle.bodyTypeKey];
        } else if ([collectionName isEqualToString:@"directionsOfTravel"]) {
            [self loadDefaultForCollection:collectionName toField:self.directionOfTravelField withKey:@"DirectionOfTravelID" defaultValue:self.editingVehicle.directionOfTravelKey];
        } else if ([collectionName isEqualToString:@"specialFunctions"]) {
            [self loadDefaultForCollection:collectionName toField:self.specialFunctionField withKey:@"SpecialFunctionID" defaultValue:self.editingVehicle.specialFunctionKey];
        } else if ([collectionName isEqualToString:@"emergencyUses"]) {
            [self loadDefaultForCollection:collectionName toField:self.emergencyUseField withKey:@"EmergencyUseID" defaultValue:self.editingVehicle.emergencyUseKey];
        } else if ([collectionName isEqualToString:@"postedSpeeds"]) {
            [self loadDefaultForCollection:collectionName toField:self.statutorySpeedField withKey:@"PostedSpeedID" defaultValue:self.editingVehicle.statutorySpeedKey];
            [self loadDefaultForCollection:collectionName toField:self.postedSpeedField withKey:@"PostedSpeedID" defaultValue:self.editingVehicle.postedSpeedKey];
        } else if ([collectionName isEqualToString:@"actions"]) {
            [self loadDefaultForCollection:collectionName toField:self.actionField withKey:@"ActionID" defaultValue:self.editingVehicle.actionKey];
        } else if ([collectionName isEqualToString:@"trafficwayDescriptions"]) {
            [self loadDefaultForCollection:collectionName toField:self.trafficwayDescriptionField withKey:@"TrafficwayDescriptionID" defaultValue:self.editingVehicle.trafficwayDescriptionKey];
        } else if ([collectionName isEqualToString:@"roadwayHorizontalAlignments"]) {
            [self loadDefaultForCollection:collectionName toField:self.roadwayHorizontalAlignmentField withKey:@"RoadwayHorizontalAlignmentID" defaultValue:self.editingVehicle.roadwayHorizontalAlignmentKey];
        } else if ([collectionName isEqualToString:@"roadwayGrades"]) {
            [self loadDefaultForCollection:collectionName toField:self.roadwayGradeField withKey:@"RoadwayGradeID" defaultValue:self.editingVehicle.roadwayGradeKey];
        } else if ([collectionName isEqualToString:@"totalLanesCategories"]) {
            [self loadDefaultForCollection:collectionName toField:self.totalLaneCategoryField withKey:@"TotalLanesCategoryID" defaultValue:self.editingVehicle.totalLaneCategoryKey];
        } else if ([collectionName isEqualToString:@"totalLanes"]) {
            [self loadDefaultForCollection:collectionName toField:self.totalLaneField withKey:@"TotalLanesID" defaultValue:self.editingVehicle.totalLaneKey];
        } else if ([collectionName isEqualToString:@"TCDTypes"]) {
            self.TCDTypesField.text = [NSString stringWithFormat:NSLocalizedString(@"multilist.selected", nil), [self.editingVehicle.TCDTypes count]];
            //[self loadDefaultForCollection:collectionName toField:self.TCDTypeField withKey:@"TCDTypeID" defaultValue:self.editingVehicle.TCDTypes];
        } else if ([collectionName isEqualToString:@"TCDWorking"]) {
            [self loadDefaultForCollection:collectionName toField:self.TCDWorkingField withKey:@"TCDWorkingID" defaultValue:self.editingVehicle.TCDWorkingKey];
        } else if ([collectionName isEqualToString:@"harmfulEventCategories"]) {
            NSLog(@"harmfulEventCategories Key: %@", self.editingVehicle.harmfulEventCategory1Key);
            [self loadDefaultForCollection:collectionName toField:self.harmfulEventCategory1Field withKey:@"HarmfulEventCatID" defaultValue:self.editingVehicle.harmfulEventCategory1Key];
            [self loadDefaultForCollection:collectionName toField:self.harmfulEventCategory2Field withKey:@"HarmfulEventCatID" defaultValue:self.editingVehicle.harmfulEventCategory2Key];
            [self loadDefaultForCollection:collectionName toField:self.harmfulEventCategory3Field withKey:@"HarmfulEventCatID" defaultValue:self.editingVehicle.harmfulEventCategory3Key];
            [self loadDefaultForCollection:collectionName toField:self.harmfulEventCategory4Field withKey:@"HarmfulEventCatID" defaultValue:self.editingVehicle.harmfulEventCategory4Key];
        } else if ([collectionName isEqualToString:@"harmfulEvents"]) {
            NSLog(@"harmfulEvents Key: %@", self.editingVehicle.harmfulEvent4Key);
            [self loadDefaultForCollection:collectionName toField:self.harmfulEvent1Field withKey:@"HarmfulEventID" defaultValue:self.editingVehicle.harmfulEvent1Key];
            [self loadDefaultForCollection:collectionName toField:self.harmfulEvent2Field withKey:@"HarmfulEventID" defaultValue:self.editingVehicle.harmfulEvent2Key];
            [self loadDefaultForCollection:collectionName toField:self.harmfulEvent3Field withKey:@"HarmfulEventID" defaultValue:self.editingVehicle.harmfulEvent3Key];
            [self loadDefaultForCollection:collectionName toField:self.harmfulEvent4Field withKey:@"HarmfulEventID" defaultValue:self.editingVehicle.harmfulEvent4Key];
        } else if ([collectionName isEqualToString:@"schoolBusRelated"]) {
            [self loadDefaultForCollection:collectionName toField:self.busUseField withKey:@"SchoolBusRelatedID" defaultValue:self.editingVehicle.busUseKey];
        } else if ([collectionName isEqualToString:@"hitAndRun"]) {
            [self loadDefaultForCollection:collectionName toField:self.hitAndRunField withKey:@"HitAndRunID" defaultValue:self.editingVehicle.hitAndRunKey];
        } else if ([collectionName isEqualToString:@"towedBy"]) {
            [self loadDefaultForCollection:collectionName toField:self.towedByField withKey:@"TowedByID" defaultValue:self.editingVehicle.towedByKey];
        } else if ([collectionName isEqualToString:@"vehicleCircumstances"]) {
            [self loadDefaultForCollection:collectionName toField:self.vehicleCircumstance1Field withKey:@"VehicleCircumstanceID" defaultValue:self.editingVehicle.vehicleCircumstance1Key];
            [self loadDefaultForCollection:collectionName toField:self.vehicleCircumstance2Field withKey:@"VehicleCircumstanceID" defaultValue:self.editingVehicle.vehicleCircumstance2Key];
        } else if ([collectionName isEqualToString:@"initialContactPoints"]) {
            [self loadDefaultForCollection:collectionName toField:self.initialContactPointField withKey:@"InitialContactPointID" defaultValue:self.editingVehicle.initialContactPointKey];
        } else if ([collectionName isEqualToString:@"damagedAreas"]) {
            self.damagedAreasField.text = [NSString stringWithFormat:NSLocalizedString(@"multilist.selected", nil), [self.editingVehicle.damagedAreas count]];
        } else if ([collectionName isEqualToString:@"extentOfDamages"]) {
            [self loadDefaultForCollection:collectionName toField:self.extentOfDamageField withKey:@"ExtentOfDamageID" defaultValue:self.editingVehicle.extentOfDamageKey];
        } else if ([collectionName isEqualToString:@"motorCarrierTypes"]) {
            [self loadDefaultForCollection:collectionName toField:self.motorCarrierTypeField withKey:@"MotorCarrierTypeID" defaultValue:self.editingVehicle.motorCarrierTypeKey];
        } else if ([collectionName isEqualToString:@"vehicleMovements"]) {
            [self loadDefaultForCollection:collectionName toField:self.vehicleMovementField withKey:@"VehicleMovementID" defaultValue:self.editingVehicle.vehicleMovementKey];
        } else if ([collectionName isEqualToString:@"driverIsAuthorized"]) {
            [self loadDefaultForCollection:collectionName toField:self.driverIsAuthorizedField withKey:@"DriverIsAuthorizedID" defaultValue:self.editingVehicle.driverIsAuthorizedKey];
        } else if ([collectionName isEqualToString:@"inspectionUpToDate"]) {
            [self loadDefaultForCollection:collectionName toField:self.inspectionUpToDateField withKey:@"InspectionUpToDateID" defaultValue:self.editingVehicle.inspectionUpToDateKey];
        } else if ([collectionName isEqualToString:@"specialPermits"]) {
            [self loadDefaultForCollection:collectionName toField:self.specialPermitField withKey:@"SpecialPermitID" defaultValue:self.editingVehicle.specialPermitKey];
        } else if ([collectionName isEqualToString:@"GVWRGCWR"]) {
            [self loadDefaultForCollection:collectionName toField:self.GVWRGCWRField withKey:@"GVWRGCWRID" defaultValue:self.editingVehicle.GVWRGCWRKey];
        } else if ([collectionName isEqualToString:@"configurations"]) {
            [self loadDefaultForCollection:collectionName toField:self.configurationField withKey:@"ConfigurationID" defaultValue:self.editingVehicle.configurationKey];
        } else if ([collectionName isEqualToString:@"cargoBodyTypes"]) {
            [self loadDefaultForCollection:collectionName toField:self.cargoBodyTypeField withKey:@"CargoBodyTypeID" defaultValue:self.editingVehicle.cargoBodyTypeKey];
        } else if ([collectionName isEqualToString:@"hazMatInvolved"]) {
            [self loadDefaultForCollection:collectionName toField:self.hazMatInvolvedField withKey:@"HazMatInvolvedID" defaultValue:self.editingVehicle.hazMatInvolvedKey];
        } else if ([collectionName isEqualToString:@"placardDisplayed"]) {
            [self loadDefaultForCollection:collectionName toField:self.placardDisplayedField withKey:@"PlacardDisplayedID" defaultValue:self.editingVehicle.placardDisplayedKey];
        } else if ([collectionName isEqualToString:@"hazMatReleased"]) {
            [self loadDefaultForCollection:collectionName toField:self.hazMatReleasedField withKey:@"HazMatReleasedID" defaultValue:self.editingVehicle.hazMatReleasedKey];
        }
    }
    
    //NSLog(@"Received Collection: %@ (%lu elements)", collectionName, (unsigned long)[collection count]);
}

- (void)loadDefaultForCollection:(NSString*)collectionName toField:(UITextField*)field withKey:(NSString*)key defaultValue:(NSString*)value {
    
    if ([value isEqualToString:@"-1"]) {
        NSLog(@"Ignoring %@, value: %@", key, value);
        return;
    }
    
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
    } else if (textField == self.TCDTypesField) {
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
    } else if (textField == self.motorCarrierTypeField) {
        [self showCollection:@"motorCarrierTypes" withIDColumn:@"MotorCarrierTypeID" withField:textField];
        return NO;
    } else if (textField == self.vehicleMovementField) {
        [self showCollection:@"vehicleMovements" withIDColumn:@"VehicleMovementID" withField:textField];
        return NO;
    } else if (textField == self.driverIsAuthorizedField) {
        [self showCollection:@"driverIsAuthorized" withIDColumn:@"DriverIsAuthorizedID" withField:textField];
        return NO;
    } else if (textField == self.inspectionUpToDateField) {
        [self showCollection:@"inspectionUpToDate" withIDColumn:@"InspectionUpToDateID" withField:textField];
        return NO;
    } else if (textField == self.specialPermitField) {
        [self showCollection:@"specialPermits" withIDColumn:@"SpecialPermitID" withField:textField];
        return NO;
    } else if (textField == self.GVWRGCWRField) {
        [self showCollection:@"GVWRGCWR" withIDColumn:@"GVWRGCWRID" withField:textField];
        return NO;
    } else if (textField == self.configurationField) {
        [self showCollection:@"configurations" withIDColumn:@"ConfigurationID" withField:textField];
        return NO;
    } else if (textField == self.cargoBodyTypeField) {
        [self showCollection:@"cargoBodyTypes" withIDColumn:@"CargoBodyTypeID" withField:textField];
        return NO;
    } else if (textField == self.hazMatInvolvedField) {
        [self showCollection:@"hazMatInvolved" withIDColumn:@"HazMatInvolvedID" withField:textField];
        return NO;
    } else if (textField == self.placardDisplayedField) {
        [self showCollection:@"placardDisplayed" withIDColumn:@"PlacardDisplayedID" withField:textField];
        return NO;
    } else if (textField == self.hazMatReleasedField) {
        [self showCollection:@"hazMatReleased" withIDColumn:@"HazMatReleasedID" withField:textField];
        return NO;
    }
    
    return YES;
}

- (void)keysSelected:(NSArray *)keys withIdentifier:(NSString *)identifier withOutField:(UITextField *)outField {
    /*if ([identifier isEqualToString:@"totalLanesCategories"]) {
        self.totalLaneCategoryKey = keys[0];
        self.totalLaneField.text = @"";
    } if ([identifier isEqualToString:@"harmfulEventCategories"]) {
        NSInteger cat = [self getHarmfulEventCategoryKeyFor:self.latestField];
        
        [self.harmfulEventCategoryKeys replaceObjectAtIndex:cat withObject:keys[0]];
        ((UITextField*)[self.harmfulEvents objectAtIndex:cat]).text = @"";
        
        self.totalLaneCategoryKey = keys[0];
        self.totalLaneField.text = @"";*/
    /*} if ([identifier isEqualToString:@"damagedAreas"]) {
        [self.editingVehicle setDamagedAreas:[NSMutableArray arrayWithArray:keys]];
    }*/
    
    if (outField == self.bodyTypeField) {
        self.editingVehicle.bodyTypeKey = keys[0];
    } else if (outField == self.directionOfTravelField) {
        self.editingVehicle.directionOfTravelKey = keys[0];
    } else if (outField == self.specialFunctionField) {
        self.editingVehicle.specialFunctionKey = keys[0];
    } else if (outField == self.emergencyUseField) {
        self.editingVehicle.emergencyUseKey = keys[0];
    } else if (outField == self.statutorySpeedField) {
        self.editingVehicle.statutorySpeedKey = keys[0];
    } else if (outField == self.postedSpeedField) {
        self.editingVehicle.postedSpeedKey = keys[0];
    } else if (outField == self.actionField) {
        self.editingVehicle.actionKey = keys[0];
    } else if (outField == self.trafficwayDescriptionField) {
        self.editingVehicle.trafficwayDescriptionKey = keys[0];
    } else if (outField == self.roadwayHorizontalAlignmentField) {
        self.editingVehicle.roadwayHorizontalAlignmentKey = keys[0];
    } else if (outField == self.roadwayGradeField) {
        self.editingVehicle.roadwayGradeKey = keys[0];
    } else if (outField == self.totalLaneCategoryField) {
        self.editingVehicle.totalLaneCategoryKey = keys[0];
        self.totalLaneField.text = @"";
        self.totalLaneCategoryKey = keys[0];
    } else if (outField == self.totalLaneField) {
        self.editingVehicle.totalLaneKey = keys[0];
    } else if (outField == self.TCDTypesField) {
        //self.editingVehicle.TCDTypes = keys[0];
        [self.editingVehicle setTCDTypes:[NSMutableArray arrayWithArray:keys]];
    } else if (outField == self.TCDWorkingField) {
        self.editingVehicle.TCDWorkingKey = keys[0];
    } else if ([self.harmfulEventCategories containsObject:outField]) {
        NSInteger cat = [self getHarmfulEventCategoryKeyFor:outField];
        
        [self.harmfulEventCategoryKeys replaceObjectAtIndex:cat withObject:keys[0]];
        ((UITextField*)[self.harmfulEvents objectAtIndex:cat]).text = @"";
    } else if ([self.harmfulEvents containsObject:outField]) {
        NSInteger cat = [self getHarmfulEventKeyFor:outField];
        
        [self.harmfulEventKeys replaceObjectAtIndex:cat withObject:keys[0]];
    } else if (outField == self.busUseField) {
        self.editingVehicle.busUseKey = keys[0];
    } else if (outField == self.hitAndRunField) {
        self.editingVehicle.hitAndRunKey = keys[0];
    } else if (outField == self.towedByField) {
        self.editingVehicle.towedByKey = keys[0];
    } else if (outField == self.vehicleCircumstance1Field) {
        self.editingVehicle.vehicleCircumstance1Key = keys[0];
    } else if (outField == self.vehicleCircumstance2Field) {
        self.editingVehicle.vehicleCircumstance2Key = keys[0];
    } else if (outField == self.initialContactPointField) {
        self.editingVehicle.initialContactPointKey = keys[0];
    } else if (outField == self.damagedAreasField) {
        [self.editingVehicle setDamagedAreas:[NSMutableArray arrayWithArray:keys]];
    } else if (outField == self.extentOfDamageField) {
        self.editingVehicle.extentOfDamageKey = keys[0];
    } else if (outField == self.motorCarrierTypeField) {
        self.editingVehicle.motorCarrierTypeKey = keys[0];
    } else if (outField == self.vehicleMovementField) {
        self.editingVehicle.vehicleMovementKey = keys[0];
    } else if (outField == self.driverIsAuthorizedField) {
        self.editingVehicle.driverIsAuthorizedKey = keys[0];
    } else if (outField == self.inspectionUpToDateField) {
        self.editingVehicle.inspectionUpToDateKey = keys[0];
    } else if (outField == self.specialPermitField) {
        self.editingVehicle.specialPermitKey = keys[0];
    } else if (outField == self.GVWRGCWRField) {
        self.editingVehicle.GVWRGCWRKey = keys[0];
    } else if (outField == self.configurationField) {
        self.editingVehicle.configurationKey = keys[0];
    } else if (outField == self.cargoBodyTypeField) {
        self.editingVehicle.cargoBodyTypeKey = keys[0];
    } else if (outField == self.hazMatInvolvedField) {
        self.editingVehicle.hazMatInvolvedKey = keys[0];
    } else if (outField == self.placardDisplayedField) {
        self.editingVehicle.placardDisplayedKey = keys[0];
    } else if (outField == self.hazMatReleasedField) {
        self.editingVehicle.hazMatReleasedKey = keys[0];
    }
}

- (void)viewWillAppear:(BOOL)animated {
    //if (self.navigationBar != nil) {
        //[self.navigationBar setFrame:CGRectMake(0, 0, self.view.frame.size.width, 50)];
        [(UIScrollView *)self.view setContentSize:CGSizeMake(700,1600)];
    //}
    
    if (self.editingVehicle != nil) {
        self.vehicleLicensePlateField.text = self.editingVehicle.registrationPlate;
        self.vehicleYearField.text = self.editingVehicle.year;
        self.vehicleMakeField.text = self.editingVehicle.make;
        self.vehicleModelField.text = self.editingVehicle.model;
        
        self.statutorySpeedMPHField.text = self.editingVehicle.statutorySpeedMPH;
        self.postedSpeedMPHField.text = self.editingVehicle.postedSpeedMPH ;
        self.totalLanesQuantityField.text = self.editingVehicle.totalLanesQuantity;
        self.totalAxlesField.text = self.editingVehicle.totalAxles;
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
            if ([[self.harmfulEventCategoryKeys objectAtIndex:harmfulEventCategory] isEqualToString:@"-1"]) {
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
        
        if (field == self.damagedAreasField || field == self.TCDTypesField) {
            [self showPickerView:collection withField:field withIdentifier:collectionName withMultipleChoice:YES];
        } else {
            [self showPickerView:collection withField:field withIdentifier:collectionName withMultipleChoice:NO];
        }
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

- (void)showPickerView:(NSMutableDictionary*)elements withField:(UITextField*)field withIdentifier:(NSString*)identifier withMultipleChoice:(BOOL)isMultipleChoice {
    self.pickerView = [[PickerViewController alloc] initWithStyle:UITableViewStylePlain withElementsDictionary:elements withMultipleChoice:isMultipleChoice];
    self.pickerPopover = [[UIPopoverController alloc] initWithContentViewController:self.pickerView];
    
    self.pickerView.delegate = self;
    self.pickerView.outField = field;
    self.pickerView.popover = self.pickerPopover;
    [self.pickerView setIdentifier:identifier];
    
    if (field == self.damagedAreasField) {
        [self.pickerView setSelectedElements:self.editingVehicle.damagedAreas];
    }
    
    [self.pickerPopover presentPopoverFromRect:field.bounds inView:field permittedArrowDirections:UIPopoverArrowDirectionUnknown animated:YES];
}

@end
