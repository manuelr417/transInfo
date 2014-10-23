//
//  ReportSecondStepViewController.m
//  transinfo
//
//  Created by Omar Soto Fortuño on 10/20/14.
//  Copyright (c) 2014 University of Puerto Rico Mayagüez Campus. All rights reserved.
//

#import "ReportSecondStepViewController.h"
#import "SWRevealViewController.h"
#import "CollectionManager.h"
#import "Utilities.h"

@implementation ReportSecondStepViewController

- (void)viewDidLoad {
    [(UIScrollView *)self.view setContentSize:CGSizeMake(700,1100)];
    [self registerForKeyboardNotifications];
    [self loadCollections];
    
    // Set the side bar button action. When it's tapped, it'll show up the sidebar.
    self.sideBarButton.target = self.revealViewController;
    self.sideBarButton.action = @selector(revealToggle:);
    
    // Set the gesture
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    
    // Delegates
    self.firstHarmfulEventField.delegate = self;
    self.firstHarmfulEventTypeField.delegate = self;
    self.relToTrafficwayField.delegate = self;
    self.mannerOfCollisionField.delegate = self;
}

- (void)loadCollections {
    self.collections = [[NSMutableDictionary alloc] init];
    
    NSArray *collectionNames = @[@"harmfulEventCategories", @"harmfulEvents", @"relativeToTrafficways", @"mannerOfCollisions"];
    // NSArray *collectionNames = @[@"nearTo", @"properties", @"reportTypes"];
    NSMutableArray *collectionsManagers = [[NSMutableArray alloc] init];
    int i = 0;
    
    //NSString *collectionName = @"reportTypes";
    
    for (NSString *collectionName in collectionNames) {
        [self.collections setObject:[NSDate date] forKey:collectionName];
        [collectionsManagers addObject:[[CollectionManager alloc] init]];
        [collectionsManagers[i] getCollection:collectionName];
        ((CollectionManager*)collectionsManagers[i]).delegate = self;
        
        i++;
    }
}

- (void)receivedCollection:(NSArray *)collection withName:(NSString *)collectionName {
    [self.collections setObject:collection forKey:collectionName];
    
    NSLog(@"Received Collection: %@ (%lu elements)", collectionName, (unsigned long)[collection count]);
}

- (void)viewWillAppear:(BOOL)animated {
    // Border for Narrative Label
    [self.narrativeField.layer setBorderColor:[[[UIColor grayColor] colorWithAlphaComponent:0.5] CGColor]];
    [self.narrativeField.layer setBorderWidth:0.50];
    self.narrativeField.layer.cornerRadius = 5;
    self.narrativeField.clipsToBounds = YES;
    
    // Disable dependants fields...
    self.workersPresentField.enabled = NO;
    self.workzoneLocationField.enabled = NO;
    self.workzoneTypeField.enabled = NO;
    self.lawEnforcementPresentField.enabled = NO;
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    [self.view endEditing:YES];
    
    if (textField == self.firstHarmfulEventField) {
        [self showCollection:@"harmfulEvents" withIDColumn:@"HarmfulEventID" withField:self.firstHarmfulEventField];
        return NO;
    } else if (textField == self.firstHarmfulEventTypeField) {
        [self showCollection:@"harmfulEventCategories" withIDColumn:@"HarmfulEventCatID" withField:self.firstHarmfulEventTypeField];
        return NO;
    } else if (textField == self.relToTrafficwayField) {
        [self showCollection:@"relativeToTrafficways" withIDColumn:@"RelToTrafficwayID" withField:self.relToTrafficwayField];
        return NO;
    } else if (textField == self.mannerOfCollisionField) {
        [self showCollection:@"mannerOfCollisions" withIDColumn:@"MannerOfCollisionID" withField:self.mannerOfCollisionField];
        return NO;
    }
    
    return YES;
}

- (void)keysSelected:(NSArray *)keys withIdentifier:(NSString *)identifier {
    NSLog(@"Recibiendo... %@", identifier);
    if ([identifier isEqualToString:@"harmfulEventCategories"]) {
        self.harmfulEventCategoryKey = keys[0];
        self.firstHarmfulEventField.text = @"";
    }
}

