//
//  MainViewController.m
//  transinfo
//
//  Created by Omar Soto Fortuño on 7/1/14.
//  Copyright (c) 2014 University of Puerto Rico Mayagüez Campus. All rights reserved.
//

#import "MainViewController.h"
#import "Config.h"
#import "restComm.h"
#import "Utilities.h"
#import "MainTableViewController.h"
#import "ReportFirstStepViewController.h"
#import "SplitViewController.h"

@interface MainViewController ()

@property UIActivityIndicatorView *spinner;

@property (weak, nonatomic) IBOutlet UITextField *username;
@property (weak, nonatomic) IBOutlet UITextField *password;

- (void)startLoading;
- (void)stopLoading;

@end

@implementation MainViewController

UIActivityIndicatorView *spinner;
NSUserDefaults *userDefaults;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    //[self.username setLeftViewMode:UITextFieldViewModeAlways];
    //[self.username setClearButtonMode:UITextFieldViewModeWhileEditing];
    [self.username setBorderStyle:UITextBorderStyleBezel];
    
    CGRect frameRect = self.username.frame;
    frameRect.size.height = 60;
    self.username.frame = frameRect;
    
    [self.username setBorderStyle:UITextBorderStyleRoundedRect];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

- (void)viewDidAppear:(BOOL)animated {
    userDefaults = [NSUserDefaults standardUserDefaults];
    NSDictionary *loginInfo = [userDefaults objectForKey:@"login"];
    
    NSLog(@"Verifiyng!");
    if (loginInfo != nil) {
        /*[userDefaults removeObjectForKey:@"login"];
         [userDefaults synchronize];
         return;*/
        
        [self startLoading];
        
        NSDate *expirationDate = [Utilities NSDateWithMySQLDate:loginInfo[@"ExpirationDate"]];
        
        if ([expirationDate compare:[NSDate date]] == NSOrderedDescending) {
            
            
            [self showUserInfo];
        } else {
            NSLog(@"Expired! %@ Actual: %@", expirationDate, [NSDate date]);
            //[userDefaults removeObjectForKey:@"login"];
            //[userDefaults synchronize];
            
            [self stopLoading];
        }
    } else {
        NSLog(@"No User Defaults!");
    }
}

- (void)receivedData:(NSDictionary *)data {
    [self stopLoading];

    NSDictionary *errors = @{@1: @"login.error.internal", @2: @"login.empty-required-field", @3: @"login.error.wrong-information"};
        
    if ([data[@"success"] boolValue] == YES) {
        // User Defaults saved!
        [userDefaults setObject:data[@"payload"] forKey:@"login"];
        [userDefaults synchronize];
        
        NSLog(@"OK");
        [self showUserInfo];
        /* TODO: Login... */
    } else {
        [Utilities displayAlertWithMessage:NSLocalizedString([errors objectForKey:data[@"error_code"]], nil) withTitle:NSLocalizedString(@"login.error.title", nil)];
    }
}

