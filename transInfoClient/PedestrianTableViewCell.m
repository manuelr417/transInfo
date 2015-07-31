//
//  PedestrianTableViewCell.m
//  transinfo
//
//  Created by Omar Soto Fortuño on 12/8/14.
//  Copyright (c) 2014 University of Puerto Rico Mayagüez Campus. All rights reserved.
//

#import "PedestrianTableViewCell.h"

@implementation PedestrianTableViewCell

- (void)awakeFromNib {
    // Initialization code
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    
    self.expandImageView = [[UIImageView alloc]initWithFrame:CGRectMake(screenWidth - 35, 7, 30, 30)];
    self.expandImageView.image = [UIImage imageNamed:@"Arrow Right"];
    [self addSubview:self.expandImageView];
    
    self.pedestrianNameLabel.text = NSLocalizedString(@"pedestrians", nil);
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

- (void)setPedestrianName:(NSString *)pedestrianName {
    _pedestrianName = pedestrianName;
    self.pedestrianNameLabel.text = pedestrianName;
    self.pedestrianNameLabel.font = [UIFont systemFontOfSize:self.pedestrianNameLabel.font.pointSize];
    //self.pedestrianNameLabel.font.systemFontSize = self.pedestrianNameLabel.font.pointSize;
    self.pedestrianImageView.hidden = YES;
    [self.expandImageView removeFromSuperview];
}

/* 1 = Pedestrian
 * 2 = Cyclist
 * 3 = Witness
 * 4 = Other
 */
- (void)setViewType:(NSInteger)viewType {
    if (viewType == 1) {
        self.pedestrianNameLabel.text = NSLocalizedString(@"pedestrians", nil);
        [self.pedestrianImageView setImage:[UIImage imageNamed:@"walking-50"]];
    } else if (viewType == 2) {
        self.pedestrianNameLabel.text = NSLocalizedString(@"cyclists", nil);
        [self.pedestrianImageView setImage:[UIImage imageNamed:@"Biking"]];
    } else if (viewType == 3) {
        self.pedestrianNameLabel.text = NSLocalizedString(@"witnesses", nil);
        [self.pedestrianImageView setImage:[UIImage imageNamed:@"Witness"]];
    } else if (viewType == 4) {
        self.pedestrianNameLabel.text = NSLocalizedString(@"other.persons", nil);
        [self.pedestrianImageView setImage:[UIImage imageNamed:@"Question Mark"]];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
