//
//  TestTypes.swift
//  Sample
//
//  Created by wookyoung on 10/08/15.
//  Copyright © 2015 factorcat. All rights reserved.
//


// https://github.com/wookay/juliacat/blob/master/TestCases/test_types.jl

import XCTest
// @testable import Sample

class TestTypes: XCTestCase {
    
    func testInt() {
        XCTAssertTrue((2 as Any) is Int)
        XCTAssertEqual("Swift.Int", _stdlib_getDemangledTypeName(2))
    }
    
    func testDouble() {
        XCTAssertTrue((3.14 as Any) is Double)
        XCTAssertEqual("Swift.Double", _stdlib_getDemangledTypeName(3.14))
        
        XCTAssertTrue(M_PI > 3.14)
        XCTAssertTrue((M_PI as Any) is Double)
    }
    
    func testString() {
        XCTAssertTrue(("" as Any) is String)
        XCTAssertEqual("Swift.String", _stdlib_getDemangledTypeName(""))
    }

    func testArray() {
        XCTAssertTrue(([Any]() as Any) is [Any])
        XCTAssertEqual("Swift.Array<protocol<>>", _stdlib_getDemangledTypeName([Any]()))
        XCTAssertEqual("Swift.Array<Swift.Int>", _stdlib_getDemangledTypeName([Int]()))
        
        XCTAssertFalse(([Int]() as Any) is [Any])
        XCTAssertFalse(([Any]() as Any) is [Int])
    }

    func testDictionary() {
        XCTAssertTrue(([Int: Any]() as Any) is [Int: Any])
        XCTAssertEqual("Swift.Dictionary<Swift.Int, protocol<>>", _stdlib_getDemangledTypeName([Int: Any]()))
    }
    
    func testClass() {
        XCTAssertTrue((self as Any) is TestTypes)
        XCTAssertEqual("SampleTests.TestTypes", _stdlib_getDemangledTypeName(self))
    }

    func testFunction() {
        func f() -> Void { }
        XCTAssertTrue((f as Any) is () -> Void)
        XCTAssertEqual("() -> ()", _stdlib_getDemangledTypeName(f))
        
        func g() { }
        XCTAssertTrue((g as Any) is () -> Void)
        XCTAssertEqual("() -> ()", _stdlib_getDemangledTypeName(g))
    }

    func testEnum() {
        enum ABC {
            case A
            case B
        }
        XCTAssertTrue((ABC.A as Any) is ABC)
        // print(_stdlib_getDemangledTypeName(ABC.A.dynamicType))
        XCTAssertEqual("SampleTests.TestTypes.(testEnum (SampleTests.TestTypes) -> () -> ()).(ABC #1)", _stdlib_getDemangledTypeName(ABC.A))
        XCTAssertEqual("SampleTests.TestTypes.(testEnum (SampleTests.TestTypes) -> () -> ()).(ABC #1)", _stdlib_getDemangledTypeName(ABC.B))
    }
    
    func testStruct() {
        struct ABC {
            var v: Any = 0
        }
        let t = ABC()
        XCTAssertTrue((t as Any) is ABC)
        // print(_stdlib_getDemangledTypeName(t.dynamicType))
        XCTAssertEqual("SampleTests.TestTypes.(testStruct (SampleTests.TestTypes) -> () -> ()).(ABC #1)", _stdlib_getDemangledTypeName(t))
    }
    
    func testRange() {
        XCTAssertTrue((1..<5 as Any) is Range<Int>)
        XCTAssertEqual("Swift.Range<Swift.Int>", _stdlib_getDemangledTypeName((1..<5)))
        XCTAssertEqual(1, (1..<5).startIndex)
        XCTAssertEqual(5, (1..<5).endIndex)
        
        XCTAssertTrue((1...5 as Any) is Range<Int>)
        XCTAssertEqual("Swift.Range<Swift.Int>", _stdlib_getDemangledTypeName((1...5)))
        XCTAssertEqual(1, (1...5).startIndex)
        XCTAssertEqual(6, (1...5).endIndex)
        
//      if #available(iOS 9.0, *) {
//          XCTAssertEqual(4, (1..<5).count)
//          XCTAssertEqual(5, (1...5).count)
//      }
    }
    
    func testTuple() {
        XCTAssertTrue((() as Any) is ())
        XCTAssertEqual("()", _stdlib_getDemangledTypeName(()))
    }
  
    func testOptional() {
        XCTAssertEqual("Swift.Optional<()>", _stdlib_getDemangledTypeName(Optional()))
        XCTAssertEqual("()", _stdlib_getDemangledTypeName(Optional()!))

        XCTAssertEqual("().Type", _stdlib_getDemangledTypeName(Void))
        XCTAssertEqual("Swift.Optional<().Type>", _stdlib_getDemangledTypeName(Optional(Void)))
        XCTAssertEqual("().Type", _stdlib_getDemangledTypeName(Optional(Void)!))
        
        let n: Optional<Int> = 1
        XCTAssertEqual(1, n!)
        XCTAssertEqual("Swift.Optional<Swift.Int>", _stdlib_getDemangledTypeName(n))
    }
}