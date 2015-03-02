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

@interface PersonExtendedViewController ()

@end

@implementation PersonExtendedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (self.editingPerson != nil) {
        self.personNameField.text = self.editingPerson.name;
    }
    
    self.personTypeCategoryField.enabled = NO;
    self.personTypeField.enabled = NO;
    self.genderField.enabled = NO;
    self.personNameField.enabled = NO;
    
    self.rowField.delegate = self;
    self.seatField.delegate = self;
    self.seatingOtherField.delegate = self;
   
    [self loadCollections];
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
    
    NSArray *collectionNames = @[@"personTypeCategories", @"personTypes", @"genders", @"rows", @"seats", @"seatingOthers"];
    
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
        if ([collectionName isEqualToString:@"personTypeCategories"]) {
            [self loadDefaultForCollection:@"personTypeCategories" toField:self.personTypeCategoryField withKey:@"PersonTypeCategoryID" defaultValue:self.editingPerson.typeCategoryKey];
        } else if ([collectionName isEqualToString:@"personTypes"]) {
            [self loadDefaultForCollection:@"personTypes" toField:self.personTypeField withKey:@"PersonTypeID" defaultValue:[NSString stringWithFormat:@"%ld", (long)self.editingPerson.typeKey]];
        } else if([collectionName isEqualToString:@"genders"]) {
            [self loadDefaultForCollection:@"genders" toField:self.genderField withKey:@"GenderID" defaultValue:self.editingPerson.genderKey];
        }
    }
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    [self.view endEditing:YES];
    
    if (textField == self.rowField) {
        [self showCollection:@"rows" withIDColumn:@"RowID" withField:textField];
        return NO;
    } else if (textField == self.seatField) {
        [self showCollection:@"seats" withIDColumn:@"SeatID" withField:textField];
        return NO;
    } else if (textField == self.seatingOtherField) {
        [self showCollection:@"seatingOthers" withIDColumn:@"SeatingOtherID" withField:textField];
        return NO;
    }
    
    return YES;
}

- (void)keysSelected:(NSArray *)keys withIdentifier:(NSString *)identifier withOutField:(UITextField *)outField {
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
        }
        
        //NSLog(@"%@ %@ %@", collection, field, collectionName);
        
        /*if (field == self.damagedAreasField) {
            [self showPickerView:collection withField:field withIdentifier:collectionName withMultipleChoice:YES];
        } else {*/
            [self showPickerView:collection withField:field withIdentifier:collectionName withMultipleChoice:NO];
        //}
    } else {
        NSLog(@"No collection yet... %@", collectionName);
        CollectionManager *collManager = [[CollectionManager alloc] init];
        [collManager getCollection:collectionName];
        collManager.delegate = self;
    }
}

- (void)showPickerView:(NSMutableDictionary*)elements withField:(UITextField*)field withIdentifier:(NSString*)identifier withMultipleChoice:(BOOL)isMultipleChoice {
    self.pickerView = [[PickerViewController alloc] initWithStyle:UITableViewStylePlain withElementsDictionary:elements withMultipleChoice:isMultipleChoice];
    self.pickerPopover = [[UIPopoverController alloc] initWithContentViewController:self.pickerView];
    
    self.pickerView.delegate = self;
    self.pickerView.outField = field;
    self.pickerView.popover = self.pickerPopover;
    [self.pickerView setIdentifier:identifier];
    
    /*if (field == self.damagedAreasField) {
        [self.pickerView setSelectedElements:self.editingVehicle.damagedAreas];
    }*/
    
    [self.pickerPopover presentPopoverFromRect:field.bounds inView:field permittedArrowDirections:UIPopoverArrowDirectionUnknown animated:YES];
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
