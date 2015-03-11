//
//  HTTPClient.h
//  TheFeed
//
//  Created by Micah Napier on 11/03/2015.
//  Copyright (c) 2015 Micah Napier. All rights reserved.
//

#import <Foundation/Foundation.h>

#define FeedURL @"http://dl.dropboxusercontent.com/u/746330/facts.json"
typedef void (^JSONCompletionBlock)(NSError *error, NSDictionary *jsonDict);

@interface JSONWebParser : NSObject

+(NSDictionary *)jsonDictionaryFromURL:(NSString *)url withCompletion:(JSONCompletionBlock)completionBlock;
@end
