//
//  CarTableViewCell.m
//  transinfo
//
//  Created by Omar Soto Fortuño on 12/7/14.
//  Copyright (c) 2014 University of Puerto Rico Mayagüez Campus. All rights reserved.
//

#import "CarTableViewCell.h"

@implementation CarTableViewCell

- (void)awakeFromNib {
    // Initialization code
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    
    self.expandImageView = [[UIImageView alloc]initWithFrame:CGRectMake(screenWidth - 35, 7, 30, 30)];
    self.expandImageView.image = [UIImage imageNamed:@"Arrow Right"];
    [self addSubview:self.expandImageView];
}

- (void)setLoading:(BOOL)loading
{
    if (loading != _loading) {
        _loading = loading;
    }
}

- (void)setExpansionStyle:(UIExpansionStyle)expansionStyle animated:(BOOL)animated
{
    if (expansionStyle != _expansionStyle) {
        _expansionStyle = expansionStyle;
        
        [self updateExpansion];
    }
}

- (void)updateExpansion {
    [self.expandImageView removeFromSuperview];
    
    if (!self.isLoading) {
        switch (self.expansionStyle) {
            case UIExpansionStyleExpanded:
                self.expandImageView.image = [UIImage imageNamed:@"Arrow Down"];
                [self addSubview:self.expandImageView];
                break;
            case UIExpansionStyleCollapsed:
                self.expandImageView.image = [UIImage imageNamed:@"Arrow Right"];
                [self addSubview:self.expandImageView];
                break;
        }
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setCarMake:(NSString *)carMake {
    _carMake = carMake;
    [self updateCarDescription];
}

- (void)setCarModel:(NSString *)carModel {
    _carModel = carModel;
    [self updateCarDescription];
}

- (void)setCarYear:(NSString *)carYear {
    _carYear = carYear;
    [self updateCarDescription];
}

- (void)setRegistrationPlate:(NSString *)registrationPlate {
    _registrationPlate = registrationPlate;
    self.registrationPlateLabel.text = [NSString stringWithFormat:@"# Tablilla: %@", registrationPlate];
}

- (void)updateCarDescription {
    if (self.carMake == nil) {
        self.carMake = @"";
    }
    
    if (self.carModel == nil) {
        self.carModel = @"";
    }
    
    if (self.carYear == nil) {
        self.carYear = @"";
    }
    
    self.carDescriptionLabel.text = [NSString stringWithFormat:@"%@ %@ %@", self.carMake, self.carModel, self.carYear];
    [self updateExpansion];
}

@end
