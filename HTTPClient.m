//
//  HTTPClient.m
//  TheFeed
//
//  Created by Micah Napier on 11/03/2015.
//  Copyright (c) 2015 Micah Napier. All rights reserved.
//

#import "HTTPClient.h"

@implementation HTTPClient

+(void)fetchJsonDataFromURL:(NSURL *)url withCompletion:(JSONCompletionBlock)completionBlock{
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *error){
                               
                               if (!error){
                                   completionBlock(YES,data);
                               }else{
                                   NSLog(@"ERROR");
                                   completionBlock(NO,nil);
                               }
                           }];
}

@end
