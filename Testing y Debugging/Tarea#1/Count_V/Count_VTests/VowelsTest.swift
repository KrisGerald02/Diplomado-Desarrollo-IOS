//
//  VowelsTest.swift
//  Count_VTests
//
//  Created by Geraldine on 11/4/24.
//

import XCTest

class VowelCounterTests: XCTestCase {

    var vowelCounter: VowelCounter!

    override func setUp() {
        super.setUp()
        vowelCounter = VowelCounter()
    }

    override func tearDown() {
        vowelCounter = nil
        super.tearDown()
    }

    func testCountVowelsInText() {
        let result = vowelCounter.countVowels(in: "hola mundo")
        XCTAssertEqual(result, 4, "La frase 'hola mundo' debería tener 4 vocales")
    }

    func testCountVowelsInTextWithNoVowels() {
        let result = vowelCounter.countVowels(in: "bcdfghjkl")
        XCTAssertEqual(result, 0, "El texto 'bcdfghjkl' no debería tener vocales")
    }
}
