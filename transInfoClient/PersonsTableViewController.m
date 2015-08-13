//
//  PersonsTableViewController.m
//  transinfo
//
//  Created by Omar Soto Fortuño on 3/1/15.
//  Copyright (c) 2015 University of Puerto Rico Mayagüez Campus. All rights reserved.
//

#import "PersonsTableViewController.h"
#import "SWRevealViewController.h"
#import "CrashSummary.h"
#import "Vehicle.h"
#import "Person.h"
#import "Utilities.h"
#import "PersonExtendedViewController.h"

@interface PersonsTableViewController ()

@end

@implementation PersonsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [(UIScrollView *)self.view setContentSize:CGSizeMake(700,1100)];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    // Set the side bar button action. When it's tapped, it'll show up the sidebar.
    self.sideBarButton.target = self.revealViewController;
    self.sideBarButton.action = @selector(revealToggle:);
    
    // Set the gesture
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveNotification:) name:@"updatePersons" object:nil];
    
    //NSLog(@"Estoy esperando updatePersons");
    //[Utilities displayAlertWithMessage:@"aja" withTitle:@"aja"];
    
    self.persons = [[NSMutableArray alloc] init];
    
    // Loaod Person Types
    self.colManager = [[CollectionManager alloc] init];
    self.colManager.delegate = self;
    [self.colManager getCollection:@"personTypes"];
}

- (void)receivedCollection:(NSArray *)collection withName:(NSString *)collectionName {
    NSLog(@"Received: %@", collectionName);
    
    if ([collectionName isEqualToString:@"personTypes"]) {
        self.personTypes = [[NSMutableDictionary alloc] init];
        
        for (NSDictionary *dict in collection) {
            [self.personTypes setValue:[dict objectForKey:[Utilities collectionColumn]] forKey:[NSString stringWithFormat:@"%@",[dict objectForKey:@"PersonTypeID"]]];
        }
        
        NSLog(@"personTypes: %@", self.personTypes);
        [self.tableView reloadData];
    }
}

- (void)receiveNotification:(NSNotification*)notification {
    NSLog(@"Update persons!");
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    CrashSummary *crashSummary = [CrashSummary sharedCrashSummary];
    
    self.persons = [[NSMutableArray alloc] init];
    
    NSLog(@"Comenzó");
    
    for (Vehicle *v in crashSummary.vehicles) {
        for (Person *p in v.persons) {
            [self.persons addObject:p];
            NSLog(@"%@", p.name);
        }
    }
    
    for (Person *p in crashSummary.individualPersons) {
        [self.persons addObject:p];
        NSLog(@"%@", p.name);
    }
    
    self.displayEmptyCell = ([self.persons count] == 0);
    if (self.displayEmptyCell) {
        return 1;
    }
    
    return [self.persons count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.displayEmptyCell) {
        UITableViewCell *cell = [[UITableViewCell alloc] init];
        
        cell.textLabel.text = NSLocalizedString(@"empty.list", nil);
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        return cell;
    } else {
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    }
    
    static NSString *cellIdentifier = @"PersonCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    
    Person *p = [self.persons objectAtIndex:indexPath.row];
    
    cell.textLabel.text = p.name;
    
    NSString *personTypeDesc = (NSString*)[self.personTypes objectForKey:p.typeKey];
    
    //NSLog(@"%@ %@ %@", p.typeKey, personTypeDesc, self.personTypes);
    
    if (personTypeDesc != nil) {
        // Vehicle Exists and is a Motorist.
        if (p.vehicleUuid != nil && [p.typeCategoryKey isEqualToString:@"1"]) {
            CrashSummary *crashSummary = [CrashSummary sharedCrashSummary];
            Vehicle *v = [crashSummary getVehicleWithUUID:p.vehicleUuid];
            
            cell.detailTextLabel.text = [NSString stringWithFormat:NSLocalizedString(@"person.description.detail", nil), personTypeDesc, [v.registrationPlate uppercaseString]];
        } else {
            cell.detailTextLabel.text = personTypeDesc;
        }
    } else {
        // Not yet available!
        cell.detailTextLabel.text = @"";
    }
    
    [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    
    return cell;
}

//EditPersonSegue

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.displayEmptyCell) {
        return;
    }
    
    //[self performSegueWithIdentifier:@"EditPersonSegue" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"EditPersonSegue"]) {
        PersonExtendedViewController *personExtendedViewController = segue.destinationViewController;
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        
        Person *p = [self.persons objectAtIndex:indexPath.row];
        
        [personExtendedViewController setEditingModeFor:p];
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
