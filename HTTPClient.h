//
//  HTTPClient.h
//  TheFeed
//
//  Created by Micah Napier on 11/03/2015.
//  Copyright (c) 2015 Micah Napier. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Typedefs.h"
@interface HTTPClient : NSObject

+(void)fetchJsonDataFromURL:(NSURL *)url withCompletion:(JSONCompletionBlock)completionBlock;
@end
