//
//  DataEntryTableViewController.h
//  transinfo
//
//  Created by Omar Soto Fortuño on 12/8/14.
//  Copyright (c) 2014 University of Puerto Rico Mayagüez Campus. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SLExpandableTableView.h"


@interface DataEntryTableViewController : UITableViewController <SLExpandableTableViewDatasource/*, SLExpandableTableViewDelegate*/>

@property (weak, nonatomic) IBOutlet UIBarButtonItem *sideBarButton;

@property NSMutableArray *vehicles;
@property NSMutableArray *pedestrians;

@property UIPopoverController *popover;

@end
