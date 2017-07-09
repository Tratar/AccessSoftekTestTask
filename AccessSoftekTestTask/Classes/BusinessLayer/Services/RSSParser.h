//
//  RSSParser.h
//  AccessSoftekTestTask
//
//  Created by Michael Belenchenko on 09/07/2017.
//  Copyright © 2017 We. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RSSFeed;

@interface RSSParser : NSObject

- (RSSFeed *)parseData:(NSData *)data error:(NSError **)error;

@end
