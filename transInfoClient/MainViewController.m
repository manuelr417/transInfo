//
//  MainViewController.m
//  transinfo
//
//  Created by Omar Soto Fortuño on 7/1/14.
//  Copyright (c) 2014 University of Puerto Rico Mayagüez Campus. All rights reserved.
//

#import "MainViewController.h"
#import "restComm.h"

@interface MainViewController ()

@property (weak, nonatomic) IBOutlet UIPickerView *countyListOutlet;
@property NSMutableArray *countyList;

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    NSLog(@"initWithNibName");
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    NSLog(@"View appeared!");
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSLog(@"Load!");
    self.countyList = [[NSMutableArray alloc] initWithObjects:@"Prueba 1",@"Prueba 2",@"Prueba 3", nil];
    //NSLog([self.countyList objectAtIndex:1]);
    self.countyListOutlet.dataSource = self;
    self.countyListOutlet.delegate = self;
    
    restComm *conn = [[restComm alloc] initWithURL:@"http://localhost:9000/counties" withMethod:0];
    [conn setDelegate:self];
    [conn makeCall];
}

- (void)receivedData:(NSMutableArray *)data {
    NSLog(@"Llegó algo..");
    
    //NSLog(@"%f", [data count]);
    
    if (data != nil) {
        [self.countyList removeAllObjects];
        
        for (NSDictionary *elem in data) {
            [self.countyList addObject:elem];
        }
        
        [self.countyListOutlet reloadAllComponents];
    }
    
    //NSLog(@"%@", [data objectAtIndex:0]);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return [self.countyList count];
}


- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [self.countyList objectAtIndex:row];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
