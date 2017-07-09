//
//  RSSPresenter.m
//  AccessSoftekTestTask
//
//  Created by Michael Belenchenko on 08/07/2017.
//  Copyright © 2017 We. All rights reserved.
//

#import "RSSPresenter.h"
#import "RSSPresenterFeed.h"
#import "RSSPresenterEntry.h"
#import "RSSPresenterState.h"
#import "RSSInteractor.h"
#import "RSSRootViewController.h"

@implementation RSSPresenter

- (void)requestReloadFeed {
    if (self.state.currentRequest) {
        [self.state.currentRequest cancel];
    }
    
    // It's not necessary to handle wrap self into __block variable.
    self.state.currentRequest = [self.interactor getFeed:^(RSSPresenterFeed *feed, NSError *error) {
        if (error == nil) {
            self.state.feed = feed;
            [self.rootViewController displayRSSFeed:feed];
        }
        self.state.currentRequest = nil;
    }];
}

- (void)requestSelect:(RSSPresenterEntry *)entry {
    if ([self.state.feed.entries containsObject:entry]) {
        self.state.currentEntry = entry;
        [self.rootViewController displayRSSEntry:entry];
    }
}

- (void)dealloc {
    self.state = nil;
    self.interactor = nil;
    self.rootViewController = nil;

    [super dealloc];
}

@end
