//
//  PersonsTableViewController.h
//  transinfo
//
//  Created by Omar Soto Fortuño on 3/1/15.
//  Copyright (c) 2015 University of Puerto Rico Mayagüez Campus. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CollectionManager.h"

@interface PersonsTableViewController : UITableViewController

@property (weak, nonatomic) IBOutlet UIBarButtonItem *sideBarButton;

@property BOOL displayEmptyCell;

@property NSMutableArray *persons;
@property NSMutableDictionary *personTypes;

@property CollectionManager *colManager;

@end
