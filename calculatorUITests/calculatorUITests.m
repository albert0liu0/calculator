//
//  calculatorUITests.m
//  calculatorUITests
//
//  Created by iOSIntern on 2017/7/6.
//  Copyright © 2017年 iOSIntern. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface calculatorUITests : XCTestCase

@end

@implementation calculatorUITests

- (void)setUp {
    [super setUp];
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    // In UI tests it is usually best to stop immediately when a failure occurs.
    self.continueAfterFailure = NO;
    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
    [[[XCUIApplication alloc] init] launch];
    
    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // Use recording to get started writing UI tests.
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    XCUIElement *button = app.buttons[@"1"];
    [button tap];
    [app.buttons[@"+"] tap];
    [button tap];
    
    XCUIElement *button2 = app.buttons[@"="];
    [button2 tap];
    [app.buttons[@"*"] tap];
    [app.buttons[@"2"] tap];
    [button2 tap];
    [app.buttons[@"C"] tap];
    [app.buttons[@"0"] tap];
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

@end
