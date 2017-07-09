//
//  RSSFeedRootViewController.m
//  AccessSoftekTestTask
//
//  Created by Michael Belenchenko on 08/07/2017.
//  Copyright © 2017 We. All rights reserved.
//

#import "RSSFeedRootViewController.h"
#import "RSSFeedMasterViewController.h"
#import "RSSFeedDetailViewController.h"
#import "RSSPresenter.h"

@implementation RSSFeedRootViewController

- (void)viewDidLoad {
    self.preferredDisplayMode = UISplitViewControllerDisplayModeAllVisible;
    [self.presenter requestReloadFeed];
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark Input

- (void)displayRSSFeed:(RSSPresenterFeed *)feed {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.master displayRSSFeed:feed];
    });
}

- (void)displayRSSEntry:(RSSPresenterEntry *)entry {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.detail displayRSSEntry:entry];
        [self showDetailViewController:self.detail sender:nil];
    });
}

#pragma mark Output

- (void)requestReloadFeed {
    [self.presenter requestReloadFeed];
}

- (void)requestSelect:(RSSPresenterEntry *)entry {
    [self.presenter requestSelect:entry];
}

#pragma mark Output UISplitViewControllerDelegate

- (BOOL)splitViewController:(UISplitViewController *)splitViewController collapseSecondaryViewController:(UIViewController *)secondaryViewController ontoPrimaryViewController:(UIViewController *)primaryViewController {
    if ([secondaryViewController isKindOfClass:[UINavigationController class]] && [[(UINavigationController *)secondaryViewController topViewController] isKindOfClass:[RSSFeedDetailViewController class]] && ([(RSSFeedDetailViewController *)[(UINavigationController *)secondaryViewController topViewController] entry] == nil)) {
        // Return YES to indicate that we have handled the collapse by doing nothing; the secondary controller will be discarded.
        return YES;
    } else {
        return NO;
    }
}

- (void)dealloc {
    self.master = nil;
    self.detail = nil;
    self.presenter = nil;
    
    [super dealloc];
}

@end
