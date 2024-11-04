//
//  PotenciaTest.swift
//  Potencia_NumeroTests
//  Created by Geraldine on 11/4/24.
//

import XCTest

class PowerCalculatorTests: XCTestCase {

    var powerCalculator: PowerCalculator!

    override func setUp() {
        super.setUp()
        powerCalculator = PowerCalculator()
    }

    override func tearDown() {
        powerCalculator = nil
        super.tearDown()
    }

    func testCalculatePower() {
        let result = powerCalculator.calculatePower(base: 2, exponent: 3)
        XCTAssertEqual(result, 8, "2^3 debería ser 8")
    }

    func testCalculatePowerWithExponentZero() {
        let result = powerCalculator.calculatePower(base: 5, exponent: 0)
        XCTAssertEqual(result, 1, "Cualquier número elevado a la potencia 0 debe ser 1")
    }
}

