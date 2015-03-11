//
//  HTTPClient.m
//  TheFeed
//
//  Created by Micah Napier on 11/03/2015.
//  Copyright (c) 2015 Micah Napier. All rights reserved.
//

#import "JSONWebParser.h"

@implementation JSONWebParser

+(NSDictionary *)jsonDictionaryFromURL:(NSString *)url withCompletion:(JSONCompletionBlock)completionBlock{
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    
    __block NSDictionary *jsonDictionary;
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *error){
                               
                               if (!data){
                                   completionBlock(error,nil);
                               }else{
                                   
                                   //data contains special characters that don't look human with UTF-8
                                   //convert to ASCII
                                   NSData *jsonData = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
                                   NSString *stringASCII = [[[NSString alloc] initWithData:jsonData encoding:NSASCIIStringEncoding] autorelease];
                                   NSData *datNewData = [stringASCII dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
                                   jsonDictionary  = [NSJSONSerialization JSONObjectWithData:datNewData options:kNilOptions error:&error];
                                   
                               }
                           }];
    
    return jsonDictionary;
}
@end
