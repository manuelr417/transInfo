//
//  DataEntryTableViewController.m
//  transinfo
//
//  Created by Omar Soto Fortuño on 12/8/14.
//  Copyright (c) 2014 University of Puerto Rico Mayagüez Campus. All rights reserved.
//

#import "DataEntryTableViewController.h"
#import "CarMembersTableViewCell.h"
#import "CarTableViewCell.h"
#import "PedestrianTableViewCell.h"
#import "Vehicle.h"
#import "Person.h"
#include "NewPersonController.h"
#include "NewVehicleController.h"
#import "SWRevealViewController.h"
#import "CrashSummary.h"

@interface DataEntryTableViewController ()

@end

@implementation DataEntryTableViewController

- (void)loadView
{
    self.tableView = [[SLExpandableTableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
}

- (void)receiveNotification:(NSNotification*)notification {
    NSDictionary *dict = [notification userInfo];
    CrashSummary *crashSummary = [CrashSummary sharedCrashSummary];
    
    if ([[notification name] isEqualToString:@"addCar"]) {
        Vehicle *vehicle = [dict objectForKey:@"Vehicle"];
        NSString *vehicleUUID = vehicle.uuid;
        
        if (vehicleUUID != nil) {
            NSLog(@"Updating UUID: %@", vehicleUUID);
            
            for (Vehicle *v in crashSummary.vehicles) {
                if ([v.uuid isEqualToString:vehicleUUID]) {
                    NSUInteger index = [crashSummary.vehicles indexOfObject:v];
                    
                    NSLog(@"Found at %lu, replacing!", (unsigned long)index);
                    
                    [crashSummary.vehicles replaceObjectAtIndex:index withObject:vehicle];
                    
                    break;
                }
            }
        } else {
            NSLog(@"Adding new car...");
            
            vehicle.uuid = [[NSUUID UUID] UUIDString];
            
            [crashSummary.vehicles addObject:vehicle];
        }
        
        [self.tableView reloadData];
        
        [[NSNotificationCenter defaultCenter] postNotificationName:@"updateVehicles" object:nil userInfo:nil];
    } else if ([[notification name] isEqualToString:@"addPerson"]) {
        Person *person = [dict objectForKey:@"Person"];
        //NSString *personType = [dict objectForKey:@"typeKey"];
        //NSString *personType = [NSString stringWithFormat:@"%ld", (long)person.typeKey];
        NSString *personUUID = person.uuid;
        BOOL pedestrianAdded = NO;
        
        NSLog(@"Person UUID: %@", person.uuid);
        
        if (personUUID != nil) {
            for (Person *p in crashSummary.individualPersons) {
                if ([p.uuid isEqualToString:personUUID]) {
                    NSUInteger index = [crashSummary.individualPersons indexOfObject:p];
                    
                    NSLog(@"Found at %lu, replacing or deleting!", (unsigned long)index);
                    
                    if ([person.typeCategoryKey isEqualToString:@"2"]) {
                    //if ([person.typeKey isEqualToString:@"3"] || [person.typeKey isEqualToString:@"7"]) {
                        [crashSummary.individualPersons replaceObjectAtIndex:index withObject:person];
                        NSLog(@"Replacing!");
                    } else {
                        [crashSummary.individualPersons removeObjectAtIndex:index];
                        NSLog(@"Deleting! %@", person.typeKey);
                    }
                    
                    pedestrianAdded = YES;
                    
                    break;
                }
            }
            
            for (Vehicle *v in crashSummary.vehicles) {
                for (Person *p in v.persons) {
                    if ([p.uuid isEqualToString:personUUID]) {
                        NSUInteger index = [v.persons indexOfObject:p];
                        
                        NSLog(@"Found at %lu in vehicle %@, replacing!", (unsigned long)index, v.uuid);
                        
                        //person.vehicleUuid = v.uuid;
                        //[v.persons replaceObjectAtIndex:index withObject:person];
                        [v.persons removeObjectAtIndex:index];
                        break;
                    }
                }
            }
        }
        
        if ([person.typeCategoryKey isEqualToString:@"2"]) {
        //if ([person.typeKey isEqualToString:@"3"] || [person.typeKey isEqualToString:@"7"]) {
            if (!pedestrianAdded) {
                person.uuid = [[NSUUID UUID] UUIDString];
                [crashSummary.individualPersons addObject:person];
            }
        } else {
            for (Vehicle *v in crashSummary.vehicles) {
                if ([v.registrationPlate isEqualToString:[dict objectForKey:@"vehicleLicensePlate"]]) {
                    person.uuid = (personUUID != nil) ? personUUID : [[NSUUID UUID] UUIDString];
                    person.vehicleUuid = v.uuid;
                    [v addPerson:person];
                    
                    break;
                }
            }
        }
        
        [self buildIndividualPersons];
        [self.tableView reloadData];
        
        [[NSNotificationCenter defaultCenter] postNotificationName:@"updatePersons" object:nil userInfo:nil];
    } else if ([[notification name] isEqualToString:@"requestVehicles"]) {
        NSDictionary *info = [NSDictionary dictionaryWithObjectsAndKeys:crashSummary.vehicles,@"vehicles", nil];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"getVehicles" object:nil userInfo:info];
    }
}

- (void)buildIndividualPersons {
    CrashSummary *crashSummary = [CrashSummary sharedCrashSummary];
    self.individualPersons = [[NSMutableArray alloc] init];
    
    [self.individualPersons addObject:@{@"viewType" : @1, @"personTypes" : @[@"3", @"7"], @"persons" : [[NSMutableArray alloc] init]}];
    [self.individualPersons addObject:@{@"viewType" : @2, @"personTypes" : @[@"4", @"5"], @"persons" : [[NSMutableArray alloc] init]}];
    [self.individualPersons addObject:@{@"viewType" : @3, @"personTypes" : @[@"8", @"9", @"10"], @"persons" : [[NSMutableArray alloc] init]}];
    
    for (NSDictionary *desc in self.individualPersons) {
        NSMutableArray *persons = desc[@"persons"];
        
        for (Person *p in crashSummary.individualPersons) {
            NSArray *personTypes = desc[@"personTypes"];
            
            if ([personTypes containsObject:p.typeKey]) {
                [persons addObject:p];
            }
        }
    }
    
    NSArray *tempArray = [[NSArray alloc] initWithArray:self.individualPersons];
    
    for (NSDictionary *desc in tempArray) {
        NSMutableArray *persons = desc[@"persons"];
        
        if ([persons count] == 0) {
            [self.individualPersons removeObject:desc];
        }
    }
}

- (Person*)personFromDict:(NSDictionary*)dict {
    Person *person = [[Person alloc] init];
    NSString *personType = [dict objectForKey:@"typeKey"];
    
    person.typeCategoryKey = [dict objectForKey:@"typeCategoryKey"];
    person.name = [dict objectForKey:@"name"];
    person.genderKey = [dict objectForKey:@"genderKey"];
    person.licenseTypeKey = [dict objectForKey:@"licenseTypeKey"];
    person.driverLicense = [dict objectForKey:@"driverLicense"];
    person.organDonorKey = [dict objectForKey:@"organDonorKey"];
    person.licenseExpirationDate = ([[dict objectForKey:@"licenseExpirationDate"] isEqual:@""]) ? nil : [dict objectForKey:@"licenseExpirationDate"];
    person.licenseExpirationNA = [dict objectForKey:@"licenseExpirationNA"];
    person.streetAddress = [dict objectForKey:@"streetAddress"];
    person.neighbohood = [dict objectForKey:@"neighbohood"];
    person.city = [dict objectForKey:@"city"];
    person.stateCountry = [dict objectForKey:@"stateCountry"];
    person.zipCode = [dict objectForKey:@"zipCode"];
    person.phoneNumber = [dict objectForKey:@"phoneNumber"];
    person.uuid = [[NSUUID UUID] UUIDString];
    person.typeKey = personType;
    
    return person;
}

- (BOOL)tableView:(UITableView*)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    CrashSummary *crashSummary = [CrashSummary sharedCrashSummary];
    
    if (crashSummary.individualPersons.count > 0 && indexPath.section == [crashSummary.vehicles count] && indexPath.row == 0) {
        return NO;
    }
    return YES;
}

