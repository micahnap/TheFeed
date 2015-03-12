//
//  HTTPClient.m
//  TheFeed
//
//  Created by Micah Napier on 11/03/2015.
//  Copyright (c) 2015 Micah Napier. All rights reserved.
//

#import "HTTPClient.h"

@implementation HTTPClient

+(void)fetchJSONDataFromURL:(NSString *)url withCompletion:(JSONCompletionBlock)completionBlock{
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_async(queue, ^{
        NSError *error = nil;
        NSString *json = [[[NSString alloc] initWithContentsOfURL:[NSURL URLWithString:url] encoding:NSASCIIStringEncoding error:&error] autorelease];
        completionBlock(error,json);
    });
}

+(void)fetchImageDataFromURL:(NSString *)url withCompletion:(ImageCompletionBlock)completionBlock{
    
}

@end
