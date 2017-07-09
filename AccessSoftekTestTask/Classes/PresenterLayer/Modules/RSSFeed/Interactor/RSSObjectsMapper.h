//
//  RSSObjectsMapper.h
//  AccessSoftekTestTask
//
//  Created by Michael Belenchenko on 08/07/2017.
//  Copyright © 2017 We. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RSSPresenterEntry;
@class RSSPresenterFeed;
@class RSSEntry;
@class RSSFeed;

@interface RSSObjectsMapper : NSObject

- (RSSPresenterEntry *)mapEntry:(RSSEntry *)entry;
- (RSSPresenterFeed *)mapFeed:(RSSFeed *)feed;

@end
