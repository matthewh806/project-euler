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
        return "\(PrimeUtil.primeFactors(600851475143).maxElement()!)"
    }
        
    required init() {
        
    }
}
