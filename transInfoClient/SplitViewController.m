//
//  SplitViewController.m
//  transinfo
//
//  Created by Omar Soto Fortuño on 9/3/14.
//  Copyright (c) 2014 University of Puerto Rico Mayagüez Campus. All rights reserved.
//

#import "SplitViewController.h"
#import "MainTableViewController.h"
#import "ReportFirstStepViewController.h"

@interface SplitViewController ()

@end

@implementation SplitViewController



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
        //MainTableViewController* firstVC = [[MainTableViewController alloc] init];
        //ReportFirstStepViewController* secondVC = [[ReportFirstStepViewController alloc] init];
        
        //UISplitViewController* splitVC = [[UISplitViewController alloc] init];
        //splitVC.viewControllers = [NSArray arrayWithObjects:firstVC, secondVC, nil];
    
    //self.viewControllers = [NSArray arrayWithObjects:firstVC, secondVC, nil];
    
       /* window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        window.rootViewController = splitVC;
        [window makeKeyAndVisible];*/
        
        //return YES;
    

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
