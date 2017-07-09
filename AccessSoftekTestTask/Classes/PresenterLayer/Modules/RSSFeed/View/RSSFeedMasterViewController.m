//
//  RSSFeedMasterViewController.m
//  AccessSoftekTestTask
//
//  Created by Michael Belenchenko on 08/07/2017.
//  Copyright © 2017 We. All rights reserved.
//

#import "RSSFeedMasterViewController.h"
#import "RSSFeedRootViewController.h"
#import "RSSPresenterFeed.h"
#import "RSSPresenterEntry.h"

NSString *const rssListCellIdentifier = @"rssListCellIdentifier";

@interface RSSFeedMasterViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) RSSPresenterFeed *feed;

@end

@implementation RSSFeedMasterViewController

- (void)viewDidLoad {
    self.tableView = [[UITableView new] autorelease];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.translatesAutoresizingMaskIntoConstraints = NO;
    self.tableView.clipsToBounds = YES;
    
    [self.view addSubview:self.tableView];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[tableView]|"
                                                                 options:kNilOptions
                                                                 metrics:nil
                                                                   views:@{@"tableView":self.tableView}]];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[tableView]|"
                                                                      options:kNilOptions
                                                                      metrics:nil
                                                                        views:@{@"tableView":self.tableView}]];
    
    UIBarButtonItem *barButton = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(refresh:)] autorelease];
    self.navigationItem.rightBarButtonItem = barButton;

    [super viewDidLoad];
}

- (void)refresh:(id)sender {
    [self.rootViewController requestReloadFeed];    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)displayRSSFeed:(RSSPresenterFeed *)feed {
    self.feed = feed;
    [self.tableView reloadData];
}

#pragma mark UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *) tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *) tableView numberOfRowsInSection:(NSInteger) section {
    return [self.feed.entries count];
}

- (UITableViewCell *)tableView:(UITableView *) tableView cellForRowAtIndexPath:(NSIndexPath *) indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:rssListCellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:rssListCellIdentifier] autorelease];
    }
    
    RSSPresenterEntry *entry = self.feed.entries[indexPath.row];
    cell.textLabel.text = entry.title;
    cell.textLabel.font = [cell.textLabel.font fontWithSize:10];
    return cell;
}

#pragma mark UITableViewDelegate

- (void)tableView:(UITableView *) tableView didSelectRowAtIndexPath:(NSIndexPath *) indexPath {
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    RSSPresenterEntry *entry = self.feed.entries[indexPath.row];
    [self.rootViewController requestSelect: entry];
}

- (void)dealloc {
    self.tableView = nil;
    self.feed = nil;
    self.rootViewController = nil;
    
    [super dealloc];
}

@end
