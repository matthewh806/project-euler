//
//  P5.swift
//  project-euler
//
//  Created by Matthew on 07/03/2016.
//  Copyright © 2016 Automata Theory. All rights reserved.
//

/*
2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.

What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?
*/

import Foundation

class P5: Problem {
    func solve() -> String {
        let set = [Int](1...20)
        return "\(lcm(set))"
    }
    
    /*
    Lowest common multiple of a set of numbers
    
    1. Express each number as a product of prime powers
    2. LCM is the product of multiplying the highest power of each prime number together.
    */
    func lcm(numbers: [Int]) -> Int {
        let primeFactors = numbers.flatMap( { PrimeUtil.primeFactorsWithPowers($0) })
        let uniquePrimes = Set(primeFactors.flatMap({ $0.prime }))
        
        var highestPowers: [PrimeFactor] = []
        for p in uniquePrimes {
            highestPowers.append(primeFactors.filter({ $0.prime == p} )
                .maxElement({ (a, b) -> Bool in
                a.power < b.power
            })!)
        }
        
        print(highestPowers)
        return highestPowers.reduce(1, combine: { $0 * pow($1.prime, pow: $1.power) })
    }
    
    required init() {
        
    }
}