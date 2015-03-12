//
//  NSString+NoNil.m
//  TheFeed
//
//  Created by Micah on 13/03/2015.
//  Copyright (c) 2015 Micah Napier. All rights reserved.
//

#import "NSString+NoNil.h"

@implementation NSString (NoNil)

+(NSString *)noNilStringFromString:(NSString *)nilString{
    NSString *string = @"";
    if ([nilString isEqual:[NSNull null]]) {
        return string;
    }
    return string;
}
@end
