//
//  TestNumeric.swift
//  Sample
//
//  Created by wookyoung on 11/08/15.
//  Copyright © 2015 factorcat. All rights reserved.
//

import XCTest

class TestNumeric: XCTestCase {
    
    func testPower() {
        XCTAssertEqual(0xF*pow(10, 3), 15e3)
        XCTAssertEqual(0xF*pow(2, 3), 0xFp3)
    }

}
