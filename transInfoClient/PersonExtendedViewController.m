//
//  PersonExtendedViewController.m
//  transinfo
//
//  Created by Omar Soto Fortuño on 3/2/15.
//  Copyright (c) 2015 University of Puerto Rico Mayagüez Campus. All rights reserved.
//

#import "PersonExtendedViewController.h"
#import "CollectionManager.h"
#import "Utilities.h"
#import "CrashSummary.h"
#import "Vehicle.h"
#import "CarTableViewCell.h"
#import "PedestrianTableViewCell.h"
#import "Violation.h"
#import "ViolationViewController.h"

@interface PersonExtendedViewController ()

@end

@implementation PersonExtendedViewController

- (void)loadViewConfiguration {
    self.viewElements = [[NSMutableArray alloc] init];
    
    [self.viewElements addObject:@{
                                   @"restMethod" : @"personTypeCategories",
                                   @"key" : @"PersonTypeCategoryID",
                                   @"field" : self.personTypeCategoryField,
                                   @"enabled" : @NO,
                                   @"modelAttr" : @"typeCategoryKey",
                                   @"multiple" : @NO,
                                   @"multipleLimit" : @0,
                                   }];
    
    [self.viewElements addObject:@{
                                   @"restMethod" : @"personTypes",
                                   @"key" : @"PersonTypeID",
                                   @"field" : self.personTypeField,
                                   @"enabled" : @NO,
                                   @"modelAttr" : @"typeKey",
                                   @"multiple" : @NO,
                                   @"multipleLimit" : @0,
                                   }];
    
    [self.viewElements addObject:@{
                                   @"restMethod" : @"genders",
                                   @"key" : @"GenderID",
                                   @"field" : self.genderField,
                                   @"enabled" : @NO,
                                   @"modelAttr" : @"genderKey",
                                   @"multiple" : @NO,
                                   @"multipleLimit" : @0,
                                   }];
    
    [self.viewElements addObject:@{
                                   @"restMethod" : @"rows",
                                   @"key" : @"RowID",
                                   @"field" : self.rowField,
                                   @"enabled" : @YES,
                                   @"modelAttr" : @"rowKey",
                                   @"multiple" : @NO,
                                   @"multipleLimit" : @0,
                                   }];
    
    [self.viewElements addObject:@{
                                   @"restMethod" : @"seats",
                                   @"key" : @"SeatID",
                                   @"field" : self.seatField,
                                   @"enabled" : @YES,
                                   @"modelAttr" : @"seatKey",
                                   @"multiple" : @NO,
                                   @"multipleLimit" : @0,
                                   }];
    
    [self.viewElements addObject:@{
                                   @"restMethod" : @"seatingOthers",
                                   @"key" : @"SeatingOtherID",
                                   @"field" : self.seatingOtherField,
                                   @"enabled" : @YES,
                                   @"modelAttr" : @"seatingOtherKey",
                                   @"multiple" : @NO,
                                   @"multipleLimit" : @0,
                                   }];
    
    [self.viewElements addObject:@{
                                   @"restMethod" : @"restraintSystems",
                                   @"key" : @"RestraintSystemID",
                                   @"field" : self.restraintSystemField,
                                   @"enabled" : @YES,
                                   @"modelAttr" : @"restraintSystemKey",
                                   @"multiple" : @NO,
                                   @"multipleLimit" : @0,
                                   }];
    
    [self.viewElements addObject:@{
                                   @"restMethod" : @"helmetUses",
                                   @"key" : @"HelmetUseID",
                                   @"field" : self.helmetUseField,
                                   @"enabled" : @YES,
                                   @"modelAttr" : @"helmetUseKey",
                                   @"multiple" : @NO,
                                   @"multipleLimit" : @0,
                                   }];

    [self.viewElements addObject:@{
                                   @"restMethod" : @"airbagDeployed",
                                   @"key" : @"AirbagDeployedID",
                                   @"field" : self.airbagDeployedField,
                                   @"enabled" : @YES,
                                   @"modelAttr" : @"airbagDeployedKey",
                                   @"multiple" : @NO,
                                   @"multipleLimit" : @0,
                                   }];
    
    [self.viewElements addObject:@{
                                   @"restMethod" : @"ejections",
                                   @"key" : @"EjectionID",
                                   @"field" : self.ejectionField,
                                   @"enabled" : @YES,
                                   @"modelAttr" : @"ejectionKey",
                                   @"multiple" : @NO,
                                   @"multipleLimit" : @0,
                                   }];
    
    [self.viewElements addObject:@{
                                   @"restMethod" : @"speedingSuspected",
                                   @"key" : @"SpeedingSuspectedID",
                                   @"field" : self.speedingSuspectedField,
                                   @"enabled" : @YES,
                                   @"modelAttr" : @"speedingSuspectedKey",
                                   @"multiple" : @NO,
                                   @"multipleLimit" : @0,
                                   }];
    
    [self.viewElements addObject:@{
                                   @"restMethod" : @"extrications",
                                   @"key" : @"ExtricationID",
                                   @"field" : self.extricationField,
                                   @"enabled" : @YES,
                                   @"modelAttr" : @"extricationKey",
                                   @"multiple" : @NO,
                                   @"multipleLimit" : @0,
                                   }];
    
    [self.viewElements addObject:@{
                                   @"restMethod" : @"contribActionsCircumstances",
                                   @"key" : @"ContribActionsCircumstanceID",
                                   @"field" : self.contribActionsCircumstancesField,
                                   @"enabled" : @YES,
                                   @"modelAttr" : @"contribActionsCircumstancesKey",
                                   @"multiple" : @YES,
                                   @"multipleLimit" : @4,
                                   }];
    
    [self.viewElements addObject:@{
                                   @"restMethod" : @"distractedBy",
                                   @"key" : @"DistractedByID",
                                   @"field" : self.distractedByField,
                                   @"enabled" : @YES,
                                   @"modelAttr" : @"distractedByKey",
                                   @"multiple" : @NO,
                                   @"multipleLimit" : @0,
                                   }];
    
    [self.viewElements addObject:@{
                                   @"restMethod" : @"conditions",
                                   @"key" : @"ConditionID",
                                   @"field" : self.conditionsField,
                                   @"enabled" : @YES,
                                   @"modelAttr" : @"conditions",
                                   @"multiple" : @YES,
                                   @"multipleLimit" : @2,
                                   }];
    
    [self.viewElements addObject:@{
                                   @"restMethod" : @"actionsPriorToCrash",
                                   @"key" : @"ActionPriorToCrashID",
                                   @"field" : self.actionsPriorToCrashField,
                                   @"enabled" : @YES,
                                   @"modelAttr" : @"actionsPriorToCrash",
                                   @"multiple" : @YES,
                                   @"multipleLimit" : @2,
                                   }];
    
    [self.viewElements addObject:@{
                                   @"restMethod" : @"toFromSchool",
                                   @"key" : @"ToFromSchoolID",
                                   @"field" : self.toFromSchoolField,
                                   @"enabled" : @YES,
                                   @"modelAttr" : @"toFromSchool",
                                   @"multiple" : @NO,
                                   @"multipleLimit" : @0,
                                   }];
    
    [self.viewElements addObject:@{
                                   @"restMethod" : @"actionsAtTimeOfCrash",
                                   @"key" : @"ActionAtTimeOfCrashID",
                                   @"field" : self.actionsAtTimeOfCrashField,
                                   @"enabled" : @YES,
                                   @"modelAttr" : @"actionsAtTimeOfCrash",
                                   @"multiple" : @YES,
                                   @"multipleLimit" : @2,
                                   }];
    
    [self.viewElements addObject:@{
                                   @"restMethod" : @"nonMotoristLocations",
                                   @"key" : @"NonMotoristLocationID",
                                   @"field" : self.nonMotoristLocationField,
                                   @"enabled" : @YES,
                                   @"modelAttr" : @"nonMotoristLocation",
                                   @"multiple" : @NO,
                                   @"multipleLimit" : @0,
                                   }];
    
    [self.viewElements addObject:@{
                                   @"restMethod" : @"safetyEquipments",
                                   @"key" : @"SafetyEquipmentID",
                                   @"field" : self.safetyEquipmentField,
                                   @"enabled" : @YES,
                                   @"modelAttr" : @"safetyEquipments",
                                   @"multiple" : @YES,
                                   @"multipleLimit" : @0,
                                   }];
    
    [self.viewElements addObject:@{
                                   @"restMethod" : @"substancesSuspected",
                                   @"key" : @"SubstanceSuspectedID",
                                   @"field" : self.alcoholSuspectedField,
                                   @"enabled" : @YES,
                                   @"modelAttr" : @"alcoholSuspectedKey",
                                   @"multiple" : @NO,
                                   @"multipleLimit" : @0,
                                   @"onChange": NSStringFromSelector(@selector(updateAlcoholArea)),
                                   }];
    
    [self.viewElements addObject:@{
                                   @"restMethod" : @"testStatuses",
                                   @"key" : @"TestStatusID",
                                   @"field" : self.alcoholTestStatusField,
                                   @"enabled" : @YES,
                                   @"modelAttr" : @"alcoholTestStatusKey",
                                   @"multiple" : @NO,
                                   @"multipleLimit" : @0,
                                   }];
    
    [self.viewElements addObject:@{
                                   @"restMethod" : @"alcoholTestTypes",
                                   @"key" : @"AlcoholTestTypeID",
                                   @"field" : self.alcoholTestTypeField,
                                   @"enabled" : @YES,
                                   @"modelAttr" : @"alcoholTestTypeKey",
                                   @"multiple" : @NO,
                                   @"multipleLimit" : @0,
                                   }];
    
    [self.viewElements addObject:@{
                                   @"restMethod" : @"alcoholTestResults",
                                   @"key" : @"AlcoholTestResultID",
                                   @"field" : self.alcoholResultTypeField,
                                   @"enabled" : @YES,
                                   @"modelAttr" : @"alcoholResultTypeKey",
                                   @"multiple" : @NO,
                                   @"multipleLimit" : @0,
                                   }];
    
    [self.viewElements addObject:@{
                                   @"restMethod" : @"substancesSuspected",
                                   @"key" : @"SubstanceSuspectedID",
                                   @"field" : self.drugSuspectedField,
                                   @"enabled" : @YES,
                                   @"modelAttr" : @"drugSuspectedKey",
                                   @"multiple" : @NO,
                                   @"multipleLimit" : @0,
                                   @"onChange": NSStringFromSelector(@selector(updateDrugArea)),
                                   }];
    
    [self.viewElements addObject:@{
                                   @"restMethod" : @"testStatuses",
                                   @"key" : @"TestStatusID",
                                   @"field" : self.drugTestStatusField,
                                   @"enabled" : @YES,
                                   @"modelAttr" : @"drugTestStatusKey",
                                   @"multiple" : @NO,
                                   @"multipleLimit" : @0,
                                   }];
    
    [self.viewElements addObject:@{
                                   @"restMethod" : @"drugTestTypes",
                                   @"key" : @"DrugTestTypeID",
                                   @"field" : self.drugTestTypeField,
                                   @"enabled" : @YES,
                                   @"modelAttr" : @"drugTestTypeKey",
                                   @"multiple" : @NO,
                                   @"multipleLimit" : @0,
                                   }];
    
    [self.viewElements addObject:@{
                                   @"restMethod" : @"drugTestResults",
                                   @"key" : @"DrugTestResultID",
                                   @"field" : self.drugResultField,
                                   @"enabled" : @YES,
                                   @"modelAttr" : @"drugResultKey",
                                   @"multiple" : @NO,
                                   @"multipleLimit" : @0,
                                   }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (self.editingPerson != nil) {
        self.personNameField.text = self.editingPerson.name;
        self.alcoholResultField.text = self.editingPerson.alcoholResult;
    }
    
    self.personNameField.enabled = false;
    
    self.vehicleStrikingNonMotoristTable.delegate = self;
    self.vehicleStrikingNonMotoristTable.dataSource = self;
    
    self.violationsTable.delegate = self;
    self.violationsTable.dataSource = self;
   
    [self loadViewConfiguration];
    
    // Dynamically set delegates.
    for (NSDictionary *elem in self.viewElements) {
        UITextField *field = elem[@"field"];
        BOOL isEnabled = ([elem[@"enabled"]  isEqual: @YES]);
        
        //NSLog(@"Setting Delegate for Element with Key: %@", elem[@"key"]);
        
        field.delegate = self;
        field.enabled = isEnabled;
    }
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveNotification:) name:@"updateViolation" object:nil];
    
    [self loadCollections];
}

