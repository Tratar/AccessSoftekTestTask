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

@class RSSMasterViewController;
@class RSSDetailViewController;

@interface RSSRootViewController : UISplitViewController<UISplitViewControllerDelegate>

@property (nonatomic, strong) RSSMasterViewController *master;
@property (nonatomic, strong) RSSDetailViewController *detail;

@property (nonatomic, strong) RSSPresenter *presenter;

#pragma mark Input

- (void)displayRSSFeed:(RSSPresenterFeed *)feed;
- (void)displayRSSEntry:(RSSPresenterEntry *)entry;

#pragma mark Output

- (void)requestReloadFeed;
- (void)requestSelect:(RSSPresenterEntry *)entry;

@end
