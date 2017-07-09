//
//  RSSFeedInteractor.m
//  AccessSoftekTestTask
//
//  Created by Michael Belenchenko on 08/07/2017.
//  Copyright © 2017 We. All rights reserved.
//

#import "RSSFeedInteractor.h"
#import "FeedAPIService.h"
#import "RSSObjectsMapper.h"

@implementation RSSFeedInteractor

- (NSURLSessionTask *)getFeed:(void(^)(RSSPresenterFeed *, NSError *))callback {
    return [self.feedAPIService getAppleFeed:^(RSSFeed *feed, NSError *error) {
        if (feed != nil && error == nil) {
            callback([self.objectsMapper mapFeed:feed], error);
        } else {
            callback(nil, error);
        }
    }];
}

- (void)dealloc {
    self.feedAPIService = nil;
    self.objectsMapper = nil;
    
    [super dealloc];
}

@end
