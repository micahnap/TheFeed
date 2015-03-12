//
//  TestNoNil.m
//  TheFeed
//
//  Created by Micah on 13/03/2015.
//  Copyright (c) 2015 Micah Napier. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "NSString+NoNil.h"
@interface TestNoNil : XCTestCase

@end

@implementation TestNoNil

- (void)testNoNilString {
    NSString *string = [NSString noNilStringFromString:nil];
    XCTAssertNotNil(string,@"string should not be nil. but it is.");
}

- (void)testNoNULLString {
    NSString *string = [NSString noNilStringFromString:NULL];
    XCTAssertNotNil(string,@"string should not be nil. but it is.");
}

@end
