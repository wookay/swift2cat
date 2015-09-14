//
//  TestClass.swift
//  SwiftTwo
//
//  Created by wookyoung on 11/08/15.
//  Copyright © 2015 factorcat. All rights reserved.
//

import XCTest

class A {
}

extension A {
    func f() -> Int {
        return 0
    }
}


class TestClass: XCTestCase {
    
    func testClass() {
        let a = A()
        XCTAssertTrue(a.f() == a.f())
    }
    
    
}
