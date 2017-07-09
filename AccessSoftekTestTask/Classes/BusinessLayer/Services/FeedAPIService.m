//
//  FeedAPIService.m
//  AccessSoftekTestTask
//
//  Created by Michael Belenchenko on 08/07/2017.
//  Copyright © 2017 We. All rights reserved.
//

#import "FeedAPIService.h"
#import "Requester.h"
#import "FeedParser.h"

#import "RSSFeed.h"
#import "RSSEntry.h"

NSString *const AppleRSSFeedPath = @"http://images.apple.com/main/rss/hotnews/hotnews.rss";
NSString *const AppleRSSFeedMethod = @"GET";

@implementation FeedAPIService

- (NSURLSessionTask *)getAppleFeed:(void(^)(RSSFeed *, NSError *))callback {
    // It's not necessary to handle wrap self into __block variable.
    return [self.requester makeRequest:AppleRSSFeedPath method:AppleRSSFeedMethod headers:nil body:nil completion:^(NSData *data, NSError *error) {
        if (data && !error) {
            NSError *error;
            RSSFeed *feed = [self.parser parseData:data error:&error];
            if (error) {
                callback(nil, error);
            } else {
                callback(feed, nil);
            }
            
        } else {
            callback(nil, error);
        }
    }];
}

- (void)dealloc {
    self.parser = nil;
    self.requester = nil;
    
    [super dealloc];
}

@end
