//
//  PalindromoCheck.swift
//  Palindromo_Test
//
//  Created by Geraldine on 11/4/24.
//

import Foundation

class PalindromeChecker {
    func isPalindrome(_ text: String) -> Bool {
        let cleanText = text.lowercased()
                              .filter { $0.isLetter }
        return cleanText == String(cleanText.reversed())
    }
}
