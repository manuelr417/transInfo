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

@interface DataEntryTableViewController ()

@end

@implementation DataEntryTableViewController

- (void)loadView
{
    self.vehicles = [[NSMutableArray alloc] init];
    self.pedestrians = [[NSMutableArray alloc] init];
    self.tableView = [[SLExpandableTableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
}

/*- (IBAction)addButonAction:(id)sender {
 NSLog(@"Add car and person!");
 
 NSDictionary *carDictionary = @{@"vehicleMake" : self.vehicleMakeField.text, @"vehicleModel" : self.vehicleModelField.text, @"vehicleYear" : self.vehicleYearField.text, @"vehicleRegistrationNumber" : self.vehicleRegistrationNumberField.text};
 NSDictionary *personDictionary = @{@"vehicleRegistrationNumber" : self.vehicleRegistrationNumberField.text, @"personName" : self.personNameField.text, @"licenseNumber" : self.licenseNumberField.text};
 
 [[NSNotificationCenter defaultCenter] postNotificationName:@"addCar" object:nil userInfo:carDictionary];
 [[NSNotificationCenter defaultCenter] postNotificationName:@"addPerson" object:nil userInfo:personDictionary];
 }*/

- (void)receiveNotification:(NSNotification*)notification {
    NSDictionary *dict = [notification userInfo];
    
    if ([[notification name] isEqualToString:@"addCar"]) {
        NSString *vehicleUUID = [dict objectForKey:@"uuid"];
        NSMutableArray *savedPersons;
        
        if (vehicleUUID != nil) {
            for (Vehicle *v in self.vehicles) {
                if ([v.uuid isEqualToString:vehicleUUID]) {
                    savedPersons = v.persons;
                    [self.vehicles removeObject:v];
                    break;
                }
            }
        }
        
        Vehicle *vehicle = [[Vehicle alloc] init];
        vehicle.make = [dict objectForKey:@"vehicleMake"];
        vehicle.model = [dict objectForKey:@"vehicleModel"];
        vehicle.year = [dict objectForKey:@"vehicleYear"];
        vehicle.registrationPlate = [dict objectForKey:@"vehicleLicensePlate"];
        vehicle.uuid = [[NSUUID UUID] UUIDString];
        
        if (savedPersons != nil) {
            vehicle.persons = savedPersons;
        }
        
        [self.vehicles addObject:vehicle];
        
        [self.tableView reloadData];
    } else if ([[notification name] isEqualToString:@"addPerson"]) {
        NSString *personType = [dict objectForKey:@"typeKey"];
        NSString *personUUID = [dict objectForKey:@"uuid"];
        
        if (personUUID != nil) {
            for (Person *p in self.pedestrians) {
                if ([p.uuid isEqualToString:personUUID]) {
                    [self.pedestrians removeObject:p];
                    break;
                }
            }
            
            for (Vehicle *v in self.vehicles) {
                for (Person *p in v.persons) {
                    if ([p.uuid isEqualToString:personUUID]) {
                        [v.persons removeObject:p];
                        break;
                    }
                }
            }
        }
        
        if ([personType isEqualToString:@"3"] || [personType isEqualToString:@"7"]) {
            Person *person = [[Person alloc] init];
            
            person.typeCategoryKey = [dict objectForKey:@"typeCategoryKey"];
            person.name = [dict objectForKey:@"name"];
            person.genderKey = [dict objectForKey:@"genderKey"];
            person.licenseTypeKey = [dict objectForKey:@"licenseTypeKey"];
            person.driverLicense = [dict objectForKey:@"driverLicense"];
            person.organDonorKey = [dict objectForKey:@"organDonorKey"];
            person.licenseExpirationDate = [dict objectForKey:@"licenseExpirationDate"];
            person.licenseExpirationNA = [dict objectForKey:@"licenseExpirationNA"];
            person.streetAddress = [dict objectForKey:@"streetAddress"];
            person.neighbohood = [dict objectForKey:@"neighbohood"];
            person.city = [dict objectForKey:@"city"];
            person.stateCountry = [dict objectForKey:@"stateCountry"];
            person.zipCode = [dict objectForKey:@"zipCode"];
            person.phoneNumber = [dict objectForKey:@"phoneNumber"];
            person.uuid = [[NSUUID UUID] UUIDString];
            person.typeKey = [personType intValue];
            
            [self.pedestrians addObject:person];
        } else {
            
            for (Vehicle *v in self.vehicles) {
                if ([v.registrationPlate isEqualToString:[dict objectForKey:@"vehicleLicensePlate"]]) {
                    Person *person = [[Person alloc] init];
                    person.typeCategoryKey = [dict objectForKey:@"typeCategoryKey"];
                    person.name = [dict objectForKey:@"name"];
                    person.genderKey = [dict objectForKey:@"genderKey"];
                    person.licenseTypeKey = [dict objectForKey:@"licenseTypeKey"];
                    person.driverLicense = [dict objectForKey:@"driverLicense"];
                    person.organDonorKey = [dict objectForKey:@"organDonorKey"];
                    person.licenseExpirationDate = [dict objectForKey:@"licenseExpirationDate"];
                    person.licenseExpirationNA = [dict objectForKey:@"licenseExpirationNA"];
                    person.streetAddress = [dict objectForKey:@"streetAddress"];
                    person.neighbohood = [dict objectForKey:@"neighbohood"];
                    person.city = [dict objectForKey:@"city"];
                    person.stateCountry = [dict objectForKey:@"stateCountry"];
                    person.zipCode = [dict objectForKey:@"zipCode"];
                    person.phoneNumber = [dict objectForKey:@"phoneNumber"];
                    person.uuid = [[NSUUID UUID] UUIDString];
                    person.typeKey = [personType intValue];

                    
                    [v addPerson:person];
                    
                    break;
                }
            }
        }
        
        [self.tableView reloadData];
    } else if ([[notification name] isEqualToString:@"requestVehicles"]) {
        NSDictionary *info = [NSDictionary dictionaryWithObjectsAndKeys:self.vehicles,@"vehicles", nil];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"getVehicles" object:nil userInfo:info];
    }
}

- (BOOL)tableView:(UITableView*)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.pedestrians.count > 0 && indexPath.section == [self.vehicles count] && indexPath.row == 0) {
        return NO;
    }
    return YES;
}

