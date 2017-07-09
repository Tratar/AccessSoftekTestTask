//
//  RSSFeed.h
//  AccessSoftekTestTask
//
//  Created by Michael Belenchenko on 08/07/2017.
//  Copyright © 2017 We. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RSSEntry;

@interface RSSFeed : NSObject

@property (nonatomic, readonly) NSArray <RSSEntry *> *entries;

- (instancetype)initWithEntriesList:(NSArray <RSSEntry *> *)entries;

@end
