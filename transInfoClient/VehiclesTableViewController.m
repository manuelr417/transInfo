//
//  VehiclesTableViewController.m
//  transinfo
//
//  Created by Omar Soto Fortuño on 1/26/15.
//  Copyright (c) 2015 University of Puerto Rico Mayagüez Campus. All rights reserved.
//

#import "VehiclesTableViewController.h"
#import "SWRevealViewController.h"
#import "CarTableViewCell.h"
#import "CrashSummary.h"
#import "Vehicle.h"
#import "VehicleExtendedViewController.h"

@interface VehiclesTableViewController ()

@end

@implementation VehiclesTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    // Set the side bar button action. When it's tapped, it'll show up the sidebar.
    self.sideBarButton.target = self.revealViewController;
    self.sideBarButton.action = @selector(revealToggle:);
    
    // Set the gesture
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveNotification:) name:@"updateVehicles" object:nil];
}

- (void)receiveNotification:(NSNotification*)notification {
    NSDictionary *dict = [notification userInfo];
    CrashSummary *crashSummary = [CrashSummary sharedCrashSummary];
 
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
    return [crashSummary.vehicles count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"CarCell";
    
    CarTableViewCell *cell = (CarTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"CarViewCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    CrashSummary *crashSummary = [CrashSummary sharedCrashSummary];
    
    Vehicle *vehicle = [crashSummary.vehicles objectAtIndex:indexPath.row];
    
    cell.carMake = vehicle.make;
    cell.carModel = vehicle.model;
    cell.carYear = vehicle.year;
    cell.registrationPlate = vehicle.registrationPlate;
    
    return cell;
}


- (BOOL)tableView:(UITableView*)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    CrashSummary *crashSummary = [CrashSummary sharedCrashSummary];
    
    if (crashSummary.pedestrians.count > 0 && indexPath.section == [crashSummary.vehicles count] && indexPath.row == 0) {
        return NO;
    }
    return YES;
}

- (NSArray *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewRowAction *updateAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:NSLocalizedString(@"report.third.edit", nil) handler:^(UITableViewRowAction *action, NSIndexPath *indexPath){
        CrashSummary *crashSummary = [CrashSummary sharedCrashSummary];
        
        VehicleExtendedViewController *vehicleExtendedController = [self.storyboard instantiateViewControllerWithIdentifier:@"newVehicleExtendedView"];
        Vehicle *vehicle = [crashSummary.vehicles objectAtIndex:indexPath.section];
        [vehicleExtendedController setEditingModeFor:vehicle];
        
        self.popover = [[UIPopoverController alloc] initWithContentViewController:vehicleExtendedController];
        
        CGRect aFrame = [self.tableView rectForRowAtIndexPath:[NSIndexPath indexPathForRow:indexPath.row inSection:indexPath.section]];
        [self.popover presentPopoverFromRect:[self.tableView convertRect:aFrame toView:self.view] inView:self.view permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
                                          
        [self.tableView setEditing:NO];
        
        //NSLog(@"Update! %ld", (long)indexPath.row);
        
        /*if (indexPath.row > 0) {
            NewPersonController *newPersonView = [self.storyboard instantiateViewControllerWithIdentifier:@"newPersonView"];
            
            if (crashSummary.pedestrians.count > 0 && indexPath.section == [crashSummary.vehicles count]) {
                Person *person = [crashSummary.pedestrians objectAtIndex:indexPath.row - 1];
                
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
            
            CGRect aFrame = [self.tableView rectForRowAtIndexPath:[NSIndexPath indexPathForRow:indexPath.row inSection:indexPath.section]];
            [self.popover presentPopoverFromRect:[self.tableView convertRect:aFrame toView:self.view] inView:self.view permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
        }
        
        [self.tableView setEditing:NO];*/
        
        
    }];
    updateAction.backgroundColor = [UIColor colorWithRed:0 green:204.0/255.0 blue:0 alpha:1];
    

    
    return @[updateAction];
}


-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
}

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
