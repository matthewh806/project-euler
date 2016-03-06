//
//  problem.swift
//  project-euler
//
//  Created by Matthew on 03/03/2016.
//  Copyright © 2016 Automata Theory. All rights reserved.
//

import Foundation

protocol Problem {
    func solve() -> String
    init()
}

class ProblemFactory
{
    class func create(name:String) -> Problem? {
        guard let c : AnyClass = NSClassFromString(name) else { return nil }
        
        if c is Problem.Type {
            let pClass = c as! Problem.Type
            return pClass.init()
        } else {
            return nil
        }
    }
}

