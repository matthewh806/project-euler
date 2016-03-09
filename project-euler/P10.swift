//
//  P10.swift
//  project-euler
//
//  Created by Matthew on 10/03/2016.
//  Copyright © 2016 Automata Theory. All rights reserved.
//

/*
The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.

Find the sum of all the primes below two million.
*/

import Foundation

class P10 : Problem {
    func solve() -> String {
        return "\(sumPrimes(17))"
    }
    
    func sumPrimes(n: Int) -> Int {
        return PrimeUtil.sieveOfEratosthenes(upTo: 2000000)
        .reduce(0, combine: +)
    }
    
    required init() { }
}