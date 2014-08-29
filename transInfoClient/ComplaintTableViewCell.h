//
//  ComplaintTableViewCell.h
//  transinfo
//
//  Created by Omar Soto Fortuño on 8/29/14.
//  Copyright (c) 2014 University of Puerto Rico Mayagüez Campus. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ComplaintTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *complaintNumberLabel;
@property (weak, nonatomic) IBOutlet UILabel *coordinatesLabel;
@property (weak, nonatomic) IBOutlet UILabel *complaintTypeLabel;
@property (weak, nonatomic) IBOutlet UILabel *placeLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;

@property (nonatomic) NSNumber *complaintType;

- (void)setComplaintType:(NSNumber *)complaintType;

@end
