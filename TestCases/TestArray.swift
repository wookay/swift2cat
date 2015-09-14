//
//  TestArray.swift
//  Sample
//
//  Created by wookyoung on 11/08/15.
//  Copyright © 2015 factorcat. All rights reserved.
//

import XCTest

class TestArray: XCTestCase {
    
    func testSort() {
        XCTAssertEqual([1,2,3], [1,3,2].sort())
    }
    
    func testFind() {
        XCTAssertEqual(2, [1,2,5].indexOf(5))
        XCTAssertEqual(2, [1,2,5].indexOf(5) as Int!)
        XCTAssertNil([1,2,3].indexOf(5))
    }
    
}