- (NSArray *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewRowAction *updateAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:NSLocalizedString(@"report.third.edit", nil) handler:^(UITableViewRowAction *action, NSIndexPath *indexPath){
        CrashSummary *crashSummary = [CrashSummary sharedCrashSummary];
        //NSLog(@"Update! %ld", (long)indexPath.row);
        
        if (indexPath.row > 0) {
            NewPersonController *newPersonView = [self.storyboard instantiateViewControllerWithIdentifier:@"newPersonView"];
            
            if (crashSummary.individualPersons.count > 0 && indexPath.section == [crashSummary.vehicles count]) {
                Person *person = [crashSummary.individualPersons objectAtIndex:indexPath.row - 1];
                
                [newPersonView setEditingModeFor:person forRegistrationPlate:nil];
            } else {
                Vehicle *vehicle = [crashSummary.vehicles objectAtIndex:indexPath.section];
                Person *person = [[vehicle persons] objectAtIndex:indexPath.row - 1];
                
                [newPersonView setEditingModeFor:person forRegistrationPlate:vehicle.registrationPlate];
            }
            
            self.popover = [[UIPopoverController alloc] initWithContentViewController:newPersonView];
            
            CGRect aFrame = [self.tableView rectForRowAtIndexPath:[NSIndexPath indexPathForRow:indexPath.row inSection:indexPath.section]];
            [self.popover presentPopoverFromRect:[self.tableView convertRect:aFrame toView:self.view] inView:self.view permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
        } else {
            NewVehicleController *newVehicleController = [self.storyboard instantiateViewControllerWithIdentifier:@"newVehicleView"];
            Vehicle *vehicle = [crashSummary.vehicles objectAtIndex:indexPath.section];
            [newVehicleController setEditingModeFor:vehicle];
            
            self.popover = [[UIPopoverController alloc] initWithContentViewController:newVehicleController];
            self.popover.delegate = self;
            
            CGRect aFrame = [self.tableView rectForRowAtIndexPath:[NSIndexPath indexPathForRow:indexPath.row inSection:indexPath.section]];
            [self.popover presentPopoverFromRect:[self.tableView convertRect:aFrame toView:self.view] inView:self.view permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
        }
        
        [self.tableView setEditing:NO];
    }];
    updateAction.backgroundColor = [UIColor colorWithRed:0 green:204.0/255.0 blue:0 alpha:1];
    
    UITableViewRowAction *deleteAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:NSLocalizedString(@"report.third.delete", nil)  handler:^(UITableViewRowAction *action, NSIndexPath *indexPath){
        CrashSummary *crashSummary = [CrashSummary sharedCrashSummary];
        //NSLog(@"Delete %ld %ld", (long)indexPath.section, (long)indexPath.row);
        
        if (indexPath.row == 0) {
            [crashSummary.vehicles removeObjectAtIndex:indexPath.section];
            [self.tableView reloadData];
            
            [[NSNotificationCenter defaultCenter] postNotificationName:@"updateVehicles" object:nil userInfo:nil];
        } else {
            if (indexPath.section >= crashSummary.vehicles.count) { // Borrar Persona Individial
                NSLog(@"Deleting person %ld", indexPath.row - 1);
                
                NSDictionary *viewDescription = [self.individualPersons objectAtIndex:(indexPath.section - crashSummary.vehicles.count)];
                NSArray *persons = viewDescription[@"persons"];
                Person *p = [persons objectAtIndex:indexPath.row - 1];
                
                [crashSummary.individualPersons removeObject:p];
                //[crashSummary.individualPersons removeObjectAtIndex:indexPath.row - 1];
                
                [self buildIndividualPersons];
            } else {
                Vehicle *v = [crashSummary.vehicles objectAtIndex:indexPath.section];
                [v.persons removeObjectAtIndex:indexPath.row - 1];
            }
            
            [self.tableView reloadData];
            [[NSNotificationCenter defaultCenter] postNotificationName:@"updatePersons" object:nil userInfo:nil];
        }
        
        [self.tableView setEditing:NO];
    }];
    
    return @[deleteAction, updateAction];
}

