//
//  PedestrianTableViewCell.h
//  transinfo
//
//  Created by Omar Soto Fortuño on 12/8/14.
//  Copyright (c) 2014 University of Puerto Rico Mayagüez Campus. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SLExpandableTableView.h"

@interface PedestrianTableViewCell : UITableViewCell <UIExpandingTableViewCell>

@property (nonatomic) NSString *pedestrianName;

@property UIImageView *expandImageView;

@property (weak, nonatomic) IBOutlet UILabel *pedestrianNameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *pedestrianImageView;

@property (nonatomic, assign, getter = isLoading) BOOL loading;

@property (nonatomic, readonly) UIExpansionStyle expansionStyle;
- (void)setExpansionStyle:(UIExpansionStyle)expansionStyle animated:(BOOL)animated;

@end
