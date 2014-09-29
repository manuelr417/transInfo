//
//  CollectionManager.m
//  transinfo
//
//  Created by Omar Soto Fortuño on 9/25/14.
//  Copyright (c) 2014 University of Puerto Rico Mayagüez Campus. All rights reserved.
//

#import "CollectionManager.h"
#import "Utilities.h"
#import "restComm.h"
#import "Config.h"

@implementation CollectionManager

- (void)getCollection:(NSString*)collection {
    self.loadingCollection = collection;
    
    if ([self collectionIsCached:collection]) {
        //NSLog(@"Loading from Cache");
        //[self loadFromWebService:collection];
        [self loadFromCache:collection];
    } else {
        //NSLog(@"Loading from Collection");
        [self loadFromWebService:collection];
    }
}

- (void)receivedData:(NSDictionary *)data {
    NSDictionary *errors = @{@1: @"login.error.internal", @2: @"login.empty-required-field", @3: @"login.error.wrong-information"};
    
    //NSLog(@"receivedData");
    
    if ([data[@"success"] boolValue] == YES) {
        
        NSMutableArray *elems = [[NSMutableArray alloc] init];
        
        [elems addObject:[[NSDate date] dateByAddingTimeInterval:60]];
        [elems addObjectsFromArray:data[@"payload"]];
        
        // Save to Cache
        
        NSString *filePath = [self fileNameForCollection:self.loadingCollection];
        
        [elems writeToFile:filePath atomically:YES];
        
        //NSLog(@"%@", filePath);
        [self collectionLoaded:elems];
    } else {
        [Utilities displayAlertWithMessage:NSLocalizedString([errors objectForKey:data[@"error_code"]], nil) withTitle:NSLocalizedString(@"login.error.title", nil)];
    }
}

- (void)receivedError:(NSError *)error {
    // Do something with error...
}

- (BOOL)collectionIsCached:(NSString*)collection {
    // Need to add expiration...
    return [[NSFileManager defaultManager] fileExistsAtPath:[self fileNameForCollection:collection]];
}

- (void)loadFromCache:(NSString*)collection {
    NSString *filePath = [self fileNameForCollection:collection];
    //NSLog(@"%@", filePath);
    
   /* NSString* content = [NSString stringWithContentsOfFile:filePath
                                                  encoding:NSUTF8StringEncoding
                                                     error:NULL];
    NSLog(@"Prueba... %@",[NSDictionary dictionaryWithContentsOfFile:filePath]);
    */
    //[NSDictionary dictionaryF]
    
    NSMutableArray *elems = [NSMutableArray arrayWithContentsOfFile:filePath];
    NSDate *expirationDate = elems[0];
    
    //NSLog(@"Actual: %@ Expiration: %@",[NSDate date], expirationDate);
    
    if (expirationDate > [NSDate date]) {
        //NSLog(@"Cache expired!");
        [self loadFromWebService:collection];
    } else {
        [self collectionLoaded:elems];
    }
}

- (void)loadFromWebService:(NSString*)collection {
    restComm *conn = [[restComm alloc] initWithURL:[NSString stringWithFormat:@"%@%@", urlAPI, collection] withMethod:GET];
    [conn setDelegate:self];
    
    [conn makeCall];
}

- (void)collectionLoaded:(NSMutableArray*)elems {
    self.loadedCollection = elems;
    
    // Debug
    //NSLog(@"Collection...");
    //NSLog(@"%@", elems);
    
    /*for (NSDictionary *elem in elems) {
        NSLog(@"%@", elem[@"DescriptionES"]);
    }*/
    
    // First object is the expiration date.
    /*for (int i = 1; i < [elems count]; i++) {
        NSDictionary *elem = [elems objectAtIndex:i];
         NSLog(@"%@", elem[@"DescriptionES"]);
    }*/
    
    // send to delegate.
    [self.loadedCollection removeObjectAtIndex:0];
    [self.delegate receivedCollection:self.loadedCollection withName:self.loadingCollection];
}

- (NSString*)fileNameForCollection:(NSString*)collection {
    NSString *fileName = [NSString stringWithFormat:@"%@.COL", [collection uppercaseString]];
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    return [documentsDirectory stringByAppendingPathComponent:fileName];
}

@end
