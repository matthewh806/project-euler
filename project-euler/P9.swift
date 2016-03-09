//
//  P9.swift
//  project-euler
//
//  Created by Matthew on 09/03/2016.
//  Copyright © 2016 Automata Theory. All rights reserved.
//

/*
A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,

a^2 + b^2 = c^2
For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.

There exists exactly one Pythagorean triplet for which a + b + c = 1000.
Find the product abc.

This is a much better solution: https://projecteuler.net/thread=9#284
*/
import Foundation

class P9 : Problem {
    func solve() -> String {
        let triple = generatePythagoreanTripletWith(1000)
        triple.a * triple.b * triple.c
        return "\(triple.a * triple.b * triple.c)"
    }
    
    /* 
        https://en.wikipedia.org/wiki/Pythagorean_triple#Generating_a_triple
    */
    func generatePythagoreanTripletWith(sum: Int) -> (a: Int, b: Int, c:Int){
        
        for _a in 1...sum {
            let aSqr = _a * _a
            for _b in (_a+1)...sum {
                let bSqr = _b * _b
                let cSqr = aSqr + bSqr
                let _c = sum - (_a + _b)
                
                if((_c * _c) == cSqr) {
                    return (a: _a, b:_b, c:_c)
                }
            }
        }
        
        return (a: 0, b: 0, c: 0)
    }
    
    required init() {
        
    }
}