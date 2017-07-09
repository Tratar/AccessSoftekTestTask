//
//  FeedAPIService.h
//  AccessSoftekTestTask
//
//  Created by Michael Belenchenko on 08/07/2017.
//  Copyright © 2017 We. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RSSFeed;
@class Requester;
@class FeedParser;

@interface FeedAPIService : NSObject

@property (nonatomic, strong) Requester *requester;
@property (nonatomic, strong) FeedParser *parser;

- (NSURLSessionTask *)getAppleFeed:(void(^)(RSSFeed *, NSError *))callback;

@end
