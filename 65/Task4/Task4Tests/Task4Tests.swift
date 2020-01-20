//
//  Task4Tests.swift
//  Task4Tests
//
//  Created by Андрей Зорин on 19/01/2020.
//  Copyright © 2020 Андрей Зорин. All rights reserved.
//

import XCTest
@testable import Task4

class Task4Tests: XCTestCase {

    private let validator = ViewController()
    
    func testMinLengthDenial() {
        XCTAssert(validator.isValidLogin("qq") == false)
    }
    func testMinLengthSuccess() {
        XCTAssert(validator.isValidLogin("qqq") == true)
    }
    func testMaxLengthDenial() {
        XCTAssert(validator.isValidLogin("qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq") == false)
    }
    func testMaxLengthSuccess() {
        XCTAssert(validator.isValidLogin("qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq") == true)
    }
    func testFirstLetterDenial1() {
        XCTAssert(validator.isValidLogin("1qqqqqqqqqq") == false)
    }
    func testFirstLetterDenial2() {
        XCTAssert(validator.isValidLogin(".qqqqqqqqqq") == false)
    }
    func testFirstLetterDenial3() {
        XCTAssert(validator.isValidLogin("-qqqqqqqqqq") == false)
    }
    func testFirstLetterSuccess1() {
        XCTAssert(validator.isValidLogin("Aqqqqqqqqqq") == true)
    }
    func testFirstLetterSuccess2() {
        XCTAssert(validator.isValidLogin("aqqqqqqqqqq") == true)
    }
    func testContainsLetterDenial1() {
        XCTAssert(validator.isValidLogin("ZZZppppZZAAA-.@#asddd1121_") == false)
    }
    func testContainsLetterDenial2() {
        XCTAssert(validator.isValidLogin("ZZZppppZZAAA-.@#asddd1121") == false)
    }
    func testContainsLetterDenial3() {
        XCTAssert(validator.isValidLogin("ZZZppppZZAAA-.@asddd1121") == false)
    }
    func testContainsLetterSuccess1() {
        XCTAssert(validator.isValidLogin("ZZZppppZZAAA-.asddd1121") == true)
    }
    func testContainsLetterSuccess2() {
        XCTAssert(validator.isValidLogin("ZZZppppZZAAA-asddd1121") == true)
    }
    func testContainsLetterSuccess3() {
        XCTAssert(validator.isValidLogin("ZZZppppZZAAAasddd1121") == true)
    }
    func testContainsLetterSuccess4() {
        XCTAssert(validator.isValidLogin("ZZZppppZZAAAasddd") == true)
    }
    func testContainsLetterSuccess5() {
        XCTAssert(validator.isValidLogin("ppppasddd") == true)
    }
    func testContainsLetterSuccess6() {
        XCTAssert(validator.isValidLogin("ZZZZZAAA") == true)
    }

}