- (NSArray *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewRowAction *updateAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:NSLocalizedString(@"report.third.edit", nil) handler:^(UITableViewRowAction *action, NSIndexPath *indexPath){
        NSLog(@"Update! %ld", (long)indexPath.row);
        
        if (indexPath.row > 0) {
            NewPersonController *newPersonView = [self.storyboard instantiateViewControllerWithIdentifier:@"newPersonView"];
            
            if (self.pedestrians.count > 0 && indexPath.section == [self.vehicles count]) {
                Person *person = [self.pedestrians objectAtIndex:indexPath.row - 1];
                
                [newPersonView setEditingModeFor:person forRegistrationPlate:nil];
            } else {
                Vehicle *vehicle = [self.vehicles objectAtIndex:indexPath.section];
                Person *person = [[vehicle persons] objectAtIndex:indexPath.row - 1];
                
                [newPersonView setEditingModeFor:person forRegistrationPlate:vehicle.registrationPlate];
            }
            
            self.popover = [[UIPopoverController alloc] initWithContentViewController:newPersonView];
            
            CGRect aFrame = [self.tableView rectForRowAtIndexPath:[NSIndexPath indexPathForRow:indexPath.row inSection:indexPath.section]];
            [self.popover presentPopoverFromRect:[self.tableView convertRect:aFrame toView:self.view] inView:self.view permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
        } else {
            NewVehicleController *newVehicleController = [self.storyboard instantiateViewControllerWithIdentifier:@"newVehicleView"];
            Vehicle *vehicle = [self.vehicles objectAtIndex:indexPath.section];
            [newVehicleController setEditingModeFor:vehicle];
            
            self.popover = [[UIPopoverController alloc] initWithContentViewController:newVehicleController];
            
            CGRect aFrame = [self.tableView rectForRowAtIndexPath:[NSIndexPath indexPathForRow:indexPath.row inSection:indexPath.section]];
            [self.popover presentPopoverFromRect:[self.tableView convertRect:aFrame toView:self.view] inView:self.view permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
        }
        
        [self.tableView setEditing:NO];
    }];
    updateAction.backgroundColor = [UIColor colorWithRed:0 green:204.0/255.0 blue:0 alpha:1];
    
    UITableViewRowAction *deleteAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:NSLocalizedString(@"report.third.delete", nil)  handler:^(UITableViewRowAction *action, NSIndexPath *indexPath){
        
        NSLog(@"Delete %ld %ld", (long)indexPath.section, (long)indexPath.row);
        
        if (indexPath.row == 0) {
            [self.vehicles removeObjectAtIndex:indexPath.section];
            [self.tableView reloadData];
        } else {
            if (indexPath.row == self.vehicles.count) { // Borrar Persona
                [self.pedestrians removeObjectAtIndex:indexPath.row - 1];
                [self.tableView reloadData];
            } else {
                /*Vehicle *v = [self.vehicles objectAtIndex:indexPath.section];
                [v.persons removeObjectAtIndex:indexPath.row - 1];
                [self.tableView reloadData];*/
            }
        }
        
        [self.tableView setEditing:NO];
    }];
    
    return @[deleteAction, updateAction];
}


