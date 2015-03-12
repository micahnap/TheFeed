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

- (void)testJSONDataParsing {
    
    NSBundle *testBundle = [NSBundle bundleForClass:[self class]];
    NSURL *dataURL = [testBundle URLForResource:@"TestJSONData" withExtension:@"json"];
    NSData *jsonData = [NSData dataWithContentsOfURL:dataURL];
    
    NSError *theError = nil;
    
    XCTAssertNotNil(theError, @"should not be nil");
    
//    XCTestExpectation *expectation = [self expectationWithDescription:@"Test success!"];
//    [HTTPClient fetchJsonDataFromURL:FeedURL withCompletion:^(NSError *error, NSHTTPURLResponse *response, NSData *data){
//        if(error)
//        {
//            NSLog(@"error is: %@", error);
//        }else{
//            NSInteger statusCode = [response statusCode];
//            XCTAssertEqual(statusCode, 200);
//            [expectation fulfill];
//        }
//    }];
    
//    [self waitForExpectationsWithTimeout:5.0 handler:^(NSError *error) {
//        
//        if(error)
//        {
//            XCTFail(@"Expectation Failed with error: %@", error);
//        }
//        
//    }];


//    NSLog(@"feedString: %@, error: %@", dict, error);
}

//- (void)testPerformanceExample {
//    // This is an example of a performance test case.
//    [self measureBlock:^{
//        // Put the code you want to measure the time of here.
//    }];
//}

@end
