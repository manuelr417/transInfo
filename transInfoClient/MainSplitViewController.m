//
//  MainSplitViewController.m
//  transinfo
//
//  Created by Omar Soto Fortuño on 9/5/14.
//  Copyright (c) 2014 University of Puerto Rico Mayagüez Campus. All rights reserved.
//

#import "MainSplitViewController.h"
#import "MainTableViewController.h"
#import "ReportFirstStepViewController.h"

@interface MainSplitViewController ()

@end

@implementation MainSplitViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    // Do any additional setup after loading the view.
    
    
    MainTableViewController *master = [[MainTableViewController alloc] init];
    ReportFirstStepViewController *detail = [[ReportFirstStepViewController alloc] init];
    
    self.viewControllers = [NSArray arrayWithObjects:master,
                                                detail, nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

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
