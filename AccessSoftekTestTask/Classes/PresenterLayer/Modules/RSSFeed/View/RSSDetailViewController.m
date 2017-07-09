//
//  RSSDetailViewController.m
//  AccessSoftekTestTask
//
//  Created by Michael Belenchenko on 08/07/2017.
//  Copyright © 2017 We. All rights reserved.
//

#import "RSSDetailViewController.h"
#import "RSSPresenterEntry.h"

@interface RSSDetailViewController ()

@property (nonatomic, readwrite, strong) RSSPresenterEntry *entry;
@property (nonatomic, strong) UIWebView *webView;
@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UIScrollView *scrollView;

@end

@implementation RSSDetailViewController

- (void)viewDidLoad {
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.scrollView = [[UIScrollView new] autorelease];
    self.scrollView.translatesAutoresizingMaskIntoConstraints = NO;
    
    UIView *contentView = [[UIView new] autorelease];
    contentView.translatesAutoresizingMaskIntoConstraints = NO;
    
    self.label = [[UILabel new] autorelease];
    self.label.translatesAutoresizingMaskIntoConstraints = NO;
    self.label.numberOfLines = 0;
    
    self.webView = [[UIWebView new] autorelease];
    self.webView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.view addSubview:self.scrollView];
    
    [self.scrollView addSubview:contentView];
    [contentView addSubview:self.label];
    [contentView addSubview:self.webView];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[scrollView]|"
                                                                      options:kNilOptions
                                                                      metrics:nil
                                                                        views:@{@"scrollView":self.scrollView}]];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[topGuide][scrollView]|"
                                                                      options:kNilOptions
                                                                      metrics:nil
                                                                        views:@{@"scrollView":self.scrollView, @"topGuide":self.topLayoutGuide}]];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[contentView]|"
                                                                       options:kNilOptions
                                                                       metrics:nil
                                                                         views:@{@"contentView":contentView}]];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[contentView]|"
                                                                       options:kNilOptions
                                                                       metrics:nil
                                                                         views:@{@"contentView":contentView}]];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[contentView(==mainView)]"
                                                                      options:kNilOptions
                                                                      metrics:nil
                                                                        views:@{@"contentView":contentView, @"mainView": self.view}]];
    
    [contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[label]-|"
                                                                      options:kNilOptions
                                                                      metrics:nil
                                                                        views:@{@"label":self.label}]];
    
    [contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[webView]|"
                                                                      options:kNilOptions
                                                                      metrics:nil
                                                                        views:@{@"webView":self.webView}]];
    
    [contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[label][webView]|"
                                                                      options:kNilOptions
                                                                      metrics:nil
                                                                        views:@{@"webView":self.webView, @"label":self.label}]];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[webView(==mainView)]"
                                                                      options:kNilOptions
                                                                      metrics:nil
                                                                        views:@{@"webView":self.webView, @"mainView": self.view}]];
    if (self.entry) {
        [self configure];
    }
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)displayRSSEntry:(RSSPresenterEntry *)entry {
    self.entry = entry;
    [self configure];
}

- (void)configure {
    self.title = self.entry.title;
    NSURLRequest *request = [[[NSURLRequest alloc] initWithURL:self.entry.targetURL] autorelease];
    [self.webView loadRequest: request];
    self.label.text = self.entry.descr;
    self.scrollView.contentOffset = CGPointZero;
}

- (void)dealloc {
    self.entry = nil;
    self.label = nil;
    self.webView = nil;
    self.scrollView = nil;
    
    [super dealloc];
}

@end
