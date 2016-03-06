//
//  p1.swift
//  project-euler
//
//  Created by Matthew on 03/03/2016.
//  Copyright © 2016 Automata Theory. All rights reserved.
//

import Foundation

/* If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.

    Find the sum of all the multiples of 3 or 5 below 1000.
*/

class P1 : Problem {
    func solve() -> String {
        return "\(multiplesOf3and5(below: 1000))"
    }
    
    func multiplesOf3and5(below below: Int) -> Int {
        let condition = { $0 % 3 == 0 || $0 % 5 == 0 }
        
        return (0..<below)
            .filter(condition)
            .reduce(0, combine: +)
    }
    
    required init() {
        
    }
}


