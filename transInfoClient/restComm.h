//
//  restComm.h
//  transinfo
//
//  Created by Omar Soto Fortuño on 7/1/14.
//  Copyright (c) 2014 University of Puerto Rico Mayagüez Campus. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface restComm : NSObject

@property NSURLConnection *currentConnection;
@property NSString *connURL;
@property NSNumber *method;
@property NSMutableData *data;
@property id delegate;

extern const int GET;
extern const int POST;
extern const int PUT;
extern const int DELETE;

- (id)initWithURL:(NSString*)url;
- (id)initWithURL:(NSString*)url withMethod:(int)method;
- (void)makeCall;


@end

@interface NSObject(MyDelegateMethods)
- (void) receivedData:(NSMutableArray*)data;
@end
