//
//  AppDependencies.m
//  AccessSoftekTestTask
//
//  Created by Michael Belenchenko on 08/07/2017.
//  Copyright © 2017 We. All rights reserved.
//

#import "AppDependencies.h"

#import "Requester.h"

#import "RSSRouter.h"
#import "RSSInteractor.h"
#import "RSSService.h"
#import "RSSParser.h"
#import "RSSObjectsMapper.h"

@interface AppDependencies()

@property (nonatomic, readwrite) RSSRouter *rssRouter;

@end

@implementation AppDependencies

- (void)configureWithWindow:(UIWindow *)window {
    Requester *requester = [[Requester new] autorelease];
    
    RSSService *rssService = [[RSSService new] autorelease];
    RSSParser *rssParser = [[RSSParser new] autorelease];
    
    RSSRouter *rssRouter = [[RSSRouter new] autorelease];
    RSSInteractor *rssInteractor = [[RSSInteractor new] autorelease];
    
    RSSObjectsMapper *rssObjectsMapper = [[RSSObjectsMapper new] autorelease];
    
    rssService.requester = requester;
    rssService.parser = rssParser;
    
    rssInteractor.rssService = rssService;
    rssInteractor.objectsMapper = rssObjectsMapper;
    
    rssRouter.interactor = rssInteractor;
    rssRouter.window = window;
    
    self.rssRouter = rssRouter;
}

- (void)dealloc {
    self.rssRouter = nil;
    
    [super dealloc];
}

@end
