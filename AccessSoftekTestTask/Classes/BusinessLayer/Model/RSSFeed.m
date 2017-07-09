//
//  RSSFeed.m
//  AccessSoftekTestTask
//
//  Created by Michael Belenchenko on 08/07/2017.
//  Copyright © 2017 We. All rights reserved.
//

#import "RSSFeed.h"

@interface RSSFeed()

@property (nonatomic, strong, readwrite) NSMutableArray <RSSEntry *> *entries;

@end

@implementation RSSFeed

- (instancetype)initWithEntriesList:(NSArray *)entries {
    self = [super init];
    
    if (self) {
        self.entries = [NSMutableArray arrayWithArray:entries];
    }
    
    return self;
}

- (void)dealloc {
    self.entries = nil;
    
    [super dealloc];
}

@end
