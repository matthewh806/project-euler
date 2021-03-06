//
//  P2.swift
//  project-euler
//
//  Created by Matthew on 06/03/2016.
//  Copyright © 2016 Automata Theory. All rights reserved.
//

import Foundation

/* Each new term in the Fibonacci sequence is generated by adding the previous two terms. By starting with 1 and 2, the first 10 terms will be:

1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...

By considering the terms in the Fibonacci sequence whose values do not exceed four million, find the sum of the even-valued terms.
*/
class P2: Problem {
    func solve() -> String {
        return "\(fibonacci(4000000).filter( { $0 % 2 == 0} ).reduce(0, combine: +))"
    }
    
    func fibonacci(limit: Int) -> [Int] {
        var seq: [Int] = [1,2]
        
        while(seq.suffix(2).reduce(0, combine: +) < limit) {
            let term = seq.suffix(2).reduce(0, combine: +)
            seq.append(term)
        }
        
        return seq
    }
    
    required init() {
        
    }
}
