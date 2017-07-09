//
//  RSSPrsenterState.h
//  AccessSoftekTestTask
//
//  Created by Michael Belenchenko on 08/07/2017.
//  Copyright © 2017 We. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RSSPresenterFeed;
@class RSSPresenterEntry;

@interface RSSPresenterState : NSObject

@property (nonatomic, strong) RSSPresenterFeed *feed;
@property (nonatomic, strong) RSSPresenterEntry *currentEntry;
@property (nonatomic, strong) NSURLSessionTask *currentRequest;

@end
