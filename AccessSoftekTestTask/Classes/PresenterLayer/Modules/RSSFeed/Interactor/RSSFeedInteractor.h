//
//  RSSFeedInteractor.h
//  AccessSoftekTestTask
//
//  Created by Michael Belenchenko on 08/07/2017.
//  Copyright © 2017 We. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RSSPresenterFeed;
@class FeedAPIService;
@class RSSObjectsMapper;

@interface RSSFeedInteractor : NSObject

@property (nonatomic, strong) FeedAPIService *feedAPIService;
@property (nonatomic, strong) RSSObjectsMapper *objectsMapper;

- (NSURLSessionTask *)getFeed:(void(^)(RSSPresenterFeed *, NSError *))callback;

@end
