//
//  MainTableViewController.m
//  transinfo
//
//  Created by Omar Soto Fortuño on 8/25/14.
//  Copyright (c) 2014 University of Puerto Rico Mayagüez Campus. All rights reserved.
//

#import "MainTableViewController.h"
#import "Utilities.h"
#import "ComplaintTableViewCell.h"
#import "SWRevealViewController.h"
#import "AppDelegate.h"
#import "Report.h"
#import "CollectionManager.h"
#import "ReportInvolvedUnit.h"

@interface MainTableViewController ()
@property (weak, nonatomic) IBOutlet UIBarButtonItem *sidebarButton;

@property NSMutableArray *dates;
@property NSMutableArray *reports;

@property NSMutableDictionary *collections;

@end

@implementation MainTableViewController

- (void)loadData {
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    NSEntityDescription *entityDescription = [NSEntityDescription
                                              entityForName:@"Report" inManagedObjectContext:appDelegate.managedObjectContext];
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entityDescription];
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSDictionary *loginInfo = [userDefaults objectForKey:@"login"];
    NSString *officerUserID;
    
    if (loginInfo != nil) {
        officerUserID = loginInfo[@"UserID"];
    }
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"officerUserID == %@", officerUserID];
    [request setPredicate:predicate];
    
    
    
   // NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc]
   //                                     initWithKey:@"caseNumber" ascending:YES];
    
    NSSortDescriptor *sortDescriptor1 = [[NSSortDescriptor alloc] initWithKey:@"crashDate" ascending:YES];
    NSSortDescriptor *sortDescriptor2 = [[NSSortDescriptor alloc] initWithKey:@"crashTime" ascending:YES];
    
    [request setSortDescriptors:[NSArray arrayWithObjects:sortDescriptor1, sortDescriptor2, nil]];
    
    //[request setSortDescriptors:@[sortDescriptor]];
    
    NSError *error;
    NSArray *array = [appDelegate.managedObjectContext executeFetchRequest:request error:&error];
    
    if (array == nil) {
        NSLog(@"Error: %@", error);
    } else {
        Report *report;
        BOOL contains;
        
        NSLog(@"Count: %lu", (unsigned long)[array count]);
        for (int i = 0; i < [array count]; i++) {
            report = array[i];
            
            NSLog(@"ReportTypeID: %@", report.reportTypeID);
            
            ReportInvolvedUnit *riu = report.reportInvolvedUnit;
            
            NSLog(@"vehicleQuantity: %@", riu.vehicleQuantity);
            NSLog(@"motoristQuantity: %@", riu.motoristQuantity);
            NSLog(@"pedestrianQuantity: %@", riu.pedestrianQuantity);
            
            contains = NO;
            for (int e = 0; e < [self.dates count]; e++) {
                
                if ([[self stringFromDate:self.dates[e]] isEqualToString:[self stringFromDate:report.crashDate]]) {
                    contains = YES;
                }
            }
            
            if (!contains) {
                [self.dates addObject:report.crashDate];
            }
            
            [self.reports addObject:report];
        }
        
        NSLog(@"Total Dates: %lu", (unsigned long)[self.dates count]);
        
        [self.tableView reloadData];
    }
}

