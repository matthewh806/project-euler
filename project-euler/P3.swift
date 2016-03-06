//
//  P3.swift
//  project-euler
//
//  Created by Matthew on 06/03/2016.
//  Copyright © 2016 Automata Theory. All rights reserved.
//

import Foundation
import Darwin

/* The prime factors of 13195 are 5, 7, 13 and 29.

What is the largest prime factor of the number 600851475143 ?
*/

class P3: Problem {
    func solve() -> String {
        return "\(primeFactors(600851475143).maxElement()!)"
    }
    
    /*
    Trial division method of factorization: https://en.wikipedia.org/wiki/Trial_division
    */
    func primeFactors(integer: Int) -> [Int] {
        var n = integer
        var pFactors: Set<Int> = []
        
        if n < 2 { return [] }
        for p in sieveOfEratosthenes(upTo: sqrt(n) + 1) {
            if p * p > n { break }
            
            while n % p == 0 {
                pFactors.insert(p)
                n = n / p
            }
        }
        if(n > 1) { pFactors.insert(n) }
        
        return pFactors.sort()
    }
    
    func sieveOfEratosthenes(upTo n: Int) -> [Int] {
        var numbers = [Int](2..<n)
        
        for i in 0..<n-2 {
            guard numbers[i] > 0 else { continue }
            let prime = numbers[i]
            for multiple in (2*prime-2).stride(to: n-2, by: prime) {
                numbers[multiple] = 0
            }
        }
        
        return numbers.filter({$0 > 0})
    }
    
    func sqrt(x: Int) -> Int { return Int(Darwin.sqrt(Double(x))) }
    
    required init() {
        
    }
}
