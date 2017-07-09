//
//  Requester.m
//  AccessSoftekTestTask
//
//  Created by Michael Belenchenko on 08/07/2017.
//  Copyright © 2017 We. All rights reserved.
//

#import "Requester.h"

@implementation Requester

- (NSURLSessionTask *)makeRequest:(NSString *)path method:(NSString *)method headers:(NSDictionary <NSString *, NSString *> *)headers body:(NSData *)body completion:(void(^)(NSData *, NSError *))completion {
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    NSMutableURLRequest *request = [[[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:path]] autorelease];
    for (NSString *key in headers.allKeys) {
        [request setValue:[headers valueForKey:key] forHTTPHeaderField:key];
    }
    
    request.HTTPBody = body;
    
    // It's not necessary to handle wrap self into __block variable.
    NSURLSessionDataTask * task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (completion)
            completion(data, error);
    }];
    [task resume];
    return task;
}

@end
