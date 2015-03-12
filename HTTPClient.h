//
//  HTTPClient.h
//  TheFeed
//
//  Created by Micah Napier on 11/03/2015.
//  Copyright (c) 2015 Micah Napier. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^CompletionBlock)(NSError *error, NSData *data);

@interface HTTPClient : NSObject

+(void)fetchDataFromURL:(NSString *)url withCompletion:(CompletionBlock)completionBlock;
@end
