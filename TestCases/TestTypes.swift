//
//  TestTypes.swift
//  Sample
//
//  Created by wookyoung on 10/08/15.
//  Copyright © 2015 factorcat. All rights reserved.
//

import XCTest

// @testable import Sample

class TestTypes: XCTestCase {
    
    func testInt() {
        XCTAssertTrue((2 as Any) is Int)
        XCTAssertEqual("Swift.Int.Type", _stdlib_getDemangledTypeName(2.dynamicType))
    }
    
    func testDouble() {
        XCTAssertTrue((3.14 as Any) is Double)
        XCTAssertEqual("Swift.Double.Type", _stdlib_getDemangledTypeName(3.14.dynamicType))
        
        XCTAssertTrue(M_PI > 3.14)
        XCTAssertTrue((M_PI as Any) is Double)
    }
    
    func testString() {
        XCTAssertTrue(("" as Any) is String)
        XCTAssertEqual("Swift.String.Type", _stdlib_getDemangledTypeName("".dynamicType))
    }

    func testArray() {
        XCTAssertTrue(([Any]() as Any) is [Any])
        XCTAssertEqual("Swift.Array<protocol<>>.Type", _stdlib_getDemangledTypeName([Any]().dynamicType))
        XCTAssertEqual("Swift.Array<Swift.Int>.Type", _stdlib_getDemangledTypeName([Int]().dynamicType))
        
        XCTAssertFalse(([Int]() as Any) is [Any])
        XCTAssertFalse(([Any]() as Any) is [Int])
    }

    func testDictionary() {
        XCTAssertTrue(([Int: Any]() as Any) is [Int: Any])
        XCTAssertEqual("Swift.Dictionary<Swift.Int, protocol<>>.Type", _stdlib_getDemangledTypeName([Int: Any]().dynamicType))
    }
    
    func testClass() {
        XCTAssertTrue((self as Any) is TestTypes)
        XCTAssertEqual("SampleTests.TestTypes.Type", _stdlib_getDemangledTypeName(self.dynamicType))
    }

    func testFunction() {
        func f() -> Void { }
        XCTAssertTrue((f as Any) is () -> Void)
        XCTAssertEqual("(() -> ()).Type", _stdlib_getDemangledTypeName(f.dynamicType))
        
        func g() { }
        XCTAssertTrue((g as Any) is () -> Void)
        XCTAssertEqual("(() -> ()).Type", _stdlib_getDemangledTypeName(g.dynamicType))
    }

    func testEnum() {
        enum ABC {
            case A
            case B
        }
        XCTAssertTrue((ABC.A as Any) is ABC)
        // print(_stdlib_getDemangledTypeName(ABC.A.dynamicType))
        XCTAssertEqual("SampleTests.TestTypes.(testEnum (SampleTests.TestTypes) -> () -> ()).(ABC #1).Type", _stdlib_getDemangledTypeName(ABC.A.dynamicType))
        XCTAssertEqual("SampleTests.TestTypes.(testEnum (SampleTests.TestTypes) -> () -> ()).(ABC #1).Type", _stdlib_getDemangledTypeName(ABC.B.dynamicType))
    }
    
    func testStruct() {
        struct ABC {
            var v: Any = 0
        }
        let t = ABC()
        XCTAssertTrue((t as Any) is ABC)
        // print(_stdlib_getDemangledTypeName(t.dynamicType))
        XCTAssertEqual("SampleTests.TestTypes.(testStruct (SampleTests.TestTypes) -> () -> ()).(ABC #1).Type", _stdlib_getDemangledTypeName(t.dynamicType))
    }
}