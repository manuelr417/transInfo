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

@end

@implementation VehicleExtendedViewController

- (void)setEditingModeFor:(Vehicle*)vehicle {
    self.editingVehicle = vehicle;
    
    self.navigationBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 50)];
    
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"OK" style:UIBarButtonItemStyleDone target:nil action:nil];
    // TODO
    UINavigationItem *item = [[UINavigationItem alloc] initWithTitle:@"Información Extendida del Vehículo"];
    item.rightBarButtonItem = rightButton;
    item.hidesBackButton = YES;
    //[rightButton setAction:@selector(addButonAction:)];
    
    [self.navigationBar pushNavigationItem:item animated:NO];
    
    [self.view addSubview:self.navigationBar];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadCollections];
    
    /*
     @property (weak, nonatomic) IBOutlet UITextField *bodyTypeField;
     @property (weak, nonatomic) IBOutlet UITextField *directionOfTravelField;
     @property (weak, nonatomic) IBOutlet UITextField *specialFunctionField;
     @property (weak, nonatomic) IBOutlet UITextField *statutorySpeedMPHField;
     @property (weak, nonatomic) IBOutlet UITextField *statutorySpeedField;
     @property (weak, nonatomic) IBOutlet UITextField *postedSpeedMPHField;
     @property (weak, nonatomic) IBOutlet UITextField *postedSpeedField;
     @property (weak, nonatomic) IBOutlet UITextField *actionField;*/
    
    // Delegates
    self.bodyTypeField.delegate = self;
    self.directionOfTravelField.delegate = self;
    self.specialFunctionField.delegate = self;
    self.emergencyUseField.delegate = self;
    self.statutorySpeedField.delegate = self;
    self.postedSpeedField.delegate = self;
    self.actionField.delegate = self;
}

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

- (void)loadCollections {
    self.collections = [[NSMutableDictionary alloc] init];
    
    NSArray *collectionNames = @[@"bodyTypes", @"specialFunctions", @"emergencyUses", @"postedSpeeds", @"directionsOfTravel", @"trafficwayDescriptions", @"totalLanesCategories", @"totalLanes", @"roadwayHorizontalAlignments", @"roadwayGrades", @"TCDWorking", @"TCDTypes", @"actions"];
    
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
    
    /* NSArray *collectionNames = @[@"bodyTypes", @"specialFunctions", @"emergencyUses", @"postedSpeeds", @"directionsOfTravel", @"trafficwayDescriptions", @"totalLanesCategories", @"totalLanes", @"roadwayHorizontalAlignments", @"roadwayGrades", @"TCDWorking", @"TCDTypes", @"actions"];*/
    
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
    }
    
    return YES;
}

- (void)keysSelected:(NSArray *)keys withIdentifier:(NSString *)identifier {
}

- (void)viewWillAppear:(BOOL)animated {
    if (self.navigationBar != nil) {
        [self.navigationBar setFrame:CGRectMake(0, 0, self.view.frame.size.width, 50)];
        [(UIScrollView *)self.view setContentSize:CGSizeMake(700,800)];
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
        NSMutableDictionary *collection = [[NSMutableDictionary alloc] init];
        
        /*BOOL isPersonTypes = [collectionName isEqualToString:@"personTypes"];
        
        if (isPersonTypes && self.personTypeCategoryKey == nil) {
            [Utilities displayAlertWithMessage:NSLocalizedString(@"report.third.no-person-type-category.msg", nil) withTitle:NSLocalizedString(@"report.third.no-person-type-category.title", nil) ];
            return;
        }*/
        
        for (NSDictionary *elem in self.collections[collectionName]) {
            /*if (isPersonTypes) {
                if (![self.personTypeCategoryKey isEqualToString:[NSString stringWithFormat:@"%@", [elem objectForKey:@"PersonTypeCategoryID"]]]) {
                    continue;
                }
            }*/
            
            //NSLog(@"%@", elem);
            
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
