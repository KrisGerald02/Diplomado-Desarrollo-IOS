//
//  NumeroTest.swift
//  Numero_Par_ImparTests
//
//  Created by Geraldine on 11/4/24.
//

import XCTest

import XCTest

class NumberCheckerTests: XCTestCase {

    var numberChecker: NumberChecker!

    override func setUp() {
        super.setUp()
        numberChecker = NumberChecker()
    }

    override func tearDown() {
        numberChecker = nil
        super.tearDown()
    }

    func testIsEvenWithEvenNumber() {
        let result = numberChecker.isEven(4)
        XCTAssertTrue(result, "4 debería ser un número par")
    }

    func testIsEvenWithOddNumber() {
        let result = numberChecker.isEven(5)
        XCTAssertFalse(result, "5 debería ser un número impar")
    }
}
