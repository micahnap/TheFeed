//
//  JSONParser.h
//  TheFeed
//
//  Created by Micah Napier on 12/03/2015.
//  Copyright (c) 2015 Micah Napier. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JSONParser : NSObject

+(NSDictionary *)jsonDictionaryFromString:(NSString *)jsonString;

@end
