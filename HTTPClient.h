//
//  HTTPClient.h
//  TheFeed
//
//  Created by Micah Napier on 11/03/2015.
//  Copyright (c) 2015 Micah Napier. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void (^JSONCompletionBlock)(NSError *error, NSString *jsonString);
typedef void (^ImageCompletionBlock)(NSError *error, UIImage *data);

@interface HTTPClient : NSObject

+(void)fetchJSONDataFromURL:(NSString *)url withCompletion:(JSONCompletionBlock)completionBlock;
+(void)fetchImageDataFromURL:(NSString *)url withCompletion:(ImageCompletionBlock)completionBlock;
@end
