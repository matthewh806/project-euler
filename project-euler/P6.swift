//
//  P6.swift
//  project-euler
//
//  Created by Matthew on 07/03/2016.
//  Copyright © 2016 Automata Theory. All rights reserved.
//

/*
The sum of the squares of the first ten natural numbers is,

12 + 22 + ... + 102 = 385
The square of the sum of the first ten natural numbers is,

(1 + 2 + ... + 10)2 = 552 = 3025
Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is 3025 − 385 = 2640.

Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.
*/

import Foundation

class P6: Problem {
    func solve() -> String {
        return "\(diffSumSquaresAndSquareSum([Int](1...100)))"
    }
    
    func diffSumSquaresAndSquareSum(numbers: [Int]) -> Int {
        return  numbers.reduce(0, combine: +) * numbers.reduce(0, combine: +) - numbers.reduce(0, combine: { $0 + $1*$1})
    }
    
    required init() { }
}