//
//  RSSInteractor.h
//  AccessSoftekTestTask
//
//  Created by Michael Belenchenko on 08/07/2017.
//  Copyright © 2017 We. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RSSPresenterFeed;
@class RSSService;
@class RSSObjectsMapper;

@interface RSSInteractor : NSObject

@property (nonatomic, strong) RSSService *rssService;
@property (nonatomic, strong) RSSObjectsMapper *objectsMapper;

- (NSURLSessionTask *)getFeed:(void(^)(RSSPresenterFeed *, NSError *))callback;

@end
