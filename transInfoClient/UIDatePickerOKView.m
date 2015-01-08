//
//  UIDatePickerOKView.m
//  transinfo
//
//  Created by Omar Soto Fortuño on 9/10/14.
//  Copyright (c) 2014 University of Puerto Rico Mayagüez Campus. All rights reserved.
//

#import "UIDatePickerOKView.h"

@implementation UIDatePickerOKView

@synthesize datePicker;
@synthesize parent;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (IBAction)okButtonAction:(id)sender {
    [self.parent resignFirstResponder];
}
- (IBAction)datePickerValueChanged:(id)sender {
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect
 {
 // Drawing code
 }
 */

@end
