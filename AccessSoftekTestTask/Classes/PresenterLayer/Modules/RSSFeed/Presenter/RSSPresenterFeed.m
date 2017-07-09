//
//  RSSPresenterFeed.m
//  AccessSoftekTestTask
//
//  Created by Michael Belenchenko on 08/07/2017.
//  Copyright © 2017 We. All rights reserved.
//

#import "RSSPresenterFeed.h"

@interface RSSPresenterFeed()

@property (nonatomic, readwrite, strong) NSArray <RSSPresenterEntry *> *entries;

@end

@implementation RSSPresenterFeed

- (instancetype)initWithEntriesList:(NSArray <RSSPresenterEntry *> *)entries {
    self = [super init];
    
    if (self != nil) {
        self.entries = entries;
    }
    
    return self;
}

- (void)dealloc {
    self.entries = nil;
    
    [super dealloc];
}

@end
