//
//  CarMembersTableViewCell.m
//  transinfo
//
//  Created by Omar Soto Fortuño on 12/7/14.
//  Copyright (c) 2014 University of Puerto Rico Mayagüez Campus. All rights reserved.
//

#import "CarMembersTableViewCell.h"
#import "Utilities.h"

@implementation CarMembersTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

/* 1 = Driver
 * 2 = Passenger
 */
- (void)setMemberType:(NSInteger)memberType {
    _memberType = memberType;
    if (self.memberType == 1) {
        [self.memberImageView setImage:[UIImage imageNamed:@"driver-50"]];
    } else if (self.memberType == 2) {
        [self.memberImageView setImage:[UIImage imageNamed:@"passenger-50"]];
    }
}

- (void)setMemberName:(NSString *)memberName {
    _memberName = memberName;
    self.memberNameLabel.text = memberName;
}

- (void)setMemberDriverLicense:(NSString *)memberDriverLicense {
    _memberDriverLicense = memberDriverLicense;
    self.memberDriverLicenseLabel.text = [NSString stringWithFormat:NSLocalizedString(@"report.third.license-no", nil), memberDriverLicense];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
