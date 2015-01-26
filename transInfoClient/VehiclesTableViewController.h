//
//  VehiclesTableViewController.h
//  transinfo
//
//  Created by Omar Soto Fortuño on 1/26/15.
//  Copyright (c) 2015 University of Puerto Rico Mayagüez Campus. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VehiclesTableViewController : UITableViewController

@property (weak, nonatomic) IBOutlet UIBarButtonItem *sideBarButton;

@property UIPopoverController *popover;

@end