- (BOOL)popoverControllerShouldDismissPopover:(UIPopoverController *)popoverController {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Closing unsaved work"
                                                        message:@"Do you want to close this popover without saving the work done?"
                                                       delegate:self
                                              cancelButtonTitle:@"No"
                                              otherButtonTitles:@"Yes", nil];
    
    [alert show];
    
    return NO;
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 1) { // Close
        [self.popover dismissPopoverAnimated:TRUE];
    }
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Set the side bar button action. When it's tapped, it'll show up the sidebar.
    self.sideBarButton.target = self.revealViewController;
    self.sideBarButton.action = @selector(revealToggle:);
    
    // Set the gesture
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveNotification:) name:@"addCar" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveNotification:) name:@"addPerson" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveNotification:) name:@"requestVehicles" object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)tableView:(SLExpandableTableView *)tableView canExpandSection:(NSInteger)section
{
    // return YES, if the section should be expandable
    return YES;
}

- (BOOL)tableView:(SLExpandableTableView *)tableView needsToDownloadDataForExpandableSection:(NSInteger)section
{
    // return YES, if you need to download data to expand this section. tableView will call tableView:downloadDataForExpandableSection: for this section
    return NO;
}

- (UITableViewCell<UIExpandingTableViewCell> *)tableView:(SLExpandableTableView *)tableView expandingCellForSection:(NSInteger)section
{
    if (self.displayEmptyCell) {
        PedestrianTableViewCell *cell = [[PedestrianTableViewCell alloc] init];
        
        cell.textLabel.text = NSLocalizedString(@"empty.list", nil);
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        return cell;
    } else {
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    }
    
    CrashSummary *crashSummary = [CrashSummary sharedCrashSummary];
    
    if (section >= crashSummary.vehicles.count && crashSummary.individualPersons.count > 0) {
    //if (section == crashSummary.vehicles.count && crashSummary.individualPersons.count > 0) {
        NSDictionary *viewDescription = [self.individualPersons objectAtIndex:(section - crashSummary.vehicles.count)];
        NSString *viewType = [NSString stringWithFormat:@"%@", viewDescription[@"viewType"]];
        
        static NSString *cellIdentifier = @"PedestrianDivisorCell";
        
        PedestrianTableViewCell *cell = (PedestrianTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        if (cell == nil) {
            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"PedestrianViewCell" owner:self options:nil];
            cell = [nib objectAtIndex:0];
        }
        
        [cell setViewType:[viewType integerValue]];
        
        return cell;
    } else {
        static NSString *cellIdentifier = @"CarCell";
        
        CarTableViewCell *cell = (CarTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        if (cell == nil) {
            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"CarViewCell" owner:self options:nil];
            cell = [nib objectAtIndex:0];
            [cell setExpandable:YES];
        }
        
        Vehicle *vehicle = [crashSummary.vehicles objectAtIndex:section];
        
        cell.carMake = vehicle.make;
        cell.carModel = vehicle.model;
        cell.carYear = vehicle.year;
        cell.registrationPlate = vehicle.registrationPlate;
        
        return cell;
    }
}

