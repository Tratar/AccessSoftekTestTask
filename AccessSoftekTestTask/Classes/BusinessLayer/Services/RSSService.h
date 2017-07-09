//
//  RSSService.h
//  AccessSoftekTestTask
//
//  Created by Michael Belenchenko on 08/07/2017.
//  Copyright © 2017 We. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Requester;
@class RSSFeed;
@class RSSParser;

@interface RSSService : NSObject

@property (nonatomic, strong) Requester *requester;
@property (nonatomic, strong) RSSParser *parser;

- (NSURLSessionTask *)getAppleFeed:(void(^)(RSSFeed *, NSError *))callback;

@end
