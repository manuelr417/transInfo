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

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
