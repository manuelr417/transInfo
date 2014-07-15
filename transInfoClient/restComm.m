//
//  restComm.m
//  transinfo
//
//  Created by Omar Soto Fortuño on 7/1/14.
//  Copyright (c) 2014 University of Puerto Rico Mayagüez Campus. All rights reserved.
//

#import "restComm.h"

@implementation restComm

const int GET = 0;
const int POST = 1;
const int PUT = 2;
const int DELETE = 3;

@synthesize delegate;

- (id)init {
    self = super.init;
    
    if (self) {
        // Init defaults...
        self.connURL = @"http://localhost:9000/";
        self.method = [NSNumber numberWithInt:GET];
    }
    
    return self;
}

- (id)initWithURL:(NSString*)url {
    self = super.init;
    
    if (self) {
        self.connURL = url;
    }
    
    return self;
}

- (id)initWithURL:(NSString*)url withMethod:(int)method {
    self = super.init;
    
    if (self) {
        self.connURL = url;
        self.method = [NSNumber numberWithInt:method];
    }
    
    return self;
}

//- (void)makeGet:

- (void)makeCall {
    //NSString *restLink = [NSString stringWithFormat:"%@/%@", self.connURL, ]
    
    NSURL *restURL = [NSURL URLWithString:self.connURL];
    NSURLRequest *restRequest = [NSURLRequest requestWithURL:restURL];
    
    if (self.currentConnection) {
        [self.currentConnection cancel];
        self.currentConnection = nil;
        self.data = nil;
    }
    
    self.currentConnection = [[NSURLConnection alloc] initWithRequest:restRequest delegate:self];
    self.data = [NSMutableData data];
}

- (void)connection:(NSURLConnection*)connection didReceiveData:(NSData *)data {
    [self.data appendData:data];
}

- (void)connection:(NSURLConnection*)connection didFailWithError:(NSError *)error {
    NSLog(@"REST ERROR: %@", error);
    
    self.currentConnection = nil;
    /*[self.activityIndicator stopAnimating];
    
    UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Connection error!"
                                                      message:@"There was a problem connecting with the server."
                                                     delegate:nil
                                            cancelButtonTitle:@"OK"
                                            otherButtonTitles:nil];
    
    [message show];*/
}

- (void)connectionDidFinishLoading:(NSURLConnection*)connection {
    self.currentConnection = nil;
    
    NSError *error = nil;
    NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData:self.data options:kNilOptions error:&error];
    
    if (error != nil) {
        NSLog(@"Problem parsing JSON! %@", error);
        //[self.activityIndicator stopAnimating];
    } else {
        //[self.itemList removeAllObjects];
        NSMutableArray *elems = [[NSMutableArray alloc] init];
        
        for(NSDictionary *elem in jsonArray) {
            [elems addObject:elem];
            
            NSLog(@"Item %@", elem);
            
            /*Item *item = [[Item alloc] init];
            item.id = [[elem objectForKey:@"id"] intValue];
            item.description = [elem valueForKey:@"description"];
            item.isDone = ([[elem objectForKey:@"isDone"] intValue] != 0);*/
            //NSLog(@"desc = %@, isDone = %d, isDoneAPI = %@", item.description, item.isDone, [elem valueForKey:@"isDone"]);
            
            //[self.itemList addObject:item];
        }
        
        if (delegate) {
            NSLog(@"Count: %d", [elems count]);
            [delegate receivedData:elems];
        }
        
        //[self.activityIndicator stopAnimating];
        //[self.tableView reloadData];
    }
}

@end
