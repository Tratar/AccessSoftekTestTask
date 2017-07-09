//
//  RSSInteractor.m
//  AccessSoftekTestTask
//
//  Created by Michael Belenchenko on 08/07/2017.
//  Copyright © 2017 We. All rights reserved.
//

#import "RSSInteractor.h"
#import "RSSService.h"
#import "RSSObjectsMapper.h"
#import "RSSPresenterFeed.h"

@implementation RSSInteractor

- (NSURLSessionTask *)getFeed:(void(^)(RSSPresenterFeed *, NSError *))callback {
    return [self.rssService getAppleFeed:^(RSSFeed *feed, NSError *error) {
        if (feed != nil && error == nil) {
            callback([self.objectsMapper mapFeed:feed], error);
        } else {
            callback(nil, error);
        }
    }];
}

- (void)dealloc {
    self.rssService = nil;
    self.objectsMapper = nil;
    
    [super dealloc];
}

@end
