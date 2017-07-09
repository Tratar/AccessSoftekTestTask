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
@class RSSInteractor;
@class RSSRootViewController;

@interface RSSPresenter : NSObject

@property (nonatomic, strong) RSSPresenterState *state;
@property (nonatomic, strong) RSSInteractor *interactor;
@property (nonatomic, strong) RSSRootViewController *rootViewController;

- (void)requestReloadFeed;
- (void)requestSelect:(RSSPresenterEntry *)entry;

@end
