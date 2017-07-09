//
//  RSSPresenterEntry.m
//  AccessSoftekTestTask
//
//  Created by Michael Belenchenko on 08/07/2017.
//  Copyright © 2017 We. All rights reserved.
//

#import "RSSPresenterEntry.h"

@interface RSSPresenterEntry()

@property (nonatomic, copy, readwrite) NSString *title;
@property (nonatomic, copy, readwrite) NSString *descr;
@property (nonatomic, strong, readwrite) NSURL *targetURL;

@end

@implementation RSSPresenterEntry

- (instancetype)initWithTitle:(NSString *)title description:(NSString *)description targetURL:(NSURL *)targetURL {
    self = [super init];
    
    if (self) {
        self.title = title;
        self.descr = description;
        self.targetURL = targetURL;
    }
    
    return self;
}

- (void)dealloc {
    self.title = nil;
    self.descr = nil;
    self.targetURL = nil;
    
    [super dealloc];
}

@end
