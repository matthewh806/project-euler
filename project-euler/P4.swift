//
//  P4.swift
//  project-euler
//
//  Created by Matthew on 06/03/2016.
//  Copyright © 2016 Automata Theory. All rights reserved.
//

import Foundation

/*
A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.

Find the largest palindrome made from the product of two 3-digit numbers.
*/
class P4: Problem {
    func solve() -> String {
        
        return "\(generatePalindromes(3).maxElement()!)"
    }
    
    func generatePalindromes(numDigits: Int) -> [Int] {
        var p:[Int] = []
        var min = 1
        for _ in 1..<numDigits {
            min *= 10
        }
        let max = min * 10 - 1
        
        for i in (min...max) {
            for j in (min...max) {
                if isPalindrome(i * j) { p.append(i*j) }
            }
        }
        
        return p
    }
    
    func isPalindrome(number: Int) -> Bool {
        let str = String(number)
        let revStr = String(str.characters.reverse())
        
        return str == revStr
    }
    
    required init() {
        
    }
}