//
//  restComm.m
//  transinfo
//
//  Created by Omar Soto Fortuño on 7/1/14.
//  Copyright (c) 2014 University of Puerto Rico Mayagüez Campus. All rights reserved.
//

#import "restComm.h"

const NSInteger GET = 0;
const NSInteger POST = 1;
const NSInteger PUT = 2;
const NSInteger DELETE = 3;

@implementation restComm

@synthesize delegate;
@synthesize dataToRequest;
@synthesize connectionTag;

- (id)init {
    self = super.init;
    
    if (self) {
        // Init defaults...
        self.connURL = @"http://localhost:9000/";
        self.method = @"GET";
        self.methodInString = @{[NSNumber numberWithInteger:GET] : @"GET", [NSNumber numberWithInteger:POST] : @"POST", [NSNumber numberWithInteger:PUT] : @"PUT", [NSNumber numberWithInteger:DELETE] : @"DELETE"};
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

- (id)initWithURL:(NSString*)url withMethod:(NSInteger)method {
    self = super.init;
    
    if (self) {
        self.connURL = url;
        
        switch (method) {
            case GET:
                self.method = @"GET";
                break;
            case POST:
                self.method = @"POST";
                break;
            case PUT:
                self.method = @"PUT";
                break;
            case DELETE:
                self.method = @"DELETE";
                break;
            default:
                break;
        }
    }
    
    return self;
}

- (void)makeCall {
    NSURL *restURL = [NSURL URLWithString:self.connURL];
    NSMutableURLRequest *restRequest = [NSMutableURLRequest requestWithURL:restURL];
    
    if (self.dataToRequest != nil) {
        [restRequest setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
        restRequest.HTTPBody = [[self joinRequestWithDictionary:self.dataToRequest] dataUsingEncoding:NSUTF8StringEncoding];
    }
    
    restRequest.HTTPMethod = self.method;
    
    if (self.currentConnection) {
        [self.currentConnection cancel];
        self.currentConnection = nil;
        self.data = nil;
    }
    
    self.currentConnection = [[NSURLConnection alloc] initWithRequest:restRequest delegate:self];
    self.data = [NSMutableData data];
}

- (NSMutableString*)joinRequestWithDictionary:(NSMutableDictionary*)dictionary {
    NSMutableString *request = [[NSMutableString alloc] init];
    
    for (NSString* key in dictionary) {
        //NSLog(@"%@", key);
        NSString *value = [dictionary objectForKey:key];
        
        if ([request length] > 0)
            [request appendString:@"&"];
        
        [request appendString:[NSString stringWithFormat:@"%@", key]];
        if ([value isKindOfClass:[NSString class]] && [value isEqualToString:@""]) {
            [request appendString:@"="];
        } else if ([value isKindOfClass:[NSNumber class]]) {
            //NSLog(@"Is Number!");
            [request appendFormat:@"=%@", value];
        } else if ([value isKindOfClass:[NSDate class]]) {
            NSDateFormatter *gmtDateFormatter = [[NSDateFormatter alloc] init];
            gmtDateFormatter.timeZone = [NSTimeZone timeZoneForSecondsFromGMT:0];
            gmtDateFormatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
            
            NSString *dateString = [gmtDateFormatter stringFromDate:(NSDate*)value];
            
            [request appendFormat:@"=%@", dateString];
        } else if ([value isKindOfClass:[NSArray class]] || [value isKindOfClass:[NSMutableArray class]]) {
            NSString *arr = [((NSArray*)value) componentsJoinedByString:@","];
            [request appendFormat:@"=%@", arr];
        } else {
            //NSLog(@"Is String!");
            [request appendFormat:@"=%@", [value stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
        }
    }
    
    return request;
}

- (void)connection:(NSURLConnection*)connection didReceiveData:(NSData *)data {
    [self.data appendData:data];
}

- (void)connection:(NSURLConnection*)connection didFailWithError:(NSError *)error {
    NSLog(@"REST ERROR: %@", error);
    [delegate receivedError:error];
    
    self.currentConnection = nil;
}

- (void)connectionDidFinishLoading:(NSURLConnection*)connection {
    self.currentConnection = nil;
    
    NSError *error = nil;
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:self.data options:kNilOptions error:&error];
    
    if (error != nil) {
        NSLog(@"Problem parsing JSON! %@", error);
        [delegate receivedError:error];
    } else {
        if (delegate) {
            [delegate receivedData:dict];
        }
    }
}

@end
