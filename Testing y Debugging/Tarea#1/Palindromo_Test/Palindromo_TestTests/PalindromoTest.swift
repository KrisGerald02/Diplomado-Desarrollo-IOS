//
//  PalindromoTest.swift
//  Palindromo_TestTests
//  Created by Geraldine on 11/4/24.

import XCTest

class PalindromeCheckerTests: XCTestCase {

    var palindromeChecker: PalindromeChecker!

    override func setUp() {
        super.setUp()
        palindromeChecker = PalindromeChecker()
    }

    override func tearDown() {
        palindromeChecker = nil
        super.tearDown()
    }

    func testIsPalindromeWithWord() {
        XCTAssertTrue(palindromeChecker.isPalindrome("Reconocer"), "La palabra 'Reconocer' debería ser un palíndromo")
        XCTAssertTrue(palindromeChecker.isPalindrome("anilina"), "La palabra 'anilina' debería ser un palíndromo")
        XCTAssertTrue(palindromeChecker.isPalindrome("radar"), "La palabra 'radar' debería ser un palíndromo")
    }

    func testIsPalindromeWithPhrase() {
        XCTAssertTrue(palindromeChecker.isPalindrome("Anita lava la tina"), "La frase 'Anita lava la tina' debería ser un palíndromo")
        XCTAssertTrue(palindromeChecker.isPalindrome("Romani seconoce sin oro, ni se conoce sin amor"), "La frase 'Romani seconoce sin oro, ni se conoce sin amor' debería ser un palíndromo")
    }
}
