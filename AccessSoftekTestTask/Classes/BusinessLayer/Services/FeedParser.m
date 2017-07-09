//
//  FeedParser.m
//  AccessSoftekTestTask
//
//  Created by Michael Belenchenko on 09/07/2017.
//  Copyright © 2017 We. All rights reserved.
//

#import "FeedParser.h"
#import "RSSEntry.h"
#import "RSSFeed.h"

NSString *const itemXMLElementName = @"item";
NSString *const rootXMLElementName = @"rss";
NSString *const titleXMLElementName = @"title";
NSString *const linkXMLElementName = @"link";
NSString *const descriptionXMLElementName = @"description";

@interface FeedParser() <NSXMLParserDelegate>

@property (nonatomic, strong) NSMutableArray <RSSEntry *> *entries;

@property (nonatomic, copy) NSString *currentElement;

@property (nonatomic, assign) BOOL parsingItem;

@property (nonatomic, strong) NSMutableString *title;
@property (nonatomic, strong) NSMutableString *link;
@property (nonatomic, strong) NSMutableString *descr;

@property (nonatomic, strong) NSRecursiveLock *lock;

@end

@implementation FeedParser

- (RSSFeed *)parseData:(NSData *)data error:(NSError **)error {
    NSXMLParser *parser = [[[NSXMLParser alloc] initWithData:data] autorelease];
    
    parser.delegate = self;
    
    [self.lock lock];
    self.entries = [[NSMutableArray new] autorelease];
    self.title = nil;
    self.link = nil;
    self.descr = nil;
    self.parsingItem = NO;
    
    [parser parse];
    RSSFeed *result = parser.parserError == nil ? [[[RSSFeed alloc] initWithEntriesList:self.entries] autorelease] : nil;
    if (error != NULL)
        *error = parser.parserError;
    self.entries = nil;
    [self.lock unlock];
    
    return result;
}

#pragma mark NSXMLParserDelegate

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary<NSString *,NSString *> *)attributeDict {
    if ([elementName isEqualToString: itemXMLElementName]) {
        self.parsingItem = YES;
    } else if ([elementName isEqualToString: descriptionXMLElementName]) {
        self.descr = [[NSMutableString new] autorelease];
    } else if ([elementName isEqualToString: titleXMLElementName]) {
        self.title = [[NSMutableString new] autorelease];
    } else if ([elementName isEqualToString: linkXMLElementName]) {
        self.link = [[NSMutableString new] autorelease];
    }
    
    self.currentElement = elementName;
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    if ([elementName isEqualToString: rootXMLElementName]) {
    } else if ([elementName isEqualToString: itemXMLElementName]) {
        self.parsingItem = NO;
        [self.entries addObject:[[[RSSEntry alloc] initWithTitle:self.title description:self.descr targetURL:[NSURL URLWithString:self.link]] autorelease]];
    }
    
    self.currentElement = nil;
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    if (self.parsingItem) {
        if ([self.currentElement isEqualToString: titleXMLElementName]) {
            [self.title appendString:string];
        } else if ([self.currentElement isEqualToString: linkXMLElementName]) {
            [self.link appendString:string];
        } else if ([self.currentElement isEqualToString: descriptionXMLElementName]) {
            [self.descr appendString:string];
        }
    }
}

- (void)dealloc {
    self.entries = nil;
    self.title = nil;
    self.link = nil;
    self.descr = nil;
    self.lock = nil;
    self.currentElement = nil;
    
    [super dealloc];
}

@end
