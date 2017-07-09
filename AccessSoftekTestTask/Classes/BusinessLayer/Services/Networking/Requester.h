//
//  Requester.h
//  AccessSoftekTestTask
//
//  Created by Michael Belenchenko on 08/07/2017.
//  Copyright © 2017 We. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Requester : NSObject

- (NSURLSessionTask *)makeRequest:(NSString *)path method:(NSString *)method headers:(NSDictionary *)headers body:(NSData *)body completion:(void(^)(NSData *, NSError *))completion;

@end
