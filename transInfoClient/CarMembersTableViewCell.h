//
//  CarMembersTableViewCell.h
//  transinfo
//
//  Created by Omar Soto Fortuño on 12/7/14.
//  Copyright (c) 2014 University of Puerto Rico Mayagüez Campus. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SLExpandableTableView.h"

@interface CarMembersTableViewCell : UITableViewCell

@property (nonatomic) NSInteger memberType;
@property (nonatomic) NSString *memberName;
@property (nonatomic) NSString *memberDriverLicense;

@property (weak, nonatomic) IBOutlet UIImageView *memberImageView;
@property (weak, nonatomic) IBOutlet UILabel *memberNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *memberDriverLicenseLabel;


@end
