//
//  JSONParser.m
//  TheFeed
//
//  Created by Micah Napier on 12/03/2015.
//  Copyright (c) 2015 Micah Napier. All rights reserved.
//

#import "JSONParser.h"

@implementation JSONParser

+(NSDictionary *)jsonDictionaryFromString:(NSString *)jsonString{
    
    NSError *error = nil;
    NSData *jsonData = [jsonString dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    NSDictionary *jsonDictionary  = [NSJSONSerialization JSONObjectWithData:jsonData options:kNilOptions error:&error];
    
    return jsonDictionary;
}

@end
