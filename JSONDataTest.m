//
//  JSONDataTest.m
//  TheFeed
//
//  Created by Micah Napier on 11/03/2015.
//  Copyright (c) 2015 Micah Napier. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "HTTPClient.h"

@interface JSONDataTest : XCTestCase

@end

@implementation JSONDataTest{
    NSDictionary *_feedDetailJSON;
}

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testJSONData {
    
    NSURL *dataServiceURL = [[NSBundle bundleForClass:self.class]
                             URLForResource:@"JSONData" withExtension:@"json"];
    
    // 4
    NSData *sampleData = [NSData dataWithContentsOfURL:dataServiceURL];
    NSError *error;
    
    id json = [NSJSONSerialization JSONObjectWithData:sampleData
                                              options:kNilOptions
                                                error:&error];
    XCTAssertNotNil(json, @"invalid test data");
    
}

//- (void)testPerformanceExample {
//    // This is an example of a performance test case.
//    [self measureBlock:^{
//        // Put the code you want to measure the time of here.
//    }];
//}

@end
