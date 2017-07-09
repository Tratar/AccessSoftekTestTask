//
//  RSSEntry.h
//  AccessSoftekTestTask
//
//  Created by Michael Belenchenko on 08/07/2017.
//  Copyright © 2017 We. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RSSEntry : NSObject

@property (nonatomic, readonly) NSString *title;
@property (nonatomic, readonly) NSString *descr;
@property (nonatomic, readonly) NSURL *targetURL;

- (instancetype)initWithTitle:(NSString *)title description:(NSString *)description targetURL:(NSURL *)targetURL;

@end
