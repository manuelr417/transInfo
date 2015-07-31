//
//  PickerViewController.m
//  transinfo
//
//  Created by Omar Soto Fortuño on 9/11/14.
//  Copyright (c) 2014 University of Puerto Rico Mayagüez Campus. All rights reserved.
//

#import "PickerViewController.h"
#import "Utilities.h"

@interface PickerViewController ()

@end

@implementation PickerViewController

@synthesize identifier;
@synthesize selectedLimit;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        
        self.elementKeys = [NSArray array];
        self.elementsDictionary = [NSMutableDictionary dictionary];
        self.selectedLimit = @1;
    }
    return self;
}

- (id)initWithStyle:(UITableViewStyle)style withElementsDictionary:(NSMutableDictionary*)elementsDictionary withMultipleChoice:(BOOL)isMultipleChoice
{
    self = [super initWithStyle:style];
    if (self) {
        //Custom initialization
        self.isMultipleChoice = isMultipleChoice;
        
        if (elementsDictionary == nil) {
            self.elementsDictionary = [NSMutableDictionary dictionary];
        } else {
            self.elementsDictionary = elementsDictionary;
        }
        
        self.selectedElements = [[NSMutableArray alloc] init];
        
        NSArray *sortedDictionary = [self.elementsDictionary keysSortedByValueUsingComparator:^NSComparisonResult(id obj1, id obj2) {
            return [obj1 compare:obj2 options:NSCaseInsensitiveSearch];
        }];
        
        NSMutableArray *tempKeys = [[NSMutableArray alloc] init];
        
        for (NSString *key in sortedDictionary) {
            if ([key isEqualToString:@"999"]) {
                continue;
            }
            
            [tempKeys addObject:key];
        }
        
        self.elementKeys = tempKeys;
        
        //Calculate how tall the view should be by multiplying
        //the individual row height by the total number of rows.
        NSInteger totalRowsHeight;
        NSInteger rowsCount = [self.elementKeys count];
        NSInteger singleRowHeight = [self.tableView.delegate tableView:self.tableView heightForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
        
        if (singleRowHeight == -1) {
            UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
            totalRowsHeight = rowsCount * cell.frame.size.height;
        } else {
            totalRowsHeight = rowsCount * singleRowHeight;
        }
        
        // Calculate how wide the view should be by finding how
        // wide each string is expected tobe
        
        CGFloat largestLabelWidth = 0;
        for (NSString *elem in [self.elementsDictionary allValues]) {
            //Checks size of text using the default font for UITableViewCell's textLabel.
            NSDictionary *attributes = @{NSFontAttributeName: [UIFont boldSystemFontOfSize:20.0f]};
            CGSize labelSize = [elem sizeWithAttributes:attributes];
            
            if (labelSize.width > largestLabelWidth) {
                largestLabelWidth = labelSize.width;
            }
        }
        
        // Add a little padding to the width
        CGFloat popoverWidth = largestLabelWidth + 100;
        
        // Set the property to tell the popover container how big this view will be.
        self.preferredContentSize = CGSizeMake(popoverWidth, totalRowsHeight);
        
        if (self.isMultipleChoice) {
            self.tableView.allowsMultipleSelection = YES;
        }
    }
    
    return self;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *key = [self.elementKeys objectAtIndex:indexPath.row];
    
    if (![self.selectedElements containsObject:key]) {
        if (self.isMultipleChoice && [self.selectedLimit integerValue] != 0 && [self.selectedElements count] == [self.selectedLimit integerValue]) {
            [Utilities displayAlertWithMessage:[NSString stringWithFormat:NSLocalizedString(@"picker-view.limit-violation.msg", nil),[self.selectedLimit integerValue]] withTitle:NSLocalizedString(@"picker-view.limit-violation.title", nil)];
        } else {
            [self.selectedElements addObject:key];
        }
    } else {
        [self.selectedElements removeObject:key];
    }
    
    if (self.isMultipleChoice && [self.selectedElements count] > 1) {
        self.outField.text = [NSString stringWithFormat:NSLocalizedString(@"multilist.selected", nil), (unsigned long)[self.selectedElements count]];
    } else {
        if ([self.selectedElements count] == 0) {
            self.outField.text = @"";
        } else {
            self.outField.text = [self.elementsDictionary objectForKey:key];
        }
    }
    
    if (self.delegate != nil) {
        NSLog(@"Sending Keys Selected...");
        [self.delegate keysSelected:self.selectedElements withIdentifier:self.identifier withOutField:self.outField];
    }
    
    if (!self.isMultipleChoice) {
        [self.popover dismissPopoverAnimated:YES];
    } else {
        UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        if (self.isMultipleChoice && [self.selectedElements containsObject:key]) {
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
        } else {
            cell.accessoryType = UITableViewCellAccessoryNone;
        }
        //  [self.activeElements setValue:@1 forKey:indexPath.row];
        [self.tableView reloadData];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return self.elementKeys.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    NSString *key = [self.elementKeys objectAtIndex:indexPath.row];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    } else {
        cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    }
    
    cell.textLabel.text = [self.elementsDictionary valueForKey:[self.elementKeys objectAtIndex:indexPath.row]];
    
    if ([self.selectedElements containsObject:key]) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    
    return cell;
}

- (void)loadSelectedElements:(NSMutableArray *)selectedElements {
    self.selectedElements = selectedElements;
    [self.tableView reloadData];
}

@end
