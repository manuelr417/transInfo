//
//  NewDataEntryTableViewController.m
//  transinfo
//
//  Created by Omar Soto Fortuño on 12/10/14.
//  Copyright (c) 2014 University of Puerto Rico Mayagüez Campus. All rights reserved.
//

#import "NewDataEntryTableViewController.h"

@interface NewDataEntryTableViewController ()

@end

@implementation NewDataEntryTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)cancelButtonAction:(UIBarButtonItem *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
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
    return 3;
}


@end
