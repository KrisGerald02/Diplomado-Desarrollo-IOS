//
//  Vowels.swift
//  Count_V
//
//  Created by Geraldine on 11/4/24.
//

import Foundation

class VowelCounter {
    func countVowels(in text: String) -> Int {
        let vowels = "aeiouáéíóúAEIOUÁÉÍÓÚ"
        return text.filter { vowels.contains($0) }.count
    }
}
