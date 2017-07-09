//
//  AppDependencies.h
//  AccessSoftekTestTask
//
//  Created by Michael Belenchenko on 08/07/2017.
//  Copyright © 2017 We. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class RSSRouter;

@interface AppDependencies : NSObject

@property (nonatomic, readonly) RSSRouter *rssRouter;

- (void)configureWithWindow:(UIWindow *)window;

@end
