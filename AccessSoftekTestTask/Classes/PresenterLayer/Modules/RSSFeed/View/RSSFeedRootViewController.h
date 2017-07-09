//
//  RSSFeedRootViewController.h
//  AccessSoftekTestTask
//
//  Created by Michael Belenchenko on 08/07/2017.
//  Copyright © 2017 We. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RSSPresenter;
@class RSSPresenterFeed;
@class RSSPresenterEntry;

@class RSSFeedMasterViewController;
@class RSSFeedDetailViewController;

@interface RSSFeedRootViewController : UISplitViewController<UISplitViewControllerDelegate>

@property (nonatomic, strong) RSSFeedMasterViewController *master;
@property (nonatomic, strong) RSSFeedDetailViewController *detail;

@property (nonatomic, strong) RSSPresenter *presenter;

#pragma mark Input

- (void)displayRSSFeed:(RSSPresenterFeed *)feed;
- (void)displayRSSEntry:(RSSPresenterEntry *)entry;

#pragma mark Output

- (void)requestReloadFeed;
- (void)requestSelect:(RSSPresenterEntry *)entry;

@end
