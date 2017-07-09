//
//  AppDependencies.m
//  AccessSoftekTestTask
//
//  Created by Michael Belenchenko on 08/07/2017.
//  Copyright © 2017 We. All rights reserved.
//

#import "AppDependencies.h"
#import "RSSFeedRouter.h"
#import "RSSFeedInteractor.h"
#import "FeedAPIService.h"
#import "Requester.h"
#import "FeedParser.h"
#import "RSSObjectsMapper.h"

@interface AppDependencies()

@property (nonatomic, readwrite) RSSFeedRouter *feedRouter;

@end

@implementation AppDependencies

- (void)configureWithWindow:(UIWindow *)window {
    FeedAPIService *feedAPIService = [[FeedAPIService new] autorelease];
    Requester *requester = [[Requester new] autorelease];
    FeedParser *feedParser = [[FeedParser new] autorelease];
    
    RSSFeedRouter *feedRouter = [[RSSFeedRouter new] autorelease];
    RSSFeedInteractor *feedInteractor = [[RSSFeedInteractor new] autorelease];
    
    RSSObjectsMapper *objectsMapper = [[RSSObjectsMapper new] autorelease];
    
    feedAPIService.requester = requester;
    feedAPIService.parser = feedParser;
    
    feedInteractor.feedAPIService = feedAPIService;
    feedInteractor.objectsMapper = objectsMapper;
    
    feedRouter.interactor = feedInteractor;
    feedRouter.window = window;
    
    self.feedRouter = feedRouter;
}

- (void)dealloc {
    self.feedRouter = nil;
    
    [super dealloc];
}

@end
