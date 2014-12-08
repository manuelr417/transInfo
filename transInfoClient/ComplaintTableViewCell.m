//
//  ComplaintTableViewCell.m
//  transinfo
//
//  Created by Omar Soto Fortuño on 8/29/14.
//  Copyright (c) 2014 University of Puerto Rico Mayagüez Campus. All rights reserved.
//

#import "ComplaintTableViewCell.h"

@interface CircleView : UIView

@end

@implementation ComplaintTableViewCell

@synthesize complaintNumberLabel;
@synthesize complaintTypeLabel;
@synthesize mostContributingPersonLabel;
@synthesize placeLabel;
@synthesize dateLabel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setComplaintType:(NSNumber *)complaintType {
    //self.complaintType = complaintType;
    
    CGRect positionFrame = CGRectMake(complaintTypeLabel.frame.origin.x + complaintTypeLabel.frame.size.width - 17,complaintNumberLabel.frame.origin.y,15,15);
    CircleView *circleView = [[CircleView alloc] initWithFrame:positionFrame];
    [circleView setBackgroundColor:[UIColor clearColor]];
    
    [self.contentView addSubview:circleView];
    //[circleView release];
    
    
    
}

@end

@implementation CircleView
    
    - (void)drawRect:(CGRect)rect {
        CGContextRef context= UIGraphicsGetCurrentContext();
        
        CGContextSetFillColorWithColor(context, [UIColor redColor].CGColor);
        CGContextSetAlpha(context, 0.5); // 0.5
        CGContextFillEllipseInRect(context, CGRectMake(0,0,self.frame.size.width,self.frame.size.height));
        
        CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
       // CGContextStrokeEllipseInRect(context, CGRectMake(0,0,self.frame.size.width,self.frame.size.height));
        CGContextStrokeEllipseInRect(context, CGRectMake(1, 1, self.frame.size.width - 2, self.frame.size.height - 2));
        
    }

@end