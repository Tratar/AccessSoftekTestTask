//
//  RSSPresenterState.m
//  AccessSoftekTestTask
//
//  Created by Michael Belenchenko on 08/07/2017.
//  Copyright © 2017 We. All rights reserved.
//

#import "RSSPresenterState.h"

@implementation RSSPresenterState

- (void)dealloc {
    self.feed = nil;
    self.currentEntry = nil;
    self.currentRequest = nil;
    
    [super dealloc];
}

@end
