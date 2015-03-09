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

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (self.editingPerson != nil) {
        self.personNameField.text = self.editingPerson.name;
    }
    
    self.personNameField.enabled = false;
    
    self.vehicleStrikingNonMotoristTable.delegate = self;
    self.vehicleStrikingNonMotoristTable.dataSource = self;
   
    [self loadViewConfiguration];
    
    // Dynamically set delegates.
    for (NSDictionary *elem in self.viewElements) {
        UITextField *field = elem[@"field"];
        BOOL isEnabled = ([elem[@"enabled"]  isEqual: @YES]);
        
        NSLog(@"Elem: %@", elem);
        
        field.delegate = self;
        field.enabled = isEnabled;
    }
    
    [self loadCollections];
}

- (void)viewWillAppear:(BOOL)animated {
    [(UIScrollView *)self.view setContentSize:CGSizeMake(700,1400)];
}

- (void)viewWillDisappear:(BOOL)animated {
    NSLog(@"Pa fuera!");
    [self saveChanges];
}

- (void)saveChanges {
    BOOL found = NO;
    CrashSummary *crashSummary = [CrashSummary sharedCrashSummary];
    
    NSString *personUUID = self.editingPerson.uuid;
    
    if (personUUID != nil) {
        NSLog(@"Updating UUID: %@", personUUID);
        
        for (Person *p in crashSummary.pedestrians) {
            if ([p.uuid isEqualToString:personUUID]) {
                NSUInteger index = [crashSummary.pedestrians indexOfObject:p];
                
                NSLog(@"Found at %lu, replacing!", (unsigned long)index);
                
                [crashSummary.pedestrians replaceObjectAtIndex:index withObject:self.editingPerson];
                
                found = YES;
                break;
            }
        }
        
        if (!found) {
            for (Vehicle *v in crashSummary.vehicles) {
                for (Person *p in v.persons) {
                    if ([p.uuid isEqualToString:personUUID]) {
                        NSUInteger index = [v.persons indexOfObject:p];
                        
                        NSLog(@"Found at %lu, replacing!", (unsigned long)index);
                        
                        [v.persons replaceObjectAtIndex:index withObject:self.editingPerson];
                        
                        break;
                    }
                }
            }
        }
    }
    //[self dismissViewControllerAnimated:YES completion:nil];
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

- (void)receivedCollection:(NSArray *)collection withName:(NSString *)collectionName {
    [self.collections setObject:collection forKey:collectionName];
    
    if (self.editingPerson != nil) {
        for (NSDictionary *elem in self.viewElements) {
            if ([collectionName isEqualToString:elem[@"restMethod"]]) {
                /*} else if ([collectionName isEqualToString:@"damagedAreas"]) {
                self.damagedAreasField.text = [NSString stringWithFormat:NSLocalizedString(@"multilist.selected", nil), [self.editingVehicle.damagedAreas count]];*/
                
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
            [self showCollection:elem[@"restMethod"] withIDColumn:elem[@"key"] withField:textField];
            return NO;
        }
    }
    
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
        }
    }
}

- (IBAction)showCollection:(NSString*)collectionName withIDColumn:(NSString*)IDColumn withField:(id)field {
    if ([self.collections[collectionName] isKindOfClass:[NSArray class]]) {
        self.latestField = field;
        
        NSMutableDictionary *collection = [[NSMutableDictionary alloc] init];
        
        /*NSInteger harmfulEventCategory = 0;
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
        }*/
        
        //NSLog(@"Displaying Collection: %@",self.collections[collectionName]);
        
        for (NSDictionary *elem in self.collections[collectionName]) {
            /*if (isTotalLane) {
                if (![self.totalLaneCategoryKey isEqualToString:[NSString stringWithFormat:@"%@", [elem objectForKey:@"TotalLanesCategoryID"]]]) {
                    continue;
                }
            } else if (isHarmfulEvent) {
                NSLog(@"Cat: %@ Elem Cat: %@", [[self.harmfulEventCategoryKeys objectAtIndex:harmfulEventCategory] class], [[elem objectForKey:@"HarmfulEventCatID"] class]);
                if (![[self.harmfulEventCategoryKeys objectAtIndex:harmfulEventCategory] isEqualToString:[NSString stringWithFormat:@"%@", [elem objectForKey:@"HarmfulEventCatID"]]]) {
                    continue;
                }
            }*/
            
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
    CrashSummary *crashSummary = [CrashSummary sharedCrashSummary];
    
    if ([crashSummary.vehicles count] == 0) {
        self.displayEmptyCell = YES;
        return 1;
    } else {
        self.displayEmptyCell = NO;
        return [crashSummary.vehicles count];
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
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
        [cell setSelected:YES];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    CrashSummary *crashSummary = [CrashSummary sharedCrashSummary];
    Vehicle *vehicle = [crashSummary.vehicles objectAtIndex:indexPath.row];
    
    self.editingPerson.vehicleStrikingNonMotorist = vehicle.registrationPlate;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
