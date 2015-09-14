//
//  SwiftTwoUITests.swift
//  SwiftTwoUITests
//
//  Created by wookyoung on 11/08/15.
//  Copyright © 2015 factorcat. All rights reserved.
//

import XCTest

class SwiftTwoUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        
        let window = XCUIApplication().childrenMatchingType(.Window).element
        window.doubleTap()
        window.swipeDown()
        window.tap()
        XCUIApplication().launch()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
}
