//
//  RSSMasterViewController.h
//  AccessSoftekTestTask
//
//  Created by Michael Belenchenko on 08/07/2017.
//  Copyright © 2017 We. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RSSPresenterFeed;
@class RSSRootViewController;

@interface RSSMasterViewController : UIViewController

@property (nonatomic, assign) RSSRootViewController *rootViewController;

#pragma mark Input

- (void)displayRSSFeed:(RSSPresenterFeed *)feed;

@end
