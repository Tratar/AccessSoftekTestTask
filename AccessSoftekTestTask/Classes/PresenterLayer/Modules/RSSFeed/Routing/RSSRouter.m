//
//  RSSRouter.m
//  AccessSoftekTestTask
//
//  Created by Michael Belenchenko on 08/07/2017.
//  Copyright © 2017 We. All rights reserved.
//

#import "RSSRouter.h"
#import "RSSRootViewController.h"
#import "RSSMasterViewController.h"
#import "RSSDetailViewController.h"
#import "RSSPresenter.h"
#import "RSSPresenterState.h"

@implementation RSSRouter

- (void)presentRSSFeed {
    RSSRootViewController *root = [[RSSRootViewController new] autorelease];
    
    RSSMasterViewController *master = [[RSSMasterViewController new] autorelease];
    RSSDetailViewController *detail = [[RSSDetailViewController new] autorelease];
    
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
