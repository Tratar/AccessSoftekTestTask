//
//  RSSFeedMasterViewController.h
//  AccessSoftekTestTask
//
//  Created by Michael Belenchenko on 08/07/2017.
//  Copyright © 2017 We. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RSSPresenter;
@class RSSPresenterFeed;
@class RSSPresenterEntry;

@class RSSFeedRootViewController;

@interface RSSFeedMasterViewController : UIViewController

@property (nonatomic, assign) RSSFeedRootViewController *rootViewController;

#pragma mark Input

- (void)displayRSSFeed:(RSSPresenterFeed *)feed;

@end
