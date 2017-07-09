//
//  RSSPresenterFeed.h
//  AccessSoftekTestTask
//
//  Created by Michael Belenchenko on 08/07/2017.
//  Copyright © 2017 We. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RSSPresenterEntry;

@interface RSSPresenterFeed : NSObject

@property (nonatomic, readonly) NSArray <RSSPresenterEntry *> *entries;

- (instancetype)initWithEntriesList:(NSArray <RSSPresenterEntry *> *)entries;

@end
