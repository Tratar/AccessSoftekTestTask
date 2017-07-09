//
//  RSSPresenter.h
//  AccessSoftekTestTask
//
//  Created by Michael Belenchenko on 08/07/2017.
//  Copyright © 2017 We. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RSSPresenterState;
@class RSSPresenterEntry;
@class RSSFeedInteractor;
@class RSSFeedRootViewController;

@interface RSSPresenter : NSObject

@property (nonatomic, strong) RSSPresenterState *state;
@property (nonatomic, strong) RSSFeedInteractor *interactor;
@property (nonatomic, strong) RSSFeedRootViewController *rootViewController;

- (void)requestReloadFeed;
- (void)requestSelect:(RSSPresenterEntry *)entry;

@end