-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    /*if (editingStyle == UITableViewCellEditingStyleDelete) {
     
     }*/
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)loadDummyData {
    Person *person = [[Person alloc] init];
    person.name = @"Omar Soto Fortuño";
    person.driverLicense = @"4883682";
    person.typeKey = 1;
    
    Person *person2 = [[Person alloc] init];
    person2.name = @"Manuel Rodríguez Martínez";
    person2.driverLicense = @"1234567";
    person2.typeKey = 2;
    
    Vehicle *vehicle = [[Vehicle alloc] init];
    vehicle.make = @"Mitsubishi";
    vehicle.model = @"Lancer";
    vehicle.year = @"2004";
    vehicle.registrationPlate = @"FER 048";
    
    [vehicle addPerson:person];
    [vehicle addPerson:person2];
    
    [self.vehicles addObject:vehicle];
    
    Vehicle *vehicle2 = [[Vehicle alloc] init];
    vehicle2.make = @"Hyundai";
    vehicle2.model = @"Accent";
    vehicle2.year = @"2010";
    vehicle2.registrationPlate = @"GRR 144";
    
    [vehicle2 addPerson:person];
    [vehicle2 addPerson:person2];
    
    [self.vehicles addObject:vehicle2];
    
    Person *person3 = [[Person alloc] init];
    person3.name = @"Ivette Cruzado Vélez";
    person3.driverLicense = @"1234567";
    person3.typeKey = 3;
    
    [self.pedestrians addObject:person3];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    //[self loadDummyData];
    
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
    if (section == self.vehicles.count && self.pedestrians.count > 0) {
        static NSString *cellIdentifier = @"PedestrianDivisorCell";
        
        PedestrianTableViewCell *cell = (PedestrianTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        if (cell == nil) {
            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"PedestrianViewCell" owner:self options:nil];
            cell = [nib objectAtIndex:0];
        }
        
        return cell;
    } else {
        static NSString *cellIdentifier = @"CarCell";
        
        CarTableViewCell *cell = (CarTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        if (cell == nil) {
            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"CarViewCell" owner:self options:nil];
            cell = [nib objectAtIndex:0];
        }
        
        Vehicle *vehicle = [self.vehicles objectAtIndex:section];
        
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
    //NSLog(@"%@", self.pedestrians);
    if (self.pedestrians.count > 0) {
        return [self.vehicles count] + 1;
    } else {
        return [self.vehicles count];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == self.vehicles.count) {
        return self.pedestrians.count + 1;
    } else {
        Vehicle *actual =[self.vehicles objectAtIndex:section];
        return actual.persons.count + 1;
    }
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == self.vehicles.count && [self.pedestrians count] > 0) {
        static NSString *cellIdentifier = @"PedestrianCell";
        
        PedestrianTableViewCell *cell = (PedestrianTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        if (cell == nil) {
            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"PedestrianViewCell" owner:self options:nil];
            cell = [nib objectAtIndex:0];
        }
        
        Person *person = [self.pedestrians objectAtIndex:indexPath.row - 1];
        
        cell.pedestrianName = person.name;
        
        return cell;
    } else {
        static NSString *cellIdentifier = @"CarMemberCell";
        
        CarMembersTableViewCell *cell = (CarMembersTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        if (cell == nil) {
            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"CarMembersViewCell" owner:self options:nil];
            cell = [nib objectAtIndex:0];
        }
        
        Vehicle *vehicle = [self.vehicles objectAtIndex:indexPath.section];
        Person *person = [vehicle.persons objectAtIndex:indexPath.row - 1];
        
        NSLog(@"Displaying... %ld", (long)person.typeKey);
        
        if (person.typeKey == 1) {
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
