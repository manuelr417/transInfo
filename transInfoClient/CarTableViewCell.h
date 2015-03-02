//
//  CarTableViewCell.h
//  transinfo
//
//  Created by Omar Soto Fortuño on 12/7/14.
//  Copyright (c) 2014 University of Puerto Rico Mayagüez Campus. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SLExpandableTableView.h"

@interface CarTableViewCell : UITableViewCell <UIExpandingTableViewCell>

@property (nonatomic) NSString *carMake;
@property (nonatomic) NSString *carModel;
@property (nonatomic) NSString *carYear;
@property (nonatomic) NSString *registrationPlate;

@property (weak, nonatomic) IBOutlet UILabel *carDescriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *registrationPlateLabel;

@property UIImageView *expandImageView;

@property (nonatomic, assign, getter = isLoading) BOOL loading;

@property (nonatomic, assign, getter = isExpandable) BOOL expandable;
@property (nonatomic, readonly) UIExpansionStyle expansionStyle;
- (void)setExpansionStyle:(UIExpansionStyle)expansionStyle animated:(BOOL)animated;

@end
