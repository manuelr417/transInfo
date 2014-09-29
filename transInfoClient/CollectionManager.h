//
//  CollectionManager.h
//  transinfo
//
//  Created by Omar Soto Fortuño on 9/25/14.
//  Copyright (c) 2014 University of Puerto Rico Mayagüez Campus. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CollectionManager : NSObject

@property NSString *loadingCollection;
@property NSMutableArray *loadedCollection;
@property id delegate;

- (void)getCollection:(NSString*)collection;

@end

@interface NSObject(collectionManagerDelegateMethods)
- (void) receivedCollection:(NSArray*)collection withName:(NSString*)collectionName;
@end