- (void)receiveNotification:(NSNotification*)notification {
    //NSLog(@"Update violation!");
    
    NSDictionary *dict = [notification userInfo];
    Violation *violation = [dict objectForKey:@"violation"];
    
    if (violation.uuid != nil) {
        for (Violation *v in self.editingPerson.violations) {
            if ([v.uuid isEqualToString:violation.uuid]) {
                NSUInteger index = [self.editingPerson.violations indexOfObject:v];
                [self.editingPerson.violations replaceObjectAtIndex:index withObject:violation];
                break;
            }
        }
    } else {
        violation.uuid = [[NSUUID UUID] UUIDString];
        [self.editingPerson.violations addObject:violation];
    }
    
    [self.violationsTable reloadData];
}

- (void)viewWillAppear:(BOOL)animated {
    [(UIScrollView *)self.view setContentSize:CGSizeMake(700,1900)];
}

- (void)viewWillDisappear:(BOOL)animated {
    //NSLog(@"Pa fuera!");
    [self saveChanges];
}

- (void)saveChanges {
    BOOL found = NO;
    CrashSummary *crashSummary = [CrashSummary sharedCrashSummary];
    
    NSString *personUUID = self.editingPerson.uuid;
    
    self.editingPerson.alcoholResult = self.alcoholResultField.text;
    
    if (personUUID != nil) {
        //NSLog(@"Updating UUID: %@", personUUID);
        
        for (Person *p in crashSummary.individualPersons) {
            if ([p.uuid isEqualToString:personUUID]) {
                NSUInteger index = [crashSummary.individualPersons indexOfObject:p];
                
                //NSLog(@"Found at %lu, replacing!", (unsigned long)index);
                
                [crashSummary.individualPersons replaceObjectAtIndex:index withObject:self.editingPerson];
                
                found = YES;
                break;
            }
        }
        
        if (!found) {
            for (Vehicle *v in crashSummary.vehicles) {
                for (Person *p in v.persons) {
                    if ([p.uuid isEqualToString:personUUID]) {
                        NSUInteger index = [v.persons indexOfObject:p];
                        
                        //NSLog(@"Found at %lu, replacing!", (unsigned long)index);
                        
                        [v.persons replaceObjectAtIndex:index withObject:self.editingPerson];
                        
                        break;
                    }
                }
            }
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setEditingModeFor:(Person *)person {
    self.editingPerson = person;
}

- (void)loadCollections {
    self.collections = [[NSMutableDictionary alloc] init];
    
    NSMutableArray *collectionsNames = [[NSMutableArray alloc] init];
    
    // Dynamically load collections
    for (NSDictionary *elem in self.viewElements) {
        if (![collectionsNames containsObject:elem[@"restMethod"]]) {
            [collectionsNames addObject:elem[@"restMethod"]];
        }
    }
    
    NSMutableArray *collectionsManagers = [[NSMutableArray alloc] init];
    int i = 0;
    
    for (NSString *collectionName in collectionsNames) {
        [self.collections setObject:[NSDate date] forKey:collectionName];
        [collectionsManagers addObject:[[CollectionManager alloc] init]];
        ((CollectionManager*)collectionsManagers[i]).delegate = self;
        [collectionsManagers[i] getCollection:collectionName];
        
        i++;
    }
}

- (void)loadDefaultForCollection:(NSString*)collectionName toField:(UITextField*)field withKey:(NSString*)key defaultValue:(NSString*)value {
    
    if ([value isEqualToString:@"-1"]) {
        //NSLog(@"Ignoring %@, value: %@", key, value);
        return;
    }
    
    NSArray *collection = [self.collections objectForKey:collectionName];
    
    //NSLog(@"Loading default for %@, value: %@", key, value);
    
    for (NSDictionary *dict in collection) {
        if ([[NSString stringWithFormat:@"%@", [dict objectForKey:key]] isEqualToString:value]) {
            field.text = [dict objectForKey:[Utilities collectionColumn]];
            break;
        }
    }
}

- (void)receivedCollection:(NSArray *)collection withName:(NSString *)collectionName {
    [self.collections setObject:collection forKey:collectionName];
    NSLog(@"%@", collection);
    if (self.editingPerson != nil) {
        for (NSDictionary *elem in self.viewElements) {
            if ([collectionName isEqualToString:elem[@"restMethod"]]) {
                if ([elem[@"multiple"]  isEqual: @YES]) {
                    UITextField *field = elem[@"field"];
                    NSMutableArray *array = [self.editingPerson valueForKey:elem[@"modelAttr"]];
                    
                    field.text = [NSString stringWithFormat:NSLocalizedString(@"multilist.selected", nil), [array count]];
                } else {
                    [self loadDefaultForCollection:elem[@"restMethod"] toField:elem[@"field"] withKey:elem[@"key"] defaultValue:[self.editingPerson valueForKey:elem[@"modelAttr"]]];
                }
            }
        }
    }
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    [self.view endEditing:YES];
    
    for (NSDictionary *elem in self.viewElements) {
        if (textField == elem[@"field"] && [elem[@"enabled"] isEqual: @YES]) {
            //NSLog(@"Showing collection with ID: %@ (REST: %@)", elem[@"key"], elem[@"restMethod"]);
            [self showCollection:elem[@"restMethod"] withIDColumn:elem[@"key"] withField:textField];
            return NO;
        }
    }
    
    //NSLog(@"%@ NO!", textField);
    
    return YES;
}

- (void)keysSelected:(NSArray *)keys withIdentifier:(NSString *)identifier withOutField:(UITextField *)outField {
    for (NSDictionary *elem in self.viewElements) {
        if (outField == elem[@"field"] && [elem[@"enabled"] isEqual: @YES]) {
            if ([elem[@"multiple"] isEqual:@YES]) {
                [self.editingPerson setValue:[NSMutableArray arrayWithArray:keys] forKey:elem[@"modelAttr"]];
            } else {
                [self.editingPerson setValue:(NSString*)keys[0] forKey:elem[@"modelAttr"]];
            }
            
            id onChange = [elem objectForKey:@"onChange"];
            
            if (onChange != nil) {
                SEL selector = NSSelectorFromString(onChange);
                
                [self performSelector:selector withObject:nil afterDelay:0.0];
            }
        }
    }
}

- (void)updateAlcoholArea {
    BOOL isEnabled = [self.editingPerson.alcoholSuspectedKey isEqualToString:@"2"];
    
    self.alcoholTestStatusField.enabled = isEnabled;
    self.alcoholTestTypeField.enabled = isEnabled;
    self.alcoholResultField.enabled = isEnabled;
    self.alcoholResultTypeField.enabled = isEnabled;
    
    if (!isEnabled) {
        self.alcoholTestStatusField.text = @"";
        self.alcoholTestTypeField.text = @"";
        self.alcoholResultField.text = @"";
        self.alcoholResultTypeField.text = @"";
        
        self.editingPerson.alcoholTestStatusKey = nil;
        self.editingPerson.alcoholTestTypeKey = nil;
        self.editingPerson.alcoholResult = @"";
        self.editingPerson.alcoholResultTypeKey = nil;
    }
}

- (void)updateDrugArea {
    BOOL isEnabled = [self.editingPerson.drugSuspectedKey isEqualToString:@"2"];
    
    self.drugTestStatusField.enabled = isEnabled;
    self.drugTestTypeField.enabled = isEnabled;
    self.drugResultField.enabled = isEnabled;
    
    if (!isEnabled) {
        self.drugTestStatusField.text = @"";
        self.drugTestTypeField.text = @"";
        self.drugResultField.text = @"";
        
        self.editingPerson.drugTestStatusKey = nil;
        self.editingPerson.drugTestTypeKey = nil;
        self.editingPerson.drugResultKey = nil;
    }
}

- (IBAction)showCollection:(NSString*)collectionName withIDColumn:(NSString*)IDColumn withField:(id)field {
    if ([self.collections[collectionName] isKindOfClass:[NSArray class]]) {
        self.latestField = field;
        
        NSMutableDictionary *collection = [[NSMutableDictionary alloc] init];
        
        NSLog(@"Displaying Collection: %@", self.collections[collectionName]);
        
        for (NSDictionary *elem in self.collections[collectionName]) {
            [collection setObject:(NSString*)[elem objectForKey:[Utilities collectionColumn]] forKey:[NSString stringWithFormat:@"%@", [elem objectForKey:IDColumn]]];
            
            NSLog(@"%@ = %@", [NSString stringWithFormat:@"%@", [elem objectForKey:IDColumn]], (NSString*)[elem objectForKey:[Utilities collectionColumn]]);
        }
        
        NSDictionary *actualElement;
        
        for (NSDictionary *elem in self.viewElements) {
            if ([elem[@"restMethod"] isEqualToString:collectionName]) {
                actualElement = elem;
                break;
            }
        }
        
        //NSLog(@"%@ %@ %@", collection, field, collectionName);
        
        if (actualElement != nil && [actualElement[@"multiple"] isEqual:@YES]) {
            NSMutableArray *array = [self.editingPerson valueForKey:actualElement[@"modelAttr"]];
            [self showPickerView:collection withField:field withIdentifier:collectionName withMultipleChoice:YES withSelectedElements:array withSelectedLimit:actualElement[@"multipleLimit"]];
        } else {
            [self showPickerView:collection withField:field withIdentifier:collectionName withMultipleChoice:NO withSelectedElements:nil withSelectedLimit:nil];
        }
    } else {
        NSLog(@"No collection yet... %@", collectionName);
        CollectionManager *collManager = [[CollectionManager alloc] init];
        [collManager getCollection:collectionName];
        collManager.delegate = self;
    }
}

- (void)showPickerView:(NSMutableDictionary*)elements withField:(UITextField*)field withIdentifier:(NSString*)identifier withMultipleChoice:(BOOL)isMultipleChoice withSelectedElements:(NSMutableArray*)selectedElements withSelectedLimit:(NSNumber*)selectedLimit {
    self.pickerView = [[PickerViewController alloc] initWithStyle:UITableViewStylePlain withElementsDictionary:elements withMultipleChoice:isMultipleChoice];
    self.pickerPopover = [[UIPopoverController alloc] initWithContentViewController:self.pickerView];
    
    self.pickerView.delegate = self;
    self.pickerView.outField = field;
    self.pickerView.popover = self.pickerPopover;
    [self.pickerView setIdentifier:identifier];
    if (selectedLimit != nil) {
        [self.pickerView setSelectedLimit:selectedLimit];
    }
    
    if (selectedElements != nil) {
        [self.pickerView setSelectedElements:selectedElements];
    }
    
    [self.pickerPopover presentPopoverFromRect:field.bounds inView:field permittedArrowDirections:UIPopoverArrowDirectionUnknown animated:YES];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (tableView == self.vehicleStrikingNonMotoristTable) {
        CrashSummary *crashSummary = [CrashSummary sharedCrashSummary];
        
        if ([crashSummary.vehicles count] == 0) {
            self.displayEmptyCell = YES;
            return 1;
        } else {
            self.displayEmptyCell = NO;
            return [crashSummary.vehicles count];
        }
    } else if (tableView == self.violationsTable) {
        if ([self.editingPerson.violations count] == 0) {
            self.displayEmptyCellViolations = YES;
            return 1;
        } else {
            self.displayEmptyCellViolations = NO;
            NSLog(@"Violations: %lu", (unsigned long)[self.editingPerson.violations count]);
            return [self.editingPerson.violations count];
        }
    }
    
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView == self.vehicleStrikingNonMotoristTable) {
        if (self.displayEmptyCell) {
            PedestrianTableViewCell *cell = [[PedestrianTableViewCell alloc] init];
            
            cell.textLabel.text = NSLocalizedString(@"empty.list", nil);
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            self.vehicleStrikingNonMotoristTable.separatorStyle = UITableViewCellSeparatorStyleNone;
            
            return cell;
        } else {
            self.vehicleStrikingNonMotoristTable.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        }
        
        static NSString *cellIdentifier = @"CarCell";
        CrashSummary *crashSummary = [CrashSummary sharedCrashSummary];
        
        CarTableViewCell *cell = (CarTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        if (cell == nil) {
            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"CarViewCell" owner:self options:nil];
            cell = [nib objectAtIndex:0];
        }
        
        Vehicle *vehicle = [crashSummary.vehicles objectAtIndex:indexPath.row];
        
        cell.carMake = vehicle.make;
        cell.carModel = vehicle.model;
        cell.carYear = vehicle.year;
        cell.registrationPlate = vehicle.registrationPlate;
        
        if ([vehicle.registrationPlate isEqualToString:self.editingPerson.vehicleStrikingNonMotorist]) {
            NSLog(@"Seleccionó: %@", vehicle.registrationPlate);
            //[cell setSelected:YES];
            [self.vehicleStrikingNonMotoristTable selectRowAtIndexPath:indexPath animated:YES scrollPosition:UITableViewScrollPositionTop];
        }
        
        return cell;
    } else if (tableView == self.violationsTable) {
        if (self.displayEmptyCellViolations) {
            PedestrianTableViewCell *cell = [[PedestrianTableViewCell alloc] init];
            
            cell.textLabel.text = NSLocalizedString(@"empty.list", nil);
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            self.violationsTable.separatorStyle = UITableViewCellSeparatorStyleNone;
            
            return cell;
        } else {
            self.violationsTable.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        }
        
        static NSString *cellIdentifier = @"ViolationCell";
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
        }
        
        Violation *violation = [self.editingPerson.violations objectAtIndex:indexPath.row];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.textLabel.text = [NSString stringWithFormat:NSLocalizedString(@"violations.list.main", nil), violation.violationCode, violation.lawArticle];

        if (violation.courtCitationDate == nil || violation.courtCitationTime == nil) {
            cell.detailTextLabel.text = NSLocalizedString(@"violations.list.nocitation", nil);
        } else {
            NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
            dateFormatter.dateFormat = @"yyyy-MM-dd";
            
            NSDateFormatter *dateFormatter2 = [[NSDateFormatter alloc] init];
            dateFormatter2.dateFormat = @"hh:mm a";
            
            cell.detailTextLabel.text = [NSString stringWithFormat:NSLocalizedString(@"violations.list.citation", nil), [dateFormatter stringFromDate:violation.courtCitationDate], [dateFormatter2 stringFromDate:violation.courtCitationTime]];
        }

        return cell;
    }
    
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView == self.vehicleStrikingNonMotoristTable) {
        CrashSummary *crashSummary = [CrashSummary sharedCrashSummary];
        Vehicle *vehicle = [crashSummary.vehicles objectAtIndex:indexPath.row];
        
        self.editingPerson.vehicleStrikingNonMotorist = vehicle.registrationPlate;
    }
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
}

