//
//  RSSFeedRouter.m
//  AccessSoftekTestTask
//
//  Created by Michael Belenchenko on 08/07/2017.
//  Copyright © 2017 We. All rights reserved.
//

#import "RSSFeedRouter.h"
#import "RSSFeedRootViewController.h"
#import "RSSFeedMasterViewController.h"
#import "RSSFeedDetailViewController.h"
#import "RSSPresenter.h"
#import "RSSPresenterState.h"

@implementation RSSFeedRouter

- (void)presentRSSFeed {
    RSSFeedRootViewController *root = [[RSSFeedRootViewController new] autorelease];
    
    RSSFeedMasterViewController *master = [[RSSFeedMasterViewController new] autorelease];
    RSSFeedDetailViewController *detail = [[RSSFeedDetailViewController new] autorelease];
    
    UINavigationController *rootNav = [[[UINavigationController alloc] initWithRootViewController:master] autorelease];
    UINavigationController *detailNav = [[[UINavigationController alloc] initWithRootViewController:detail] autorelease];
    
    root.viewControllers = [NSArray arrayWithObjects:rootNav, detailNav, nil];
    root.master = master;
    root.detail = detail;
    root.delegate = root;

    master.rootViewController = root;
    
    RSSPresenter *presenter = [[RSSPresenter new] autorelease];
    presenter.interactor = self.interactor;
    presenter.rootViewController = root;
    presenter.state = [[RSSPresenterState new] autorelease];
    
    root.presenter = presenter;
    
    [self.window setRootViewController:root];
    [self.window makeKeyAndVisible];
}

- (void)dealloc {
    self.window = nil;
    self.interactor = nil;
    
    [super dealloc];
}

@end
