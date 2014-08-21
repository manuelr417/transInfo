//
//  restComm.h
//  transinfo
//
//  Created by Omar Soto Fortuño on 7/1/14.
//  Copyright (c) 2014 University of Puerto Rico Mayagüez Campus. All rights reserved.
//

#import <Foundation/Foundation.h>

extern const NSInteger GET;
extern const NSInteger POST;
extern const NSInteger PUT;
extern const NSInteger DELETE;

@interface restComm : NSObject

@property NSURLConnection *currentConnection;
@property NSString *connURL;
@property NSString *method;
@property NSMutableData *data;
@property id delegate;
@property NSMutableDictionary *dataToRequest;
@property NSDictionary *methodInString;

- (id)initWithURL:(NSString*)url;
- (id)initWithURL:(NSString*)url withMethod:(NSInteger)method;
- (void)makeCall;

@end

@interface NSObject(MyDelegateMethods)
- (void) receivedData:(NSDictionary*)data;
- (void) receivedError:(NSError*)error;
@end
