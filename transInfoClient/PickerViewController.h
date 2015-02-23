//
//  PickerViewController.h
//  transinfo
//
//  Created by Omar Soto Fortuño on 9/11/14.
//  Copyright (c) 2014 University of Puerto Rico Mayagüez Campus. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PickerViewController : UITableViewController

- (id)initWithStyle:(UITableViewStyle)style withElementsDictionary:(NSMutableDictionary*)elementsDictionary withMultipleChoice:(BOOL)isMultipleChoice;
- (void)loadSelectedElements:(NSMutableArray*)selectedElements;

@property (nonatomic, strong) NSString *identifier;
@property (nonatomic, strong) UITextField *outField;
@property (nonatomic, strong) UIPopoverController *popover;

@property (nonatomic, strong) NSMutableDictionary *elementsDictionary;
@property (nonatomic, strong) NSArray *elementKeys;
@property (nonatomic, strong) NSMutableArray *selectedElements;
@property BOOL isMultipleChoice;

@property id delegate;

@end

@interface NSObject(PickerViewControllerDelegateMethods)
- (void)keysSelected:(NSArray*)keys withIdentifier:(NSString*)identifier withOutField:(UITextField*)outField;
@end