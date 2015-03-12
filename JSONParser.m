//
//  JSONParser.m
//  TheFeed
//
//  Created by Micah Napier on 12/03/2015.
//  Copyright (c) 2015 Micah Napier. All rights reserved.
//

#import "JSONParser.h"

@implementation JSONParser

+(NSDictionary *)jsonDictionaryFromData:(NSData *)urlData{
    
    //data contains a special characters (actually erroneous that don't look good with UTF-8
    //convert to ASCII for better representation with special characters
    //For the projects sake, the ASCII encoding is part of this overall logic.
    //In the real world, this class would be extended to include different encoding options
    
    NSError *error = nil;
    NSString *stringASCII = [[[NSString alloc] initWithData:urlData encoding:NSASCIIStringEncoding] autorelease];
    NSData *dataASCII = [stringASCII dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    NSDictionary *jsonDictionary  = [NSJSONSerialization JSONObjectWithData:dataASCII options:kNilOptions error:&error];
    
    return jsonDictionary;
}

@end