- (void)receivedError:(NSError *)error {
    [self stopLoading];
    
    if ([[error domain] isEqualToString:@"NSURLErrorDomain"]) {
        [Utilities displayAlertWithMessage:NSLocalizedString(@"login.error.server-timeout", nil) withTitle:NSLocalizedString(@"login.error.title", nil)];
    } else if ([[error domain] isEqualToString:@"NSCocoaErrorDomain"]) {
        [Utilities displayAlertWithMessage:NSLocalizedString(@"login.error.unknown-output", nil) withTitle:NSLocalizedString(@"login.error.title", nil)];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)loginTouch:(id)sender {
    if ([self.username.text length] == 0) {
        [Utilities displayAlertWithMessage:NSLocalizedString(@"login.empty-plate", nil) withTitle:NSLocalizedString(@"login.empty-required-field", nil)];
        [self.username becomeFirstResponder];
        return;
    }
    
    if ([self.password.text length] == 0) {
        [Utilities displayAlertWithMessage:NSLocalizedString(@"login.empty-password", nil) withTitle:NSLocalizedString(@"login.empty-required-field", nil)];
        [self.password becomeFirstResponder];
        return;
    }
    
    NSMutableDictionary *postData = [[NSMutableDictionary alloc] init];
    [postData setValue:self.username.text forKey:@"username"];
    [postData setValue:self.password.text forKey:@"password"];
    
    restComm *conn = [[restComm alloc] initWithURL:[NSString stringWithFormat:@"%@login", urlAPI] withMethod:POST];
    
    [conn setDelegate:self];
    [conn setDataToRequest:postData];
    
    [self startLoading];
    
    [conn makeCall];
}

- (void)startLoading {
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    
    if (self.spinner != nil) {
        [self.spinner stopAnimating];
    }
    self.spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    self.spinner.center = CGPointMake(screenRect.size.height * 0.5, screenRect.size.width * 0.5);
    
    [self.view addSubview:self.spinner];
    [self.spinner startAnimating];
    self.view.userInteractionEnabled = NO;
}

- (void)stopLoading {
    if (self.spinner != nil) {
        [self.spinner stopAnimating];
    }
    
    self.view.userInteractionEnabled = YES;
}

// This is just for debugging purposes
- (void)showUserInfo {
    if (userDefaults != nil) {
        userDefaults = [NSUserDefaults standardUserDefaults];
    }
    
    NSDictionary *loginInfo = [userDefaults objectForKey:@"login"];
    
    if (loginInfo != nil) {
        //NSString *out = [NSString stringWithFormat:@"First Name: %@\nLast Name: %@\nPlate Number: %@\nAgency ID: %@", loginInfo[@"FirstName"], loginInfo[@"LastName"], loginInfo[@"PlateNumber"], loginInfo[@"AgencyID"]];
        
        NSLog(@"You are in!");
        //[Utilities displayAlertWithMessage:[NSString stringWithFormat:@"Welcome %@ %@, your session expires on %@", loginInfo[@"FirstName"], loginInfo[@"LastName"], loginInfo[@"ExpirationDate"]] withTitle:@"DEBUG"];
        
        //[Utilities displayAlertWithMessage:out withTitle:@"LOGIN INFO (DEBUG)"];
        
        //[self performSegueWithIdentifier:@"GoToMainNavigation" sender:self];
   
        //MainTableViewController *masterViewController = [[MainTableViewController alloc] init];
        //UINavigationController *masterNavigationController = [[UINavigationController alloc] initWithRootViewController:masterViewController];
        
        //ReportFirstStepViewController *detailViewController = [[ReportFirstStepViewController alloc] init];
        //UINavigationController *detailNavigationController = [[UINavigationController alloc] initWithRootViewController:detailViewController];
        
        
        UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        UIViewController *masterViewController = [storyBoard instantiateViewControllerWithIdentifier:@"MainNavigationController"];

         UIViewController *detailViewController = [storyBoard instantiateViewControllerWithIdentifier:@"ReportFirstStepNavigationController"];
        
        SplitViewController* splitViewController = [[SplitViewController alloc] init];
       
        
        //splitViewController.viewControllers = @[masterViewController, detailViewController];
        splitViewController.viewControllers = @[masterViewController, detailViewController];
        //splitViewController.delegate = self;
        //splitViewController.delegate = [[SplitViewController alloc] init];
        //splitViewController.delegate = splitViewController;
        
        /*UIWindow *window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        window.rootViewController = splitViewController;
        window.backgroundColor = [UIColor whiteColor];
        */
        //self.view.window = window;
        
        //self.view.window.bounds = [[UIScreen mainScreen] bounds];
        
        self.view.window.rootViewController = splitViewController;
        //self.view.window.backgroundColor = [UIColor whiteColor];
        [self.view.window makeKeyAndVisible];
        
    }
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