- (IBAction)showCollection:(NSString*)collectionName withIDColumn:(NSString*)IDColumn withField:(id)field {
    if ([self.collections[collectionName] isKindOfClass:[NSArray class]]) {
        NSMutableDictionary *collection = [[NSMutableDictionary alloc] init];
        
        BOOL isHarmfulEvents = [collectionName isEqualToString:@"harmfulEvents"];
        
        if (isHarmfulEvents && self.harmfulEventCategoryKey == nil) {
            [Utilities displayAlertWithMessage:NSLocalizedString(@"report.second.no-harmful-event-category.msg", nil) withTitle:NSLocalizedString(@"report.second.no-harmful-event-category.title", nil) ];
            return;
        }
        
        for (NSDictionary *elem in self.collections[collectionName]) {
            if (isHarmfulEvents) {
                if (![self.harmfulEventCategoryKey isEqualToString:[NSString stringWithFormat:@"%@", [elem objectForKey:@"HarmfulEventCatID"]]]) {
                    continue;
                }
            }
            
            [collection setObject:(NSString*)[elem objectForKey:@"DescriptionES"] forKey:[NSString stringWithFormat:@"%@", [elem objectForKey:IDColumn]]];
        }
        
        [self showPickerView:collection withField:field withIdentifier:collectionName];
    } else {
        NSLog(@"No collection yet... %@", collectionName);
        CollectionManager *collManager = [[CollectionManager alloc] init];
        [collManager getCollection:collectionName];
        collManager.delegate = self;
    }
}


- (void)registerForKeyboardNotifications
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillBeHidden:)
                                                 name:UIKeyboardWillHideNotification object:nil];
}

// Called when the UIKeyboardWillShowNotification is sent.
- (void)keyboardWillShow:(NSNotification*)aNotification
{
    if ([self.narrativeField isFirstResponder]) {
        self.activeField = self.narrativeField;
    } else {
        return;
    }
    
    UIScrollView *scrollView = (UIScrollView*)self.view;
    NSDictionary* info = [aNotification userInfo];
    CGSize kbSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    
    UIEdgeInsets contentInsets = UIEdgeInsetsMake(0.0, 0.0, kbSize.height, 0.0);
    scrollView.contentInset = contentInsets;
    scrollView.scrollIndicatorInsets = contentInsets;
    
    // If active text field is hidden by keyboard, scroll it so it's visible
    // Your app might not need or want this behavior.
    CGRect aRect = self.view.frame;
    aRect.size.height -= kbSize.height;
    if (!CGRectContainsPoint(aRect, self.activeField.frame.origin) ) {
        [scrollView scrollRectToVisible:self.activeField.frame animated:YES];
    }
}


// Called when the UIKeyboardWillHideNotification is sent
- (void)keyboardWillBeHidden:(NSNotification*)aNotification
{
    UIScrollView* scrollView = (UIScrollView*)self.view;
    
    UIEdgeInsets contentInsets = UIEdgeInsetsZero;
    scrollView.contentInset = contentInsets;
    scrollView.scrollIndicatorInsets = contentInsets;
    
    self.activeField = nil;
}

- (void)showPickerView:(NSMutableDictionary*)elements withField:(UITextField*)field withIdentifier:(NSString*)identifier {
    self.pickerView = [[PickerViewController alloc] initWithStyle:UITableViewStylePlain withElementsDictionary:elements withMultipleChoice:NO];
    self.pickerPopover = [[UIPopoverController alloc] initWithContentViewController:self.pickerView];
    
    self.pickerView.delegate = self;
    self.pickerView.outField = field;
    self.pickerView.popover = self.pickerPopover;
    [self.pickerView setIdentifier:identifier];
    
    [self.pickerPopover presentPopoverFromRect:field.bounds inView:field permittedArrowDirections:UIPopoverArrowDirectionUnknown animated:YES];
}

@end
