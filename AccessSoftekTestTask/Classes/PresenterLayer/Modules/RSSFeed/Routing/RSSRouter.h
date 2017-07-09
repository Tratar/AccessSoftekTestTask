//
//  RSSFeedRouter.h
//  AccessSoftekTestTask
//
//  Created by Michael Belenchenko on 08/07/2017.
//  Copyright © 2017 We. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class RSSInteractor;

@interface RSSRouter : NSObject

@property (nonatomic, strong) UIWindow *window;
@property (nonatomic, strong) RSSInteractor *interactor;

- (void)presentRSSFeed;

@end