- (void)tableView:(SLExpandableTableView *)tableView downloadDataForExpandableSection:(NSInteger)section
{
    // download your data here
    // call [tableView expandSection:section animated:YES]; if download was successful
    // call [tableView cancelDownloadInSection:section]; if your download was NOT successful
}

- (void)tableView:(SLExpandableTableView *)tableView didExpandSection:(NSUInteger)section animated:(BOOL)animated
{
    //...
}

- (void)tableView:(SLExpandableTableView *)tableView didCollapseSection:(NSUInteger)section animated:(BOOL)animated
{
    //...
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    CrashSummary *crashSummary = [CrashSummary sharedCrashSummary];
    //NSLog(@"%@", crashSummary.pedestrians);
    
    if ([self.individualPersons count] > 0) {
    //if (crashSummary.individualPersons.count > 0) {
        self.displayEmptyCell = NO;
        //return [crashSummary.vehicles count] + 1;
        return [crashSummary.vehicles count] + [self.individualPersons count];
    } else {
        self.displayEmptyCell = ([crashSummary.vehicles count] == 0);
        if (self.displayEmptyCell) {
            return 1;
        }
        
        return [crashSummary.vehicles count];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    CrashSummary *crashSummary = [CrashSummary sharedCrashSummary];
    
    if (section >= crashSummary.vehicles.count) {
    //if (section == crashSummary.vehicles.count) {
        //return crashSummary.individualPersons.count + 1;
        NSDictionary *personDesc = [self.individualPersons objectAtIndex:(section - [crashSummary.vehicles count])];
        NSArray *persons = personDesc[@"persons"];
        return persons.count + 1;
    } else {
        Vehicle *actual =[crashSummary.vehicles objectAtIndex:section];
        return actual.persons.count + 1;
    }
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CrashSummary *crashSummary = [CrashSummary sharedCrashSummary];
    
    if (indexPath.section >= crashSummary.vehicles.count && [crashSummary.individualPersons count] > 0) {
    //if (indexPath.section == crashSummary.vehicles.count && [crashSummary.individualPersons count] > 0) {
        NSDictionary *viewDescription = [self.individualPersons objectAtIndex:(indexPath.section - crashSummary.vehicles.count)];
        NSArray *persons = viewDescription[@"persons"];
        
        static NSString *cellIdentifier = @"PedestrianCell";
        
        PedestrianTableViewCell *cell = (PedestrianTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        if (cell == nil) {
            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"PedestrianViewCell" owner:self options:nil];
            cell = [nib objectAtIndex:0];
        }
        
        //Person *person = [crashSummary.individualPersons objectAtIndex:indexPath.row - 1];
        Person *person = [persons objectAtIndex:indexPath.row - 1];
        
        cell.pedestrianName = person.name;
        
        return cell;
    } else {
        static NSString *cellIdentifier = @"CarMemberCell";
        
        CarMembersTableViewCell *cell = (CarMembersTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        if (cell == nil) {
            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"CarMembersViewCell" owner:self options:nil];
            cell = [nib objectAtIndex:0];
        }
        
        Vehicle *vehicle = [crashSummary.vehicles objectAtIndex:indexPath.section];
        Person *person = [vehicle.persons objectAtIndex:indexPath.row - 1];
        
        //NSLog(@"Displaying... %ld", (long)person.typeKey);
        
        if ([person.typeKey isEqualToString:@"1"]) {
            cell.memberType = 1;
        } else {
            cell.memberType = 2;
        }
        cell.memberName = person.name;
        cell.memberDriverLicense = person.driverLicense;
        
        return cell;
    }
}

@end
