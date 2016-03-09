//
//  P7.swift
//  project-euler
//
//  Created by Matthew on 09/03/2016.
//  Copyright © 2016 Automata Theory. All rights reserved.
//

/*
By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.

What is the 10 001st prime number?
*/

import Foundation

class P7 : Problem {
    func solve() -> String {
        return "\(PrimeUtil.generatePrimesNaive(through: 10001))"
    }
    
    required init() { }
}