- (IBAction)doLogout:(id)sender {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    [userDefaults removeObjectForKey:@"login"];
    [userDefaults synchronize];
    
    [Utilities displayAlertWithMessage:@"Logout!" withTitle:@"Debug"];
    
    [self performSegueWithIdentifier:@"GoToLogin" sender:self];
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    
    
    self.dates = [[NSMutableArray alloc] init];
    self.reports = [[NSMutableArray alloc] init];
    self.collections = [[NSMutableDictionary alloc] init];
    
    [self loadCollections];
    
    //[self loadData];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.sidebarButton.target = self.revealViewController;
    self.sidebarButton.action = @selector(revealToggle:);
    
    // Set the gesture
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    //#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return [self.dates count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //#warning Incomplete method implementation.
    // Return the number of rows in the section.
    int count = 0;
    NSString *sectionDate = [self stringFromDate:self.dates[section]];
    
    for (int i = 0; i < [self.reports count]; i++) {
        Report *report = self.reports[i];
        
        if ([sectionDate isEqualToString:[self stringFromDate:report.crashDate]]) {
            count++;
        }
    }
    
    return count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *complaintTableIdentifier = @"ComplaintTableViewCell";
    
    ComplaintTableViewCell *cell = (ComplaintTableViewCell *)[tableView dequeueReusableCellWithIdentifier:complaintTableIdentifier];
    if (cell == nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"ComplaintTableViewCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    Report *report = [self getReportForIndex:indexPath.row fromSection:indexPath.section];
    //NSLog(@"%@", report);
    
    cell.complaintType = [[NSNumber alloc] initWithInt:5];
    //XXXX-X-XXX-XXXXX
    //(Año)-(Area Policiaca… Ponce, San Juan, Fajardo)-(Número de Precinto)-(Número de Querella)
    /*cell.complaintNumberLabel.text = @"# 2014-1-023-00001";
    cell.mostContributingPersonLabel.text = @"Soto Fortuño, Omar";
    cell.placeLabel.text = @"Ponce, Puerto Rico";
    cell.complaintTypeLabel.text = @"Fatal";
    
    NSDate *date = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //[dateFormatter setDateStyle:NSDateFormatterLongStyle];
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    NSString *dateString = [[NSString alloc] initWithFormat:@"%@ %@", [dateFormatter stringFromDate:date], @"7:00 A.M."];
    
    cell.dateLabel.text = dateString;*/
    
    cell.complaintNumberLabel.text = [NSString stringWithFormat:@"# %@", report.caseNumber];
    cell.mostContributingPersonLabel.text = @"";
    cell.placeLabel.text = @"";
    cell.complaintTypeLabel.text = [NSString stringWithFormat:@"%@", report.reportTypeID];
    
    
    if ([report.reportTypeID  isEqual: @999]) {
        cell.complaintTypeLabel.text = @"";
    } else {
        NSArray *collection = [self.collections objectForKey:@"reportTypes"];
        NSString *value = [NSString stringWithFormat:@"%@", report.reportTypeID];
    
        for (NSDictionary *dict in collection) {
            if ([[NSString stringWithFormat:@"%@", [dict objectForKey:@"ReportTypeID"]] isEqualToString:value]) {
                cell.complaintTypeLabel.text = [dict objectForKey:[Utilities collectionColumn]];
                break;
            }
        }
    }
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    
    NSDateFormatter *dateFormatter2 = [[NSDateFormatter alloc] init];
    [dateFormatter2 setDateFormat:@"h:mm a"];
    
    NSString *dateString = [[NSString alloc] initWithFormat:@"%@ %@", [dateFormatter stringFromDate:report.crashDate], [dateFormatter2 stringFromDate:report.crashTime]];
    
    cell.dateLabel.text = dateString;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 141;
}

- (NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [self stringFromDate:self.dates[section]];
}

- (NSString*)stringFromDate:(NSDate*)date {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterLongStyle];
    NSString *dateString = [dateFormatter stringFromDate:date];
    
    return dateString;
}

- (Report*)getReportForIndex:(NSInteger)index fromSection:(NSInteger)section {
    NSString *sectionDate = [self stringFromDate:self.dates[section]];
    NSMutableArray *array = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < [self.reports count]; i++) {
        Report *report = self.reports[i];
        
        if ([sectionDate isEqualToString:[self stringFromDate:report.crashDate]]) {
            [array addObject:report];
        }
    }
    
    return (Report*)array[index];
}

- (void)loadCollections {
    NSMutableArray *collectionsNames = [[NSMutableArray alloc] init];
    
    [collectionsNames addObject:@"reportTypes"];
    
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

- (void)receivedCollection:(NSArray *)collection withName:(NSString *)collectionName {
    [self.collections setObject:collection forKey:collectionName];
    
    if ([collectionName isEqualToString:@"reportTypes"]) {
        [self loadData];
    }
}

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
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
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