- (BOOL)tableView:(UITableView*)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return (self.violationsTable == tableView) && !self.displayEmptyCellViolations;
}

- (NSArray *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView == self.vehicleStrikingNonMotoristTable) {
        return nil;
    }
    
    UITableViewRowAction *updateAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:NSLocalizedString(@"report.third.edit", nil) handler:^(UITableViewRowAction *action, NSIndexPath *indexPath){
        ViolationViewController *violationView = [self.storyboard instantiateViewControllerWithIdentifier:@"newViolationView"];
        
        violationView.editingViolation = [self.editingPerson.violations objectAtIndex:indexPath.row];
        
        self.popover = [[UIPopoverController alloc] initWithContentViewController:violationView];
        
        CGRect aFrame = [self.violationsTable rectForRowAtIndexPath:[NSIndexPath indexPathForRow:indexPath.row inSection:indexPath.section]];
        [self.popover presentPopoverFromRect:[self.violationsTable convertRect:aFrame toView:self.view] inView:self.view permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
        
        [self.violationsTable setEditing:NO];
    }];
    updateAction.backgroundColor = [UIColor colorWithRed:0 green:204.0/255.0 blue:0 alpha:1];
    
    UITableViewRowAction *deleteAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:NSLocalizedString(@"report.third.delete", nil)  handler:^(UITableViewRowAction *action, NSIndexPath *indexPath){
        [self.editingPerson.violations removeObjectAtIndex:indexPath.row];
        [self.violationsTable reloadData];
        [self.violationsTable setEditing:NO];
    }];
    
    return @[deleteAction, updateAction];
}

@end
