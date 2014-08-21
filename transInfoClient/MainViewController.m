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

@interface MainViewController ()

@property UIActivityIndicatorView *spinner;

@property (weak, nonatomic) IBOutlet UITextField *plateNumber;
@property (weak, nonatomic) IBOutlet UITextField *password;

@end

@implementation MainViewController

UIActivityIndicatorView *spinner;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    //NSLog(@"initWithNibName");
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    //NSLog(@"View appeared!");
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)receivedData:(NSDictionary *)data {
    self.view.userInteractionEnabled = YES;
    [self.spinner stopAnimating];

    NSDictionary *errors = @{@1: @"login.error.internal", @2: @"login.empty-required-field", @3: @"login.error.wrong-information"};
        
    if ([data[@"success"] boolValue] == YES) {
        NSLog(@"OK");
        /* TODO: Login... */
    } else {
        [Utilities displayAlertWithMessage:NSLocalizedString([errors objectForKey:data[@"error_code"]], nil) withTitle:NSLocalizedString(@"login.error.title", nil)];
    }
}

- (void)receivedError:(NSError *)error {
    self.view.userInteractionEnabled = YES;
    [self.spinner stopAnimating];
    
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
    if ([self.plateNumber.text length] == 0) {
        [Utilities displayAlertWithMessage:NSLocalizedString(@"login.empty-plate", nil) withTitle:NSLocalizedString(@"login.empty-required-field", nil)];
        [self.plateNumber becomeFirstResponder];
        return;
    }
    
    if ([self.password.text length] == 0) {
        [Utilities displayAlertWithMessage:NSLocalizedString(@"login.empty-password", nil) withTitle:NSLocalizedString(@"login.empty-required-field", nil)];
        [self.password becomeFirstResponder];
        return;
    }
    
    NSMutableDictionary *postData = [[NSMutableDictionary alloc] init];
    [postData setValue:self.plateNumber.text forKey:@"username"];
    [postData setValue:self.password.text forKey:@"password"];
    
    restComm *conn = [[restComm alloc] initWithURL:[NSString stringWithFormat:@"%@login", urlAPI] withMethod:POST];
    
    [conn setDelegate:self];
    [conn setDataToRequest:postData];
    
    // Loading spinner
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    
    if (self.spinner != nil) {
        [self.spinner stopAnimating];
    }
    self.spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    self.spinner.center = CGPointMake(screenRect.size.width * 0.5, screenRect.size.height * 0.5);
    
    [self.view addSubview:self.spinner];
    [self.spinner startAnimating];
    self.view.userInteractionEnabled = NO;
    
    [conn makeCall];
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
