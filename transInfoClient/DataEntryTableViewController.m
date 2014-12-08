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

@interface DataEntryTableViewController ()

@end

@implementation DataEntryTableViewController

- (void)loadView
{
    self.vehicles = [[NSMutableArray alloc] init];
    self.pedestrians = [[NSMutableArray alloc] init];
    self.tableView = [[SLExpandableTableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    
    
}

- (void)loadDummyData {
    Person *person = [[Person alloc] init];
    person.name = @"Omar Soto Fortuño";
    person.driverLicense = @"4883682";
    person.type = 1;
    
    Person *person2 = [[Person alloc] init];
    person2.name = @"Manuel Rodríguez Martínez";
    person2.driverLicense = @"1234567";
    person2.type = 2;
    
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
    person3.type = 3;
    
    [self.pedestrians addObject:person3];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    [self loadDummyData];
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
    // Return the number of sections.
    if (self.pedestrians.count > 0) {
        return [self.vehicles count] + 1;
    } else {
        return [self.vehicles count];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    //return 5;
    if (section == self.vehicles.count) {
        NSLog(@"Hola %lu", (unsigned long)self.pedestrians.count);
        return self.pedestrians.count + 1;
    } else {
        Vehicle *actual =[self.vehicles objectAtIndex:section];
        return actual.persons.count + 1;
    }
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%lu %lu", (unsigned long)self.vehicles.count, (unsigned long)[self.pedestrians count]);
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
        
        if (person.type == 1) {
            cell.memberType = 1;
        } else {
            cell.memberType = 2;
        }
        cell.memberName = person.name;
        cell.memberDriverLicense = person.driverLicense;
        
        return cell;
    }
}


/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
