//
//  HTTPClient.m
//  TheFeed
//
//  Created by Micah Napier on 11/03/2015.
//  Copyright (c) 2015 Micah Napier. All rights reserved.
//

#import "HTTPClient.h"

@implementation HTTPClient

+(void)fetchDataFromURL:(NSString *)url withCompletion:(CompletionBlock)completionBlock{
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *error){
                               
                               if (!data){
                                   completionBlock(error,nil);
                               }else{
                                   completionBlock(nil,data);
                               }
                           }];
}

@end
