//
//  RSSObjectsMapper.m
//  AccessSoftekTestTask
//
//  Created by Michael Belenchenko on 08/07/2017.
//  Copyright © 2017 We. All rights reserved.
//

#import "RSSObjectsMapper.h"

#import "RSSPresenterEntry.h"
#import "RSSPresenterFeed.h"
#import "RSSEntry.h"
#import "RSSFeed.h"

@implementation RSSObjectsMapper

- (RSSPresenterEntry *)mapEntry:(RSSEntry *)entry {
    return [[[RSSPresenterEntry alloc] initWithTitle:entry.title description:entry.descr targetURL:entry.targetURL] autorelease];
}

- (RSSPresenterFeed *)mapFeed:(RSSFeed *)feed {
    NSMutableArray <RSSPresenterEntry*> *entries = [NSMutableArray <RSSPresenterEntry*> array];
    
    [feed.entries enumerateObjectsUsingBlock:^(RSSEntry * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [entries addObject:[self mapEntry:obj]];
    }];
    
    return [[[RSSPresenterFeed alloc] initWithEntriesList:entries] autorelease];
}

@end
