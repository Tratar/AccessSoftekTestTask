//
//  RSSDetailViewController.h
//  AccessSoftekTestTask
//
//  Created by Michael Belenchenko on 08/07/2017.
//  Copyright © 2017 We. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RSSPresenterEntry;

@interface RSSDetailViewController : UIViewController

@property (nonatomic, readonly) RSSPresenterEntry *entry;

- (void)displayRSSEntry:(RSSPresenterEntry *)entry;

@end
